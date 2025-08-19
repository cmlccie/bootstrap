# Git Setup and Configuration

Before you start learning Git commands, you need to install Git and configure it for your development environment.

## Installation

### Check if Git is Already Installed

```bash
git --version
```

If Git is installed, you'll see a version number. If not, follow the installation instructions below.

### Install Git

=== "macOS"

    **Option 1: Using Homebrew (Recommended)**

    ```bash
    # Install Homebrew if you don't have it
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Install Git
    brew install git
    ```

    **Option 2: Download Installer**
    Download from [git-scm.com](https://git-scm.com/download/mac)

=== "Windows"

    **Download and Install**

    1. Visit [git-scm.com](https://git-scm.com/download/win)
    2. Download the installer for your system (32-bit or 64-bit)
    3. Run the installer with default settings

    **Using Windows Package Manager**

    ```bash
    winget install Git.Git
    ```

=== "Linux (Ubuntu/Debian)"

    ```bash
    sudo apt update
    sudo apt install git
    ```

=== "Linux (CentOS/RHEL/Fedora)"

    ```bash
    # For CentOS/RHEL
    sudo yum install git

    # For Fedora
    sudo dnf install git
    ```

## Initial Configuration

After installing Git, you need to configure your identity. This information is included in every commit you make.

### Set Your Name and Email

```bash
git config --global user.name "Your Full Name"
git config --global user.email "your.email@example.com"
```

!!! tip "Use Your Real Information"

    Use your actual name and email address. If you plan to use GitHub, use the same email address you'll use for your GitHub account.

### Configure Your Default Editor

Git will sometimes open a text editor for commit messages. Set your preferred editor:

```bash
# For VS Code
git config --global core.editor "code --wait"
```

### Set Default Branch Name

Configure Git to use `main` as the default branch name for new repositories:

```bash
git config --global init.defaultBranch main
```

## Verify Your Configuration

Check that your configuration is set correctly:

```bash
git config --list
```

You should see your name, email, and other settings in the output.

## Optional: Set Up a Global .gitignore

Create a global `.gitignore` file for files you want to ignore in all repositories:

```bash
# Create the global .gitignore file
touch ~/.gitignore_global

# Configure Git to use it
git config --global core.excludesfile ~/.gitignore_global
```

Add common files to ignore:

```bash
# Add OS-specific files to global .gitignore
echo ".DS_Store" >> ~/.gitignore_global
echo "Thumbs.db" >> ~/.gitignore_global
echo ".vscode/" >> ~/.gitignore_global
echo "*.swp" >> ~/.gitignore_global
```

## Testing Your Setup

Create a test repository to verify everything works:

```bash
# Create a test directory
mkdir git-test
cd git-test

# Initialize a Git repository
git init

# Create a test file
echo "Hello, Git!" > test.txt

# Add and commit the file
git add test.txt
git commit -m "Initial commit"

# Check the commit log
git log
```

If you see your commit with your name and email, everything is set up correctly!

Clean up the test:

```bash
cd ..
rm -rf git-test
```

## Common Configuration Options

Here are some additional useful configuration options:

```bash
# Colorize Git output
git config --global color.ui auto

# Set up line ending handling (important for cross-platform projects)
# For Windows:
git config --global core.autocrlf true

# For macOS/Linux:
git config --global core.autocrlf input

# Set up push behavior
git config --global push.default simple

# Enable Git's built-in credential helper (saves passwords)
# For macOS:
git config --global credential.helper osxkeychain

# For Windows:
git config --global credential.helper manager-core

# For Linux:
git config --global credential.helper store
```

## Troubleshooting

### "Command not found" Error

If you get a "git: command not found" error:

1. **Make sure Git is installed** using the installation instructions above
2. **Restart your terminal** to refresh the PATH
3. **On Windows**: Make sure Git was added to your PATH during installation

### Permission Denied Errors

If you encounter permission errors:

1. **Check file permissions** in your repository directory
2. **Make sure you own the repository directory**
3. **On Windows**: Try running the terminal as administrator

### Configuration Issues

If Git doesn't seem to use your configuration:

1. **Check for typos** in email addresses or names
2. **Verify configuration** with `git config --list`
3. **Use `--global` flag** to set user-wide configuration

## What's Next?

Now that Git is installed and configured, you're ready to start learning how Git works conceptually.

[Next: Interactive Learning →](interactive-learning.md)
