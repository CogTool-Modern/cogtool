---
title: Coding Conventions
layout: default
---

# CogTool Coding Conventions

This document outlines the coding standards and conventions used in the CogTool project to ensure consistency and maintainability across the codebase.

## General Principles

### Code Quality
- **Readability**: Code should be self-documenting and easy to understand
- **Consistency**: Follow established patterns throughout the codebase
- **Simplicity**: Prefer simple, clear solutions over complex ones
- **Maintainability**: Write code that can be easily modified and extended

### Documentation
- Document public APIs with Javadoc
- Include inline comments for complex logic
- Keep documentation up-to-date with code changes
- Write meaningful commit messages

## Java Coding Standards

### Naming Conventions

#### Classes and Interfaces
```java
// Classes: PascalCase
public class DesignEditor { }
public class ProjectManager { }

// Interfaces: PascalCase, often with 'I' prefix or descriptive suffix
public interface IWidget { }
public interface Selectable { }
public interface ActionListener { }
```

#### Methods and Variables
```java
// Methods: camelCase, descriptive verbs
public void createNewProject() { }
public boolean isValidTransition() { }
public String getFrameName() { }

// Variables: camelCase, descriptive nouns
private String projectName;
private List<Frame> frameList;
private boolean isModified;
```

#### Constants
```java
// Constants: UPPER_CASE with underscores
public static final String DEFAULT_PROJECT_NAME = "Untitled Project";
public static final int MAX_FRAME_COUNT = 1000;
private static final double EPSILON = 0.001;
```

#### Packages
```java
// Packages: lowercase, hierarchical
edu.cmu.cs.hcii.cogtool.model
edu.cmu.cs.hcii.cogtool.ui.editors
edu.cmu.cs.hcii.cogtool.util
```

### Code Formatting

#### Indentation
- Use **4 spaces** for indentation (no tabs)
- Continuation lines should be indented 8 spaces

```java
public void longMethodName(String parameter1,
        String parameter2,
        String parameter3) {
    // Method body indented 4 spaces
    if (someCondition &&
            anotherCondition) {
        // Nested code indented 4 more spaces
        doSomething();
    }
}
```

#### Line Length
- Maximum line length: **120 characters**
- Break long lines at logical points
- Align parameters and arguments when breaking lines

#### Braces
- Use K&R style bracing (opening brace on same line)
- Always use braces, even for single statements

```java
// Correct
if (condition) {
    doSomething();
}

// Incorrect
if (condition)
    doSomething();
```

#### Spacing
```java
// Operators: spaces around binary operators
int result = a + b * c;
boolean flag = (x > 0) && (y < 10);

// Method calls: no space before parentheses
methodCall(parameter1, parameter2);

// Control structures: space before parentheses
if (condition) { }
for (int i = 0; i < count; i++) { }
while (running) { }
```

### Class Structure

#### Order of Elements
1. Static fields (constants first)
2. Instance fields
3. Constructors
4. Methods (public first, then protected, then private)
5. Nested classes

```java
public class ExampleClass {
    // Static constants
    public static final String CONSTANT_VALUE = "value";
    
    // Static fields
    private static int instanceCount = 0;
    
    // Instance fields
    private String name;
    private List<String> items;
    
    // Constructors
    public ExampleClass() {
        this("default");
    }
    
    public ExampleClass(String name) {
        this.name = name;
        instanceCount++;
    }
    
    // Public methods
    public String getName() {
        return name;
    }
    
    // Protected methods
    protected void internalMethod() {
        // Implementation
    }
    
    // Private methods
    private void helperMethod() {
        // Implementation
    }
    
    // Nested classes
    private static class InnerClass {
        // Implementation
    }
}
```

### Documentation Standards

#### Javadoc Comments
```java
/**
 * Creates a new frame in the design with the specified name.
 * 
 * @param frameName the name for the new frame, must not be null
 * @param backgroundImage optional background image for the frame
 * @return the newly created frame
 * @throws IllegalArgumentException if frameName is null or empty
 * @throws DuplicateFrameException if a frame with the same name already exists
 */
public Frame createFrame(String frameName, Image backgroundImage) {
    // Implementation
}
```

#### Inline Comments
```java
// Check if the project has been modified since last save
if (project.isModified()) {
    // Prompt user to save changes before closing
    int result = showSaveDialog();
    if (result == SAVE_OPTION) {
        saveProject();
    }
}
```

## SWT-Specific Conventions

### Resource Management
```java
// Always dispose of SWT resources
Image image = new Image(display, "path/to/image.png");
try {
    // Use the image
    label.setImage(image);
} finally {
    // Dispose when done
    if (image != null && !image.isDisposed()) {
        image.dispose();
    }
}

// Or use try-with-resources for automatic disposal
try (FileInputStream stream = new FileInputStream(file)) {
    Image image = new Image(display, stream);
    // Use image
} // Stream automatically closed
```

### Event Handling
```java
// Use descriptive listener implementations
button.addSelectionListener(new SelectionAdapter() {
    @Override
    public void widgetSelected(SelectionEvent e) {
        handleButtonClick();
    }
});

// Or extract to named methods for complex handlers
private void setupEventHandlers() {
    saveButton.addSelectionListener(createSaveButtonListener());
    cancelButton.addSelectionListener(createCancelButtonListener());
}
```

## Error Handling

### Exception Handling
```java
// Be specific about exceptions
try {
    loadProject(filename);
} catch (FileNotFoundException e) {
    showError("Project file not found: " + filename);
} catch (InvalidProjectFormatException e) {
    showError("Invalid project format: " + e.getMessage());
} catch (IOException e) {
    showError("Error reading project file: " + e.getMessage());
}

// Don't catch and ignore exceptions
try {
    riskyOperation();
} catch (Exception e) {
    // BAD: Silent failure
}

// Better: Log or handle appropriately
try {
    riskyOperation();
} catch (Exception e) {
    logger.error("Failed to perform risky operation", e);
    throw new OperationFailedException("Operation failed", e);
}
```

### Validation
```java
// Validate parameters early
public void setFrameName(String name) {
    if (name == null) {
        throw new IllegalArgumentException("Frame name cannot be null");
    }
    if (name.trim().isEmpty()) {
        throw new IllegalArgumentException("Frame name cannot be empty");
    }
    this.frameName = name.trim();
}
```

## Performance Guidelines

### Object Creation
```java
// Reuse objects when possible
private StringBuilder stringBuilder = new StringBuilder();

public String formatMessage(String template, Object... args) {
    stringBuilder.setLength(0); // Clear previous content
    // Build string
    return stringBuilder.toString();
}

// Use appropriate collection sizes
List<Frame> frames = new ArrayList<>(expectedSize);
Map<String, Widget> widgets = new HashMap<>(expectedSize);
```

### String Handling
```java
// Use StringBuilder for multiple concatenations
StringBuilder sb = new StringBuilder();
for (String item : items) {
    sb.append(item).append(", ");
}
String result = sb.toString();

// Prefer String.format() for complex formatting
String message = String.format("Frame '%s' contains %d widgets", 
                               frameName, widgetCount);
```

## Testing Conventions

### Unit Test Structure
```java
public class FrameTest {
    private Frame frame;
    
    @Before
    public void setUp() {
        frame = new Frame("Test Frame");
    }
    
    @Test
    public void testAddWidget_ValidWidget_AddsSuccessfully() {
        // Arrange
        Widget widget = new Button("Test Button");
        
        // Act
        frame.addWidget(widget);
        
        // Assert
        assertEquals(1, frame.getWidgetCount());
        assertTrue(frame.containsWidget(widget));
    }
    
    @Test(expected = IllegalArgumentException.class)
    public void testAddWidget_NullWidget_ThrowsException() {
        frame.addWidget(null);
    }
}
```

### Test Naming
- Use descriptive test method names
- Format: `test[MethodName]_[Scenario]_[ExpectedResult]`
- Example: `testCreateFrame_ValidName_ReturnsNewFrame`

## Version Control

### Commit Messages
```
Short summary (50 chars or less)

Longer description if needed. Explain what changed and why.
Reference issue numbers when applicable.

- Use bullet points for multiple changes
- Keep lines under 72 characters
- Use present tense ("Add feature" not "Added feature")

Fixes #123
```

### Branch Naming
- `feature/description` - New features
- `bugfix/description` - Bug fixes
- `hotfix/description` - Critical fixes
- `refactor/description` - Code refactoring

## Code Review Guidelines

### What to Look For
- **Correctness**: Does the code do what it's supposed to do?
- **Style**: Does it follow these conventions?
- **Performance**: Are there obvious performance issues?
- **Security**: Are there potential security vulnerabilities?
- **Maintainability**: Is the code easy to understand and modify?

### Review Comments
- Be constructive and specific
- Explain the reasoning behind suggestions
- Acknowledge good practices
- Focus on the code, not the person

## Tools and Automation

### IDE Configuration
- Configure your IDE to follow these formatting rules
- Use automatic code formatting (Ctrl+Shift+F in Eclipse)
- Enable save actions to organize imports and format code

### Static Analysis
- Use tools like FindBugs, PMD, or SpotBugs
- Address warnings and potential issues
- Configure build to fail on critical violations

### Continuous Integration
- All code must pass automated tests
- Code coverage should be maintained or improved
- Style violations should be reported and addressed

## Resources

### Java Style Guides
- [Google Java Style Guide](https://google.github.io/styleguide/javaguide.html)
- [Oracle Java Code Conventions](https://www.oracle.com/java/technologies/javase/codeconventions-contents.html)

### Tools
- [Checkstyle](https://checkstyle.sourceforge.io/) - Style checking
- [PMD](https://pmd.github.io/) - Static analysis
- [SpotBugs](https://spotbugs.github.io/) - Bug detection

### IDE Plugins
- Eclipse: Built-in formatting and style checking
- IntelliJ IDEA: Code inspection and formatting
- VS Code: Java extension pack with style support