#!/bin/bash

# CogTool LISP Implementation Bundling Script
# Creates portable LISP bundles for all supported platforms

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

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to get library dependencies
get_dependencies() {
    local binary="$1"
    if command_exists ldd; then
        ldd "$binary" 2>/dev/null | grep -v "linux-vdso\|ld-linux" | awk '{print $3}' | grep -v "^$" || true
    fi
}

# Function to copy dependencies
copy_dependencies() {
    local binary="$1"
    local target_dir="$2"
    
    print_status "Copying dependencies for $(basename "$binary")"
    
    # Create lib directory
    mkdir -p "$target_dir/lib"
    
    # Get and copy dependencies
    get_dependencies "$binary" | while read -r lib; do
        if [ -n "$lib" ] && [ -f "$lib" ]; then
            local lib_name=$(basename "$lib")
            if [ ! -f "$target_dir/lib/$lib_name" ]; then
                cp "$lib" "$target_dir/lib/"
                print_status "  Copied: $lib_name"
            fi
        fi
    done
}

# Function to create a portable LISP bundle
create_lisp_bundle() {
    local lisp_name="$1"
    local lisp_binary="$2"
    local target_dir="$3"
    local platform="$4"
    
    print_status "Creating $lisp_name bundle for $platform"
    
    # Create bundle directory structure
    mkdir -p "$target_dir/bin"
    mkdir -p "$target_dir/lib"
    mkdir -p "$target_dir/share"
    
    # Copy main binary
    cp "$lisp_binary" "$target_dir/bin/"
    chmod +x "$target_dir/bin/$(basename "$lisp_binary")"
    
    # Copy dependencies (Linux only)
    if [ "$platform" = "linux" ]; then
        copy_dependencies "$lisp_binary" "$target_dir"
    fi
    
    # Copy LISP-specific files
    case "$lisp_name" in
        "clisp")
            # Copy CLISP runtime files
            if [ -d "/usr/lib/clisp-2.49" ]; then
                cp -r /usr/lib/clisp-2.49/* "$target_dir/share/" 2>/dev/null || true
            elif [ -d "/usr/share/clisp" ]; then
                cp -r /usr/share/clisp/* "$target_dir/share/" 2>/dev/null || true
            fi
            ;;
        "ecl")
            # Copy ECL runtime files
            if [ -d "/usr/lib/ecl" ]; then
                cp -r /usr/lib/ecl/* "$target_dir/share/" 2>/dev/null || true
            fi
            ;;
        "sbcl")
            # Copy SBCL core files
            if [ -d "/usr/lib/sbcl" ]; then
                cp -r /usr/lib/sbcl/* "$target_dir/share/" 2>/dev/null || true
            fi
            ;;
    esac
    
    print_success "$lisp_name bundle created in $target_dir"
}

# Function to create wrapper script for bundled LISP
create_bundled_wrapper() {
    local platform="$1"
    local wrapper_path="$2"
    
    print_status "Creating bundled wrapper for $platform"
    
    cat > "$wrapper_path" << 'EOF'
#!/bin/bash

# CogTool Bundled LISP Wrapper Script
# Uses bundled LISP implementations for maximum portability

# Get script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Helper functions
log_message() {
    echo "[CogTool LISP] $1" >&2
}

# Try bundled LISP implementations in order of preference
LISP_IMPL=""
LISP_CMD=""

# Check for bundled CLISP
if [ -x "$SCRIPT_DIR/bundle/clisp/bin/clisp" ]; then
    log_message "Using bundled CLISP"
    LISP_IMPL="clisp"
    LISP_CMD="$SCRIPT_DIR/bundle/clisp/bin/clisp"
    export LD_LIBRARY_PATH="$SCRIPT_DIR/bundle/clisp/lib:$LD_LIBRARY_PATH"
# Check for bundled ECL
elif [ -x "$SCRIPT_DIR/bundle/ecl/bin/ecl" ]; then
    log_message "Using bundled ECL"
    LISP_IMPL="ecl"
    LISP_CMD="$SCRIPT_DIR/bundle/ecl/bin/ecl"
    export LD_LIBRARY_PATH="$SCRIPT_DIR/bundle/ecl/lib:$LD_LIBRARY_PATH"
# Check for bundled SBCL
elif [ -x "$SCRIPT_DIR/bundle/sbcl/bin/sbcl" ]; then
    log_message "Using bundled SBCL"
    LISP_IMPL="sbcl"
    LISP_CMD="$SCRIPT_DIR/bundle/sbcl/bin/sbcl"
    export LD_LIBRARY_PATH="$SCRIPT_DIR/bundle/sbcl/lib:$LD_LIBRARY_PATH"
# Fallback to system LISP
elif command -v clisp >/dev/null 2>&1; then
    log_message "Using system CLISP"
    LISP_IMPL="clisp"
    LISP_CMD="clisp"
elif command -v ecl >/dev/null 2>&1; then
    log_message "Using system ECL"
    LISP_IMPL="ecl"
    LISP_CMD="ecl"
elif command -v sbcl >/dev/null 2>&1; then
    log_message "Using system SBCL"
    LISP_IMPL="sbcl"
    LISP_CMD="sbcl"
else
    log_message "ERROR: No LISP implementation found!"
    log_message ""
    log_message "This should not happen as CogTool includes bundled LISP implementations."
    log_message "Please check that the bundle directory exists and contains LISP binaries."
    log_message ""
    exit 1
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
    print_success "Bundled wrapper created: $wrapper_path"
}

# Main bundling process
main() {
    print_status "Starting LISP implementation bundling process"
    
    # Create bundles for Linux (current system)
    if command_exists clisp; then
        create_lisp_bundle "clisp" "$(which clisp)" "clisp-linux/bundle/clisp" "linux"
    fi
    
    if command_exists ecl; then
        create_lisp_bundle "ecl" "$(which ecl)" "clisp-linux/bundle/ecl" "linux"
    fi
    
    if command_exists sbcl; then
        create_lisp_bundle "sbcl" "$(which sbcl)" "clisp-linux/bundle/sbcl" "linux"
    fi
    
    # Create bundled wrapper for Linux
    create_bundled_wrapper "linux" "clisp-linux/lisp.run"
    
    # For Mac platforms, we'll create download instructions since we can't cross-compile
    print_status "Creating Mac bundle preparation scripts"
    
    # Create Mac Intel bundle preparation script
    cat > "prepare-mac-intel-bundle.sh" << 'EOF'
#!/bin/bash
# Mac Intel Bundle Preparation Script
# Run this on an Intel Mac to create the bundled LISP implementations

echo "Preparing Intel Mac LISP bundle..."

# Install CLISP via Homebrew if not present
if ! command -v clisp >/dev/null 2>&1; then
    echo "Installing CLISP via Homebrew..."
    brew install clisp
fi

# Create bundle directory
mkdir -p clisp-mac-intel/bundle/clisp/bin

# Copy CLISP binary
cp "$(which clisp)" clisp-mac-intel/bundle/clisp/bin/

# Copy CLISP runtime files
if [ -d "$(brew --prefix)/lib/clisp" ]; then
    cp -r "$(brew --prefix)/lib/clisp" clisp-mac-intel/bundle/clisp/share/
fi

echo "Intel Mac bundle prepared successfully!"
EOF

    # Create Mac ARM64 bundle preparation script  
    cat > "prepare-mac-arm64-bundle.sh" << 'EOF'
#!/bin/bash
# Mac ARM64 Bundle Preparation Script
# Run this on an Apple Silicon Mac to create the bundled LISP implementations

echo "Preparing Apple Silicon Mac LISP bundle..."

# Install ECL via Homebrew if not present (better ARM64 support)
if ! command -v ecl >/dev/null 2>&1; then
    echo "Installing ECL via Homebrew..."
    brew install ecl
fi

# Create bundle directory
mkdir -p clisp-mac-arm64/bundle/ecl/bin

# Copy ECL binary
cp "$(which ecl)" clisp-mac-arm64/bundle/ecl/bin/

# Copy ECL runtime files
if [ -d "$(brew --prefix)/lib/ecl" ]; then
    cp -r "$(brew --prefix)/lib/ecl" clisp-mac-arm64/bundle/ecl/share/
fi

echo "Apple Silicon Mac bundle prepared successfully!"
EOF

    chmod +x prepare-mac-intel-bundle.sh prepare-mac-arm64-bundle.sh
    
    # Update existing Mac wrappers to use bundled implementations
    create_bundled_wrapper "mac-intel" "clisp-mac-intel/lisp.run"
    create_bundled_wrapper "mac-arm64" "clisp-mac-arm64/lisp.run"
    
    print_success "LISP bundling process completed!"
    print_status "Linux bundles are ready to use"
    print_status "Mac bundle preparation scripts created - run them on respective Mac systems"
}

# Run main function
main "$@"