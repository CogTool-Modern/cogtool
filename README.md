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
To compile CogTool,
1. Download the source code from [GitHub](https://github.com/CogTool-Modern/cogtool).
2. Install [Apache Ant](https://ant.apache.org/bindownload.cgi)
3. From within the project directory, run `ant` 

Running the `ant` command begins the build process specified in `build.xml`. 

For a Mac package using the help files already in the repository, run
`ant package-without-help`. The regular `ant` target also rebuilds the help
bundle and requires the documentation's Jekyll dependencies. Both targets
produce `dist/CogTool.app` and a `.tgz` archive.

On Apple Silicon, the Mac app requires an ARM64 Java 17 or newer runtime.
The launcher uses `JAVA_HOME` when set, otherwise it looks for a registered
ARM64 Java 17+ installation with `/usr/libexec/java_home`, followed by the
standard Apple Silicon Homebrew OpenJDK location. The app does not bundle
Java. The older Intel SWT remains available when launched with an
Intel Java runtime. Predictions on Apple Silicon use a native CLISP runtime
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
<summary>Building on Windows</summary>

The step in the build process for building Windows installers will only happen when building CogTool on Windows. This steps assumes that you have installed [NSIS](https://nsis.sourceforge.io/Main_Page) and the executable is available at `C:\Program Files (x86)\NSIS\makensis.exe`

</details>

### Related 
- [CogTool - 32-bit build instructions](https://github.com/cogtool/documentation/blob/master/Processes/configuring-development-machines.txt)
- [Download Apache Ant](https://ant.apache.org/bindownload.cgi)

