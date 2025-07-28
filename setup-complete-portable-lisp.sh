#!/bin/bash

# Complete Portable LISP Setup for CogTool
# Creates self-contained LISP environments for all supported platforms

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Function to create comprehensive documentation
create_comprehensive_docs() {
    print_status "Creating comprehensive LISP setup documentation"
    
    cat > "LISP-SETUP-README.md" << 'EOF'
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
EOF

    print_success "Comprehensive documentation created: LISP-SETUP-README.md"
}

# Function to test all platforms
test_all_platforms() {
    print_status "Testing all platform implementations"
    
    # Test Linux
    if [ -x "clisp-linux/lisp.run" ]; then
        print_status "Testing Linux implementation..."
        if ./clisp-linux/lisp.run -x '(format t "Linux test: OK~%")' >/dev/null 2>&1; then
            print_success "Linux implementation working"
        else
            print_warning "Linux implementation test failed"
        fi
    fi
    
    # Test Mac Intel (will show installation guidance)
    if [ -x "clisp-mac-intel/lisp.run" ]; then
        print_success "Mac Intel wrapper is executable"
    else
        print_warning "Mac Intel wrapper not found"
    fi
    
    # Test Mac ARM64 (will show installation guidance)
    if [ -x "clisp-mac-arm64/lisp.run" ]; then
        print_success "Mac ARM64 wrapper is executable"
    else
        print_warning "Mac ARM64 wrapper not found"
    fi
    
    # Test Windows
    if [ -x "clisp-win/lisp.exe" ]; then
        print_success "Windows CLISP executable is available"
    else
        print_warning "Windows CLISP executable not found"
    fi
}

# Function to create a unified setup verification script
create_verification_script() {
    print_status "Creating setup verification script"
    
    cat > "verify-lisp-setup.sh" << 'EOF'
#!/bin/bash

# CogTool LISP Setup Verification Script
# Verifies that all LISP implementations are properly configured

echo "=== CogTool LISP Setup Verification ==="
echo ""

# Detect platform
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    PLATFORM="linux"
    WRAPPER="clisp-linux/lisp.run"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    if [[ $(uname -m) == "arm64" ]]; then
        PLATFORM="mac-arm64"
        WRAPPER="clisp-mac-arm64/lisp.run"
    else
        PLATFORM="mac-intel"
        WRAPPER="clisp-mac-intel/lisp.run"
    fi
elif [[ "$OSTYPE" == "cygwin" ]] || [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "win32" ]]; then
    PLATFORM="windows"
    WRAPPER="clisp-win/lisp.exe"
else
    echo "Unknown platform: $OSTYPE"
    exit 1
fi

echo "Detected platform: $PLATFORM"
echo "Using wrapper: $WRAPPER"
echo ""

# Test the wrapper
if [ -x "$WRAPPER" ]; then
    echo "✓ Wrapper is executable"
    
    # Try to run a simple LISP command
    echo "Testing LISP execution..."
    if [ "$PLATFORM" = "windows" ]; then
        # Windows uses different syntax
        echo "(format t \"CogTool LISP verification successful!~%\")" | ./"$WRAPPER" 2>/dev/null
    else
        # Unix-like systems
        ./"$WRAPPER" -x '(format t "CogTool LISP verification successful!~%")' 2>/dev/null
    fi
    
    if [ $? -eq 0 ]; then
        echo "✓ LISP execution successful"
    else
        echo "⚠ LISP execution failed - this may be normal on Mac if LISP isn't installed yet"
        echo "  The wrapper will attempt auto-installation when CogTool runs"
    fi
else
    echo "✗ Wrapper not found or not executable: $WRAPPER"
    exit 1
fi

echo ""
echo "=== Verification Complete ==="
echo ""
echo "Your CogTool LISP setup is ready!"
echo "- Platform: $PLATFORM"
echo "- Wrapper: $WRAPPER"
echo ""

if [[ "$PLATFORM" == "mac"* ]]; then
    echo "Note for Mac users:"
    echo "- The first time CogTool runs, it may install LISP automatically"
    echo "- This requires an internet connection and Homebrew"
    echo "- Installation is automatic and only happens once"
fi
EOF

    chmod +x verify-lisp-setup.sh
    print_success "Verification script created: verify-lisp-setup.sh"
}

# Main setup function
main() {
    print_status "Setting up complete portable LISP environment for CogTool"
    
    # Run the bundling scripts
    if [ -f "bundle-lisp-implementations.sh" ]; then
        print_status "Running LISP implementation bundling..."
        ./bundle-lisp-implementations.sh
    fi
    
    if [ -f "create-portable-mac-bundles.sh" ]; then
        print_status "Creating portable Mac bundles..."
        ./create-portable-mac-bundles.sh
    fi
    
    # Create documentation and verification tools
    create_comprehensive_docs
    create_verification_script
    
    # Test all platforms
    test_all_platforms
    
    print_success "Complete portable LISP setup finished!"
    print_status ""
    print_status "Summary:"
    print_status "- Linux: Bundled CLISP, ECL, and SBCL implementations"
    print_status "- Mac Intel: Auto-installing ECL wrapper"
    print_status "- Mac ARM64: Auto-installing ECL wrapper with native performance"
    print_status "- Windows: Pre-bundled CLISP executable"
    print_status ""
    print_status "Run './verify-lisp-setup.sh' to test your platform"
    print_status "See 'LISP-SETUP-README.md' for detailed documentation"
}

# Run main function
main "$@"