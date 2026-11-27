#!/usr/bin/env python3
"""Build the portable Windows staging tree as an MSI with a bundled JRE."""

import argparse
import hashlib
import os
from pathlib import Path
import re
import struct
import subprocess
import sys
import uuid
import xml.etree.ElementTree as ET

WIX = "http://schemas.microsoft.com/wix/2006/wi"
ET.register_namespace("", WIX)
NAMESPACE = uuid.UUID("a04d12af-d9fa-4c2f-8ab7-b96ed2a78aea")


def element(parent, name, **attributes):
    return ET.SubElement(parent, "{%s}%s" % (WIX, name), attributes)


def identifier(prefix, value):
    return prefix + hashlib.sha256(value.encode("utf-8")).hexdigest()[:32]


def guid(value):
    return "{%s}" % str(uuid.uuid5(NAMESPACE, value)).upper()


def check_runtime(stage, arch):
    runtime = stage / "jre"
    javaw = runtime / "bin" / "javaw.exe"
    release = runtime / "release"
    if not javaw.is_file() or not release.is_file():
        raise ValueError("The Windows runtime must contain bin/javaw.exe and a release file")
    with javaw.open("rb") as f:
        if f.read(2) != b"MZ":
            raise ValueError("The supplied javaw.exe is not a Windows executable")
        f.seek(0x3c)
        pe_offset = struct.unpack("<I", f.read(4))[0]
        f.seek(pe_offset)
        if f.read(4) != b"PE\0\0":
            raise ValueError("Invalid PE header in javaw.exe")
        machine = struct.unpack("<H", f.read(2))[0]
    expected = {"arm64": 0xAA64, "x86_64": 0x8664}[arch]
    if machine != expected:
        raise ValueError("The Windows runtime architecture does not match " + arch)
    match = re.search(r'^JAVA_VERSION="([^"]+)"', release.read_text(encoding="utf-8"), re.MULTILINE)
    if not match:
        raise ValueError("Cannot read JAVA_VERSION from the runtime release file")
    major = match.group(1).split(".")[0]
    if not major.isdigit() or int(major) < 17:
        raise ValueError("The MSI requires Java 17 or newer")


def product_version(version):
    parts = version.split(".")
    if not 1 <= len(parts) <= 4 or not all(p.isdigit() for p in parts):
        raise ValueError("The release version must have one to four numeric components")
    numbers = [int(p) for p in parts]
    if len(numbers) == 4 and numbers[3] != 0:
        raise ValueError("MSI versions support three components; the fourth must be zero")
    numbers = (numbers + [0, 0, 0])[:3]
    if numbers[0] > 255 or numbers[1] > 255 or numbers[2] > 65535:
        raise ValueError("MSI version components exceed 255.255.65535")
    return ".".join(map(str, numbers))


def upgrade_with_rollback(msi):
    """Place old-version removal inside the Windows Installer transaction."""
    def sequence():
        output = subprocess.check_output(
            ["msiinfo", "export", str(msi), "InstallExecuteSequence"], text=True
        )
        result = {}
        for line in output.splitlines()[3:]:
            fields = line.split("\t")
            if len(fields) >= 3 and fields[2]:
                result[fields[0]] = int(fields[2])
        return result

    actions = sequence()
    required = ("InstallValidate", "InstallInitialize", "RemoveExistingProducts", "ProcessComponents")
    if any(action not in actions for action in required):
        raise ValueError("Installer is missing an action needed for a safe upgrade")
    initialize = actions["InstallInitialize"]
    new_position = initialize + 1
    if not (actions["InstallValidate"] < initialize < new_position < actions["ProcessComponents"]):
        raise ValueError("Cannot safely schedule removal of the previous installation")
    if any(value == new_position and name != "RemoveExistingProducts" for name, value in actions.items()):
        raise ValueError("The installer upgrade sequence position is already occupied")
    query = ("UPDATE `InstallExecuteSequence` SET `Sequence` = %d "
             "WHERE `Action` = 'RemoveExistingProducts'" % new_position)
    subprocess.run(["msibuild", str(msi), "-q", query], check=True)
    if sequence().get("RemoveExistingProducts") != new_position:
        raise ValueError("Could not verify the installer upgrade sequence")


def make_source(args, source):
    root = ET.Element("{%s}Wix" % WIX)
    label = "ARM64" if args.arch == "arm64" else "x64"
    name = "CogTool (" + label + ")"
    product = element(root, "Product", Id=guid("product:" + args.arch + ":" + product_version(args.version)), Name=name, Language="1033",
                      Version=product_version(args.version), Manufacturer="CogTool",
                      UpgradeCode=guid("upgrade:" + args.arch))
    element(product, "Package", InstallerVersion="500", Compressed="yes", InstallScope="perUser")
    element(product, "MajorUpgrade", DowngradeErrorMessage="A newer version of CogTool is already installed.")
    element(product, "Media", Id="1", Cabinet="cogtool.cab", EmbedCab="yes")
    element(product, "Icon", Id="CogToolIcon", SourceFile=str(args.icon))
    target = element(product, "Directory", Id="TARGETDIR", Name="SourceDir")
    local = element(target, "Directory", Id="LocalAppDataFolder")
    programs = element(local, "Directory", Id="CogToolPrograms", Name="Programs")
    install = element(programs, "Directory", Id="INSTALLDIR", Name=name)
    menu = element(target, "Directory", Id="ProgramMenuFolder")
    menu_dir = element(menu, "Directory", Id="CogToolMenu", Name=name)
    feature = element(product, "Feature", Id="Main", Title="CogTool", Level="1")

    files = sorted((p for p in args.stage.rglob("*") if p.is_file()), key=lambda p: p.as_posix())
    dirs = {Path("."): install}
    for file in files:
        relative = file.relative_to(args.stage)
        # The MSI uses javaw directly; the portable launcher is not installed.
        if relative in (Path("CogTool.bat"), Path("README.txt")):
            continue
        for directory in reversed(relative.parent.parents):
            if directory not in dirs and directory != Path("."):
                dirs[directory] = element(dirs[directory.parent], "Directory",
                                          Id=identifier("d", directory.as_posix()), Name=directory.name)
        if relative.parent not in dirs:
            directory = relative.parent
            dirs[directory] = element(dirs[directory.parent], "Directory",
                                      Id=identifier("d", directory.as_posix()), Name=directory.name)
        key = relative.as_posix()
        component_id = identifier("c", key)
        component = element(dirs[relative.parent], "Component", Id=component_id,
                            Guid=guid(args.arch + ":" + key), Win64="yes")
        element(component, "File", Id=identifier("f", key), Source=str(file), KeyPath="yes")
        element(feature, "ComponentRef", Id=component_id)

    shortcut = element(menu_dir, "Component", Id="MenuShortcut", Guid=guid(args.arch + ":shortcut"), Win64="yes")
    element(shortcut, "Shortcut", Id="CogToolShortcut", Directory="CogToolMenu", Name="CogTool",
            Target="[#%s]" % identifier("f", "jre/bin/javaw.exe"), WorkingDirectory="INSTALLDIR",
            Arguments='-Xmx400000000 "-Djava.library.path=./lib" "-Dcogtool.version=%s" "-Dcogtool.revision=%s" "-Dcogtool.build=%s" -jar "[INSTALLDIR]CogTool.jar"' % (args.version, args.revision, args.buildtime),
            Icon="CogToolIcon")
    element(shortcut, "RegistryValue", Root="HKCU", Key="Software\\CogTool\\" + args.arch, Name="Installed",
            Type="integer", Value="1", KeyPath="yes")
    element(shortcut, "RemoveFolder", Id="RemoveCogToolMenu", On="uninstall")
    element(feature, "ComponentRef", Id="MenuShortcut")

    # Explorer starts file associations with an arbitrary working directory.
    # Use absolute resource paths so opening a project also permits predictions.
    prog_id = "CogTool.Project." + args.arch
    classes = "Software\\Classes\\"
    capabilities = "Software\\CogTool\\" + args.arch + "\\Capabilities"
    association = element(install, "Component", Id="ProjectAssociation",
                          Guid=guid(args.arch + ":project-association"), Win64="yes")
    def registry(key, value, name=None, key_path=False):
        attributes = dict(Root="HKCU", Key=key, Type="string", Value=value)
        if name is not None:
            attributes["Name"] = name
        if key_path:
            attributes["KeyPath"] = "yes"
        element(association, "RegistryValue", **attributes)

    registry(classes + ".cgt", prog_id)
    registry(classes + ".cgt\\OpenWithProgids", "", prog_id)
    registry(classes + prog_id, "CogTool Project", key_path=True)
    icon = '"[#%s]",0' % identifier("f", "CogTool.ico")
    registry(classes + prog_id + "\\DefaultIcon", icon)
    registry(classes + prog_id + "\\Application", name, "ApplicationName")
    registry(classes + prog_id + "\\Application", icon, "ApplicationIcon")
    registry(classes + prog_id + "\\Application", "Open CogTool project files", "ApplicationDescription")
    command = ('"[#%s]" -Xmx400000000 "-Djava.library.path=[INSTALLDIR]lib" '
               '"-Dcogtool.home=[INSTALLDIR]." "-Dcogtool.version=%s" '
               '"-Dcogtool.revision=%s" "-Dcogtool.build=%s" '
               '-jar "[INSTALLDIR]CogTool.jar" "%%1"') % (
                   identifier("f", "jre/bin/javaw.exe"), args.version, args.revision, args.buildtime)
    registry(classes + prog_id + "\\shell\\open\\command", command)
    registry(capabilities, name, "ApplicationName")
    registry(capabilities, icon, "ApplicationIcon")
    registry(capabilities, "Open CogTool project files", "ApplicationDescription")
    registry(capabilities + "\\FileAssociations", prog_id, ".cgt")
    registry("Software\\RegisteredApplications", capabilities, name)
    element(feature, "ComponentRef", Id="ProjectAssociation")
    ET.ElementTree(root).write(source, encoding="utf-8", xml_declaration=True)


def main():
    parser = argparse.ArgumentParser()
    for name in ("stage", "icon", "output"):
        parser.add_argument("--" + name, type=lambda p: Path(p).resolve(), required=True)
    parser.add_argument("--arch", choices=("arm64", "x86_64"), required=True)
    for name in ("version", "revision", "buildtime"):
        parser.add_argument("--" + name, required=True)
    args = parser.parse_args()
    check_runtime(args.stage, args.arch)
    source = args.stage.parent / "cogtool-msi.wxs"
    make_source(args, source)
    temporary = args.stage.parent / "cogtool-build.msi"
    result = subprocess.run(["wixl", "-a", "x64", "-o", str(temporary), str(source)],
                            check=True, text=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    if result.stderr:
        print(result.stderr, file=sys.stderr, end="")
    if "CRITICAL" in result.stderr:
        raise ValueError("wixl reported an unsupported installer element")
    # wixl 0.106 cannot set MajorUpgrade/@Schedule. Its default removes the
    # existing product before InstallInitialize, leaving nothing to roll back
    # if the new install fails. Move removal inside the transaction instead.
    upgrade_with_rollback(temporary)
    if args.arch == "arm64":
        # wixl 0.106 has no ARM64 switch. The package contains only 64-bit
        # file/registry components and standard actions, so its architecture
        # metadata can be set after wixl generates the database.
        package_code = "{%s}" % str(uuid.uuid4()).upper()
        subprocess.run(["msibuild", str(temporary), "-s", "CogTool (ARM64)", "CogTool", "Arm64;1033", package_code], check=True)
    os.replace(temporary, args.output)
    print("Built", args.output)


if __name__ == "__main__":
    try:
        main()
    except (OSError, ValueError, subprocess.CalledProcessError) as exc:
        print("MSI build failed:", exc, file=sys.stderr)
        sys.exit(1)
