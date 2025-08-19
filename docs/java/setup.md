# Setting Up Your Java Development Environment

Before writing Java code, you need to install Java, set up development tools, and understand the build ecosystem. This guide will get you ready for both learning and professional Java development.

## What You'll Install

1. **Java Development Kit (JDK)** - The core Java compiler and runtime
2. **Build Tool (Gradle)** - For managing dependencies and building projects
3. **Integrated Development Environment (IDE)** - For writing and debugging code
4. **Command Line Tools** - For compilation, execution, and project management

## Step 1: Install Java Development Kit (JDK)

### Check if Java is Already Installed

Open your terminal/command prompt and run:

```bash
java --version
javac --version
```

If both commands show version 17 or higher, you can skip to Step 2.

!!! note "Java Version Recommendation"

    Use Java 17 or 21 (LTS versions) for new projects. These are Long Term Support versions with the best stability and community support.

### Install JDK

=== "macOS"

#### Option 1: Using Homebrew (Recommended)

```bash
# Install Homebrew if you don't have it
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Java
brew install openjdk@21

# Add to PATH
echo 'export PATH="/opt/homebrew/opt/openjdk@21/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

#### Option 2: Download from Oracle

1. Visit [Oracle JDK Downloads](https://www.oracle.com/java/technologies/downloads/)
2. Download JDK 21 for macOS
3. Run the installer and follow the prompts

=== "Windows"

#### Option 1: Download from Oracle

1. Visit [Oracle JDK Downloads](https://www.oracle.com/java/technologies/downloads/)
2. Download JDK 21 for Windows
3. Run the installer
4. Add Java to PATH:
   - Open System Properties → Environment Variables
   - Add Java installation path to PATH variable

#### Option 2: Using Package Manager

```powershell
# Using Chocolatey
choco install openjdk21

# Using Winget
winget install Microsoft.OpenJDK.21
```

=== "Linux (Ubuntu/Debian)"

```bash
# Update package list
sudo apt update

# Install OpenJDK 21
sudo apt install openjdk-21-jdk

# Verify installation
java --version
javac --version
```

### Verify Installation

After installation, verify everything works:

```bash
java --version
javac --version
```

You should see version information for both commands.

## Step 2: Install Gradle Build Tool

**Gradle** is a build automation tool that manages dependencies, compiles code, runs tests, and packages applications. It's essential for professional Java development.

### Install Gradle

=== "macOS"

```bash
# Using Homebrew (recommended)
brew install gradle

# Verify installation
gradle --version
```

=== "Windows"

#### Option 1: Using Package Manager

```powershell
# Using Chocolatey
choco install gradle

# Using Scoop
scoop install gradle
```

#### Option 2: Manual Installation

1. Download from [gradle.org/releases](https://gradle.org/releases/)
2. Extract to a directory (e.g., `C:\gradle`)
3. Add `C:\gradle\bin` to your PATH environment variable

=== "Linux (Ubuntu/Debian)"

```bash
# Using SDKMAN (recommended)
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install gradle

# Or using package manager
sudo apt update
sudo apt install gradle
```

### Verify Gradle Installation

```bash
gradle --version
```

You should see Gradle version information along with JVM details.

## Step 3: Choose an Integrated Development Environment (IDE)

### Option 1: IntelliJ IDEA (Recommended for Java)

**IntelliJ IDEA** is the most popular Java IDE with excellent code completion, debugging, and refactoring tools.

1. **Download**: [jetbrains.com/idea/download](https://www.jetbrains.com/idea/download/)
2. Choose **Community Edition** (free) or **Ultimate Edition** (paid, more features)
3. Install with default settings
4. **First Launch Setup**:
   - Choose your theme (Light or Dark)
   - Install recommended plugins
   - Configure JDK (should auto-detect your installation)

### Option 2: Visual Studio Code

**VS Code** is lightweight and excellent for beginners with great Java support.

1. **Download**: [code.visualstudio.com](https://code.visualstudio.com/)
2. **Install Java Extension Pack**:
   - Open VS Code
   - Go to Extensions (Ctrl+Shift+X / Cmd+Shift+X)
   - Search for "Extension Pack for Java"
   - Install it (includes Language Support, Debugging, Testing, Maven, Gradle support)

### Option 3: Eclipse IDE

**Eclipse** is a mature, free IDE with strong Java support.

1. **Download**: [eclipse.org/downloads](https://www.eclipse.org/downloads/)
2. Choose "Eclipse IDE for Java Developers"
3. Install and launch
4. Create a workspace directory for your projects

## Step 4: Create Your First Java Project with Gradle

Let's create a proper Java project using Gradle, which is the standard approach for professional development.

### Create Gradle Project

```bash
# Create project directory
mkdir java-learning
cd java-learning

# Initialize Gradle project
gradle init

# When prompted, select:
# 1. Type of project: 2 (application)
# 2. Implementation language: 3 (Java)
# 3. Build script DSL: 1 (Groovy)
# 4. Test framework: 4 (JUnit Jupiter)
# 5. Project name: java-learning
# 6. Source package: com.example
```

### Understand Project Structure

After initialization, you'll have this structure:

```text
java-learning/
├── build.gradle                    # Build configuration
├── settings.gradle                 # Project settings
├── gradle/                        # Gradle wrapper files
├── gradlew                        # Gradle wrapper script (Unix)
├── gradlew.bat                    # Gradle wrapper script (Windows)
└── app/
    ├── build.gradle               # Application module config
    └── src/
        ├── main/
        │   └── java/
        │       └── com/
        │           └── example/
        │               └── App.java    # Main application
        └── test/
            └── java/
                └── com/
                    └── example/
                        └── AppTest.java # Unit tests
```

### Build and Run Your Project

```bash
# Build the project
./gradlew build

# Run the application
./gradlew run
```

You should see:

```text
Hello World!
```

## Step 5: Create a Simple Program

Let's modify the generated program to understand how it works.

### Examine the Generated Code

Open `app/src/main/java/com/example/App.java`:

```java
package com.example;

public class App {
    public String getGreeting() {
        return "Hello World!";
    }

    public static void main(String[] args) {
        System.out.println(new App().getGreeting());
    }
}
```

### Modify the Program

Update the file to customize the greeting:

```java
package com.example;

public class App {
    public String getGreeting() {
        return "Hello from Java! Setup is working perfectly!";
    }

    public static void main(String[] args) {
        System.out.println(new App().getGreeting());
        System.out.println("Java version: " + System.getProperty("java.version"));
        System.out.println("Ready to start learning!");
    }
}
```

### Test Your Changes

```bash
# Build and run
./gradlew run
```

You should see:

```text
Hello from Java! Setup is working perfectly!
Java version: 17.0.x (or your version)
Ready to start learning!
```

## Understanding the Development Workflow

The modern Java development workflow uses build tools for automation:

### Gradle Commands

```bash
# Build the project (compile + test)
./gradlew build

# Run the application
./gradlew run

# Run tests only
./gradlew test

# Clean build artifacts
./gradlew clean

# Get help
./gradlew help

# See all available tasks
./gradlew tasks
```

### Project Organization

Professional Java projects follow this standard structure:

```text
project-root/
├── build.gradle                 # Build configuration and dependencies
├── settings.gradle              # Multi-project settings
├── src/
│   ├── main/
│   │   ├── java/               # Production source code
│   │   │   └── com/example/    # Package structure
│   │   └── resources/          # Configuration files, assets
│   └── test/
│       ├── java/               # Test source code
│       └── resources/          # Test resources
├── build/                      # Generated files (don't commit)
└── gradle/                     # Gradle wrapper files
```

## Build Configuration with Gradle

### Understanding build.gradle

Your `app/build.gradle` file configures dependencies and build settings:

```gradle
plugins {
    id 'application'           // Enables running with 'gradle run'
}

repositories {
    mavenCentral()            // Where to find dependencies
}

dependencies {
    implementation 'com.google.guava:guava:31.1-jre'
    testImplementation 'org.junit.jupiter:junit-jupiter:5.9.1'
}

application {
    mainClass = 'com.example.App'  // Entry point for 'gradle run'
}

tasks.named('test') {
    useJUnitPlatform()        // Use JUnit 5 for testing
}
```

### Adding Dependencies

To add external libraries, modify the `dependencies` section:

```gradle
dependencies {
    // JSON processing library
    implementation 'com.fasterxml.jackson.core:jackson-core:2.15.2'

    // Existing dependencies
    implementation 'com.google.guava:guava:31.1-jre'
    testImplementation 'org.junit.jupiter:junit-jupiter:5.9.1'
}
```

Then run `./gradlew build` to download the new dependencies.

## Common Setup Issues and Solutions

### Issue: "gradle is not recognized as a command"

**Solution**: Gradle isn't in your PATH, or you should use the wrapper:

- Use `./gradlew` (Unix) or `gradlew.bat` (Windows) instead of `gradle`
- Or add Gradle to your system PATH

### Issue: "JAVA_HOME is not set"

**Solution**: Set the JAVA_HOME environment variable:

=== "macOS/Linux"

```bash
# Add to ~/.bashrc or ~/.zshrc
export JAVA_HOME=$(/usr/libexec/java_home)  # macOS
# or
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk  # Linux

# Reload shell configuration
source ~/.zshrc  # or ~/.bashrc
```

=== "Windows"

1. Open System Properties → Advanced → Environment Variables
2. Add `JAVA_HOME` variable pointing to your JDK installation
3. Example: `C:\Program Files\Java\jdk-17`

### Issue: "Could not find or load main class"

**Solutions**:

- Ensure you're using `./gradlew run` in the project root
- Check that `mainClass` is correctly set in `build.gradle`
- Verify your package structure matches the declared package

### Issue: IDE doesn't recognize Java project

**Solution**:

- **IntelliJ**: Open the project folder, it should auto-detect Gradle
- **VS Code**: Install Java Extension Pack, open the folder containing `build.gradle`
- **Eclipse**: Import → Existing Gradle Project

## IDE Configuration Tips

### IntelliJ IDEA Settings

Essential settings for Java development:

1. **File → Settings → Build → Build Tools → Gradle**

   - Build and run using: IntelliJ IDEA (faster than Gradle for development)
   - Use Gradle from: 'gradle-wrapper.properties' file

2. **File → Settings → Editor → Code Style → Java**
   - Set indentation to 4 spaces
   - Enable "Use tab character": off

### VS Code Settings

Add to your VS Code `settings.json`:

```json
{
  "java.configuration.updateBuildConfiguration": "automatic",
  "java.saveActions.organizeImports": true,
  "java.format.enabled": true,
  "java.compile.nullAnalysis.mode": "automatic"
}
```

### Useful IDE Shortcuts

=== "IntelliJ IDEA"

- **Ctrl+Shift+F10** - Run current class
- **Shift+F10** - Run last configuration
- **Ctrl+Shift+F9** - Recompile
- **Alt+Enter** - Quick fix suggestions
- **Ctrl+Alt+L** - Reformat code

=== "VS Code"

- **F5** - Run program
- **Ctrl+Shift+P** - Command palette
- **Ctrl+`** - Open terminal
- **Shift+Alt+F** - Format document
- **Ctrl+.** - Quick fix

## What's Next?

Excellent! You now have a complete Java development environment with:

✅ Java Development Kit (JDK) installed
✅ Gradle build tool configured
✅ Professional IDE set up
✅ First project created and running
✅ Understanding of project structure and build workflow

Time to dive into Java language fundamentals:

[Next: Learn Basic Syntax →](syntax.md)

## Troubleshooting Resources

If you encounter additional issues:

- [Gradle User Manual](https://docs.gradle.org/current/userguide/userguide.html) - Complete Gradle documentation
- [IntelliJ IDEA Documentation](https://www.jetbrains.com/help/idea/) - IDE setup and configuration
- [VS Code Java Documentation](https://code.visualstudio.com/docs/languages/java) - Java development in VS Code
- [Stack Overflow Java Tag](https://stackoverflow.com/questions/tagged/java) - Community help for specific issues
