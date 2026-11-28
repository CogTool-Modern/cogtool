# ACT-R 7 migration status

CogTool still runs ACT-R 6. The ACT-R 7 upgrade is not complete: the bundled
memory images, model generator, EMMA and device extensions, and trace handling
must be migrated and tested together before selecting a new runtime for
predictions. Existing saved projects also refer to `ACTR6PredictionAlgo`, so
their loaders must remain compatible.

To reproduce the first extension-loading failure, install SBCL and Python 3.9
or newer, unpack an ACT-R 7 source distribution, and run:

```sh
python3 tests/probe-actr7.py /path/to/unpacked/act-r
```

The default probe copies the necessary source directories into a temporary
directory, loads ACT-R in single-threaded mode without the Environment, and
then loads CogTool's ACT-R 6 EMMA and prediction extensions. It exits nonzero
on a Lisp error. This mode does not run a model or establish that predictions
are valid.
It was exercised with ACT-R 7.27.7 (repository revision 3260, 2022-07-19),
obtained from the [ACT-R source mirror](https://github.com/asmaloney/ACT-R).
The temporary copy also works around that version's SBCL package nickname
issue; the source distribution and the shipped runtime are not modified.

The current first failure is CogTool's EMMA `encoding-complete` method: ACT-R
7 requires an additional position argument. Other old vision functions used
by that method are absent in the tested ACT-R 7 source. CogTool also overrides
motor, device, and trace internals in `cogtool-actr.lisp`, so changing this
signature alone does not complete the port. ACT-R 7's own EMMA is a separate
module with different interfaces; substituting it requires adapting CogTool's
eye movement tracking and checking the resulting behavior.

An experimental adapter in `cogtool-actr7-emma.lisp` loads ACT-R 7's own
EMMA, supplies CogTool's existing encoding defaults, suppresses destination
noise, and emits an eye-movement preparation marker. The trace parser also
recognizes EMMA's three-dimensional completion events. Exercise the adapter
with a small ACT-R model using a full source distribution:

```sh
python3 tests/probe-actr7.py --emma-only /path/to/unpacked/act-r
ant test-actr-traces
```

The probe can also run this model on the shipped CLISP executable when given
the matching, plain `lispinit.mem` from the CLISP bottle documented in
`clisp-mac-arm64/README.md` (the shipped ACT-R 6 image cannot be used as the
base image):

```sh
python3 tests/probe-actr7.py --emma-only \
  --clisp "$PWD/clisp-mac-arm64/lisp.run" \
  --clisp-image /path/to/base/lispinit.mem /path/to/unpacked/act-r
```

The adapter avoids a directory pathname probe that fails in CLISP and handles
CLISP's division-by-zero error when EMMA computes an angle to the eye's
current location. The smoke model has passed with both SBCL and the bundled
Apple Silicon CLISP executable, but this does not test the full CogTool model.

The adapter is deliberately not connected to the application yet. The current
ACT-R 6 boilerplate redefines shared motor and movement functions, including
functions used by ACT-R 7 EMMA, and still needs an ACT-R 7 port. Passing the
adapter smoke test therefore does not imply that CogTool predictions run on
ACT-R 7. The runtime images and generated-model path remain ACT-R 6.

The next integration failure can be reproduced with:

```sh
python3 tests/probe-actr7.py --boilerplate /path/to/unpacked/act-r
```

With 7.27.7, the old boilerplate redefines `prepare-movement` and
`preparation-complete`, removing ACT-R 7's methods, and then fails while
defining `build-vis-locs-for`: ACT-R 7's generic function takes one required
argument, whereas CogTool's ACT-R 6 method takes two. The vision migration
also needs to use ACT-R 7's feature/visicon lifecycle rather than just changing
that method signature. This probe runs in a separate process because the old
boilerplate mutates the running Lisp image.
On the Apple Silicon CLISP build, the same probe also reports that the old
motor module's parameter definitions are rejected.

### ACT-R 7 extras assessment

The following observations apply to the ACT-R 7.27.7 distribution used above;
they are not a compatibility claim for later ACT-R releases.

* [Extended motor actions](https://github.com/asmaloney/ACT-R/blob/main/extras/extended-motor-actions/read-me.txt)
  supplies held keys and mouse buttons, separate release signals, and optional
  drag costs. Its `hold-punch`/`release` and `hold-mouse`/`release-mouse`
  requests are candidates for CogTool's finger-down/up and mouse-down/up
  productions. It replaces the motor module, so it should replace—not be
  layered on top of—CogTool's ACT-R 6 motor overrides. Trace formats and
  timings still need adaptation and validation; for example, the extension's
  default `:peck-strike-distance` changes peck output timing. The upstream
  mouse hold/release demo ran on the bundled Apple Silicon CLISP executable.
* [ACT-Touch](https://github.com/asmaloney/ACT-R/blob/main/extras/act-touch/readme.txt)
  supplies touch gestures, a touch device and notifications, and is a candidate
  for CogTool touchscreen actions. CogTool currently models several touch
  actions through mouse/finger commands, so this requires model-generation and
  trace changes and may change timing predictions. Its upstream demo ran with
  the experimental EMMA adapter enabled on Apple Silicon CLISP, but did not
  exercise an EMMA eye movement during that run.
* **The two motor extensions cannot simply be enabled together in this
  distribution.** With `extended-motor-actions` and `act-touch` loaded, the
  ACT-Touch demo fails on its first tap: `TWO-EXEC-P` has no applicable method
  for `TAP`. This occurred on CLISP and SBCL, in either load order on CLISP,
  including with both dual-stage parameters set to `nil`. The warnings also
  indicate incompatible motor processor state handling. An adapter or a
  different design must be validated before combining them. Reproduce with:

  ```sh
  python3 tests/probe-actr7.py --combined-extras /path/to/unpacked/act-r
  ```

  Add the `--clisp` and `--clisp-image` arguments shown above to run it with
  CLISP. The command currently exits nonzero at the failure; it exercises the
  upstream demo, not a generated CogTool model.
* EMMA remains the candidate for eye movements. The other bundled extras are
  primarily concerned with memory, learning, parallelism, model inspection,
  or model serialization; they do not supply a CogTool storyboard device.
  ACT-R 7's core visicon and device APIs are the starting point for adapting
  frame/widget presentation, transition signals, and CogTool trace metadata.

Version selection should use CogTool's existing project and task prediction
algorithm mechanism rather than a global runtime preference. Project defaults,
task overrides, and results already persist algorithm identities; a separate
ACT-R 7 algorithm can preserve ACT-R 6 results and saved-project defaults.
It should not be offered in the UI until its model generation and packaged
runtime are functional.

Once the extensions load, migration verification must include real generated
models and trace parsing, the phone-number prediction fixtures, interaction
types beyond those fixtures, CogTool Explorer, existing projects, and rebuilt
CLISP images for each packaged platform. ACT-R 7 may legitimately change
prediction times; any new expectations should be reviewed as behavioral
changes rather than copied from ACT-R 6 or accepted automatically.
