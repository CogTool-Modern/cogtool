# CogTool Build System Modernization

## Overview

The CogTool build system has been updated to support the modernized LISP environment with Apple Silicon compatibility and cross-platform enhancements.

## Key Changes to build.xml

### 1. Enhanced Platform Detection

#### New Platform Conditions
- **`os.linux`**: Detects Linux systems (Unix family, excluding Mac)
- **`os.mac.arm64`**: Detects Apple Silicon Macs (ARM64/AArch64)
- **`os.mac.intel`**: Detects Intel Macs (x86_64)

#### Architecture Detection Logic
```xml
<!-- Detect Apple Silicon (ARM64) vs Intel Mac -->
<condition property="os.mac.arm64">
    <and>
        <os family="mac" />
        <or>
            <contains string="${os.arch}" substring="aarch64" />
            <contains string="${os.arch}" substring="arm64" />
        </or>
    </and>
</condition>
```

### 2. Mac Bundle Packaging Updates

#### Architecture-Specific LISP Distribution
- **Intel Mac**: Uses existing `clisp-mac-intel` distribution
- **Apple Silicon Mac**: Uses new `clisp-mac-arm64` distribution with ECL wrapper
- **Universal Build**: Includes both architectures for maximum compatibility

#### New Targets
- `copy-mac-lisp-intel`: Packages Intel Mac LISP distribution
- `copy-mac-lisp-arm64`: Packages Apple Silicon LISP distribution  
- `copy-mac-lisp-universal`: Packages both architectures for universal builds

#### Modern LISP Infrastructure
```xml
<!-- Copy modern LISP infrastructure -->
<copy todir="${distdir}/CogTool.app/Contents/Resources/lisp/">
    <fileset dir="${basedir}/lisp">
        <include name="actr6-modern.lisp" />
        <include name="actr6.lisp" />
    </fileset>
</copy>

<!-- Copy setup scripts -->
<copy file="${basedir}/setup-modern-lisp.sh" todir="${distdir}/CogTool.app/Contents/Resources/" />
<chmod file="${distdir}/CogTool.app/Contents/Resources/setup-modern-lisp.sh" perm="a+x" />
```

### 3. Linux Distribution Support

#### New Linux Packaging Target
The `package-linux` target creates a complete Linux distribution:

- **Main Application**: CogTool.jar and required libraries
- **LISP Runtime**: Linux-compatible LISP wrapper
- **Modern Infrastructure**: ACT-R modern loader and setup scripts
- **Launcher Script**: Automatic LISP environment setup

#### Linux Distribution Structure
```
CogTool-Linux/
├── CogTool.jar                 # Main application
├── lib/                        # Java libraries
├── clisp-linux/               # Linux LISP runtime
├── lisp/                      # Modern ACT-R loaders
├── setup-modern-lisp.sh       # Setup script
└── cogtool.sh                 # Launcher script
```

#### Automatic Setup
The Linux launcher script automatically:
1. Detects first run
2. Executes modern LISP setup
3. Launches CogTool with proper environment

### 4. Windows Distribution Updates

#### Enhanced Windows Installer
Updated `cogtool.nsi` to include:
- Cross-platform LISP support (`clisp-linux`)
- Modern ACT-R loaders (`actr6-modern.lisp`)
- Setup infrastructure (`setup-modern-lisp.sh`)

#### Windows Package Contents
```nsi
SetOutPath $INSTDIR\clisp-win
File ..\clisp-win\*
SetOutPath $INSTDIR\clisp-linux
File ..\clisp-linux\*
SetOutPath $INSTDIR\lisp
File ..\lisp\actr6-modern.lisp
File ..\lisp\actr6.lisp
SetOutPath $INSTDIR
File ..\setup-modern-lisp.sh
```

### 5. Build Script Enhancements

#### Updated build-image.sh
Enhanced platform detection in `lisp/build-image.sh`:

```bash
case $MACHTYPE in
    i?86-apple*)
        platform=mac-intel ;;
    x86_64-apple*)
        platform=mac-intel ;;
    arm64-apple*|aarch64-apple*)
        platform=mac-arm64 ;;
    i?86-pc*)
        platform=win ;;
    x86_64-*-linux*)
        platform=linux ;;
    *)
        echo "Unknown platform: $MACHTYPE" 
        echo "Supported platforms: mac-intel, mac-arm64, win, linux"
        exit 1 ;;
esac
```

## Build Targets

### Main Targets
- **`package`**: Main packaging target (calls platform-specific targets)
- **`clean`**: Cleans build artifacts
- **`compile`**: Compiles Java source code

### Platform-Specific Targets
- **`copy-mac-lisp-intel`**: Intel Mac LISP packaging
- **`copy-mac-lisp-arm64`**: Apple Silicon Mac LISP packaging
- **`copy-mac-lisp-universal`**: Universal Mac build
- **`package-linux`**: Linux distribution packaging
- **`package-windows`**: Windows distribution packaging

### Helper Targets
- **`help-copy`**: Creates Mac Help Bundle
- **`help-index`**: Builds Help search indices

## Platform Support Matrix

| Platform | Build Target | LISP Runtime | Status |
|----------|-------------|--------------|---------|
| Windows | `package-windows` | CLISP 2.38 + Modern | ✅ Enhanced |
| Mac Intel | `copy-mac-lisp-intel` | CLISP 2.38 + Modern | ✅ Enhanced |
| Mac Apple Silicon | `copy-mac-lisp-arm64` | ECL + Fallback | ✅ New |
| Linux | `package-linux` | System LISP + Modern | ✅ New |

## Usage Examples

### Build for Current Platform
```bash
ant package
```

### Build Universal Mac Bundle
```bash
ant package  # On Mac, automatically creates universal build
```

### Build Linux Distribution
```bash
ant package  # On Linux, automatically creates Linux distribution
```

### Clean and Rebuild
```bash
ant clean package
```

## Dependencies

### Build Requirements
- **Java 8+**: For compilation
- **Apache Ant**: Build system
- **Platform-specific tools**: 
  - Mac: Xcode command line tools
  - Windows: NSIS installer (for Windows builds)
  - Linux: Standard build tools

### Runtime Requirements
- **Java 8+**: Runtime environment
- **LISP Implementation**:
  - Windows: Bundled CLISP
  - Mac Intel: Bundled CLISP
  - Mac Apple Silicon: ECL (recommended) or Rosetta 2 fallback
  - Linux: System CLISP or ECL

## Testing

### Validate Build Configuration
```bash
ant -projecthelp
```

### Test Compilation
```bash
ant compile
```

### Test Platform Detection
```bash
# Check which platform-specific targets will be called
ant -v package | grep "Target.*if"
```

## Migration Notes

### From Previous Build System
1. **No Breaking Changes**: Existing build commands continue to work
2. **Enhanced Functionality**: New platforms and architectures supported
3. **Backward Compatibility**: All existing distributions still created

### For Developers
1. **New Platforms**: Linux and Apple Silicon now officially supported
2. **Modern LISP**: All distributions include modern LISP infrastructure
3. **Automatic Setup**: Runtime setup is automated for end users

### For End Users
1. **Apple Silicon**: Native performance with automatic fallback
2. **Linux**: Official support with automated setup
3. **Windows**: Enhanced with cross-platform capabilities

## Future Enhancements

### Planned Improvements
1. **Native Apple Silicon CLISP**: When available, replace ECL wrapper
2. **Docker Support**: Containerized builds for consistent environments
3. **CI/CD Integration**: Automated multi-platform builds
4. **Performance Optimization**: Platform-specific optimizations

### Extension Points
1. **New LISP Implementations**: Easy to add via ModernLispRunner
2. **Additional Platforms**: Framework supports new architectures
3. **Custom Distributions**: Template for specialized builds

This modernized build system provides a solid foundation for CogTool's future while maintaining full compatibility with existing workflows and adding support for modern platforms and architectures.