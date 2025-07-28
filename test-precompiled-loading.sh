#!/bin/bash

# Test that pre-compiled ACT-R 6 loads quickly without recompilation
echo "🧪 Testing Pre-compiled ACT-R 6 Loading..."

cd "$(dirname "$0")"

# Create test environment
TEST_DIR="/tmp/cogtool-precompiled-test"
mkdir -p "$TEST_DIR/Resources/lisp"
mkdir -p "$TEST_DIR/Resources/clisp-mac-arm64"

# Copy files including pre-compiled ones
cp clisp-mac-arm64/lisp.run "$TEST_DIR/Resources/clisp-mac-arm64/"
cp lisp/actr6.lisp "$TEST_DIR/Resources/lisp/"
cp -r lisp/actr6 "$TEST_DIR/Resources/lisp/"

cd "$TEST_DIR/Resources"

echo "📊 Pre-compiled files available:"
COMPILED_COUNT=$(find lisp/actr6 -name "*.fas" | wc -l)
echo "   Found $COMPILED_COUNT compiled .fas files"

if [ -f "lisp/actr6/.actr6-lisp-implementation" ]; then
    IMPL_MARKER=$(cat lisp/actr6/.actr6-lisp-implementation)
    echo "   Implementation marker: $IMPL_MARKER"
else
    echo "   No implementation marker found"
fi

echo ""
echo "🚀 Testing fast loading with pre-compiled files..."
echo "Expected: Should use pre-compiled files and load quickly"
echo ""

if command -v ecl >/dev/null 2>&1; then
    echo "--- Loading ACT-R 6 with pre-compiled files ---"
    time timeout 30s ./clisp-mac-arm64/lisp.run -M actr6.mem -x '(format t "~%🎯 Pre-compiled ACT-R 6 loaded successfully!~%")(quit)' 2>&1 | grep -E "\[ACT-R 6\]|🎯|Using pre-compiled|recompiling"
else
    echo "⚠️  ECL not available for testing"
fi

echo ""
echo "🎯 Expected Benefits:"
echo "✅ Fast loading (no compilation delays)"
echo "✅ 'Using pre-compiled' messages instead of 'Compiling' messages"
echo "✅ Immediate ACT-R 6 availability"

# Cleanup
cd /
rm -rf "$TEST_DIR"