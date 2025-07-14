# Setting Up Your Java Development Environment

Before writing Java code, you need to install Java and set up your development tools. This guide will get you up and running quickly.

## What You'll Install

1. **Java Development Kit (JDK)** - The core Java tools
2. **Text Editor or IDE** - Where you'll write your code
3. **Command Line Tools** - To compile and run your programs

## Step 1: Install Java Development Kit (JDK)

### Check if Java is Already Installed

Open your terminal/command prompt and run:

```bash
java --version
javac --version
```

If both commands show version 17 or higher, you can skip to Step 2.

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

## Step 2: Choose a Text Editor or IDE

### Option 1: VS Code (Recommended for Beginners)

1. **Download**: [code.visualstudio.com](https://code.visualstudio.com/)
2. **Install Java Extension Pack**:
   - Open VS Code
   - Go to Extensions (Ctrl+Shift+X)
   - Search for "Extension Pack for Java"
   - Install it

### Option 2: IntelliJ IDEA Community Edition

1. **Download**: [jetbrains.com/idea/download](https://www.jetbrains.com/idea/download/)
2. Choose the free Community Edition
3. Install with default settings

### Option 3: Simple Text Editor

Any text editor works for learning:

- **Notepad++** (Windows)
- **TextEdit** (macOS) - Make sure to use plain text mode
- **Gedit** (Linux)
- **Sublime Text** (All platforms)

## Step 3: Create Your First Java Program

Let's verify everything is working by creating a simple program.

### Create Project Directory

```bash
mkdir java-learning
cd java-learning
```

### Create Your First Program

Create a file named `HelloWorld.java`:

```java
public class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Hello, World!");
        System.out.println("Java is working!");
    }
}
```

### Compile and Run

```bash
# Compile the program
javac HelloWorld.java

# Run the program
java HelloWorld
```

You should see:

```text
Hello, World!
Java is working!
```

## Understanding the Development Workflow

The basic Java development cycle:

1. **Write** - Create `.java` source files
2. **Compile** - Use `javac` to create `.class` bytecode files
3. **Run** - Use `java` to execute the bytecode

```bash
# Compile: .java → .class
javac MyProgram.java

# Run: Execute the .class file
java MyProgram
```

## Essential Command Line Commands

```bash
# Compile a single file
javac HelloWorld.java

# Compile multiple files
javac *.java

# Run a program
java HelloWorld

# Check Java version
java --version

# Check compiler version
javac --version

# See detailed compilation errors
javac -verbose HelloWorld.java
```

## Project Organization

Organize your learning projects like this:

```text
java-learning/
├── lesson1/
│   ├── HelloWorld.java
│   └── HelloWorld.class
├── lesson2/
│   ├── Variables.java
│   └── Variables.class
└── lesson3/
    ├── Calculator.java
    └── Calculator.class
```

## Common Setup Issues and Solutions

### Issue: "javac is not recognized as a command"

**Solution**: Java isn't in your PATH. Add the JDK bin directory to your system PATH.

### Issue: "Error: Could not find or load main class"

**Solutions**:

- Make sure the class name matches the filename exactly
- Make sure you're in the correct directory
- Check that the `.class` file was created during compilation

### Issue: VS Code doesn't recognize Java

**Solution**:

1. Install the Java Extension Pack
2. Open a folder containing Java files
3. VS Code should automatically detect Java projects

## Editor Configuration Tips

### VS Code Settings

Add to your VS Code settings.json:

```json
{
  "java.configuration.updateBuildConfiguration": "automatic",
  "java.saveActions.organizeImports": true,
  "java.format.enabled": true
}
```

### Basic VS Code Shortcuts

- **Ctrl+Shift+P** - Command palette
- **F5** - Run program
- **Ctrl+`** - Open terminal
- **Ctrl+Shift+`** - New terminal

## What's Next?

Great! You now have a working Java development environment. Time to learn the language itself.

[Next: Learn Basic Syntax →](syntax.md)

## Troubleshooting Resources

If you encounter issues:

- [Oracle Installation Guide](https://docs.oracle.com/en/java/javase/21/install/)
- [VS Code Java Documentation](https://code.visualstudio.com/docs/languages/java)
- [Stack Overflow Java Tag](https://stackoverflow.com/questions/tagged/java) - For specific error messages
