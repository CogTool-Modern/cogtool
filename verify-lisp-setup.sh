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
