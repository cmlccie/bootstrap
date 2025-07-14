# Git Quick Reference

A concise reference of essential Git commands for daily development work.

## Setup and Configuration

```bash
# First-time setup
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"

# Check configuration
git config --list
```

## Repository Operations

```bash
# Initialize a new repository
git init

# Clone an existing repository
git clone https://github.com/user/repo.git

# Check repository status
git status

# View commit history
git log
git log --oneline
git log --graph --oneline
```

## Staging and Committing

```bash
# Stage specific files
git add filename.txt
git add file1.txt file2.txt

# Stage all changes
git add .

# Stage all files of a type
git add *.java

# Remove file from staging
git reset filename.txt

# Create a commit
git commit -m "Commit message"

# Commit all tracked files (skip staging)
git commit -am "Commit message"

# Amend the last commit
git commit --amend -m "New commit message"
```

## Viewing Changes

```bash
# See unstaged changes
git diff

# See staged changes
git diff --staged

# See changes in a specific file
git diff filename.txt

# Compare commits
git diff commit1 commit2
```

## Branching

```bash
# List branches
git branch

# Create new branch
git branch branch-name

# Switch to branch
git checkout branch-name

# Create and switch to new branch
git checkout -b branch-name

# Delete branch
git branch -d branch-name

# Rename current branch
git branch -m new-branch-name
```

## Merging

```bash
# Merge branch into current branch
git merge branch-name

# Abort merge (if conflicts)
git merge --abort

# Continue merge after resolving conflicts
git add resolved-file.txt
git commit
```

## Remote Repositories

```bash
# List remotes
git remote -v

# Add remote
git remote add origin https://github.com/user/repo.git

# Fetch changes from remote
git fetch origin

# Pull changes from remote
git pull origin main

# Push changes to remote
git push origin branch-name

# Push and set upstream
git push -u origin branch-name
```

## Undoing Changes

```bash
# Discard changes in working directory
git checkout -- filename.txt

# Unstage file (keep changes)
git reset filename.txt

# Reset to last commit (lose all changes)
git reset --hard HEAD

# Revert a commit (create new commit that undoes changes)
git revert commit-hash

# Reset to specific commit (lose commits after it)
git reset --hard commit-hash
```

## File Operations

```bash
# Remove file from Git and filesystem
git rm filename.txt

# Remove file from Git but keep in filesystem
git rm --cached filename.txt

# Move/rename file
git mv oldname.txt newname.txt
```

## Stashing

```bash
# Stash current changes
git stash

# Stash with message
git stash save "Work in progress"

# List stashes
git stash list

# Apply most recent stash
git stash apply

# Apply and remove most recent stash
git stash pop

# Drop most recent stash
git stash drop
```

## .gitignore Patterns

```gitignore
# Ignore specific files
filename.txt
config.local.json

# Ignore file types
*.log
*.tmp
*.class

# Ignore directories
build/
node_modules/
.idea/

# Ignore all .txt files except important.txt
*.txt
!important.txt

# Ignore files in any "temp" directory
**/temp/

# Ignore only in root directory
/root-only.txt
```

## Common Workflows

### Basic Development Workflow

```bash
# 1. Start with updated code
git pull origin main

# 2. Create feature branch
git checkout -b feature/new-feature

# 3. Make changes and commit
git add .
git commit -m "Add new feature"

# 4. Push branch
git push -u origin feature/new-feature

# 5. Create pull request (on GitHub/GitLab)
# 6. After review, merge and clean up
git checkout main
git pull origin main
git branch -d feature/new-feature
```

### Handling Conflicts

```bash
# 1. Try to merge/pull
git merge feature-branch
# or
git pull origin main

# 2. If conflicts occur, resolve them
git status  # See conflicted files
# Edit files to resolve conflicts

# 3. Complete the merge
git add resolved-file.txt
git commit -m "Resolve merge conflict"
```

## Useful Aliases

Add these to your Git configuration:

```bash
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.unstage 'reset HEAD --'
git config --global alias.last 'log -1 HEAD'
git config --global alias.visual '!gitk'
```

## Emergency Commands

```bash
# Forgot to add files to last commit
git add forgotten-file.txt
git commit --amend --no-edit

# Accidentally committed to wrong branch
git checkout correct-branch
git cherry-pick commit-hash
git checkout wrong-branch
git reset --hard HEAD~1

# Accidentally deleted important commits
git reflog  # Find the lost commit
git checkout lost-commit-hash
git checkout -b recovery-branch
```

## Commit Message Format

Follow these conventions for clear commit messages:

```text
type: Short description (50 chars or less)

Longer explanation if needed. Wrap at 72 characters.
Explain what changed and why, not how.

- Use bullet points for multiple changes
- Reference issue numbers if applicable

Types: feat, fix, docs, style, refactor, test, chore
```

Examples:

- `feat: Add user authentication system`
- `fix: Resolve null pointer exception in login`
- `docs: Update installation instructions`
- `refactor: Extract email validation logic`

## Getting Help

```bash
# Get help for any command
git help command-name
git command-name --help

# Quick help
git command-name -h

# List all Git commands
git help -a
```

---

**Remember**: Git is a powerful tool, and these commands cover the most common scenarios. Don't try to memorize everything at once - focus on the commands you use most frequently and gradually expand your knowledge.
