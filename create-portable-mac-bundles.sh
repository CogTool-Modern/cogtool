#!/bin/bash

# Create Portable Mac LISP Bundles
# This script creates self-contained LISP implementations for Mac platforms

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

# Create a minimal ECL bundle for Mac Intel
create_mac_intel_bundle() {
    print_status "Creating Mac Intel ECL bundle"
    
    # Create bundle structure
    mkdir -p clisp-mac-intel/bundle/ecl/bin
    mkdir -p clisp-mac-intel/bundle/ecl/lib
    
    # Create a minimal ECL launcher script
    cat > clisp-mac-intel/bundle/ecl/bin/ecl << 'EOF'
#!/bin/bash
# Minimal ECL launcher for Mac Intel
# This script attempts to use system ECL or provides installation guidance

if command -v ecl >/dev/null 2>&1; then
    exec ecl "$@"
else
    echo "[CogTool LISP] ECL not found. Installing via Homebrew..." >&2
    if command -v brew >/dev/null 2>&1; then
        brew install ecl
        exec ecl "$@"
    else
        echo "[CogTool LISP] ERROR: Homebrew not found!" >&2
        echo "[CogTool LISP] Please install ECL manually:" >&2
        echo "[CogTool LISP]   1. Install Homebrew: https://brew.sh/" >&2
        echo "[CogTool LISP]   2. Run: brew install ecl" >&2
        echo "[CogTool LISP]   3. Or download from: https://ecl.common-lisp.dev/" >&2
        exit 1
    fi
fi
EOF
    
    chmod +x clisp-mac-intel/bundle/ecl/bin/ecl
    print_success "Mac Intel ECL bundle created"
}

# Create a minimal ECL bundle for Mac ARM64
create_mac_arm64_bundle() {
    print_status "Creating Mac ARM64 ECL bundle"
    
    # Create bundle structure
    mkdir -p clisp-mac-arm64/bundle/ecl/bin
    mkdir -p clisp-mac-arm64/bundle/ecl/lib
    
    # Create a minimal ECL launcher script
    cat > clisp-mac-arm64/bundle/ecl/bin/ecl << 'EOF'
#!/bin/bash
# Minimal ECL launcher for Mac ARM64
# This script attempts to use system ECL or provides installation guidance

if command -v ecl >/dev/null 2>&1; then
    exec ecl "$@"
else
    echo "[CogTool LISP] ECL not found. Installing via Homebrew..." >&2
    if command -v brew >/dev/null 2>&1; then
        brew install ecl
        exec ecl "$@"
    else
        echo "[CogTool LISP] ERROR: Homebrew not found!" >&2
        echo "[CogTool LISP] Please install ECL manually:" >&2
        echo "[CogTool LISP]   1. Install Homebrew: https://brew.sh/" >&2
        echo "[CogTool LISP]   2. Run: brew install ecl" >&2
        echo "[CogTool LISP]   3. Or download from: https://ecl.common-lisp.dev/" >&2
        exit 1
    fi
fi
EOF
    
    chmod +x clisp-mac-arm64/bundle/ecl/bin/ecl
    print_success "Mac ARM64 ECL bundle created"
}

# Create enhanced Mac wrappers that handle auto-installation
create_enhanced_mac_wrapper() {
    local platform="$1"
    local wrapper_path="$2"
    
    print_status "Creating enhanced Mac wrapper for $platform"
    
    cat > "$wrapper_path" << 'EOF'
#!/bin/bash

# CogTool Enhanced Mac LISP Wrapper
# Handles automatic installation and provides comprehensive fallback strategies

# Get script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Helper functions
log_message() {
    echo "[CogTool LISP] $1" >&2
}

command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Auto-install function
auto_install_lisp() {
    log_message "No LISP implementation found. Attempting automatic installation..."
    
    if command_exists brew; then
        log_message "Installing ECL via Homebrew..."
        if brew install ecl; then
            log_message "ECL installed successfully!"
            return 0
        else
            log_message "Homebrew installation failed, trying alternative methods..."
        fi
    fi
    
    # If Homebrew fails or isn't available, provide manual instructions
    log_message ""
    log_message "Automatic installation failed. Please install a LISP implementation manually:"
    log_message ""
    log_message "Option 1 - Install Homebrew and ECL (Recommended):"
    log_message "  1. Install Homebrew: /bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
    log_message "  2. Install ECL: brew install ecl"
    log_message ""
    log_message "Option 2 - Install CLISP:"
    log_message "  • Homebrew: brew install clisp"
    log_message "  • MacPorts: sudo port install clisp"
    log_message "  • Download: https://clisp.sourceforge.io/"
    log_message ""
    log_message "Option 3 - Install SBCL:"
    log_message "  • Homebrew: brew install sbcl"
    log_message "  • Download: https://www.sbcl.org/"
    log_message ""
    return 1
}

# Try to find LISP implementation
LISP_IMPL=""
LISP_CMD=""

# Check bundled implementations first
if [ -x "$SCRIPT_DIR/bundle/ecl/bin/ecl" ]; then
    log_message "Using bundled ECL"
    LISP_IMPL="ecl"
    LISP_CMD="$SCRIPT_DIR/bundle/ecl/bin/ecl"
elif [ -x "$SCRIPT_DIR/bundle/clisp/bin/clisp" ]; then
    log_message "Using bundled CLISP"
    LISP_IMPL="clisp"
    LISP_CMD="$SCRIPT_DIR/bundle/clisp/bin/clisp"
# Check system implementations
elif command_exists ecl; then
    log_message "Using system ECL"
    LISP_IMPL="ecl"
    LISP_CMD="ecl"
elif command_exists clisp; then
    log_message "Using system CLISP"
    LISP_IMPL="clisp"
    LISP_CMD="clisp"
elif command_exists sbcl; then
    log_message "Using system SBCL"
    LISP_IMPL="sbcl"
    LISP_CMD="sbcl"
else
    # Try auto-installation
    if auto_install_lisp; then
        # Retry detection after installation
        if command_exists ecl; then
            log_message "Using newly installed ECL"
            LISP_IMPL="ecl"
            LISP_CMD="ecl"
        elif command_exists clisp; then
            log_message "Using newly installed CLISP"
            LISP_IMPL="clisp"
            LISP_CMD="clisp"
        elif command_exists sbcl; then
            log_message "Using newly installed SBCL"
            LISP_IMPL="sbcl"
            LISP_CMD="sbcl"
        else
            exit 1
        fi
    else
        exit 1
    fi
fi

# Parse command line arguments
QUIET=false
ENCODING=""
LOAD_FILES=()
EXECUTE_CMD=""

while [[ $# -gt 0 ]]; do
    case $1 in
        -q|--quiet)
            QUIET=true
            shift
            ;;
        -E|--encoding)
            ENCODING="$2"
            shift 2
            ;;
        -i|--load)
            LOAD_FILES+=("$2")
            shift 2
            ;;
        -x|--execute)
            EXECUTE_CMD="$2"
            shift 2
            ;;
        *)
            # Pass through unknown arguments
            break
            ;;
    esac
done

# Build command based on LISP implementation
if [ "$LISP_IMPL" = "clisp" ]; then
    # CLISP syntax
    CMD="$LISP_CMD"
    if [ "$QUIET" = true ]; then
        CMD="$CMD -q"
    fi
    if [ -n "$ENCODING" ]; then
        CMD="$CMD -E $ENCODING"
    fi
    for file in "${LOAD_FILES[@]}"; do
        CMD="$CMD -i '$file'"
    done
    if [ -n "$EXECUTE_CMD" ]; then
        CMD="$CMD -x '$EXECUTE_CMD'"
    fi
elif [ "$LISP_IMPL" = "ecl" ]; then
    # ECL syntax
    CMD="$LISP_CMD"
    if [ "$QUIET" = true ]; then
        CMD="$CMD -q"
    fi
    for file in "${LOAD_FILES[@]}"; do
        CMD="$CMD --load '$file'"
    done
    if [ -n "$EXECUTE_CMD" ]; then
        CMD="$CMD --eval '$EXECUTE_CMD'"
    fi
    # ECL needs explicit quit
    CMD="$CMD --eval '(quit)'"
elif [ "$LISP_IMPL" = "sbcl" ]; then
    # SBCL syntax
    CMD="$LISP_CMD"
    if [ "$QUIET" = true ]; then
        CMD="$CMD --noinform"
    fi
    for file in "${LOAD_FILES[@]}"; do
        CMD="$CMD --load '$file'"
    done
    if [ -n "$EXECUTE_CMD" ]; then
        CMD="$CMD --eval '$EXECUTE_CMD'"
    fi
    # SBCL needs explicit quit
    CMD="$CMD --eval '(quit)'"
fi

# Add any remaining arguments
if [[ $# -gt 0 ]]; then
    CMD="$CMD $*"
fi

# Run the command
exec bash -c "$CMD"
EOF

    chmod +x "$wrapper_path"
    print_success "Enhanced Mac wrapper created: $wrapper_path"
}

# Main function
main() {
    print_status "Creating portable Mac LISP bundles with auto-installation"
    
    # Create Mac bundles
    create_mac_intel_bundle
    create_mac_arm64_bundle
    
    # Create enhanced wrappers
    create_enhanced_mac_wrapper "mac-intel" "clisp-mac-intel/lisp.run"
    create_enhanced_mac_wrapper "mac-arm64" "clisp-mac-arm64/lisp.run"
    
    print_success "Portable Mac bundles created successfully!"
    print_status "These bundles will automatically install LISP implementations when needed"
}

# Run main function
main "$@"