---
title: Configuring Development Machines
layout: default
---

# Configuring Development Machines

This guide provides detailed instructions for setting up a development environment for CogTool.

## Prerequisites

### Java Development Kit (JDK)
- **Required Version**: JDK 8 or later
- **Recommended**: OpenJDK 11 or Oracle JDK 11
- **Download**: [OpenJDK](https://openjdk.java.net/) or [Oracle JDK](https://www.oracle.com/java/technologies/javase-downloads.html)

### Apache Ant
- **Required Version**: Ant 1.8 or later
- **Download**: [Apache Ant](https://ant.apache.org/bindownload.cgi)
- **Installation**: Follow platform-specific instructions

### Git
- **Required**: Git 2.0 or later
- **Download**: [Git](https://git-scm.com/downloads)

## Platform-Specific Setup

### Windows Development Environment

#### JDK Installation
1. Download and install JDK
2. Set JAVA_HOME environment variable:
   ```
   JAVA_HOME=C:\Program Files\Java\jdk-11.0.x
   ```
3. Add to PATH:
   ```
   PATH=%JAVA_HOME%\bin;%PATH%
   ```

#### Apache Ant Installation
1. Download Ant binary distribution
2. Extract to `C:\apache-ant-1.x.x`
3. Set ANT_HOME:
   ```
   ANT_HOME=C:\apache-ant-1.x.x
   ```
4. Add to PATH:
   ```
   PATH=%ANT_HOME%\bin;%PATH%
   ```

#### Windows-Specific Build Requirements
- **NSIS**: Required for building Windows installers
  - Download from [NSIS website](https://nsis.sourceforge.io/)
  - Install to default location: `C:\Program Files (x86)\NSIS\`
  - The build script expects `makensis.exe` at this location

#### Visual Studio Code Setup (Optional)
1. Install VS Code
2. Install Java Extension Pack
3. Open CogTool project folder
4. Configure Java path in settings if needed

### macOS Development Environment

#### JDK Installation
1. Install via Homebrew (recommended):
   ```bash
   brew install openjdk@11
   ```
2. Or download from Oracle/OpenJDK website
3. Set JAVA_HOME in shell profile:
   ```bash
   export JAVA_HOME=$(/usr/libexec/java_home -v 11)
   ```

#### Apache Ant Installation
1. Install via Homebrew:
   ```bash
   brew install ant
   ```
2. Or download and install manually

#### Xcode Command Line Tools
```bash
xcode-select --install
```

#### macOS-Specific Considerations
- **Code Signing**: For distribution, you'll need Apple Developer certificates
- **Notarization**: Required for macOS 10.15+ distribution
- **Architecture**: Support for both Intel and Apple Silicon

### Linux Development Environment

#### Ubuntu/Debian
```bash
# Install JDK
sudo apt update
sudo apt install openjdk-11-jdk

# Install Ant
sudo apt install ant

# Install Git (if not already installed)
sudo apt install git

# Set JAVA_HOME (add to ~/.bashrc or ~/.profile)
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
```

#### CentOS/RHEL/Fedora
```bash
# Install JDK
sudo dnf install java-11-openjdk-devel  # Fedora
# or
sudo yum install java-11-openjdk-devel  # CentOS/RHEL

# Install Ant
sudo dnf install ant  # Fedora
# or
sudo yum install ant  # CentOS/RHEL

# Set JAVA_HOME
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk
```

## IDE Configuration

### Eclipse IDE
1. **Import Project**:
   - File → Import → Existing Projects into Workspace
   - Select CogTool root directory
   - Eclipse project files are included in the repository

2. **Configure Build Path**:
   - Right-click project → Properties → Java Build Path
   - Verify source folders and libraries are correctly configured

3. **Run Configuration**:
   - Main class: `edu.cmu.cs.hcii.cogtool.CogTool`
   - VM arguments: `-Xmx1024m` (or higher for large projects)

### IntelliJ IDEA
1. **Open Project**:
   - File → Open → Select CogTool directory
   - IDEA will detect the project structure

2. **Configure SDK**:
   - File → Project Structure → Project
   - Set Project SDK to JDK 11

3. **Run Configuration**:
   - Run → Edit Configurations → Add Application
   - Main class: `edu.cmu.cs.hcii.cogtool.CogTool`
   - VM options: `-Xmx1024m`

## Build Verification

### Test Your Setup
1. **Clone Repository**:
   ```bash
   git clone https://github.com/CogTool-Modern/cogtool.git
   cd cogtool
   ```

2. **Run Build**:
   ```bash
   ant clean
   ant
   ```

3. **Expected Output**:
   - Build should complete without errors
   - Executable files created in `dist/` directory

### Common Build Issues

#### Java Version Problems
```bash
# Check Java version
java -version
javac -version

# Should show JDK 8 or later
```

#### Ant Configuration Issues
```bash
# Check Ant version
ant -version

# Verify Ant can find Java
ant -diagnostics
```

#### Memory Issues
- Increase heap size for Ant:
  ```bash
  export ANT_OPTS="-Xmx2048m"
  ```

## Development Workflow

### Repository Structure
```
cogtool/
├── java/           # Java source code
├── lib/            # External libraries
├── build/          # Build output
├── dist/           # Distribution files
├── docs/           # Documentation
├── res/            # Resources
└── build.xml       # Ant build script
```

### Build Targets
- `ant clean` - Clean build artifacts
- `ant compile` - Compile Java sources
- `ant jar` - Create JAR files
- `ant dist` - Create distribution packages
- `ant test` - Run unit tests

### Development Best Practices

#### Code Style
- Follow Java naming conventions
- Use 4-space indentation
- Maximum line length: 120 characters
- Add Javadoc for public methods

#### Version Control
- Create feature branches for new work
- Write descriptive commit messages
- Keep commits focused and atomic
- Test before committing

#### Testing
- Write unit tests for new functionality
- Run full test suite before submitting changes
- Test on multiple platforms when possible

## Troubleshooting

### Build Failures

#### "Cannot find symbol" errors
- Check classpath configuration
- Verify all dependencies are present
- Clean and rebuild

#### SWT library issues
- Platform-specific SWT libraries are included
- Verify correct architecture (32-bit vs 64-bit)
- Check for conflicting SWT installations

#### Memory errors during build
- Increase heap size: `export ANT_OPTS="-Xmx2048m"`
- Close other applications to free memory

### Runtime Issues

#### Application won't start
- Check Java version compatibility
- Verify all required libraries are present
- Check console output for error messages

#### UI rendering problems
- Update graphics drivers
- Try different Java versions
- Check SWT compatibility with OS version

## Additional Resources

### Documentation
- [Apache Ant Manual](https://ant.apache.org/manual/)
- [Eclipse SWT Documentation](https://www.eclipse.org/swt/)
- [Java Development Documentation](https://docs.oracle.com/en/java/)

### Tools
- [Eclipse IDE](https://www.eclipse.org/ide/)
- [IntelliJ IDEA](https://www.jetbrains.com/idea/)
- [Visual Studio Code](https://code.visualstudio.com/)

### Community
- [CogTool GitHub Repository](https://github.com/CogTool-Modern/cogtool)
- [Issue Tracker](https://github.com/CogTool-Modern/cogtool/issues)
- [Discussions](https://github.com/CogTool-Modern/cogtool/discussions)