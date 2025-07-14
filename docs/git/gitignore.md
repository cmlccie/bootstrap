# Working with .gitignore

Not all files in your project should be tracked by Git. Some files are temporary, generated automatically, or contain sensitive information. The `.gitignore` file tells Git which files and directories to ignore.

## What Files to Ignore

Common types of files to ignore:

- **Build artifacts** - Compiled code, build outputs
- **Dependencies** - Downloaded libraries and packages
- **Temporary files** - OS-generated files, editor backups
- **Sensitive information** - API keys, passwords, config files
- **Large files** - Videos, images, datasets (unless needed)

## Creating a .gitignore File

Create a file named `.gitignore` (note the dot at the beginning) in your project's root directory:

```bash
# Create .gitignore file
touch .gitignore
```

## .gitignore Syntax

### Basic Patterns

```gitignore
# Ignore specific files
secret.txt
config.local.json

# Ignore file types
*.log
*.tmp
*.class

# Ignore directories
build/
temp/
node_modules/
```

### Advanced Patterns

```gitignore
# Ignore all .txt files except important.txt
*.txt
!important.txt

# Ignore files in any directory named "temp"
**/temp/

# Ignore only in root directory
/root-only.txt

# Ignore files ending in .test in src directory
src/**/*.test
```

## Language-Specific Examples

### Java Projects

```gitignore
# Compiled class files
*.class

# Package files
*.jar
*.war

# IDE files
.idea/
.vscode/
*.iml

# Build directories
target/
build/

# OS files
.DS_Store
Thumbs.db
```

### Python Projects

```gitignore
# Byte-compiled Python
__pycache__/
*.pyc
*.pyo

# Virtual environments
venv/
env/
.env

# IDE files
.vscode/
.idea/

# OS files
.DS_Store
```

### Web Projects

```gitignore
# Dependencies
node_modules/

# Build outputs
dist/
build/

# Environment variables
.env
.env.local

# IDE files
.vscode/
.idea/

# OS files
.DS_Store
```

## Hands-on Practice

Let's practice with a Java project:

### Step 1: Create a Project Structure

```bash
mkdir java-practice
cd java-practice
git init

# Create some directories and files
mkdir src
mkdir target
echo "public class Hello { }" > src/Hello.java
echo "compiled bytecode" > target/Hello.class
echo "temporary data" > temp.log
```

### Step 2: See What Git Wants to Track

```bash
git status
```

You'll see Git wants to track everything, including files we don't want in version control.

### Step 3: Create .gitignore

```bash
# Create .gitignore file
touch .gitignore
```

Add this content to `.gitignore`:

```gitignore
# Compiled Java classes
*.class

# Build directory
target/

# Log files
*.log

# IDE files
.idea/
.vscode/

# OS files
.DS_Store
```

### Step 4: Check Status Again

```bash
git status
```

Now Git only shows the files you want to track!

### Step 5: Commit Your .gitignore

```bash
git add .gitignore
git add src/
git commit -m "Initial project setup with .gitignore"
```

## Global .gitignore

You can create a global `.gitignore` that applies to all your Git repositories:

```bash
# Create global .gitignore
git config --global core.excludesfile ~/.gitignore_global

# Add common ignore patterns
echo ".DS_Store" >> ~/.gitignore_global
echo "Thumbs.db" >> ~/.gitignore_global
echo ".vscode/" >> ~/.gitignore_global
```

## When .gitignore Doesn't Work

If you've already committed files that you now want to ignore:

```bash
# Remove from Git but keep local file
git rm --cached filename.txt

# Remove directory from Git but keep local
git rm -r --cached directory/

# Then commit the removal
git commit -m "Remove ignored files from tracking"
```

## Pre-made .gitignore Templates

GitHub provides templates for common project types:

- Visit [github.com/github/gitignore](https://github.com/github/gitignore)
- Browse templates for Java, Python, Node.js, etc.
- Copy and customize for your projects

## Best Practices

1. **Create .gitignore early** - Set it up when you start your project
2. **Commit your .gitignore** - Share ignore patterns with your team
3. **Be specific** - Use precise patterns to avoid ignoring important files
4. **Comment your rules** - Explain why certain patterns are ignored
5. **Test your patterns** - Use `git status` to verify what's being ignored

## Common Mistakes

- ❌ Ignoring important source files by accident
- ❌ Committing sensitive information before adding to .gitignore
- ❌ Using overly broad patterns that ignore too much
- ✅ Testing .gitignore patterns before committing
- ✅ Using specific, well-commented ignore rules

## What's Next?

Now you know how to keep unwanted files out of your repository. Next, learn how to handle conflicts when working with others.

[Next: Handling Merge Conflicts →](merge-conflicts.md)

## Practice Exercises

1. **Create a .gitignore for your preferred language** - Use templates from GitHub
2. **Test ignore patterns** - Create files that should be ignored and verify with `git status`
3. **Clean up an existing project** - Add .gitignore to a project that doesn't have one
