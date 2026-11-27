# Mac SWT libraries

`swt.jar` is the existing Intel macOS SWT library. `swt-arm64.jar` is
`org.eclipse.platform:org.eclipse.swt.cocoa.macosx.aarch64:3.128.0` from
[Maven Central](https://repo.maven.apache.org/maven2/org/eclipse/platform/org.eclipse.swt.cocoa.macosx.aarch64/3.128.0/).
Its SHA-256 is `e8a7e92ed9546cd05cae0b45974480f1da07929bc7b95a57a39084779d65a6d3`.
The jar contains its third-party notices in `about.html` and `about_files/`.
SWT is licensed under the Eclipse Public License 2.0, included as
`EPL-2.0.txt`; its source is at
<https://github.com/eclipse-platform/eclipse.platform.swt> (the exact source
revision is recorded in the jar's manifest).

The launcher selects an SWT jar based on the Java VM's architecture. ARM64
SWT 3.128.0 requires Java 17 or newer. Do not put both SWT jars on the runtime
classpath together. The Ant package target extracts the ARM64 native libraries
into the app bundle and includes the SWT license.

`cogtool-launcher` is the universal native app entry point; it runs the
`cogtoolstart` script in the bundle's Resources directory. To rebuild the
checked-in launcher from `cogtool-launcher.c` on macOS with Xcode's command
line tools installed, run:

```sh
xcrun clang -arch arm64 -arch x86_64 -mmacosx-version-min=10.13 \
  -Wall -Wextra -Werror -o lib/macintosh/cogtool-launcher \
  lib/macintosh/cogtool-launcher.c
```
