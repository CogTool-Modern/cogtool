# Apple Silicon prediction runtime

This directory contains a native ARM64 CLISP 2.49.92 executable and its
runtime dependencies, built for **macOS 15 or newer**, plus a CLISP memory
image containing this repository's ACT-R 6 sources. The executable loads the
libraries next to it through `@loader_path`; it does not require Homebrew or
Rosetta at runtime. `actr6.mem` is specific to this CLISP build and CPU
architecture and must be rebuilt when either changes.

The executable and libraries were derived from the following Homebrew Core
`arm64_sequoia` bottles. Bottle SHA-256 values before relocation:

| Component | Version | SHA-256 |
| --- | --- | --- |
| clisp | 2.49.92_1 | `6333c511593cd930393b6b446ec2e60ab6a5acb75ebad2f6a383b0b8f6b6be1a` |
| libffcall | 2.6 | `b4db7f982f859bd96dbfdfa774eebdbe775e920ed8c719e4e6e4e254aaa4e95f` |
| libsigsegv | 2.16 | `b6f6b65a6ac29eaf4858763caf5f6453a0c795380393ddc842343f5766351159` |
| readline | 8.3.6 | `461763fa21c050a59e5bbceedf67dcacf24e4aa4604490d73f0c9fa0f40e7fe5` |

The Homebrew recipes, including patches and build instructions, are in
[homebrew-core commit c034486](https://github.com/Homebrew/homebrew-core/tree/c034486c217c34a3cb8e5f0f39b7d321ab3e5d47/Formula).
The corresponding upstream sources are:

- [CLISP 2.49.92](https://alpha.gnu.org/gnu/clisp/clisp-2.49.92.tar.bz2)
- [GNU libffcall 2.6](https://ftpmirror.gnu.org/libffcall/libffcall-2.6.tar.gz)
- [GNU libsigsegv 2.16](https://ftpmirror.gnu.org/libsigsegv/libsigsegv-2.16.tar.gz)
- [GNU Readline 8.3](https://ftpmirror.gnu.org/readline/readline-8.3.tar.gz), with the patches referenced by the Homebrew recipe.

CLISP, libffcall and libsigsegv are distributed under GPL-2.0-or-later;
Readline is distributed under GPL-3.0-or-later. License texts are included
in this directory. Consult the upstream sources and Homebrew recipes for
full notices and corresponding source.

To construct the runtime, copy the CLISP bottle's `base/lisp.run`, along
with `libffcall.0.dylib`, `libsigsegv.2.dylib`, and Readline's
`libreadline.8.3.dylib` (renamed to `libreadline.8.dylib`) into this directory.
Use `install_name_tool -change` to replace each `@@HOMEBREW_PREFIX@@/opt/...`
reference in `lisp.run` with `@loader_path/<library-name>`, then ad-hoc sign
the modified executable with `codesign --force --sign - lisp.run`.

To rebuild the memory image, copy `lisp/actr6` and `lisp/actr6.lisp` into a
scratch directory, then run from that directory with the matching CLISP
bottle's `base/lispinit.mem`:

```sh
/path/to/clisp-mac-arm64/lisp.run -q -M /path/to/lispinit.mem \
  -i actr6.lisp -x '(ext:saveinitmem "/absolute/path/to/actr6.mem")'
```

The loader writes compiled Lisp files in the scratch directory. After a
package build on an Apple Silicon Mac with a JDK, verify the four sample
predictions with `tests/smoke-arm64-predictions.sh /path/to/CogTool.app`.
