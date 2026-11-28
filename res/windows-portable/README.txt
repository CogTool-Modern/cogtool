CogTool for Windows (@ARCH@)

Extract the entire ZIP to a folder and double-click CogTool.bat. The batch
file keeps a command window open while CogTool runs so startup errors can be
seen. To use it from a command prompt, run CogTool.bat from any directory.

Install a Windows Java runtime matching the architecture above. The ARM64
SWT library requires ARM64 Java 17 or newer. CogTool looks for Java first in
the included jre folder, then in JAVA_HOME, and finally on PATH. The ZIP
contains Java only when the person building it explicitly supplies a runtime.

Windows ARM64 support has not yet been tested. Web-page import is unavailable
with ARM64 Java. Predictions use a 32-bit x86 CLISP executable, which must be
validated under Windows on ARM. No file associations or Start menu shortcuts
are installed by this portable package.
