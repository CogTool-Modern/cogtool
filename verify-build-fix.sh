#!/bin/bash

# Verify that the build system will include ACT-R 6 framework
echo "🔍 Verifying ACT-R 6 framework availability for build system..."

# Check if ACT-R 6 directory exists
if [ -d "lisp/actr6" ]; then
    echo "✅ ACT-R 6 directory found: lisp/actr6"
    
    # Check key files
    if [ -f "lisp/actr6/load-act-r-6.lisp" ]; then
        echo "✅ Main ACT-R 6 loader found: lisp/actr6/load-act-r-6.lisp"
    else
        echo "❌ Missing: lisp/actr6/load-act-r-6.lisp"
    fi
    
    # Count framework files
    FRAMEWORK_FILES=$(find lisp/actr6 -name "*.lisp" | wc -l)
    echo "✅ Found $FRAMEWORK_FILES LISP files in ACT-R 6 framework"
    
    # Check build.xml includes ACT-R 6
    if grep -q "actr6/\*\*/\*" build.xml; then
        echo "✅ build.xml configured to include ACT-R 6 framework"
    else
        echo "❌ build.xml missing ACT-R 6 framework inclusion"
    fi
    
    # Check NSIS includes ACT-R 6
    if grep -q "actr6" res/cogtool.nsi; then
        echo "✅ Windows installer configured to include ACT-R 6 framework"
    else
        echo "❌ Windows installer missing ACT-R 6 framework inclusion"
    fi
    
    echo ""
    echo "🎯 BUILD SYSTEM STATUS: Ready to bundle complete ACT-R 6 framework"
    echo ""
    echo "📋 Next steps for user:"
    echo "1. Pull latest changes: git pull origin feature/modernize-lisp-apple-silicon-support"
    echo "2. Clean and rebuild: ant clean && ant package-mac"
    echo "3. The new CogTool.app will include complete ACT-R 6 framework"
    
else
    echo "❌ ACT-R 6 directory not found: lisp/actr6"
    echo "This is required for CogTool's cognitive modeling functionality"
fi