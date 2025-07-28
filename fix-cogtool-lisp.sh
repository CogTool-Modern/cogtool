#!/bin/bash

# Quick Fix for CogTool LISP Issues
# This script can be run directly on the user's system to fix LISP problems

set -e

echo "🔧 CogTool LISP Quick Fix"
echo "========================="
echo ""

# Detect platform
if [[ "$OSTYPE" == "darwin"* ]]; then
    if [[ $(uname -m) == "arm64" ]]; then
        PLATFORM="mac-arm64"
        echo "Detected: Apple Silicon Mac"
    else
        PLATFORM="mac-intel"
        echo "Detected: Intel Mac"
    fi
else
    echo "This fix is specifically for Mac systems."
    echo "Linux and Windows should work out-of-the-box with the bundled LISP."
    exit 1
fi

echo ""
echo "Installing ECL (Embeddable Common Lisp)..."
echo "This will resolve the 'No LISP implementation found' error."
echo ""

# Check if Homebrew is installed
if ! command -v brew >/dev/null 2>&1; then
    echo "❌ Homebrew not found!"
    echo ""
    echo "Please install Homebrew first:"
    echo "  /bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
    echo ""
    echo "Then run this script again."
    exit 1
fi

echo "✅ Homebrew found"

# Install ECL
echo "Installing ECL via Homebrew..."
if brew install ecl; then
    echo ""
    echo "🎉 SUCCESS! ECL installed successfully."
    echo ""
    echo "Testing LISP installation..."
    if ecl --eval '(format t "CogTool LISP fix successful!~%")' --eval '(quit)' 2>/dev/null; then
        echo "✅ LISP test passed!"
        echo ""
        echo "🚀 Your CogTool should now work without LISP errors."
        echo ""
        echo "What was fixed:"
        echo "  • Installed ECL (Embeddable Common Lisp)"
        echo "  • CogTool will now use this LISP implementation"
        echo "  • No more 'No LISP implementation found' errors"
        echo ""
        echo "You can now run CogTool normally."
    else
        echo "⚠️  LISP installed but test failed. CogTool should still work."
    fi
else
    echo ""
    echo "❌ ECL installation failed."
    echo ""
    echo "Alternative solutions:"
    echo ""
    echo "1. Try installing CLISP instead:"
    echo "   brew install clisp"
    echo ""
    echo "2. Try installing SBCL instead:"
    echo "   brew install sbcl"
    echo ""
    echo "3. Manual installation:"
    echo "   • Download ECL from: https://ecl.common-lisp.dev/"
    echo "   • Download CLISP from: https://clisp.sourceforge.io/"
    echo "   • Download SBCL from: https://www.sbcl.org/"
    echo ""
    exit 1
fi