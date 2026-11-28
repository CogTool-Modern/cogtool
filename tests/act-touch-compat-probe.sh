#!/bin/sh
# Run the experimental compatibility probe against an ACT-R 6 CLISP image.
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
CLISP=${COGTOOL_CLISP:-"$ROOT/clisp-mac-arm64/lisp.run"}
IMAGE=${COGTOOL_ACTR_IMAGE:-"$ROOT/clisp-mac-arm64/actr6.mem"}
cd "$ROOT"
exec "$CLISP" -M "$IMAGE" -q -norc -on-error exit -i tests/act-touch-compat-probe.lisp
