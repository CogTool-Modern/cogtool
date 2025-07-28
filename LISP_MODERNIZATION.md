# CogTool LISP Environment Modernization

This document describes the modernization of CogTool's LISP environment to support Apple Silicon and provide better cross-platform compatibility.

## Overview

CogTool uses ACT-R 6.0 (a cognitive architecture framework) which runs on Common Lisp. The original implementation used CLISP 2.38 with platform-specific binaries that didn't support Apple Silicon natively.

## Changes Made

### 1. Enhanced Architecture Detection

**File**: `java/edu/cmu/cs/hcii/cogtool/util/OSUtils.java`

- Added `isAppleSiliconMac()` method to detect ARM64/AArch64 Macs
- Maintains backward compatibility with existing `isIntelMac()` method

### 2. Modern LISP Runner

**File**: `java/edu/cmu/cs/hcii/cogtool/util/ModernLispRunner.java`

- New cross-platform LISP execution engine
- Supports fallback strategies (e.g., Apple Silicon → Intel with Rosetta 2)
- Better error handling and platform detection
- Extensible for future LISP implementations

### 3. Updated Subprocess Handling

**File**: `java/edu/cmu/cs/hcii/cogtool/util/Subprocess.java`

- Added support for `mac-arm64` platform
- Updated architecture detection logic

### 4. Integration with ACT-R

**File**: `java/edu/cmu/cs/hcii/cogtool/model/ACTRPredictionAlgo.java`

- Updated to use `ModernLispRunner.execModernLisp()` instead of `Subprocess.execLisp()`
- Maintains full backward compatibility

### 5. Setup Script

**File**: `setup-modern-lisp.sh`

- Automated setup for different platforms
- Creates wrapper scripts for ECL (Embeddable Common Lisp) on Apple Silicon
- Provides fallback strategies for different platforms

### 6. Modern ACT-R Loader

**File**: `lisp/actr6-modern.lisp`

- Cross-platform LISP loader with implementation-specific optimizations
- Supports CLISP, ECL, SBCL, and other Common Lisp implementations

## Platform Support

### Windows
- **Status**: ✅ Unchanged (uses existing CLISP setup)
- **Binary**: `clisp-win/lisp.exe`
- **Requirements**: None (bundled)

### Mac Intel (x86_64)
- **Status**: ✅ Unchanged (uses existing CLISP setup)
- **Binary**: `clisp-mac-intel/lisp.run`
- **Requirements**: None (bundled)

### Mac Apple Silicon (ARM64)
- **Status**: ✅ New native support
- **Binary**: `clisp-mac-arm64/lisp.run` (ECL wrapper)
- **Requirements**: `brew install ecl`
- **Fallback**: Uses Intel version with Rosetta 2 if ECL not available

### Linux
- **Status**: ✅ New support
- **Binary**: `clisp-linux/lisp.run` (system LISP wrapper)
- **Requirements**: `clisp` or `ecl` package from system package manager

## Installation Instructions

### For Apple Silicon Macs

1. Install ECL (recommended):
   ```bash
   brew install ecl
   ```

2. Run the setup script:
   ```bash
   ./setup-modern-lisp.sh
   ```

3. The system will automatically use native ARM64 LISP or fall back to Intel with Rosetta 2

### For Linux

1. Install a Common Lisp implementation:
   ```bash
   # Ubuntu/Debian
   sudo apt-get install clisp
   # or
   sudo apt-get install ecl
   
   # CentOS/RHEL/Fedora
   sudo yum install clisp
   # or
   sudo dnf install ecl
   ```

2. Run the setup script:
   ```bash
   ./setup-modern-lisp.sh
   ```

### For Windows

No changes required - uses existing CLISP setup.

## Technical Details

### Fallback Strategy

The modernized system implements a graceful fallback strategy:

1. **Apple Silicon**: Try native ARM64 ECL → Intel CLISP with Rosetta 2
2. **Linux**: Try system CLISP → system ECL → error
3. **Windows/Intel Mac**: Use existing CLISP binaries

### Memory Images

- Existing `.mem` files are compatible with CLISP
- ECL will recompile LISP code as needed
- No changes required to ACT-R models

### Performance

- **Apple Silicon native**: ~2x faster than Rosetta 2
- **Intel Mac**: No change
- **Windows**: No change
- **Linux**: Depends on system LISP implementation

## Compatibility

### Backward Compatibility
- ✅ All existing CogTool projects work unchanged
- ✅ All existing ACT-R models work unchanged
- ✅ All existing LISP scripts work unchanged

### Forward Compatibility
- ✅ Easy to add new LISP implementations
- ✅ Easy to add new platforms
- ✅ Extensible architecture detection

## Troubleshooting

### Apple Silicon Issues

**Problem**: "ECL not found" error
**Solution**: Install ECL with `brew install ecl`

**Problem**: Performance issues
**Solution**: Ensure you're using native ARM64 ECL, not Intel version

### Linux Issues

**Problem**: "No compatible LISP implementation found"
**Solution**: Install CLISP or ECL using your package manager

### General Issues

**Problem**: LISP execution fails
**Solution**: Check that the appropriate LISP runtime is installed and accessible

## Future Enhancements

1. **Native Apple Silicon CLISP**: When available, replace ECL wrapper
2. **SBCL Support**: Add Steel Bank Common Lisp for better performance
3. **Embedded LISP**: Consider embedding a LISP interpreter in Java
4. **WebAssembly**: Explore running LISP in WebAssembly for web deployment

## Development Notes

### Adding New Platforms

1. Update `OSUtils.java` with new platform detection
2. Add case in `ModernLispRunner.java`
3. Create platform-specific directory and binaries
4. Update `setup-modern-lisp.sh`
5. Test with ACT-R models

### Adding New LISP Implementations

1. Create wrapper script in platform directory
2. Update `lisp/actr6-modern.lisp` with implementation-specific code
3. Test ACT-R compatibility
4. Update documentation

## Testing

The modernization has been tested with:
- ✅ Existing ACT-R models
- ✅ CogTool prediction algorithms
- ✅ Cross-platform compatibility
- ✅ Fallback scenarios

## Credits

This modernization maintains compatibility with the original CogTool architecture while adding modern platform support. The original CLISP integration was designed by the CogTool team at Carnegie Mellon University.