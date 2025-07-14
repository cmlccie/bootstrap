# Staging Files and Creating Commits

Now that you understand Git concepts, let's learn how to use Git from the command line to track changes in your projects.

## The Git Workflow

Git follows a simple three-step workflow:

1. **Working Directory** - Where you edit your files
2. **Staging Area** - Where you prepare files for a commit
3. **Repository** - Where commits are permanently stored

## Setting Up Your First Repository

### Configure Git (One-time setup)

Before using Git, tell it who you are:

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

### Create a New Repository

```bash
# Create a new directory for your project
mkdir my-project
cd my-project

# Initialize a Git repository
git init
```

## Basic Git Commands

### Check Repository Status

See what files have changed:

```bash
git status
```

### Add Files to Staging Area

Add specific files:

```bash
git add filename.txt
```

Add all changed files:

```bash
git add .
```

Add all files with a specific extension:

```bash
git add *.java
```

### Create a Commit

```bash
git commit -m "Your commit message"
```

!!! tip "Good Commit Messages"
Write clear, descriptive commit messages:

```text
✅ "Add user login functionality"
✅ "Fix bug in password validation"
❌ "stuff"
❌ "changes"
```

## Hands-on Practice

Let's practice with a real example:

### Step 1: Create a Project

```bash
# Create and enter project directory
mkdir hello-git
cd hello-git

# Initialize Git repository
git init
```

### Step 2: Create and Add a File

```bash
# Create a simple text file
echo "Hello, Git!" > hello.txt

# Check status
git status

# Add file to staging area
git add hello.txt

# Check status again
git status
```

### Step 3: Make Your First Commit

```bash
git commit -m "Add hello.txt with greeting"
```

### Step 4: Make More Changes

```bash
# Modify the file
echo "Learning Git is fun!" >> hello.txt

# Check what changed
git status
git diff

# Stage and commit the changes
git add hello.txt
git commit -m "Add encouraging message to hello.txt"
```

## Viewing Your History

See all your commits:

```bash
git log
```

See a condensed view:

```bash
git log --oneline
```

## Common Patterns

### Adding Multiple Files

```bash
# Add multiple specific files
git add file1.txt file2.txt

# Add all files in a directory
git add src/

# Add all changed files
git add .
```

### Staging Parts of Files

Sometimes you only want to commit some changes in a file:

```bash
git add -p filename.txt
```

This lets you review and select which changes to stage.

## Essential Commands Summary

| Command                   | Purpose                 |
| ------------------------- | ----------------------- |
| `git init`                | Create a new repository |
| `git status`              | Check repository status |
| `git add <file>`          | Stage specific files    |
| `git add .`               | Stage all changes       |
| `git commit -m "message"` | Create a commit         |
| `git log`                 | View commit history     |
| `git diff`                | See unstaged changes    |

## What's Next?

Now you know how to track changes with Git! Next, learn how to tell Git which files to ignore.

[Next: Working with .gitignore →](gitignore.md)

## Practice Exercises

Try these exercises to reinforce your learning:

1. **Create a simple project**: Make a directory with a few text files, initialize Git, and make several commits
2. **Practice good commit messages**: Make commits with clear, descriptive messages
3. **Use `git log`**: Explore your commit history with different options like `--oneline` and `--graph`
