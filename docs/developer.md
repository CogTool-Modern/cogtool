---
title: Developer Documentation
layout: default
---

# Developer Documentation

This section contains resources for developers who want to contribute to CogTool, understand its architecture, or build custom extensions.

## Getting Started with Development

### Building CogTool

To compile CogTool from source:

1. **Prerequisites**
   - Java Development Kit (JDK) 8 or later
   - [Apache Ant](https://ant.apache.org/bindownload.cgi)
   - Git

2. **Build Process**
   ```bash
   git clone https://github.com/CogTool-Modern/cogtool.git
   cd cogtool
   ant
   ```

For detailed build instructions, see [Building CogTool]({{site.baseurl}}/building/).

### Development Environment Setup

[**📄 Development Machine Configuration**]({{site.baseurl}}/developer/configuring-development-machines/) - Complete setup guide for development environments

## Architecture and Design

### Core Architecture
CogTool is built using Java and SWT (Standard Widget Toolkit) for cross-platform compatibility. The application follows a Model-View-Controller (MVC) architecture pattern.

**Key Components:**
- **Model**: Data structures representing projects, designs, tasks, and scripts
- **View**: User interface components and editors
- **Controller**: Business logic and user interaction handling

### Data Model
- Projects contain one or more Designs
- Designs contain Frames and Tasks
- Frames contain Widgets and Transitions
- Tasks are demonstrated through Scripts
- Scripts contain Steps that represent user actions

### Cognitive Modeling Engine
CogTool integrates with ACT-R (Adaptive Control of Thought-Rational) to generate cognitive models from demonstrated tasks. The system automatically translates user interface interactions into cognitive model predictions.

## Development Resources

### Coding Standards
[**📄 Coding Conventions**]({{site.baseurl}}/developer/coding-conventions/) - Style guide and best practices

### Build System
- **Primary Build Tool**: Apache Ant
- **Build Configuration**: `build.xml` in project root
- **Platform-Specific Builds**: Separate targets for Windows, macOS, and Linux

### Testing
- Unit tests are located in the test directories
- Integration tests verify end-to-end functionality
- Performance tests validate prediction accuracy

## Contributing

### How to Contribute

1. **Fork the Repository**
   ```bash
   git fork https://github.com/CogTool-Modern/cogtool.git
   ```

2. **Create a Feature Branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

3. **Make Changes**
   - Follow coding conventions
   - Add tests for new functionality
   - Update documentation as needed

4. **Submit a Pull Request**
   - Provide clear description of changes
   - Reference any related issues
   - Ensure all tests pass

### Development Workflow

- **Main Branch**: `master` - stable release code
- **Development Branch**: `develop` - integration branch for new features
- **Feature Branches**: `feature/*` - individual feature development
- **Release Branches**: `release/*` - preparation for new releases

## Advanced Topics

### Extending CogTool

#### Adding New Widget Types
1. Extend the base Widget class
2. Implement rendering logic
3. Define interaction behaviors
4. Add to widget palette

#### Custom Cognitive Models
1. Understand ACT-R integration points
2. Define new cognitive operators
3. Implement model generation logic
4. Validate against empirical data

#### Import/Export Formats
1. Define XML schema for new formats
2. Implement parser/generator
3. Add UI integration
4. Test with sample files

### Performance Optimization

- **Memory Management**: Efficient object lifecycle management
- **Rendering**: Optimized drawing for large designs
- **Model Generation**: Caching and incremental updates
- **File I/O**: Streaming for large project files

## API Documentation

### Core Classes

- `Project`: Top-level container for all project data
- `Design`: Represents a user interface design
- `Frame`: Individual screen or state in a design
- `Widget`: Interactive element on a frame
- `Task`: User goal to be accomplished
- `Script`: Sequence of user actions
- `Transition`: Navigation between frames

### Extension Points

- **Widget Renderers**: Custom drawing for widget types
- **Action Handlers**: Processing user interactions
- **Import/Export**: Supporting new file formats
- **Model Generators**: Creating cognitive models

## Troubleshooting

### Common Build Issues

**Java Version Conflicts**
- Ensure JDK 8+ is installed and in PATH
- Check JAVA_HOME environment variable

**Ant Build Failures**
- Verify Ant installation and version
- Check build.xml for platform-specific requirements

**SWT Library Issues**
- Platform-specific SWT libraries are included
- Verify correct architecture (32-bit vs 64-bit)

### Development Environment Issues

**IDE Setup**
- Eclipse project files are included
- IntelliJ IDEA can import the project structure
- VS Code works with appropriate Java extensions

**Debugging**
- Use IDE debugger with main class `edu.cmu.cs.hcii.cogtool.CogTool`
- Enable verbose logging for troubleshooting
- Check console output for error messages

## Resources

### External Dependencies
- **SWT**: Standard Widget Toolkit for UI
- **ACT-R**: Cognitive modeling framework
- **Apache Commons**: Utility libraries
- **JUnit**: Testing framework

### Documentation
- [SWT Documentation](https://www.eclipse.org/swt/)
- [ACT-R Website](http://act-r.psy.cmu.edu/)
- [Apache Ant Manual](https://ant.apache.org/manual/)

### Community
- [GitHub Issues](https://github.com/CogTool-Modern/cogtool/issues) - Bug reports and feature requests
- [GitHub Discussions](https://github.com/CogTool-Modern/cogtool/discussions) - Community discussions
- [Research Papers]({{site.baseurl}}/publications/) - Academic publications about CogTool