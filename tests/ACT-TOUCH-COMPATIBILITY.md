# ACT-Touch compatibility investigation

This directory contains an **experimental test**, not an implementation of
multitouch gestures in CogTool. The application does not load these files.
They cannot be used to create transitions, demonstrate gestures, or predict
task times.

## Source and runtime

`fixtures/act-touch-r13.lisp` is the unmodified revision 13 of ACT-Touch,
retrieved from [commit cbe31a3443efd24e0627f59a10c0a60e54eebb4a](https://github.com/tamborello/ACT-Touch/blob/cbe31a3443efd24e0627f59a10c0a60e54eebb4a/act-touch.lisp).
Its source header identifies its author, copyright, and LGPL license. Revision
13 targets ACT-R 6.1. This is an older implementation than the ACT-R 7.12+
version distributed in `extras/act-touch` with current ACT-R.

CogTool bundles an older ACT-R 6 image. It includes `defstyle`,
`extend-manual-requests`, and style scheduling, but lacks the
`handle-style-request` function expected by revision 13. Loading the original
file without an adapter therefore prints six warnings and does not register
the associated requests, even though Lisp reports that the file loaded.

## Running the probe

On Apple Silicon macOS, from the repository root:

```sh
sh tests/act-touch-compat-probe.sh
```

The script defaults to `clisp-mac-arm64/lisp.run` and its `actr6.mem` image.
To use another compatible CLISP executable and CogTool ACT-R image, set
`COGTOOL_CLISP` and `COGTOOL_ACTR_IMAGE` to their paths. The executable must
be able to load the selected image.

The probe loads `act-touch-compat-adapter.lisp` first, then the unmodified
revision 13 fixture. It runs a model with a synthetic device and checks that
callbacks arrive in order for tap, tap-hold, tap-release, a two-finger swipe,
a pinch, and a rotate. It also checks selected callback parameters. A successful
run prints a `RESULT` list and exits with status zero. Revision 13 redefines
the existing `AIF` macro, so CLISP emits a redefinition warning.

## What the probe does and does not establish

The adapter translates the six explicit manual requests tested here into the
older motor module's style methods. This proves that those requests can be
registered and that their methods and synthetic callbacks execute. The adapter
is intentionally scoped to the test; it does not validate all feature types,
maintain finger contact state, or implement CogTool's device behavior. With
randomization disabled, the probe checks that revision 13 motor execution time
increases with swipe distance and pinch width change, but remains unchanged when
the rotation angle changes. These are not complete CogTool task predictions.
The probe does not exercise move-hand-touch or test save/load, demonstrations,
transitions, or the GUI.

To run the installed modern ACT-R 7 ACT-Touch reference demo separately, use
`sh tests/act-touch-modern-reference.sh`. It requires SBCL and Python 3, copies
`/Applications/actr7.x` into a temporary directory, and runs the demo with a
touch device. Override the source with `ACTR7_SOURCE` or the SBCL executable
with `SBCL`. The test checks that the larger right-hand rotation takes longer
after preparation than the smaller one. These reference timings are not CogTool
task predictions, and are not directly comparable to revision 13 timings
because the runtime and motor calculations differ.

The original revision 13 request handler for move-hand-touch expects a newer
`verify-single-explicit-value` signature than CogTool's bundled version. Its
movement and device assumptions must also be reconciled with CogTool's
existing screen coordinates and cursor-based touch support. Revision 13's
timing and behavior are not interchangeable with the modern ACT-Touch version:
the latter adds, among other changes, configurable swipe speed and different
gesture calculations. A production implementation needs explicit choices for
those semantics, parameter validation, a device adapter, integration with
CogTool's action and script models, persistence and XML interchange, editor
and demonstration controls, and end-to-end prediction regression tests.

## El Batran and Dunlop's touch KLM measurements

El Batran and Dunlop, *Enhancing KLM (Keystroke-Level Model) to Fit Touch
Screen Mobile Devices*, MobileHCI 2014, DOI
[10.1145/2628363.2628385](https://doi.org/10.1145/2628363.2628385), report
approximate movement times for specific scenarios (table 1):

| Scenario | Approximate movement time |
| --- | ---: |
| Untargeted swipe over half the width of a 5-inch screen | 70 ms |
| Zoom a 100 x 100 px image to 350 x 350 px | 200 ms |
| Point from home to a 200 x 200 px icon at distance 700 px | 80 ms |

These scenarios can inform example gesture configurations and offer reference
observations for validation. The zoom dimensions describe the image, not the
starting or ending separation of the user's fingers; the swipe length in
pixels also depends on the display's physical dimensions and pixel density.
The paper does not specify defaults for ACT-Touch's hand, finger count, swipe
speed, pinch separation, or rotation angle.

The paper also reports fitted movement-time equations in milliseconds using
the Shannon index of difficulty `ID = log2(D/W + 1)`. Using the authors' fit
for IDs 1 through 3, the equations are 44.78 + 34.64 ID for swipe,
54.38 + 13.27 ID for tap, and 13.75 + 94.33 ID for zoom. The paper also gives
different fits including ID 4 and reports poor fit at that level for swipe
and zoom. Its tests used an iPad Mini; the swipe and zoom studies involved 30
participants and the tap study 21.

These fitted KLM equations are distinct from ACT-Touch's movement and timing
model. In particular, the fitted slope must not be substituted for CogTool's
ACT-R peck Fitts coefficient without defining and validating a different
prediction model. Research settings for these values should be connected to
an implemented model before they are offered as adjustable parameters.
