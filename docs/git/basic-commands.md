# Basic Git Commands

Now that you understand Git concepts and have it installed, let's learn the essential commands you'll use every day as a developer.

## The Git Workflow

Git follows a simple three-step workflow:

1. **Working Directory** - Where you edit your files
2. **Staging Area** - Where you prepare files for a commit
3. **Repository** - Where commits are permanently stored

## Repository Operations

### Create a New Repository

```bash
# Create a new directory for your project
mkdir my-project
cd my-project

# Initialize a Git repository
git init
```

### Check Repository Status

See what files have changed:

```bash
git status
```

This command shows you:

- Files that are modified but not staged
- Files that are staged and ready to commit
- Files that are not tracked by Git

## Working with Files

### Add Files to Staging Area

Stage specific files:

```bash
git add filename.txt
```

Stage multiple files:

```bash
git add file1.txt file2.txt
```

Stage all changed files:

```bash
git add .
```

Stage all files with a specific extension:

```bash
git add *.java
```

### Remove Files from Staging

If you accidentally staged a file:

```bash
git reset filename.txt
```

### See What Changed

View unstaged changes:

```bash
git diff
```

View staged changes:

```bash
git diff --staged
```

## Creating Commits

### Make a Commit

```bash
git commit -m "Your commit message"
```

### Commit All Tracked Files

Skip the staging area for files Git already knows about:

```bash
git commit -am "Your commit message"
```

!!! tip "Good Commit Messages"

    Write clear, descriptive commit messages that explain what changed and why:

```text
✅ "Add user login functionality"
✅ "Fix bug in password validation"
✅ "Update documentation for new API"
❌ "stuff"
❌ "changes"
❌ "fix"
```

## Working with Branches

Branches are one of Git's most powerful features. They let you work on different features or experiments without affecting your main code.

### Why Use Branches?

- **Isolation**: Work on features without breaking main code
- **Collaboration**: Multiple people can work on different features simultaneously
- **Experimentation**: Try new ideas without risk
- **Organization**: Keep different types of work separate

### See Current Branch

```bash
git branch
```

The current branch is marked with an asterisk (\*).

### Create a New Branch

```bash
git branch feature-name
```

### Switch to a Branch

```bash
git checkout feature-name
```

### Create and Switch in One Command

```bash
git checkout -b feature-name
```

!!! tip "Branch Naming"
Use descriptive branch names that explain what you're working on: - `feature/user-login` - `bugfix/password-validation` - `update/documentation`

### Merge Branches

Bring changes from one branch into another:

```bash
# Switch to the target branch (usually main)
git checkout main

# Merge the feature branch
git merge feature-name
```

### Delete a Branch

```bash
git branch -d feature-name
```

## Viewing History

### See Commit History

```bash
git log
```

### Condensed History

```bash
git log --oneline
```

### Visual History with Branches

```bash
git log --graph --oneline --all
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

### Step 2: Create and Add Files

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

# Create another file
echo "Git tracks changes" > readme.txt

# Check what changed
git status
git diff hello.txt

# Stage and commit the changes
git add .
git commit -m "Add encouraging message and readme file"
```

### Step 5: Work with Branches

```bash
# Create and switch to a new branch
git checkout -b feature-greetings

# Make changes on the branch
echo "Welcome to Git branching!" >> hello.txt

# Stage and commit changes
git add hello.txt
git commit -m "Add welcome message on feature branch"

# Switch back to main branch
git checkout main

# Merge the feature branch
git merge feature-greetings

# Delete the feature branch (optional)
git branch -d feature-greetings
```

### Step 6: View Your History

```bash
# See all commits with branch information
git log --graph --oneline --all

# See condensed history
git log --oneline
```

## Undoing Changes

### Discard Changes in Working Directory

```bash
# Discard changes to a specific file
git checkout -- filename.txt

# Discard all changes in working directory
git checkout -- .
```

### Unstage Files

```bash
# Remove file from staging area (keep changes)
git reset filename.txt

# Unstage all files
git reset
```

### Amend the Last Commit

```bash
# Change the last commit message
git commit --amend -m "New commit message"

# Add forgotten files to the last commit
git add forgotten-file.txt
git commit --amend --no-edit
```

## Essential Commands Reference

| Command                    | Purpose                     |
| -------------------------- | --------------------------- |
| `git init`                 | Create a new repository     |
| `git status`               | Check repository status     |
| `git add <file>`           | Stage specific files        |
| `git add .`                | Stage all changes           |
| `git commit -m "message"`  | Create a commit             |
| `git log`                  | View commit history         |
| `git diff`                 | See unstaged changes        |
| `git diff --staged`        | See staged changes          |
| `git reset <file>`         | Unstage file                |
| `git checkout -- <file>`   | Discard changes             |
| `git branch`               | List branches               |
| `git branch <name>`        | Create new branch           |
| `git checkout <branch>`    | Switch to branch            |
| `git checkout -b <branch>` | Create and switch to branch |
| `git merge <branch>`       | Merge branch into current   |
| `git branch -d <branch>`   | Delete branch               |

## Common Patterns

### Daily Development Workflow

This is how most developers work with Git on a daily basis:

```bash
# 1. Start on main branch and make sure it's up to date
git checkout main
git status

# 2. Create a new branch for your feature
git checkout -b feature/user-login

# 3. Make your changes and check what changed
git status
git diff

# 4. Stage your changes
git add .

# 5. Review staged changes
git diff --staged

# 6. Commit with descriptive message
git commit -m "Add user login functionality"

# 7. Switch back to main branch
git checkout main

# 8. Merge your feature branch
git merge feature/user-login

# 9. Clean up by deleting the feature branch
git branch -d feature/user-login

# 10. Check your history
git log --oneline
```

### Selective Staging

Sometimes you only want to commit some changes in a file:

```bash
# Interactive staging
git add -p filename.txt
```

This lets you review and select which changes to stage piece by piece.

## Best Practices

1. **Use branches for all changes** - Never work directly on the main branch
2. **Use descriptive branch names** - `feature/user-login` instead of `new-stuff`
3. **Commit frequently** - Small, focused commits are easier to understand
4. **Write clear commit messages** - Explain what and why, not how
5. **Check status often** - Know what files have changed
6. **Review changes before committing** - Use `git diff` to see what you're about to commit
7. **One logical change per commit** - Don't mix unrelated changes
8. **Merge branches when features are complete** - Keep main branch stable
9. **Delete merged branches** - Keep your branch list clean

## What's Next?

Now you know the fundamental Git commands for tracking changes! Next, learn how to tell Git which files to ignore in your projects.

[Next: Working with .gitignore →](gitignore.md)

## Practice Exercises

Try these exercises to reinforce your learning:

1. **Create a simple project**: Make a directory with a few text files, initialize Git, and make several commits
2. **Practice branching workflow**: Create a feature branch, make changes, commit them, merge back to main, and delete the branch
3. **Practice good commit messages**: Make commits with clear, descriptive messages
4. **Use `git log`**: Explore your commit history with different options like `--oneline` and `--graph --all`
5. **Practice selective staging**: Make multiple changes to a file and stage only some of them using `git add -p`
6. **Branch management**: Create multiple branches, switch between them, and practice merging
