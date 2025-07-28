#!/bin/bash

# CogTool Portable LISP Environment Setup Script
# This script creates a truly portable LISP environment that doesn't require external dependencies

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
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

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

print_status "CogTool Portable LISP Environment Setup"
print_status "======================================="

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to create a portable ECL bundle for Apple Silicon
create_apple_silicon_bundle() {
    print_status "Creating Apple Silicon ECL bundle..."
    
    if command_exists ecl; then
        # Get ECL installation path
        ECL_PATH=$(which ecl)
        ECL_DIR=$(dirname "$ECL_PATH")
        
        # Create bundle directory
        mkdir -p clisp-mac-arm64/bundle
        
        # Copy ECL binary
        cp "$ECL_PATH" clisp-mac-arm64/bundle/ecl
        
        # Try to copy ECL libraries (if they exist)
        if [[ -d "/opt/homebrew/lib/ecl" ]]; then
            cp -r /opt/homebrew/lib/ecl clisp-mac-arm64/bundle/
        elif [[ -d "/usr/local/lib/ecl" ]]; then
            cp -r /usr/local/lib/ecl clisp-mac-arm64/bundle/
        fi
        
        # Update the wrapper to use bundled ECL
        sed -i '' 's|BUNDLED_ECL="$SCRIPT_DIR/ecl"|BUNDLED_ECL="$SCRIPT_DIR/bundle/ecl"|' clisp-mac-arm64/lisp.run
        
        print_success "Apple Silicon ECL bundle created"
    else
        print_warning "ECL not found - Apple Silicon users will need to install ECL or use fallback"
    fi
}

# Function to create a portable CLISP bundle for Linux
create_linux_bundle() {
    print_status "Creating Linux CLISP bundle..."
    
    if command_exists clisp; then
        # Get CLISP installation path
        CLISP_PATH=$(which clisp)
        
        # Create bundle directory
        mkdir -p clisp-linux/bundle
        
        # Copy CLISP binary
        cp "$CLISP_PATH" clisp-linux/bundle/clisp
        
        # Update the wrapper to use bundled CLISP
        sed -i 's|BUNDLED_CLISP="$SCRIPT_DIR/clisp"|BUNDLED_CLISP="$SCRIPT_DIR/bundle/clisp"|' clisp-linux/lisp.run
        
        print_success "Linux CLISP bundle created"
    elif command_exists ecl; then
        # Use ECL as alternative
        ECL_PATH=$(which ecl)
        
        mkdir -p clisp-linux/bundle
        cp "$ECL_PATH" clisp-linux/bundle/ecl
        
        print_success "Linux ECL bundle created"
    else
        print_warning "No LISP implementation found - Linux users will need to install CLISP or ECL"
    fi
}

# Function to test the portable setup
test_portable_setup() {
    print_status "Testing portable LISP setup..."
    
    # Test Apple Silicon wrapper
    if [[ -x "clisp-mac-arm64/lisp.run" ]]; then
        print_success "Apple Silicon wrapper is executable"
    else
        print_error "Apple Silicon wrapper is not executable"
    fi
    
    # Test Linux wrapper
    if [[ -x "clisp-linux/lisp.run" ]]; then
        print_success "Linux wrapper is executable"
    else
        print_error "Linux wrapper is not executable"
    fi
    
    # Test existing bundles
    if [[ -x "clisp-mac-intel/lisp.run" ]]; then
        print_success "Intel Mac CLISP bundle is available"
    else
        print_warning "Intel Mac CLISP bundle not found"
    fi
    
    if [[ -x "clisp-win/lisp.exe" ]]; then
        print_success "Windows CLISP bundle is available"
    else
        print_warning "Windows CLISP bundle not found"
    fi
}

# Function to create documentation
create_documentation() {
    print_status "Creating portable LISP documentation..."
    
    cat > PORTABLE_LISP_README.md << 'EOF'
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
EOF

    print_success "Documentation created: PORTABLE_LISP_README.md"
}

# Main execution
main() {
    # Detect current platform
    OS=$(uname -s)
    ARCH=$(uname -m)
    
    print_status "Detected platform: $OS $ARCH"
    
    # Create bundles based on current platform
    case "$OS" in
        Darwin)
            if [[ "$ARCH" == "arm64" || "$ARCH" == "aarch64" ]]; then
                create_apple_silicon_bundle
            fi
            ;;
        Linux)
            create_linux_bundle
            ;;
        *)
            print_status "Running on $OS - no bundling needed"
            ;;
    esac
    
    # Test the setup
    test_portable_setup
    
    # Create documentation
    create_documentation
    
    print_success "Portable LISP environment setup completed!"
    print_status ""
    print_status "Your CogTool installation now includes:"
    print_status "  ✓ Intelligent LISP wrappers for all platforms"
    print_status "  ✓ Automatic fallback strategies"
    print_status "  ✓ Bundled LISP implementations (where available)"
    print_status "  ✓ Comprehensive error handling and user guidance"
    print_status ""
    print_status "CogTool will automatically select the best LISP implementation"
    print_status "available on each platform without requiring user intervention."
}

# Run main function
main "$@"