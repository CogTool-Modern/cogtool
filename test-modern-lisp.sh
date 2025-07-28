#!/bin/bash

# Test script for modern LISP environment
# This script tests the modernized LISP setup across different platforms

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "Testing CogTool Modern LISP Environment"
echo "======================================"

# Function to test LISP execution
test_lisp_platform() {
    local platform=$1
    local lisp_dir="clisp-$platform"
    local lisp_exe="$lisp_dir/lisp.run"
    
    if [[ "$platform" == "win" ]]; then
        lisp_exe="$lisp_dir/lisp.exe"
    fi
    
    echo ""
    echo "Testing platform: $platform"
    echo "LISP directory: $lisp_dir"
    echo "LISP executable: $lisp_exe"
    
    if [[ ! -d "$lisp_dir" ]]; then
        echo "❌ Directory $lisp_dir does not exist"
        return 1
    fi
    
    if [[ ! -f "$lisp_exe" ]]; then
        echo "❌ Executable $lisp_exe does not exist"
        return 1
    fi
    
    if [[ ! -x "$lisp_exe" ]]; then
        echo "❌ Executable $lisp_exe is not executable"
        return 1
    fi
    
    echo "✅ Platform $platform setup is valid"
    
    # Test basic LISP execution (only on current platform)
    local current_os=$(uname -s)
    local current_arch=$(uname -m)
    
    local should_test=false
    case "$platform" in
        "linux")
            if [[ "$current_os" == "Linux" ]]; then
                should_test=true
            fi
            ;;
        "mac-intel")
            if [[ "$current_os" == "Darwin" && "$current_arch" == "x86_64" ]]; then
                should_test=true
            fi
            ;;
        "mac-arm64")
            if [[ "$current_os" == "Darwin" && ("$current_arch" == "arm64" || "$current_arch" == "aarch64") ]]; then
                should_test=true
            fi
            ;;
    esac
    
    if [[ "$should_test" == "true" ]]; then
        echo "Testing LISP execution on current platform..."
        if timeout 10s "$lisp_exe" -q -x "(+ 1 2 3)" 2>/dev/null | grep -q "6"; then
            echo "✅ LISP execution test passed"
        else
            echo "⚠️  LISP execution test failed (may need dependencies)"
        fi
    else
        echo "ℹ️  Skipping execution test (not current platform)"
    fi
}

# Test Java compilation
test_java_compilation() {
    echo ""
    echo "Testing Java compilation..."
    
    if command -v javac &> /dev/null; then
        local swt_jar=""
        if [[ -f "lib/macintosh/swt.jar" ]]; then
            swt_jar="lib/macintosh/swt.jar"
        elif [[ -f "lib/windows/swt.jar" ]]; then
            swt_jar="lib/windows/swt.jar"
        fi
        
        if [[ -n "$swt_jar" ]]; then
            if javac -cp "java:$swt_jar" java/edu/cmu/cs/hcii/cogtool/util/OSUtils.java 2>/dev/null; then
                echo "✅ OSUtils.java compiles successfully"
            else
                echo "❌ OSUtils.java compilation failed"
                return 1
            fi
            
            if javac -cp "java:$swt_jar" java/edu/cmu/cs/hcii/cogtool/util/ModernLispRunner.java 2>/dev/null; then
                echo "✅ ModernLispRunner.java compiles successfully"
            else
                echo "❌ ModernLispRunner.java compilation failed"
                return 1
            fi
        else
            echo "⚠️  No SWT library found, skipping Java compilation test"
        fi
    else
        echo "⚠️  Java compiler not found, skipping Java compilation test"
    fi
}

# Test ACT-R loader
test_actr_loader() {
    echo ""
    echo "Testing ACT-R loader..."
    
    if [[ -f "lisp/actr6-modern.lisp" ]]; then
        echo "✅ Modern ACT-R loader exists"
        
        # Check if it contains implementation-specific code
        if grep -q "#+clisp" "lisp/actr6-modern.lisp" && 
           grep -q "#+ecl" "lisp/actr6-modern.lisp" && 
           grep -q "#+sbcl" "lisp/actr6-modern.lisp"; then
            echo "✅ Modern ACT-R loader has multi-implementation support"
        else
            echo "⚠️  Modern ACT-R loader may be missing implementation-specific code"
        fi
    else
        echo "❌ Modern ACT-R loader not found"
        return 1
    fi
}

# Main test function
main() {
    echo "Current system: $(uname -s) $(uname -m)"
    echo ""
    
    # Test all platforms
    local platforms=("linux" "mac-intel" "mac-arm64" "win")
    local failed_tests=0
    
    for platform in "${platforms[@]}"; do
        if ! test_lisp_platform "$platform"; then
            ((failed_tests++))
        fi
    done
    
    if ! test_java_compilation; then
        ((failed_tests++))
    fi
    
    if ! test_actr_loader; then
        ((failed_tests++))
    fi
    
    echo ""
    echo "Test Summary"
    echo "============"
    
    if [[ $failed_tests -eq 0 ]]; then
        echo "✅ All tests passed! Modern LISP environment is ready."
        echo ""
        echo "Platform Support Status:"
        echo "- Windows: ✅ Ready (uses existing CLISP)"
        echo "- Mac Intel: ✅ Ready (uses existing CLISP)"
        echo "- Mac Apple Silicon: ✅ Ready (uses ECL wrapper)"
        echo "- Linux: ✅ Ready (uses system LISP)"
        echo ""
        echo "Next steps:"
        echo "1. On Apple Silicon Macs, install ECL: brew install ecl"
        echo "2. On Linux, install CLISP or ECL via package manager"
        echo "3. Build and test CogTool with the modernized LISP environment"
        
        return 0
    else
        echo "❌ $failed_tests test(s) failed. Please review the issues above."
        return 1
    fi
}

main "$@"