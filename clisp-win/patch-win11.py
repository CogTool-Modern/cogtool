#!/usr/bin/env python3
"""Apply the Windows 11 ERROR_DIRECTORY fix to CogTool's CLISP 2.38 binary.

This exact binary patch preserves the existing executable/image pairing. See
clisp-win/README.md and windows11-pathname.patch for the source-level change.
"""
import hashlib
from pathlib import Path
import sys

ORIGINAL_SHA256 = "28aee924ca82a6fb7e6a68df27bc4826faa445d0ebe3eca5ebc3cd3d54957fb1"
OFFSET = 0x79B03
ORIGINAL = bytes.fromhex(
    "e8 c8 4e 06 00 83 f8 35 0f 84 68 ff ff ff "
    "e8 ba 4e 06 00 83 f8 7b 0f 84 5a ff ff ff"
)
# EAX already contains GetLastError() from the preceding check. Compare the
# complete 32-bit value with 53, 123, and 267. All three branch to the same
# existing 'no matching subdirectory' path; other errors still reach the
# existing OS_file_error call. The seven NOPs preserve the original layout.
REPLACEMENT = bytes.fromhex(
    "83 f8 35 74 0a 83 f8 7b 74 05 3d 0b 01 00 00 "
    "0f 84 61 ff ff ff 90 90 90 90 90 90 90"
)


def main():
    if len(sys.argv) != 3:
        raise SystemExit("Usage: patch-win11.py ORIGINAL_EXE PATCHED_EXE")
    original, output = map(Path, sys.argv[1:])
    if original.resolve() == output.resolve():
        raise SystemExit("Use a separate output file to preserve the original")
    data = bytearray(original.read_bytes())
    if hashlib.sha256(data).hexdigest() != ORIGINAL_SHA256:
        raise SystemExit("Unexpected CLISP executable hash; refusing to patch")
    if data[OFFSET:OFFSET + len(ORIGINAL)] != ORIGINAL:
        raise SystemExit("Expected instructions were not found; refusing to patch")
    if len(ORIGINAL) != len(REPLACEMENT):
        raise SystemExit("Patch changes executable layout; refusing to patch")
    data[OFFSET:OFFSET + len(ORIGINAL)] = REPLACEMENT
    output.write_bytes(data)
    print("Patched SHA-256:", hashlib.sha256(data).hexdigest())


if __name__ == "__main__":
    main()
