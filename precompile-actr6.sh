#!/bin/bash

# Pre-compile ACT-R 6 framework during build process
# This avoids runtime compilation delays for users

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LISP_DIR="$SCRIPT_DIR/lisp"
ACTR6_DIR="$LISP_DIR/actr6"

echo "🔧 Pre-compiling ACT-R 6 framework for build..."

# Function to detect available LISP implementations
detect_lisp() {
    if command -v ecl >/dev/null 2>&1; then
        echo "ecl"
    elif command -v clisp >/dev/null 2>&1; then
        echo "clisp"
    elif command -v sbcl >/dev/null 2>&1; then
        echo "sbcl"
    else
        echo "none"
    fi
}

# Function to compile ACT-R 6 with a specific LISP implementation
compile_with_lisp() {
    local lisp_impl="$1"
    local lisp_cmd="$2"
    
    echo "📦 Pre-compiling ACT-R 6 with $lisp_impl..."
    
    # Create a temporary compilation script
    local temp_script=$(mktemp)
    cat > "$temp_script" << 'EOF'
;; Pre-compilation script for ACT-R 6
(in-package :common-lisp-user)

;; Set feature to force compilation of all files
(pushnew :actr-recompile *features*)

;; Load and compile ACT-R 6
(format t "~&[Build] Starting ACT-R 6 pre-compilation...~%")
(load "actr6.lisp")
(format t "~&[Build] ACT-R 6 pre-compilation complete!~%")

;; Exit cleanly
#+ecl (quit)
#+clisp (quit)
#+sbcl (quit)
EOF

    # Change to lisp directory and run compilation
    cd "$LISP_DIR"
    
    case "$lisp_impl" in
        "ecl")
            timeout 300s ecl -load "$temp_script" 2>&1 | grep -E "\[Build\]|Compiling|Error|Warning" || true
            ;;
        "clisp")
            timeout 300s clisp -i "$temp_script" 2>&1 | grep -E "\[Build\]|Compiling|Error|Warning" || true
            ;;
        "sbcl")
            timeout 300s sbcl --load "$temp_script" 2>&1 | grep -E "\[Build\]|Compiling|Error|Warning" || true
            ;;
    esac
    
    # Clean up
    rm -f "$temp_script"
    cd "$SCRIPT_DIR"
}

# Function to create implementation marker
create_implementation_marker() {
    local lisp_impl="$1"
    local marker_file="$ACTR6_DIR/.actr6-lisp-implementation"
    
    echo "$lisp_impl" > "$marker_file"
    echo "📝 Created implementation marker for $lisp_impl"
}

# Main compilation logic
main() {
    if [ ! -d "$ACTR6_DIR" ]; then
        echo "❌ ACT-R 6 directory not found: $ACTR6_DIR"
        exit 1
    fi
    
    # Detect available LISP implementation
    LISP_IMPL=$(detect_lisp)
    
    if [ "$LISP_IMPL" = "none" ]; then
        echo "⚠️  No LISP implementation found for pre-compilation"
        echo "   ACT-R 6 will be compiled at runtime instead"
        return 0
    fi
    
    echo "✅ Found $LISP_IMPL for pre-compilation"
    
    # Clean any existing compiled files to ensure fresh compilation
    echo "🧹 Cleaning existing compiled files..."
    find "$ACTR6_DIR" -name "*.fas" -delete 2>/dev/null || true
    find "$ACTR6_DIR" -name "*.fasl" -delete 2>/dev/null || true
    
    # Compile with detected LISP implementation
    case "$LISP_IMPL" in
        "ecl")
            compile_with_lisp "ecl" "ecl"
            ;;
        "clisp")
            compile_with_lisp "clisp" "clisp"
            ;;
        "sbcl")
            compile_with_lisp "sbcl" "sbcl"
            ;;
    esac
    
    # Create implementation marker
    create_implementation_marker "$LISP_IMPL"
    
    # Count compiled files
    COMPILED_COUNT=$(find "$ACTR6_DIR" -name "*.fas" -o -name "*.fasl" | wc -l)
    echo "🎯 Pre-compilation complete! Generated $COMPILED_COUNT compiled files"
    
    if [ $COMPILED_COUNT -gt 0 ]; then
        echo "✅ ACT-R 6 is now pre-compiled and ready for fast runtime loading"
    else
        echo "⚠️  Pre-compilation may not have succeeded - ACT-R 6 will compile at runtime"
    fi
}

# Run main function
main "$@"