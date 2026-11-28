# Windows SWT libraries

`swt.jar` is the existing x86-64 Windows SWT library. `arm64/swt.jar` is
`org.eclipse.platform:org.eclipse.swt.win32.win32.aarch64:3.128.0` from
[Maven Central](https://repo.maven.apache.org/maven2/org/eclipse/platform/org.eclipse.swt.win32.win32.aarch64/3.128.0/).
Its SHA-256 is `651fc873f623053e6c620f1856a019cd7d81b21214fa442b01992e0bbe1be27d`.
The jar includes third-party notices in `about.html` and `about_files/`.
SWT is licensed under the Eclipse Public License 2.0, included as
`lib/macintosh/EPL-2.0.txt` and in the Windows installer. Its source is at
<https://github.com/eclipse-platform/eclipse.platform.swt>; the exact source
revision is recorded in the jar's manifest.

Build with `-Dwindows.swt.arch=arm64` to compile against and install the
ARM64 jar; the default is `x86_64`. Use an ARM64 Java 17 or newer runtime
with the ARM64 jar. The Windows ARM64 SWT library is separate from the macOS
ARM64 SWT library, and the two Windows SWT jars must not be used together on
the runtime classpath. See the main README for current Windows limitations.
