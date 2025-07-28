#!/bin/bash

# Update Existing CogTool.app with New LISP Wrappers
# This script updates already-built CogTool.app bundles with the new portable LISP system

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Function to find CogTool.app
find_cogtool_app() {
    local search_paths=(
        "./dist/CogTool.app"
        "../dist/CogTool.app"
        "../../dist/CogTool.app"
        "./CogTool.app"
        "../CogTool.app"
        "~/Applications/CogTool.app"
        "/Applications/CogTool.app"
    )
    
    for path in "${search_paths[@]}"; do
        if [ -d "$path" ]; then
            echo "$path"
            return 0
        fi
    done
    
    return 1
}

# Function to update wrapper in app bundle
update_app_wrapper() {
    local app_path="$1"
    local platform="$2"
    local source_wrapper="$3"
    
    local target_path="$app_path/Contents/Resources/clisp-$platform/lisp.run"
    
    if [ -f "$source_wrapper" ]; then
        print_status "Updating $platform wrapper in app bundle"
        
        # Backup original if it exists
        if [ -f "$target_path" ]; then
            cp "$target_path" "$target_path.backup-$(date +%Y%m%d-%H%M%S)"
            print_status "Backed up original wrapper"
        fi
        
        # Copy new wrapper
        cp "$source_wrapper" "$target_path"
        chmod +x "$target_path"
        
        print_success "$platform wrapper updated successfully"
    else
        print_warning "Source wrapper not found: $source_wrapper"
    fi
}

# Function to create bundle directories in app
create_app_bundles() {
    local app_path="$1"
    local resources_path="$app_path/Contents/Resources"
    
    print_status "Creating bundle directories in app"
    
    # Create bundle directories for each platform
    mkdir -p "$resources_path/clisp-mac-arm64/bundle/ecl/bin"
    mkdir -p "$resources_path/clisp-mac-intel/bundle/ecl/bin"
    mkdir -p "$resources_path/clisp-linux/bundle"
    
    # Copy bundle contents if they exist
    if [ -d "clisp-mac-arm64/bundle" ]; then
        cp -r clisp-mac-arm64/bundle/* "$resources_path/clisp-mac-arm64/bundle/"
        print_success "Copied ARM64 bundle to app"
    fi
    
    if [ -d "clisp-mac-intel/bundle" ]; then
        cp -r clisp-mac-intel/bundle/* "$resources_path/clisp-mac-intel/bundle/"
        print_success "Copied Intel bundle to app"
    fi
    
    if [ -d "clisp-linux/bundle" ]; then
        cp -r clisp-linux/bundle/* "$resources_path/clisp-linux/bundle/"
        print_success "Copied Linux bundle to app"
    fi
}

# Main update function
main() {
    print_status "Searching for CogTool.app to update..."
    
    # Try to find CogTool.app
    if app_path=$(find_cogtool_app); then
        print_success "Found CogTool.app at: $app_path"
    else
        print_error "CogTool.app not found!"
        print_status ""
        print_status "Please specify the path to your CogTool.app:"
        print_status "Usage: $0 /path/to/CogTool.app"
        print_status ""
        print_status "Common locations:"
        print_status "  • ./dist/CogTool.app"
        print_status "  • ~/Applications/CogTool.app"
        print_status "  • /Applications/CogTool.app"
        exit 1
    fi
    
    # Check if it's actually a CogTool.app
    if [ ! -d "$app_path/Contents/Resources" ]; then
        print_error "Invalid CogTool.app structure: $app_path"
        exit 1
    fi
    
    print_status "Updating CogTool.app with new portable LISP system..."
    
    # Create bundle directories
    create_app_bundles "$app_path"
    
    # Update wrapper scripts
    update_app_wrapper "$app_path" "mac-arm64" "clisp-mac-arm64/lisp.run"
    update_app_wrapper "$app_path" "mac-intel" "clisp-mac-intel/lisp.run"
    update_app_wrapper "$app_path" "linux" "clisp-linux/lisp.run"
    
    print_success "CogTool.app updated successfully!"
    print_status ""
    print_status "Your CogTool.app now includes:"
    print_status "  ✅ Auto-installing LISP wrappers for Mac"
    print_status "  ✅ Bundled LISP implementations"
    print_status "  ✅ Enhanced error handling and installation guidance"
    print_status ""
    print_status "The next time you run CogTool, it will automatically install"
    print_status "LISP if needed, or use the bundled implementations."
}

# Handle command line argument
if [ $# -eq 1 ]; then
    if [ -d "$1" ]; then
        app_path="$1"
        print_success "Using specified CogTool.app: $app_path"
        
        # Create bundle directories
        create_app_bundles "$app_path"
        
        # Update wrapper scripts
        update_app_wrapper "$app_path" "mac-arm64" "clisp-mac-arm64/lisp.run"
        update_app_wrapper "$app_path" "mac-intel" "clisp-mac-intel/lisp.run"
        update_app_wrapper "$app_path" "linux" "clisp-linux/lisp.run"
        
        print_success "CogTool.app updated successfully!"
        exit 0
    else
        print_error "Specified path is not a directory: $1"
        exit 1
    fi
fi

# Run main function if no arguments provided
main "$@"