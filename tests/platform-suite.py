#!/usr/bin/env python3
"""Exercise a packaged CogTool on its target operating system and Java architecture."""
import argparse
import csv
import math
import os
from pathlib import Path
import shutil
import signal
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parent.parent
FIXTURE = ROOT / "docs/examples/phone-number-lookup/N&P93.cgt"
EXPECTATIONS = ROOT / "tests/fixtures/phone-number-expected-times.csv"


def run(command, *, cwd=None, env=None, timeout=180):
    command = command if isinstance(command, str) else [str(x) for x in command]
    print("Running:", command if isinstance(command, str) else subprocess.list2cmdline(command), flush=True)
    process = subprocess.Popen(command, cwd=cwd, env=env,
                               stdin=subprocess.DEVNULL, stdout=subprocess.PIPE,
                               stderr=subprocess.STDOUT, text=True, errors="replace",
                               start_new_session=(os.name != "nt"),
                               creationflags=subprocess.CREATE_NEW_PROCESS_GROUP if os.name == "nt" else 0)
    try:
        output, _ = process.communicate(timeout=timeout)
    except subprocess.TimeoutExpired:
        if os.name == "nt":
            subprocess.run(["taskkill", "/PID", str(process.pid), "/T", "/F"],
                           stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL, check=False)
        else:
            os.killpg(process.pid, signal.SIGKILL)
        output, _ = process.communicate()
        raise RuntimeError(f"Command timed out after {timeout:g} seconds:\n{output}")
    print(output, end="" if output.endswith("\n") or not output else "\n", flush=True)
    if process.returncode:
        raise RuntimeError(f"Command exited with status {process.returncode}")


def windows_batch_command(launcher, arguments):
    values = [str(launcher)] + [str(value) for value in arguments]
    # Quote every argument, including paths with shell metacharacters such as &.
    # Percent expansion happens even inside quotes, so reject it explicitly.
    if any('"' in value or "%" in value for value in values):
        raise RuntimeError('Windows command paths containing a quote or % are not supported')
    command = " ".join('"' + value + '"' for value in values)
    # Pass a raw command line to CreateProcess: cmd.exe uses different quote
    # rules from the C runtime escaping performed for a Python argument list.
    return '"' + os.environ.get("COMSPEC", "cmd.exe") + '" /d /s /c "' + command + '"'


def check_export(path):
    with path.open(encoding="utf-8", errors="replace", newline="") as source:
        rows = list(csv.reader(source))
    header = next((row for row in rows if row and row[0] == "Tasks"), None)
    if not header:
        raise RuntimeError("Export is missing the task/design header")
    for task, design, expected in (("Look up one number", "Pop-Up", 2.645),
                                   ("Look up one number", "Dialog Box", 13.099),
                                   ("Look up two numbers", "Pop-Up", 4.912),
                                   ("Look up two numbers", "Dialog Box", 20.943)):
        matches = [row for row in rows if row and row[0] == task]
        if len(matches) != 1 or header.count(design) != 1:
            raise RuntimeError(f"Export is missing or duplicates {task} / {design}")
        try:
            actual = float(matches[0][header.index(design)].replace(",", "."))
        except (IndexError, ValueError):
            raise RuntimeError(f"Invalid exported time for {task} / {design}")
        # The normal export rounds to one decimal place.
        if not math.isfinite(actual) or abs(actual - expected) > 0.06:
            raise RuntimeError(f"Unexpected exported time for {task} / {design}: {actual}")
    print("PASS: CSV export contains all four expected results", flush=True)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--platform", required=True, choices=("macos-arm64", "windows-x86", "windows-amd64"))
    parser.add_argument("--app", type=Path, required=True, help="CogTool.app or extracted Windows portable CogTool directory")
    parser.add_argument("--java-home", type=Path, default=os.environ.get("JAVA_HOME"), help="runtime directory; Windows packaged JRE takes precedence")
    parser.add_argument("--javac", help="path to javac for Windows helper compilation (default: PATH)")
    parser.add_argument("--timeout", type=float, default=180, help="seconds allowed per process (default: 180)")
    args = parser.parse_args()
    if not 0 < args.timeout < float("inf"):
        parser.error("--timeout must be finite and positive")
    app = args.app.resolve()
    if args.platform == "macos-arm64" and sys.platform != "darwin":
        parser.error("macos-arm64 checks must run on macOS")
    if args.platform.startswith("windows-") and sys.platform != "win32":
        parser.error("Windows checks must run on Windows")
    if not FIXTURE.is_file() or not EXPECTATIONS.is_file():
        parser.error("phone-number fixture or expectations are missing")
    env = os.environ.copy()
    if args.java_home:
        env["JAVA_HOME"] = str(Path(args.java_home).resolve())
    try:
        with tempfile.TemporaryDirectory(prefix="cogtool-platform-test ") as temporary:
            temp = Path(temporary)
            helper_args = []
            if args.platform.startswith("windows-"):
                javac = args.javac or shutil.which("javac")
                if not javac:
                    raise RuntimeError("A JDK with javac on PATH (or --javac) is required to compile the Windows test helper")
                jars = [app / "CogTool.jar"] + sorted((app / "lib").glob("*.jar"))
                helper = temp / "helper"
                helper.mkdir()
                run([javac, "-encoding", "UTF-8", "-source", "8", "-target", "8", "-cp", os.pathsep.join(map(str, jars)), "-d", helper, ROOT / "tests/ProjectPredictions.java"], timeout=args.timeout)
                helper_args = ["--helper", helper]
            base_check = [sys.executable, ROOT / "tests/check-project-times.py", "--app", app,
                          "--platform", args.platform, "--expectations", EXPECTATIONS,
                          "--timeout", str(args.timeout)] + helper_args
            if args.java_home:
                base_check += ["--java-home", Path(args.java_home).resolve()]
            # Check architecture, native SWT, project loading and prediction before invoking the launcher.
            run(base_check + [FIXTURE.parent], env=env, timeout=args.timeout + 30)
            saved_dir = temp / "saved project"
            saved_dir.mkdir()
            saved = saved_dir / FIXTURE.name
            export = temp / "results.csv"
            if args.platform == "macos-arm64":
                launcher = app / "Contents/MacOS/cogtool-launcher"
                command = [launcher, FIXTURE, "-s", saved, "-e", export, "-q"]
            else:
                launcher = app / "CogTool.bat"
                if not launcher.is_file():
                    raise RuntimeError(f"Portable launcher not found: {launcher}")
                command = windows_batch_command(launcher, [FIXTURE, "-s", saved, "-e", export, "-q"])
            run(command, cwd=app, env=env, timeout=args.timeout)
            if not saved.is_file() or saved.stat().st_size == 0:
                raise RuntimeError("The launcher did not save the project")
            if not export.is_file() or export.stat().st_size == 0:
                raise RuntimeError("The launcher did not export results")
            print("PASS: packaged launcher opened and saved the project", flush=True)
            check_export(export)
            run(base_check + [saved_dir], env=env, timeout=args.timeout + 30)
        print(f"PASS: platform suite completed for {args.platform}")
        return 0
    except (OSError, RuntimeError) as error:
        print(f"FAIL: {error}", file=sys.stderr)
        return 1


if __name__ == "__main__":
    sys.exit(main())
