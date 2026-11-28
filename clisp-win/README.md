# Windows prediction runtime

`lisp.exe` is the existing 32-bit Windows CLISP 2.38 executable. It is paired
with `actr6.mem`; that image must be rebuilt if a different CLISP executable
or version is substituted. Windows 11 on ARM can run the executable under x86
emulation. The runtime and image are distributed under the GPL; see COPYRIGHT
and GNU-GPL in this directory.

The executable contains a Windows 11 compatibility patch: its directory search
treats `ERROR_DIRECTORY` (267) like `ERROR_INVALID_NAME` when checking a
potential directory. This is the same change as the later upstream CLISP fix
in <https://gitlab.com/gnu-clisp/clisp/-/merge_requests/14>, adapted to the
CLISP 2.38 source. `windows11-pathname.patch` documents the equivalent source
change; the original 2.38 source is available at
<https://ftp.gnu.org/gnu/clisp/release/2.38/clisp-2.38.tar.bz2>
(SHA-256 `98ddb7faa384b9b62621ac9af8b4416cbe1b6df420306fceea9e1e01a880e051`).
The repository's `clisp-sources/` contains a different version, 2.49.

The checked-in executable is patched in place to preserve the compatible memory
image. `patch-win11.py` documents and reproduces the exact binary
change from the prior checked-in 2.38 executable (SHA-256
`28aee924ca82a6fb7e6a68df27bc4826faa445d0ebe3eca5ebc3cd3d54957fb1`).
It checks the whole-file hash and original instructions before patching and
refuses to overwrite the input. A replacement runtime or memory image requires
fresh compatibility and prediction testing.
