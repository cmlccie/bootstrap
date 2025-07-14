# Handling Merge Conflicts

Merge conflicts happen when Git can't automatically combine changes from different sources. While they might seem scary at first, they're a normal part of working with Git, especially when collaborating with others.

## What Causes Merge Conflicts?

Conflicts occur when:

- Two people edit the same line in a file
- One person edits a file while another deletes it
- Two branches modify the same part of a file differently

## Understanding Conflict Markers

When Git encounters a conflict, it marks the conflicting sections in your files:

```text
<<<<<<< HEAD
This is the content from your current branch
=======
This is the content from the branch you're merging
>>>>>>> other-branch
```

- `<<<<<<< HEAD` - Start of your changes
- `=======` - Separator between conflicting changes
- `>>>>>>> other-branch` - End of incoming changes

## Resolving Conflicts Step-by-Step

### Step 1: Identify Conflicted Files

```bash
git status
```

Look for files marked as "both modified" or with conflict indicators.

### Step 2: Open and Edit Conflicted Files

1. Open the file in your text editor
2. Find the conflict markers (`<<<<<<<`, `=======`, `>>>>>>>`)
3. Decide which changes to keep:
   - Keep your changes
   - Keep their changes
   - Keep both changes
   - Write something completely new

### Step 3: Remove Conflict Markers

After deciding what to keep, remove ALL conflict markers:

```text
<<<<<<< HEAD
=======
>>>>>>> other-branch
```

### Step 4: Stage the Resolved Files

```bash
git add resolved-file.txt
```

### Step 5: Complete the Merge

```bash
git commit -m "Resolve merge conflict in resolved-file.txt"
```

## Hands-on Practice

Let's create and resolve a merge conflict:

### Create a Practice Repository

```bash
mkdir conflict-practice
cd conflict-practice
git init

# Create a file with initial content
echo "Welcome to our project" > README.md
echo "This is the main documentation" >> README.md
git add README.md
git commit -m "Initial README"
```

### Create Conflicting Changes

```bash
# Create and switch to a new branch
git checkout -b feature-branch

# Modify the file on the feature branch
echo "Welcome to our amazing project" > README.md
echo "This is the main documentation" >> README.md
echo "Added new feature documentation" >> README.md
git add README.md
git commit -m "Update README with feature info"

# Switch back to main branch
git checkout main

# Make different changes to the same line
echo "Welcome to our wonderful project" > README.md
echo "This is the main documentation" >> README.md
echo "Updated main branch documentation" >> README.md
git add README.md
git commit -m "Update README from main branch"
```

### Create the Conflict

```bash
# Try to merge the feature branch
git merge feature-branch
```

Git will report a conflict! Now let's resolve it.

### Resolve the Conflict

```bash
# Check status
git status

# Open README.md in your editor
# You'll see something like:
```

```text
<<<<<<< HEAD
Welcome to our wonderful project
This is the main documentation
Updated main branch documentation
=======
Welcome to our amazing project
This is the main documentation
Added new feature documentation
>>>>>>> feature-branch
```

Edit the file to resolve the conflict. For example:

```text
Welcome to our amazing and wonderful project
This is the main documentation
Updated main branch documentation
Added new feature documentation
```

Then finish the merge:

```bash
# Stage the resolved file
git add README.md

# Complete the merge
git commit -m "Resolve README conflict by combining descriptions"
```

## Conflict Resolution Strategies

### Strategy 1: Accept One Side Completely

```bash
# Keep your changes (current branch)
git checkout --ours filename.txt

# Keep their changes (incoming branch)
git checkout --theirs filename.txt

# Stage the file
git add filename.txt
```

### Strategy 2: Manual Resolution

Edit the file to combine changes thoughtfully, considering:

- What makes the most sense functionally?
- Which changes are more recent or important?
- How can you combine both sets of changes?

### Strategy 3: Use a Merge Tool

Configure a visual merge tool:

```bash
# Configure VS Code as merge tool
git config --global merge.tool vscode
git config --global mergetool.vscode.cmd 'code --wait $MERGED'

# Use the merge tool
git mergetool
```

## Preventing Conflicts

### Best Practices

1. **Communicate with your team** - Coordinate who's working on what
2. **Make smaller, focused commits** - Easier to resolve conflicts
3. **Pull frequently** - Stay up-to-date with changes
4. **Work on different files when possible** - Natural conflict avoidance

### Pull Before You Push

```bash
# Before starting work
git pull origin main

# Before pushing your changes
git pull origin main
git push origin your-branch
```

## When Things Go Wrong

### Abort a Merge

If you want to cancel a merge in progress:

```bash
git merge --abort
```

### Reset After a Bad Merge

If you completed a merge but want to undo it:

```bash
# Find the commit before the merge
git log --oneline

# Reset to that commit (replace abc123 with actual hash)
git reset --hard abc123
```

!!! warning "Use Reset Carefully"
`git reset --hard` permanently discards changes. Make sure you really want to lose the merge.

## Common Conflict Scenarios

### Scenario 1: Different Messages

```text
<<<<<<< HEAD
console.log("Hello from main branch");
=======
console.log("Hello from feature branch");
>>>>>>> feature-branch
```

**Resolution**: Choose the most appropriate message or combine them.

### Scenario 2: Added vs Modified

```text
<<<<<<< HEAD
function oldFunction() {
    return "original";
}
=======
function newFunction() {
    return "updated";
}

function anotherFunction() {
    return "additional";
}
>>>>>>> feature-branch
```

**Resolution**: Decide whether to keep old functionality, new functionality, or both.

## Essential Commands Summary

| Command                 | Purpose                              |
| ----------------------- | ------------------------------------ |
| `git status`            | Check for conflicts                  |
| `git merge branch-name` | Merge a branch (may cause conflicts) |
| `git add file`          | Stage resolved file                  |
| `git commit`            | Complete the merge                   |
| `git merge --abort`     | Cancel merge in progress             |
| `git mergetool`         | Open visual merge tool               |

## What's Next?

Congratulations! You now have a solid foundation in Git. These skills will serve you well as you collaborate on projects and manage your code.

For more advanced Git topics, check out our [Git Quick Reference](reference.md) or explore these resources:

- [Pro Git Book](https://git-scm.com/book) - Complete Git documentation
- [GitHub Guides](https://guides.github.com/) - Collaboration workflows
- [Atlassian Git Tutorials](https://www.atlassian.com/git/tutorials) - Advanced concepts

## Practice Exercises

1. **Create intentional conflicts** - Practice with different types of conflicts
2. **Try different resolution strategies** - Use `--ours`, `--theirs`, and manual resolution
3. **Set up a merge tool** - Configure VS Code or another visual tool for resolving conflicts
