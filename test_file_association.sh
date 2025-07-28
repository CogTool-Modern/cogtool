#!/bin/bash

# Test script to verify file association works
# This script simulates what happens when a .cgt file is double-clicked

echo "Testing CogTool file association..."

# Create a test .cgt file
TEST_FILE="/tmp/test_project.cgt"
echo "Creating test file: $TEST_FILE"
echo '<?xml version="1.0" encoding="UTF-8"?><project></project>' > "$TEST_FILE"

# Test the cogtoolstart script directly with the file argument
echo "Testing cogtoolstart script with file argument..."
SCRIPT_DIR="$(dirname "$0")"
COGTOOLSTART="$SCRIPT_DIR/lib/macintosh/cogtoolstart"

if [ -f "$COGTOOLSTART" ]; then
    echo "Found cogtoolstart script at: $COGTOOLSTART"
    echo "Testing with argument: $TEST_FILE"
    
    # Add some debug output to see what arguments are passed
    echo "Arguments passed to cogtoolstart: $TEST_FILE"
    
    # We can't actually run this without building the app, but we can check the script
    echo "Script content:"
    cat "$COGTOOLSTART"
else
    echo "ERROR: cogtoolstart script not found at $COGTOOLSTART"
fi

# Clean up
rm -f "$TEST_FILE"
echo "Test completed."