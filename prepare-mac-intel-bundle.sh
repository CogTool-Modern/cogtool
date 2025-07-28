#!/bin/bash
# Mac Intel Bundle Preparation Script
# Run this on an Intel Mac to create the bundled LISP implementations

echo "Preparing Intel Mac LISP bundle..."

# Install CLISP via Homebrew if not present
if ! command -v clisp >/dev/null 2>&1; then
    echo "Installing CLISP via Homebrew..."
    brew install clisp
fi

# Create bundle directory
mkdir -p clisp-mac-intel/bundle/clisp/bin

# Copy CLISP binary
cp "$(which clisp)" clisp-mac-intel/bundle/clisp/bin/

# Copy CLISP runtime files
if [ -d "$(brew --prefix)/lib/clisp" ]; then
    cp -r "$(brew --prefix)/lib/clisp" clisp-mac-intel/bundle/clisp/share/
fi

echo "Intel Mac bundle prepared successfully!"
