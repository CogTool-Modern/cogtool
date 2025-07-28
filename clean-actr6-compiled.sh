#!/bin/bash

# Clean ACT-R 6 compiled files to force recompilation for current LISP implementation
echo "🧹 Cleaning ACT-R 6 compiled files..."

cd "$(dirname "$0")"

# Count existing compiled files
COMPILED_COUNT=$(find lisp/actr6 -name "*.fas" -o -name "*.fasl" -o -name "*.o" | wc -l)
echo "📊 Found $COMPILED_COUNT compiled files to remove"

# Remove all compiled files
echo "🗑️  Removing compiled files..."
find lisp/actr6 -name "*.fas" -delete
find lisp/actr6 -name "*.fasl" -delete  
find lisp/actr6 -name "*.o" -delete

# Verify cleanup
REMAINING_COUNT=$(find lisp/actr6 -name "*.fas" -o -name "*.fasl" -o -name "*.o" | wc -l)
echo "✅ Cleanup complete. $REMAINING_COUNT compiled files remaining"

if [ $REMAINING_COUNT -eq 0 ]; then
    echo "🎯 All compiled files removed successfully!"
    echo "📝 ACT-R 6 will now recompile for the current LISP implementation"
else
    echo "⚠️  Some compiled files may still exist"
fi

echo ""
echo "💡 Next steps:"
echo "1. Rebuild CogTool.app with: ant clean && ant package-mac"
echo "2. The rebuilt app will recompile ACT-R 6 for ECL/Apple Silicon on first run"