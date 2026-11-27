#!/usr/bin/env python3
"""Recompute all predictions in a directory of CogTool projects and compare them to CSV expectations."""
import argparse
import base64
import csv
import math
import os
from pathlib import Path
import shutil
import subprocess
import sys
import zipfile

ROOT = Path(__file__).resolve().parent.parent
PREFIX = "COGTOOL_PREDICTION "


def find_java(java_home, platform="macos-arm64"):
    if platform.startswith("windows-"):
        executable = Path(java_home) / "bin/java.exe" if java_home else shutil.which("java")
        candidates = [Path(executable)] if executable else []
    elif java_home:
        candidates = [Path(java_home) / "bin/java"]
    else:
        candidates = []
        try:
            home = subprocess.run(["/usr/libexec/java_home", "-v", "17+", "-a", "arm64"],
                                  capture_output=True, text=True, check=True).stdout.strip()
            if home:
                candidates.append(Path(home) / "bin/java")
        except (OSError, subprocess.CalledProcessError):
            pass
        candidates.extend(Path("/Library/Java/JavaVirtualMachines").glob("*/Contents/Home/bin/java"))
        candidates.append(Path("/opt/homebrew/opt/openjdk/bin/java"))
        path_java = shutil.which("java")
        if path_java:
            candidates.append(Path(path_java))
    for java in candidates:
        try:
            result = subprocess.run([str(java), "-XshowSettings:properties", "-version"],
                                    capture_output=True, text=True, check=True)
        except (OSError, subprocess.CalledProcessError):
            continue
        properties = dict((key.strip(), value.strip()) for line in result.stderr.splitlines()
                          for key, sep, value in [line.partition(" = ")] if sep)
        version = properties.get("java.specification.version", "")
        major = int(version[2:]) if version.startswith("1.") and version[2:].isdigit() else int(version) if version.isdigit() else 0
        arch = properties.get("os.arch", "").lower()
        valid_arches = {"macos-arm64": {"aarch64", "arm64"}, "windows-amd64": {"amd64", "x86_64"}, "windows-x86": {"x86", "i386", "i486", "i586", "i686"}}
        if major >= (17 if platform == "macos-arm64" else 8) and arch in valid_arches[platform]:
            return java
    raise ValueError(f"Compatible Java runtime not found for {platform}; set JAVA_HOME or pass --java-home")


def number(value, label, line):
    try:
        result = float(value)
    except ValueError:
        raise ValueError(f"line {line}: invalid {label}: {value!r}")
    if not math.isfinite(result) or result < 0:
        raise ValueError(f"line {line}: {label} must be finite and nonnegative")
    return result


def read_expectations(path, directory):
    expectations = {}
    with path.open(encoding="utf-8-sig", newline="") as source:
        reader = csv.DictReader(source)
        columns = {"project", "task", "design", "seconds", "tolerance"}
        if reader.fieldnames is None or set(reader.fieldnames) != columns or len(reader.fieldnames) != len(columns):
            raise ValueError("expected CSV columns: project,task,design,seconds,tolerance")
        for row in reader:
            if None in row or any(row[c] is None or not row[c].strip() for c in columns):
                raise ValueError(f"line {reader.line_num}: all five fields are required")
            project = Path(row["project"])
            if project.is_absolute() or ".." in project.parts or project.suffix.lower() != ".cgt":
                raise ValueError(f"line {reader.line_num}: project must be a relative .cgt path inside the directory")
            resolved = (directory / project).resolve()
            if not resolved.is_relative_to(directory):
                raise ValueError(f"line {reader.line_num}: project resolves outside the directory")
            key = (project.as_posix(), row["task"], row["design"])
            if key in expectations:
                raise ValueError(f"line {reader.line_num}: duplicate expectation: {key}")
            expectations[key] = (number(row["seconds"], "seconds", reader.line_num),
                                 number(row["tolerance"], "tolerance", reader.line_num))
    if not expectations:
        raise ValueError("expectations CSV contains no predictions")
    return expectations


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("directory", type=Path, help="directory containing .cgt projects (searched recursively)")
    parser.add_argument("--expectations", type=Path, help="CSV file (default: DIRECTORY/expected-times.csv)")
    parser.add_argument("--app", type=Path, default=ROOT / "dist/CogTool.app", help="built macOS app or extracted Windows portable directory")
    parser.add_argument("--platform", choices=("macos-arm64", "windows-amd64", "windows-x86"), default="macos-arm64", help="target platform (default: macos-arm64)")
    parser.add_argument("--java-home", type=Path, default=os.environ.get("JAVA_HOME"), help="Java runtime directory (or set JAVA_HOME)")
    parser.add_argument("--timeout", type=float, default=180, help="maximum seconds per project (default: 180)")
    parser.add_argument("--helper", type=Path, help="directory containing compiled ProjectPredictions.class (Windows)")
    args = parser.parse_args()
    try:
        directory = args.directory.resolve(strict=True)
        if not directory.is_dir():
            raise ValueError(f"not a directory: {directory}")
        if not math.isfinite(args.timeout) or args.timeout <= 0:
            raise ValueError("timeout must be finite and positive")
        expectations = read_expectations(args.expectations or directory / "expected-times.csv", directory)
        projects = sorted(p for p in directory.rglob("*") if p.is_file() and p.suffix.lower() == ".cgt")
        actual_paths = {p.relative_to(directory).as_posix() for p in projects}
        expected_paths = {key[0] for key in expectations}
        if actual_paths != expected_paths:
            for name in sorted(expected_paths - actual_paths): print(f"MISSING project: {name}", file=sys.stderr)
            for name in sorted(actual_paths - expected_paths): print(f"UNEXPECTED project: {name}", file=sys.stderr)
            return 1
        app = args.app.resolve()
        if args.platform == "macos-arm64":
            if sys.platform != "darwin":
                raise ValueError("macos-arm64 checks must run on macOS")
            java_root = app / "Contents/Resources/Java"
            workdir = app / "Contents/Resources"
            helper = workdir / "cogtool-prediction-tests.jar"
            if not (java_root / "CogTool.jar").is_file() or not (java_root / "swt-arm64.jar").is_file() or not helper.is_file():
                raise ValueError(f"built Apple Silicon app or prediction helper not found at {app}; run ant package-without-help")
            jars = [java_root / "swt-arm64.jar"] + sorted(p for p in java_root.glob("*.jar") if p.name not in {"swt.jar", "swt-arm64.jar"})
            native_args = ["-XstartOnFirstThread", f"-Djava.library.path={java_root / 'dll/arm64'}"]
            java_home = args.java_home
        else:
            if sys.platform != "win32":
                raise ValueError("Windows checks must run on Windows")
            java_root = app / "lib"
            workdir = app
            swt = java_root / "swt.jar"
            if not (app / "CogTool.jar").is_file() or not swt.is_file():
                raise ValueError(f"extracted Windows portable package not found at {app}")
            with zipfile.ZipFile(swt) as jar:
                manifest = jar.read("META-INF/MANIFEST.MF").decode("utf-8", errors="replace").replace("\r\n ", "").replace("\n ", "")
            expected_arch = "x86" if args.platform == "windows-x86" else "x86_64"
            if f"SWT-Arch: {expected_arch}\n" not in manifest.replace("\r\n", "\n"):
                raise ValueError(f"Windows package does not contain {expected_arch} SWT; the current build supports x86_64 and arm64, not 32-bit x86")
            helper = args.helper
            if not helper or not (helper / "ProjectPredictions.class").is_file():
                raise ValueError("Windows requires --helper pointing to a compiled ProjectPredictions helper directory")
            jars = [app / "CogTool.jar"] + sorted(java_root.glob("*.jar"))
            native_args = [f"-Djava.library.path={java_root}"]
            java_home = app / "jre" if (app / "jre/bin/java.exe").is_file() else args.java_home
        java = find_java(java_home, args.platform)
        classpath = os.pathsep.join([str(helper)] + [str(p) for p in jars])
        failures = 0
        observed = set()
        for project in projects:
            relative = project.relative_to(directory).as_posix()
            print(f"Computing {relative}...", flush=True)
            command = [str(java)] + native_args + ["-cp", classpath, "ProjectPredictions", str(project.resolve())]
            try:
                run = subprocess.run(command, cwd=workdir, text=True, capture_output=True, timeout=args.timeout)
            except subprocess.TimeoutExpired:
                print(f"FAIL {relative}: timed out after {args.timeout:g} seconds", file=sys.stderr)
                failures += 1
                continue
            if run.returncode:
                print(f"FAIL {relative}: prediction process exited {run.returncode}\n{run.stdout}{run.stderr}", file=sys.stderr)
                failures += 1
                continue
            for line in run.stdout.splitlines():
                if not line.startswith(PREFIX):
                    continue
                task, design, value = line[len(PREFIX):].split(" ")
                task = base64.b64decode(task, validate=True).decode("utf-8")
                design = base64.b64decode(design, validate=True).decode("utf-8")
                actual = number(value, "computed seconds", 0)
                key = (relative, task, design)
                if key in observed:
                    raise ValueError(f"duplicate computed result: {key}")
                observed.add(key)
                if key not in expectations:
                    print(f"UNEXPECTED prediction: {relative} / {task} / {design}: {actual:g}", file=sys.stderr)
                    failures += 1
                    continue
                expected, tolerance = expectations[key]
                if abs(actual - expected) > tolerance:
                    print(f"FAIL {relative} / {task} / {design}: expected {expected:g} ± {tolerance:g} s, got {actual:g} s", file=sys.stderr)
                    failures += 1
                else:
                    print(f"PASS {relative} / {task} / {design}: {actual:g} s (expected {expected:g} ± {tolerance:g})")
        for project, task, design in sorted(set(expectations) - observed):
            print(f"MISSING prediction: {project} / {task} / {design}", file=sys.stderr)
            failures += 1
        if failures:
            print(f"{failures} failure(s)", file=sys.stderr)
            return 1
        print(f"All {len(observed)} predictions passed in {len(projects)} project(s).")
        return 0
    except (OSError, ValueError, KeyError, zipfile.BadZipFile, subprocess.CalledProcessError) as error:
        print(f"Error: {error}", file=sys.stderr)
        return 2


if __name__ == "__main__":
    sys.exit(main())
