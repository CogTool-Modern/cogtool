# CogTool Portable LISP Setup

CogTool now includes portable LISP implementations that work out-of-the-box on all supported platforms.

## What's Included

### Linux
- **Bundled CLISP**: Complete CLISP implementation with all dependencies
- **Bundled ECL**: Modern ECL implementation for better performance  
- **Bundled SBCL**: Advanced SBCL implementation
- **Automatic Detection**: Uses the best available implementation

### Mac Intel
- **Smart Auto-Installation**: Automatically installs ECL via Homebrew when needed
- **Fallback Support**: Falls back to CLISP or SBCL if available
- **Manual Installation Guide**: Clear instructions if auto-install fails

### Mac Apple Silicon (ARM64)
- **Native ARM64 Support**: Uses ECL with native Apple Silicon performance
- **Rosetta 2 Compatibility**: Falls back to Intel binaries when needed
- **Homebrew Integration**: Seamless installation via Homebrew

### Windows
- **Pre-bundled CLISP**: Complete CLISP executable included
- **No Installation Required**: Works immediately out-of-the-box

## How It Works

1. **Automatic Detection**: CogTool automatically detects your platform
2. **Best Implementation**: Selects the optimal LISP implementation for your system
3. **Auto-Installation**: On Mac, automatically installs LISP if not present
4. **Fallback Strategy**: Multiple fallback options ensure compatibility
5. **Clear Error Messages**: Helpful guidance if manual installation is needed

## Manual Installation (if needed)

### Mac Users
If automatic installation fails, install a LISP implementation manually:

```bash
# Option 1: Install Homebrew and ECL (Recommended)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install ecl

# Option 2: Install CLISP
brew install clisp

# Option 3: Install SBCL
brew install sbcl
```

### Linux Users
The bundled implementations should work out-of-the-box. If you encounter issues:

```bash
# Ubuntu/Debian
sudo apt install clisp ecl sbcl

# CentOS/RHEL/Fedora
sudo yum install clisp ecl sbcl
# or
sudo dnf install clisp ecl sbcl

# Arch Linux
sudo pacman -S clisp ecl sbcl
```

### Windows Users
The bundled CLISP should work immediately. No additional installation required.

## Troubleshooting

### "No LISP implementation found" Error
This error should no longer occur with the new portable setup. If you see it:

1. **Mac**: The auto-installer will attempt to install ECL via Homebrew
2. **Linux**: Use the bundled implementations (no installation needed)
3. **Windows**: Use the bundled CLISP executable

### Performance Notes
- **ECL**: Generally fastest, especially on Apple Silicon
- **SBCL**: Best for advanced LISP features
- **CLISP**: Most compatible, works everywhere

### Platform-Specific Notes

#### Apple Silicon Macs
- ECL runs natively on ARM64 for best performance
- Intel binaries run via Rosetta 2 (slightly slower but compatible)
- Homebrew automatically installs the correct architecture

#### Intel Macs
- All LISP implementations work natively
- ECL recommended for best compatibility with CogTool

#### Linux
- Bundled implementations include all necessary dependencies
- No system installation required
- Works on most Linux distributions

#### Windows
- Pre-bundled CLISP works out-of-the-box
- No additional software required

## Technical Details

### Directory Structure
```
clisp-linux/
├── bundle/
│   ├── clisp/    # Complete CLISP bundle
│   ├── ecl/      # Complete ECL bundle
│   └── sbcl/     # Complete SBCL bundle
└── lisp.run      # Intelligent wrapper script

clisp-mac-intel/
├── bundle/
│   └── ecl/      # ECL auto-installer
└── lisp.run      # Enhanced Mac wrapper

clisp-mac-arm64/
├── bundle/
│   └── ecl/      # ECL auto-installer  
└── lisp.run      # Enhanced Mac wrapper

clisp-win/
├── lisp.exe      # Pre-bundled CLISP
└── actr6.mem     # CLISP memory image
```

### Wrapper Scripts
Each platform has an intelligent wrapper script that:
- Detects available LISP implementations
- Selects the best option automatically
- Handles command-line argument conversion
- Provides clear error messages and installation guidance
- Supports auto-installation on Mac platforms

## Support

If you encounter issues:
1. Check that the wrapper scripts are executable: `chmod +x */lisp.run`
2. Run the wrapper directly to see detailed error messages
3. On Mac, ensure Homebrew is installed for auto-installation
4. On Linux, the bundled implementations should work without system dependencies

The portable LISP setup eliminates the need for users to manually install LISP implementations while providing optimal performance on each platform.
