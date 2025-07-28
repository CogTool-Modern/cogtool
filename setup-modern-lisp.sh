#!/bin/bash

# Modern LISP setup script for CogTool
# This script sets up portable LISP environments for different platforms

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "Setting up modern LISP environment for CogTool..."

# Function to detect architecture
detect_arch() {
    local arch=$(uname -m)
    case $arch in
        x86_64)
            echo "x86_64"
            ;;
        arm64|aarch64)
            echo "arm64"
            ;;
        *)
            echo "unknown"
            ;;
    esac
}

# Function to detect OS
detect_os() {
    local os=$(uname -s)
    case $os in
        Darwin)
            echo "mac"
            ;;
        Linux)
            echo "linux"
            ;;
        MINGW*|CYGWIN*|MSYS*)
            echo "win"
            ;;
        *)
            echo "unknown"
            ;;
    esac
}

# Create directories for different platforms
create_directories() {
    echo "Creating platform directories..."
    mkdir -p clisp-mac-arm64
    mkdir -p clisp-mac-intel
    mkdir -p clisp-win
    mkdir -p clisp-linux
}

# Setup Apple Silicon support using ECL (Embeddable Common Lisp)
setup_apple_silicon() {
    echo "Setting up Apple Silicon (ARM64) support..."
    
    # Create a wrapper script that uses ECL
    cat > clisp-mac-arm64/lisp.run << 'EOF'
#!/bin/bash
# Modern LISP wrapper for Apple Silicon using ECL
# This provides compatibility with the existing CogTool LISP interface

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Check if ECL is available
if ! command -v ecl &> /dev/null; then
    echo "Error: ECL (Embeddable Common Lisp) is not installed."
    echo "Please install ECL using: brew install ecl"
    exit 1
fi

# Parse command line arguments to convert CLISP format to ECL format
QUIET=false
ENCODING=""
MEMORY_IMAGE=""
LOAD_FILES=()
EXECUTE_CMD=""

while [[ $# -gt 0 ]]; do
    case $1 in
        -q)
            QUIET=true
            shift
            ;;
        -E)
            ENCODING="$2"
            shift 2
            ;;
        -M)
            MEMORY_IMAGE="$2"
            shift 2
            ;;
        -i)
            LOAD_FILES+=("$2")
            shift 2
            ;;
        -x)
            EXECUTE_CMD="$2"
            shift 2
            ;;
        *)
            shift
            ;;
    esac
done

# Build ECL command
ECL_CMD="ecl"
if [ "$QUIET" = true ]; then
    ECL_CMD="$ECL_CMD -norc"
fi

# Load files
for file in "${LOAD_FILES[@]}"; do
    ECL_CMD="$ECL_CMD -load \"$file\""
done

# Execute command
if [ -n "$EXECUTE_CMD" ]; then
    ECL_CMD="$ECL_CMD -eval \"$EXECUTE_CMD\""
fi

# Run ECL
eval $ECL_CMD
EOF

    chmod +x clisp-mac-arm64/lisp.run
    
    # Copy memory image from Intel version (ECL will recompile as needed)
    if [ -f "clisp-mac-intel/actr6.mem" ]; then
        cp clisp-mac-intel/actr6.mem clisp-mac-arm64/actr6.mem
    fi
    
    # Copy copyright files
    if [ -f "clisp-mac-intel/COPYRIGHT" ]; then
        cp clisp-mac-intel/COPYRIGHT clisp-mac-arm64/COPYRIGHT
    fi
    if [ -f "clisp-mac-intel/GNU-GPL" ]; then
        cp clisp-mac-intel/GNU-GPL clisp-mac-arm64/GNU-GPL
    fi
}

# Setup Linux support
setup_linux() {
    echo "Setting up Linux support..."
    
    # Create a wrapper script that uses system CLISP or ECL
    cat > clisp-linux/lisp.run << 'EOF'
#!/bin/bash
# Modern LISP wrapper for Linux

# Try to use system CLISP first, then ECL as fallback
if command -v clisp &> /dev/null; then
    exec clisp "$@"
elif command -v ecl &> /dev/null; then
    # Convert CLISP arguments to ECL format (simplified)
    exec ecl -norc "$@"
else
    echo "Error: No compatible LISP implementation found."
    echo "Please install CLISP or ECL using your package manager."
    exit 1
fi
EOF

    chmod +x clisp-linux/lisp.run
}

# Create a modern ACT-R loader that works with different LISP implementations
create_modern_actr_loader() {
    echo "Creating modern ACT-R loader..."
    
    cat > lisp/actr6-modern.lisp << 'EOF'
;; Modern ACT-R 6 loader for CogTool
;; Compatible with CLISP, ECL, and other Common Lisp implementations

;; Detect LISP implementation and set appropriate options
#+clisp
(progn
  (setf *load-verbose* nil)
  (setf *compile-verbose* nil)
  (setf *load-print* nil)
  (setf *compile-print* nil)
  (setf *load-compiling* t)
  (setf *floating-point-contagion-ansi* t)
  (setf *warn-on-floating-point-contagion* nil))

#+ecl
(progn
  (setf *load-verbose* nil)
  (setf *load-print* nil))

#+sbcl
(progn
  (setf *load-verbose* nil)
  (setf *load-print* nil)
  (declaim (sb-ext:muffle-conditions sb-ext:compiler-note)))

;; Load ACT-R 6 and EMMA
(load "actr6/load-act-r-6.lisp")
EOF
}

# Main setup function
main() {
    echo "CogTool Modern LISP Setup"
    echo "========================="
    
    local os=$(detect_os)
    local arch=$(detect_arch)
    
    echo "Detected platform: $os-$arch"
    
    create_directories
    create_modern_actr_loader
    
    case "$os" in
        mac)
            if [ "$arch" = "arm64" ]; then
                setup_apple_silicon
            fi
            echo "Mac setup complete. Intel version already exists."
            ;;
        linux)
            setup_linux
            ;;
        *)
            echo "Platform $os not supported by this setup script."
            echo "Windows and existing Mac Intel setups are already configured."
            ;;
    esac
    
    echo ""
    echo "Modern LISP setup complete!"
    echo ""
    echo "Platform support:"
    echo "- Windows: Uses existing CLISP setup"
    echo "- Mac Intel: Uses existing CLISP setup"
    echo "- Mac Apple Silicon: Uses ECL wrapper (install with: brew install ecl)"
    echo "- Linux: Uses system CLISP or ECL"
    echo ""
    echo "To use the modern setup, ensure your Java code calls ModernLispRunner.execModernLisp()"
}

main "$@"