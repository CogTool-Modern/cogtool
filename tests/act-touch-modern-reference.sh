#!/bin/sh
# Run the installed ACT-R 7 ACT-Touch demo in an isolated temporary copy.
set -eu
SOURCE=${ACTR7_SOURCE:-/Applications/actr7.x}
SBCL=${SBCL:-sbcl}
WORK=$(mktemp -d "${TMPDIR:-/tmp}/cogtool-act-touch-reference.XXXXXXXX")
trap 'rm -rf "$WORK"' EXIT HUP INT TERM
cp -R "$SOURCE" "$WORK/actr"
cd "$WORK/actr"
"$SBCL" --noinform --non-interactive --load load-single-threaded-act-r.lisp \
  --load extras/act-touch/touch-demo-model.lisp --eval '(run-touch-demo t)' \
  > "$WORK/trace.log" 2>&1
python3 - "$WORK/trace.log" <<'PY'
import re
import sys

with open(sys.argv[1], encoding="utf-8") as f:
    trace = f.read()
# Compare finish time after preparation, not full task time. Preparation differs
# because the two actions are consecutive.
pattern = re.compile(
    r"MOTOR\s+ROTATE HAND RIGHT FINGER INDEX ROTATION\s+([-\d.]+)"
    r".*?^\s*([\d.]+)\s+MOTOR\s+PREPARATION-COMPLETE"
    r".*?^\s*([\d.]+)\s+MOTOR\s+FINISH-MOVEMENT",
    re.MULTILINE | re.DOTALL,
)
rotations = [(float(angle), float(end) - float(prep))
             for angle, prep, end in pattern.findall(trace)]
if len(rotations) != 2 or not (
    abs(rotations[0][0] - 0.785) < 0.001
    and abs(rotations[1][0] + 1.57) < 0.001
    and rotations[1][1] > rotations[0][1]
):
    raise SystemExit("Unexpected ACT-Touch rotation trace: " + repr(rotations))
if "Stopped because no events left to process" not in trace:
    raise SystemExit("ACT-Touch demo did not finish")
print("ACT-R 7 rotation times after preparation:", rotations)
PY
