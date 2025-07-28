# CogTool Portable LISP Environment

This directory contains a portable LISP environment for CogTool that works across multiple platforms without requiring external LISP installations.

## Platform Support

### Apple Silicon Macs (ARM64)
- **Primary**: Bundled ECL (if available) - Native ARM64 performance
- **Fallback 1**: System ECL - Native ARM64 performance  
- **Fallback 2**: System CLISP - Good compatibility
- **Fallback 3**: Intel CLISP with Rosetta 2 - Compatibility mode

### Intel Macs (x86_64)
- **Primary**: Bundled CLISP - Optimized for Intel architecture
- **Fallback**: System CLISP - If available

### Linux (x86_64/ARM64)
- **Primary**: Bundled CLISP/ECL (if available) - Portable
- **Fallback 1**: System CLISP - Most compatible
- **Fallback 2**: System ECL - Good performance
- **Fallback 3**: System SBCL - Alternative

### Windows (x86_64)
- **Primary**: Bundled CLISP - Complete Windows distribution
- **Fallback**: System CLISP - If available

## Usage

The LISP environment is automatically selected when CogTool runs. No manual configuration is required.

### Manual Testing

You can test the LISP environment manually:

```bash
# Apple Silicon Mac
./clisp-mac-arm64/lisp.run -x '(format t "Hello from LISP~%")'

# Intel Mac  
./clisp-mac-intel/lisp.run -x '(format t "Hello from LISP~%")'

# Linux
./clisp-linux/lisp.run -x '(format t "Hello from LISP~%")'

# Windows
./clisp-win/lisp.exe -x "(format t \"Hello from LISP~%\")"
```

## Troubleshooting

### Apple Silicon Macs

If you get "ECL not found" errors:
1. Install ECL for best performance: `brew install ecl`
2. Or install Rosetta 2 for fallback: `/usr/sbin/softwareupdate --install-rosetta`

### Linux Systems

If you get "No LISP implementation found" errors:
```bash
# Ubuntu/Debian
sudo apt-get install clisp

# CentOS/RHEL
sudo yum install clisp

# Fedora
sudo dnf install clisp

# Arch Linux
sudo pacman -S clisp
```

### All Platforms

For additional help:
- Check the CogTool documentation
- Visit: https://github.com/CogTool-Modern/cogtool/issues
- Run the setup script: `./setup-modern-lisp.sh`

## Technical Details

### Wrapper Scripts

Each platform has an intelligent wrapper script (`lisp.run` or `lisp.exe`) that:
1. Detects available LISP implementations
2. Converts command-line arguments between LISP dialects
3. Provides helpful error messages
4. Falls back gracefully to alternative implementations

### Bundled vs System LISP

- **Bundled**: Included with CogTool, guaranteed compatibility
- **System**: Installed separately, may offer better performance
- **Automatic Selection**: Wrappers choose the best available option

### Performance Notes

- **Apple Silicon**: ECL provides ~2x performance over Rosetta 2
- **Intel Macs**: Bundled CLISP is optimized for the platform
- **Linux**: System LISP often provides best performance
- **Windows**: Bundled CLISP is the primary option

This portable environment ensures CogTool works reliably across all supported platforms while providing optimal performance where possible.
