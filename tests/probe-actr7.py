#!/usr/bin/env python3
"""Try loading CogTool's prediction extensions into an ACT-R 7 source tree.

This is a migration diagnostic, not a prediction or compatibility test.  It
uses a temporary copy because the ACT-R loader writes compiled files.
"""

import argparse
import os
from pathlib import Path
import shutil
import subprocess
import tempfile


ROOT = Path(__file__).resolve().parent.parent
DIRECTORIES = ("commands", "core-modules", "devices", "framework", "modules",
               "other-files", "support", "tools")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("actr", type=Path, help="unpacked ACT-R 7 source directory")
    parser.add_argument("--sbcl", default="sbcl", help="SBCL executable")
    parser.add_argument("--clisp", help="CLISP executable (requires --clisp-image)")
    parser.add_argument("--clisp-image", type=Path,
                        help="matching plain CLISP lispinit.mem, without ACT-R")
    modes = parser.add_mutually_exclusive_group()
    modes.add_argument("--emma-only", action="store_true",
                       help="exercise the experimental ACT-R 7 EMMA adapter")
    modes.add_argument("--boilerplate", action="store_true",
                       help="try CogTool's existing boilerplate with ACT-R 7 EMMA")
    modes.add_argument("--combined-extras", action="store_true",
                       help="exercise ACT-Touch with extended motor actions")
    args = parser.parse_args()
    if bool(args.clisp) != bool(args.clisp_image):
        parser.error("--clisp and --clisp-image must be supplied together")
    if args.clisp_image and not args.clisp_image.is_file():
        parser.error("CLISP memory image not found: " + str(args.clisp_image))
    source = args.actr.resolve()
    required = [source / "load-act-r.lisp", source / "load-single-threaded-act-r.lisp"]
    required.extend(source / name for name in DIRECTORIES)
    if args.emma_only or args.boilerplate:
        required.append(source / "extras" / "emma" / "emma.lisp")
    if args.combined_extras:
        required.extend((source / "extras" / "extended-motor-actions" / "motor-extension.lisp",
                         source / "extras" / "act-touch" / "act-touch.lisp",
                         source / "extras" / "act-touch" / "touch-demo-model.lisp"))
    missing = [str(path) for path in required if not path.exists()]
    if missing:
        parser.error("missing ACT-R source paths: " + ", ".join(missing))

    with tempfile.TemporaryDirectory(prefix="cogtool-actr7-probe-") as temporary:
        work = Path(temporary)
        for name in DIRECTORIES:
            shutil.copytree(source / name, work / name,
                            ignore=shutil.ignore_patterns("*.fasl", "*.fas", "*.lib"))
        if args.emma_only or args.boilerplate:
            (work / "extras").mkdir()
            shutil.copytree(source / "extras" / "emma", work / "extras" / "emma",
                            ignore=shutil.ignore_patterns("*.fasl", "*.fas", "*.lib"))
        if args.combined_extras:
            (work / "extras").mkdir()
            for name in ("extended-motor-actions", "act-touch"):
                shutil.copytree(source / "extras" / name, work / "extras" / name,
                                ignore=shutil.ignore_patterns("*.fasl", "*.fas", "*.lib"))
        for name in ("load-act-r.lisp", "load-single-threaded-act-r.lisp"):
            shutil.copy2(source / name, work / name)
        # CogTool does not load the ACT-R Environment. The loader otherwise
        # discovers this file automatically and attempts to load its server.
        (work / "tools" / "environment-loader.lisp").unlink(missing_ok=True)

        # ACT-R 7.27.7's SBCL DEFPACKAGE form removes the CL-USER nickname,
        # which later ACT-R sources refer to. Patch only this disposable copy.
        loader = work / "load-act-r.lisp"
        text = loader.read_text(encoding="utf-8")
        old = '(:shadow "RESET" )))'
        new = '(:nicknames "CL-USER" "USER") (:shadow "RESET" )))'
        if not args.clisp and old in text:
            loader.write_text(text.replace(old, new, 1), encoding="utf-8")

        driver = work / "probe.lisp"
        prelude = '''
(load (merge-pathnames "load-single-threaded-act-r.lisp"
                       (pathname #+sbcl (sb-ext:posix-getenv "COGTOOL_ACTR_DIR")
                                 #+clisp (ext:getenv "COGTOOL_ACTR_DIR"))))
(unless (string= *actr-architecture-version* "7")
  (error "Expected ACT-R 7, found ~a" *actr-version-string*))
(format t "~%Testing CogTool extensions with ACT-R ~a~%" *actr-version-string*)
'''
        if args.emma_only:
            body = '''
(load #+sbcl (sb-ext:posix-getenv "COGTOOL_EMMA_TEST")
      #+clisp (ext:getenv "COGTOOL_EMMA_TEST"))
'''
        elif args.combined_extras:
            body = '''
(load #+sbcl (sb-ext:posix-getenv "COGTOOL_EXTRAS_TEST")
      #+clisp (ext:getenv "COGTOOL_EXTRAS_TEST"))
'''
        elif args.boilerplate:
            body = '''
(load (merge-pathnames "cogtool-actr7-emma.lisp" (pathname #+sbcl (sb-ext:posix-getenv "COGTOOL_LISP_DIR") #+clisp (ext:getenv "COGTOOL_LISP_DIR"))))
(load (merge-pathnames "cogtool-actr.lisp" (pathname #+sbcl (sb-ext:posix-getenv "COGTOOL_LISP_DIR") #+clisp (ext:getenv "COGTOOL_LISP_DIR"))))
(format t "~%CogTool prediction boilerplate loaded with ACT-R 7 EMMA.~%")
'''
        else:
            body = '''
(load (merge-pathnames "emma.lisp" (pathname #+sbcl (sb-ext:posix-getenv "COGTOOL_LISP_DIR") #+clisp (ext:getenv "COGTOOL_LISP_DIR"))))
(load (merge-pathnames "cogtool-actr.lisp" (pathname #+sbcl (sb-ext:posix-getenv "COGTOOL_LISP_DIR") #+clisp (ext:getenv "COGTOOL_LISP_DIR"))))
(format t "~%CogTool prediction extensions loaded successfully.~%")
'''
        driver.write_text(prelude + body, encoding="utf-8")
        env = os.environ.copy()
        env["COGTOOL_ACTR_DIR"] = str(work) + os.sep
        env["COGTOOL_LISP_DIR"] = str(ROOT / "java/edu/cmu/cs/hcii/cogtool/resources") + os.sep
        env["COGTOOL_EMMA_TEST"] = str(ROOT / "tests/actr7-emma-smoke.lisp")
        env["COGTOOL_EXTRAS_TEST"] = str(ROOT / "tests/actr7-extras-compat.lisp")
        try:
            if args.clisp:
                command = [args.clisp, "-q", "-on-error", "exit", "-M",
                           str(args.clisp_image.resolve()), "-i", str(driver),
                           "-x", "(ext:quit)"]
            else:
                command = [args.sbcl, "--noinform", "--disable-debugger",
                           "--script", str(driver)]
            result = subprocess.run(command, env=env, check=False)
        except OSError as error:
            parser.exit(2, f"Could not run Lisp: {error}\n")
        return result.returncode


if __name__ == "__main__":
    raise SystemExit(main())
