# CogTool

<img alt="designs-compared" src="https://user-images.githubusercontent.com/1075425/90916892-8a721f80-e3a7-11ea-9860-ceab32e4b204.png">
<img alt="wireframes" src="https://user-images.githubusercontent.com/1075425/90916895-8b0ab600-e3a7-11ea-816c-05a3cf16dd6e.png">
<img alt="demonstration-steps" src="https://user-images.githubusercontent.com/1075425/90916886-88a85c00-e3a7-11ea-8433-f9aa9e0fb0d9.png">

CogTool is a general purpose UI prototyping tool with a difference--
it automatically evaluates your design with a predictive human
performance model (a "cognitive crash dummy"). Simply create a
storyboard of your design idea with sketches, images or on a canvas
with CogTool's widgets, demonstrate tasks on that storyboard, then
press a button to produce a valid cognitive model predicting how long
it will take a skilled user to complete those tasks. CogTool can be
used today to baseline your current interface, or compare competitors'
interfaces, and predict how much better your new designs will be.

CogTool is free software, released under the FSF Lesser Gnu Public
License. [See LICENSE.txt for details](https://github.com/CogTool-Modern/cogtool/blob/master/LICENSE.txt).

There is a separate repository of documentation, both for end users
and for developers: [https://github.com/cogtool/documentation.git](https://github.com/cogtool/documentation.git)
TODO Merge this seperate repo with the in-branch, GitHub Pages-powered `docs/` folder.

## Building
To build the macOS package and Windows ARM64 MSI together on macOS, install a
JDK (17 or newer), Apache Ant, Python 3, and
[msitools](https://wiki.gnome.org/msitools) (`wixl`, `msibuild`, and
`msiinfo` must be on `PATH`). Then:
1. Download the source code from [GitHub](https://github.com/CogTool-Modern/cogtool).
2. Obtain an extracted Windows ARM64 Java 17+ runtime suitable for redistribution.
3. Create `build.local.properties` in the project directory, containing
   `windows.jre.dir=/absolute/path/to/windows-arm64-jre`.
4. From within the project directory, run `ant`.

The default build produces `dist/CogTool.app`, a macOS `.tgz` archive, and a
Windows ARM64 MSI. It reuses the help files in the repository. The runtime
path can instead be supplied with `-Dwindows.jre.dir=/path/to/windows-jre`;
command-line properties override `build.local.properties`. To build an x86-64
Windows MSI instead, also set `-Dwindows.swt.arch=x86_64` and supply a matching
Windows runtime. The default build clears existing files in `build/` and
`dist/` before building, so save any artifacts you want to keep first.
If the installer tools are not on `PATH`, add
`windows.msitools.bin=/absolute/path/to/msitools/bin` to `build.local.properties`.

To set the release version, the About screen's documentation and software
updates links, and the Mac Java installer links, edit `java/edu/cmu/cs/hcii/cogtool/resources/release.properties`
before building. The version must have one to four numeric components (for
example, `1.4` or `1.4.1`); the build derives the Windows and archive versions
from it. The file is included in the application when it is built.

For only a Mac package using the help files already in the repository, run
`ant package-without-help`. To rebuild the help bundle as well, run
`ant package`; this requires the documentation's Jekyll dependencies. Both
targets produce `dist/CogTool.app` and a `.tgz` archive.

On Apple Silicon, the Mac app requires an ARM64 Java 17 or newer runtime.
The launcher uses `JAVA_HOME` when set, otherwise it looks for a registered
ARM64 Java 17+ installation using `/usr/libexec/java_home`, standard Java
installation locations, or `java` on `PATH`. A JRE is sufficient to run the
built app; a JDK is needed only to compile it. The app does not bundle Java.
If a runtime is not discovered automatically, launch the app from a terminal
with `JAVA_HOME=/path/to/runtime /path/to/CogTool.app/Contents/MacOS/cogtool-launcher`.
The older Intel SWT remains available when launched with an Intel Java runtime.
Predictions on Apple Silicon use a native CLISP runtime
and require macOS 15 or later; see `clisp-mac-arm64/README.md` for its source
and license information. Web-page import is unavailable on Apple Silicon:
its Mozilla XPCOM implementation needs to be rewritten for a supported
browser engine. Other functionality has not yet been fully validated for
redistribution on modern macOS.

On macOS, the build ad-hoc signs the app for local use. A public release still
needs Developer ID signing and notarization for Gatekeeper on other Macs.

The ARM64 SWT library is Eclipse SWT 3.128.0, distributed under EPL-2.0;
its license is included in the app. Its source and exact artifact coordinates
are documented in `lib/macintosh/README.md`.

<details markdown="1">
<summary>Building for Windows</summary>

With a JDK and Ant installed, build a portable Windows ZIP on macOS, Linux,
or Windows, without NSIS:

```sh
ant windows-zip                               # ARM64 Windows Java
ant -Dwindows.swt.arch=x86_64 windows-zip      # x86-64 Windows Java
```

The ZIP is written to `dist/CogTool-Windows-<architecture>-<version>.zip`.
Extract it on Windows and run `CogTool.bat`. This opens a command window for
diagnostics while the app runs. The portable package does not install file
associations or Start menu shortcuts. It uses a Java runtime in the package's
`jre/` directory if present, then `JAVA_HOME`, then `PATH`. The runtime must
be a Windows build matching the selected SWT architecture; ARM64 SWT requires
Java 17 or newer. A JDK is required to build, but a JRE suffices to run.

To bundle a Windows runtime, pass its directory at build time, for example
`ant -Dwindows.swt.arch=arm64 -Dwindows.jre.dir=/path/to/windows-jre windows-zip`.
The supplied directory must contain `bin/java.exe` and be suitable for
redistribution. The checked-in `jre/` is incomplete and is not bundled by
the portable build.

An MSI with a Start menu shortcut can also be built on macOS or Linux using
Python 3 and [msitools](https://wiki.gnome.org/msitools) (`wixl`, `msibuild`,
and `msiinfo` on `PATH`). On Windows, run the build in a Linux environment such
as WSL, or use the portable ZIP target above. The MSI includes a supplied
Windows Java 17+ runtime, so users do not need to install Java separately:

```sh
ant -Dwindows.swt.arch=arm64 -Dwindows.jre.dir=/path/to/windows-arm64-jre windows-msi
```

The runtime must contain `bin/javaw.exe` and a `release` file, and its
architecture must match `windows.swt.arch`. The output is
`dist/CogTool-Windows-<architecture>-<version>.msi`. The installer is per
user, adds a Start menu shortcut, and does not add file associations. An MSI
release version must have at most three components, or a zero fourth component
(Windows Installer limits the first three to 255.255.65535). ARM64 MSI
generation uses wixl's 64-bit file and registry components and sets the ARM64
package metadata with `msibuild`; wixl 0.106 does not offer a direct ARM64
option. The build also moves removal of the prior version inside the installer's
rollback transaction. The MSI must be tested on Windows before release.

The older NSIS installer is built only on Windows by the regular package
targets. That build assumes [NSIS](https://nsis.sourceforge.io/Main_Page) is
installed at `C:\Program Files (x86)\NSIS\makensis.exe`.

The default Windows SWT library is for ARM64 Java. To select the Windows
ARM64 SWT library explicitly for compilation and the legacy installer, use a JDK 17 or newer
and run `ant -Dwindows.swt.arch=arm64 package-without-help`. The installer
must also contain a compatible ARM64 Java runtime in `jre/`; the checked-in
`jre/` is incomplete. Web-page import is unavailable with ARM64 Java because it
depends on an obsolete Mozilla interface. Predictions use the bundled x86
CLISP executable under Windows on ARM. See
`lib/windows/README.md` for the SWT artifacts and licensing.

</details>

### Related 
- [CogTool - 32-bit build instructions](https://github.com/cogtool/documentation/blob/master/Processes/configuring-development-machines.txt)
- [Download Apache Ant](https://ant.apache.org/bindownload.cgi)

## Checking project prediction times

The prediction test loads `.cgt` files from a directory, recomputes each
individual task script with its active prediction algorithm, and compares the
resulting times with an expectations CSV. It uses the prediction engine
directly; it does not exercise the graphical interface or command-file export.
The current runner requires a built Apple Silicon macOS app, an ARM64 Java 17
or newer runtime (a JRE is sufficient),
Python 3.9 or newer, and a macOS graphical session. Build the app with
`ant package-without-help` first. As with other predictions on Apple Silicon,
macOS 15 or newer is required.

Put an `expected-times.csv` in the project directory, with one row per
prediction and times and tolerances in seconds:

```csv
project,task,design,seconds,tolerance
Example.cgt,Look up one number,Pop-Up,2.645,0.05
```

`project` is the path to the `.cgt` file relative to the supplied directory;
subdirectories are searched recursively. Task and design names must match the
project exactly. The test checks individual task scripts in every project and reports
missing or unexpected projects or predictions, failed computations, and times
outside the stated absolute tolerance. Tasks in groups are traversed; duplicate
task/design names or multiple scripts for the same task/design are ambiguous
and cause a failure. Group-level and CogTool Explorer predictions are not
covered by this runner.

Run it with:

```sh
JAVA_HOME=/path/to/java-runtime tests/check-project-times.py /path/to/project-directory
```

Use `--app /path/to/CogTool.app` for a different build, `--expectations`
to specify a CSV elsewhere, and `--timeout SECONDS`
to adjust the per-project timeout. The command exits zero only if all checks
pass. For a working example using the included phone-number project and its
four expected predictions:

```sh
tests/check-project-times.py docs/examples/phone-number-lookup \
  --expectations tests/fixtures/phone-number-expected-times.csv
```
