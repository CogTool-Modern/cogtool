---
title: Building CogTool
layout: default
---

# Building CogTool

This guide provides step-by-step instructions for building CogTool from source code.

## Quick Start

### Prerequisites
- **Java Development Kit (JDK) 8 or later** (OpenJDK 11 recommended)
- **Apache Ant 1.8 or later**
- **Git** for cloning the repository

### Build Steps
1. **Clone the repository**:
   ```bash
   git clone https://github.com/CogTool-Modern/cogtool.git
   cd cogtool
   ```

2. **Build CogTool**:
   ```bash
   ant clean
   ant
   ```

3. **Run CogTool**:
   ```bash
   java -jar dist/cogtool.jar
   ```

## Platform-Specific Instructions

### Windows
<details markdown="1">
<summary>Building on Windows</summary>

**Additional Requirements:**
- [NSIS](https://nsis.sourceforge.io/Main_Page) for creating Windows installers
- Install to default location: `C:\Program Files (x86)\NSIS\makensis.exe`

**Setup:**
1. Install JDK and set `JAVA_HOME` environment variable
2. Install Apache Ant and add to PATH
3. Install NSIS for installer creation

**Build Commands:**
```cmd
git clone https://github.com/CogTool-Modern/cogtool.git
cd cogtool
ant clean
ant
```

The Windows installer will be created automatically when building on Windows.
</details>

### macOS
<details markdown="1">
<summary>Building on macOS</summary>

**Setup using Homebrew:**
```bash
# Install prerequisites
brew install openjdk@11 ant

# Set JAVA_HOME
export JAVA_HOME=$(/usr/libexec/java_home -v 11)

# Install Xcode Command Line Tools
xcode-select --install
```

**Build:**
```bash
git clone https://github.com/CogTool-Modern/cogtool.git
cd cogtool
ant clean
ant
```
</details>

### Linux
<details markdown="1">
<summary>Building on Linux</summary>

**Ubuntu/Debian:**
```bash
# Install prerequisites
sudo apt update
sudo apt install openjdk-11-jdk ant git

# Set JAVA_HOME
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64

# Build
git clone https://github.com/CogTool-Modern/cogtool.git
cd cogtool
ant clean
ant
```

**CentOS/RHEL/Fedora:**
```bash
# Install prerequisites
sudo dnf install java-11-openjdk-devel ant git

# Set JAVA_HOME
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk

# Build
git clone https://github.com/CogTool-Modern/cogtool.git
cd cogtool
ant clean
ant
```
</details>

## Build Targets

The build system provides several targets:

- `ant clean` - Clean all build artifacts
- `ant compile` - Compile Java sources only
- `ant jar` - Create JAR files
- `ant` - Full build (default target)
- `ant test` - Run unit tests
- `ant dist` - Create platform-specific distributions

## Troubleshooting

### Common Issues

**Java Version Problems:**
```bash
# Check Java version
java -version
javac -version
# Should show JDK 8 or later
```

**Memory Issues:**
```bash
# Increase heap size for Ant
export ANT_OPTS="-Xmx2048m"
```

**SWT Library Issues:**
- Ensure correct platform architecture (32-bit vs 64-bit)
- Check for conflicting SWT installations

## Development Setup

For detailed development environment configuration, see:
- [**Development Machine Configuration**]({{site.baseurl}}/developer/configuring-development-machines/) - Complete setup guide
- [**Coding Conventions**]({{site.baseurl}}/developer/coding-conventions/) - Style guide and best practices

## IDE Integration

**Eclipse:**
1. File → Import → Existing Projects into Workspace
2. Select CogTool directory (project files included)

**IntelliJ IDEA:**
1. File → Open → Select CogTool directory
2. IDEA will detect project structure

**VS Code:**
1. Install Java Extension Pack
2. Open CogTool folder

## Getting Help

If you encounter build issues:
1. Check [GitHub Issues](https://github.com/CogTool-Modern/cogtool/issues)
2. Review error messages carefully
3. Verify all prerequisites are installed
4. Try a clean build: `ant clean && ant`

For more detailed information, see the [Developer Documentation]({{site.baseurl}}/developer/).
