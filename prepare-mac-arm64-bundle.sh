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
