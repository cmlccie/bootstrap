# Contributing

Thank you for your interest in contributing to Bootstrap Coding Skills! This guide will help you get started with contributing to our learning resources designed for new developers.

## 🎯 Our Mission

This site provides **simple, minimal, and concise** instructions to help new developers get started with essential tools and languages. Our goal is to give learners a solid foundation of the basics, help them become minimally productive quickly, and then point them toward resources for continued learning.

## 🤝 How to Contribute

### Types of Contributions We Welcome

- **Content Improvements**: Fix typos, clarify explanations, improve examples
- **New Exercises**: Add practice exercises that reinforce core concepts
- **Better Examples**: Provide clearer, more beginner-friendly code examples
- **Bug Reports**: Report issues with existing content or broken links
- **Accessibility**: Improve readability and accessibility for new learners

### What We're Looking For

**Good Contributions:**

- ✅ Simple, clear explanations that beginners can understand
- ✅ Practical examples that new developers will actually use
- ✅ Step-by-step instructions that are easy to follow
- ✅ Corrections to outdated or incorrect information

**Contributions to Avoid:**

- ❌ Advanced topics that overwhelm beginners
- ❌ Complex explanations when simple ones work better
- ❌ Tools or techniques that aren't industry standard
- ❌ Content that assumes significant prior knowledge

## � Content Standards

### Writing Guidelines

- **Keep it simple**: Use clear, straightforward language
- **Be concise**: Prefer shorter explanations over longer ones
- **Be practical**: Focus on what new developers actually need
- **Be encouraging**: Remember your audience is just starting out

### Technical Guidelines

- **Git section**: Focus on essential daily commands and concepts
- **Java section**: Cover basic syntax, data structures, and clean code practices
- **Code examples**: Should be runnable and demonstrate real concepts
- **Prerequisites**: Clearly state what knowledge is assumed

### Content Structure

Each learning section should follow this pattern:

1. **Why learn this?** - Motivation and context
2. **Basic concepts** - Core ideas explained simply
3. **Hands-on practice** - Exercises and examples
4. **Next steps** - Where to learn more

## 🛠️ Development Setup

### Getting Started

1. **Fork the Repository**

   ```bash
   # Click the "Fork" button on GitHub, then clone your fork
   git clone https://github.com/yourusername/bootstrap.git
   cd bootstrap
   ```

2. **Set Up Development Environment**

   ```bash
   # Install dependencies and set up the project
   make setup

   # Start the development server to preview changes
   make serve
   ```

3. **Create a Branch**

   ```bash
   git checkout -b improvement/description-of-change
   ```

### Making Changes

1. **Edit content** in the `docs/` directory
2. **Preview changes** at `http://localhost:8000`
3. **Test thoroughly** - make sure all examples work
4. **Commit your changes** with a clear message

### Submitting Contributions

1. **Push your branch**: `git push origin your-branch-name`
2. **Create a Pull Request** on GitHub
3. **Describe your changes** clearly in the PR description
4. **Wait for review** - we'll provide feedback and suggestions

## 📁 Repository Structure

```text
docs/
├── index.md                    # Homepage
├── getting-started.md          # Setup and learning guide
├── git/                        # Git learning section
│   ├── index.md               # Git overview
│   ├── interactive-learning.md # Using learngitbranching.js.org
│   ├── staging-commits.md     # Basic Git workflow
│   ├── gitignore.md          # File management
│   ├── merge-conflicts.md     # Conflict resolution
│   └── reference.md          # Git quick reference
├── java/                      # Java learning section
│   ├── index.md              # Java overview
│   ├── setup.md              # Environment setup
│   ├── syntax.md             # Basic syntax and data types
│   ├── data-structures.md    # Arrays, Lists, Maps
│   ├── idioms.md             # Best practices
│   └── reference.md          # Java quick reference
└── contributing.md           # This file
```

## ✅ Quality Checklist

Before submitting your contribution, please check:

### Content Quality

- [ ] Content is appropriate for beginners
- [ ] Examples are simple and practical
- [ ] Code examples are tested and work correctly
- [ ] Links are functional and point to reliable resources
- [ ] Language is clear and encouraging

### Technical Quality

- [ ] Markdown formatting is correct
- [ ] Code blocks specify the correct language
- [ ] File paths and commands are accurate
- [ ] No spelling or grammar errors

### Testing

- [ ] All code examples compile and run
- [ ] Links work and go to the right destinations
- [ ] Content renders correctly in the browser
- [ ] Examples work on multiple platforms (when applicable)

## 🎯 Contribution Ideas

### Content Improvements

- **Clarify confusing explanations** - Make complex concepts simpler
- **Add missing examples** - Provide practical code demonstrations
- **Update outdated information** - Keep tools and versions current
- **Improve exercise instructions** - Make practice exercises clearer

### New Practice Exercises

- **Git practice scenarios** - More hands-on conflict resolution examples
- **Java coding challenges** - Simple programming problems for practice
- **Project ideas** - Small applications beginners can build

### Documentation Enhancements

- **Better error handling** - Help learners troubleshoot common issues
- **Platform-specific instructions** - Improve Windows/Mac/Linux compatibility
- **Visual aids** - Diagrams or screenshots that help explain concepts

## 🔍 Review Process

### What We Look For

1. **Beginner Focus**: Is this helpful for someone just starting out?
2. **Clarity**: Can a new developer follow these instructions?
3. **Accuracy**: Do the examples work as written?
4. **Scope**: Does this fit our "bootstrap" philosophy of basics-focused content?

### Review Timeline

- **Initial Review**: Within 1-2 days
- **Feedback**: We'll provide specific suggestions for improvements
- **Follow-up**: Usually 1-2 rounds of feedback before merging
- **Merge**: Once approved, changes are deployed automatically

## 📞 Getting Help

### Questions About Contributing

- **Open an Issue** - For questions about content or technical issues
- **Email**: [Your contact email if applicable]
- **Discussions** - Use GitHub Discussions for broader questions

### Before You Start

If you're planning a significant contribution (like a new section), please:

1. **Open an issue first** to discuss the idea
2. **Check our roadmap** to see if it fits our current direction
3. **Ask questions** if you're unsure about scope or approach

## 🙏 Recognition

Contributors are recognized in several ways:

- **Contributor list** - Added to our contributors page
- **Commit history** - Your contributions are permanently recorded
- **Community impact** - Help new developers start their journey successfully

Thank you for helping make coding education more accessible! Every improvement, no matter how small, helps new developers succeed in their learning journey.
