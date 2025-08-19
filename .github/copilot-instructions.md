# Instructions for GitHub Copilot and New Contributors

This repository contains educational documentation built with MkDocs to help new developers bootstrap their coding skills. Follow these guidelines to ensure consistency with the existing project structure, conventions, and style.

## Repository Purpose

**Bootstrap** is a learning resource designed to help people get started coding, based on the premise that every learner needs to build upon a solid foundation, which includes:

1. An understanding of the core concepts and principles that underpin the technology or language (e.g. is it compiled or interpreted, statically or dynamically typed?).
2. A functional development environment (preferably on their own computer) to allow the learner to learn, experiment, and ultimately use the technology - including instructions on how to perform common developer operations.
3. An understanding of the essential syntax and language constructs (for programming languages, this includes variables, control structures, data types, and basic data structures).
4. Initial familiarity with the idiomatic practices and conventions of the language or technology.
5. A quick reference guide or cheat sheet to help them remember key concepts and syntax as they start coding.
6. Problems to solve to reinforce their learning and practice their skills.
7. Pointers to additional resources for further learning and exploration.

Bootstrap seeks to introduce minimal core concepts that build a solid foundation for advanced learning - using consistent patterns and practices for learning and adopting new technologies.

## Project Structure

```
├── docs/                   # MkDocs documentation source
├── site/                   # Generated MkDocs output (build artifacts)
├── src/bootstrap/          # Python package structure (for custom Python code used to generate site content)
├── mkdocs.yml              # MkDocs configuration
├── pyproject.toml          # Python project configuration and dependency management
├── Makefile                # Build and development commands
└── README.md               # Project overview
```

## Content Conventions

### Documentation Style

- **Friendly Tone**: Use clear, encouraging language suitable for beginners.
- **Practical Focus**: Include hands-on examples and real-world applications.
- **Visual Learning**: Use emojis, callouts, and structured formatting.
- **Progressive Structure**: Start simple, build complexity gradually.

### Writing Style & Formatting

- **Active Voice**: Always use active voice, never passive voice.
- **Code Simplicity**: Code samples should be as simple as possible and only as sophisticated as necessary.
- **Minimal Error Handling**: Keep error handling to an absolute minimum unless specifically teaching about error handling.
- **Tell-Show-Tell Model**: For learning instructions, tell the learner what they will see, show them, then review what they saw.
- **List Consistency**: All items in a list should be either complete sentences (ending with punctuation) or short phrases (no ending punctuation), never a mixture of both.
- **Parallel Structure**: Use consistent grammatical structure across list items (all starting with verbs, all starting with nouns, etc.).
- **Capitalization**: Use consistent capitalization in lists - typically sentence case for complete sentences, title case for short phrases.

### Content Standards

- Use MkDocs Material features consistently.
- Start each page with a clear H1 heading.
- Use proper syntax highlighting for code examples.
- Each technology/topic gets its own subdirectory.
- Use descriptive filenames with lowercase and hyphens.

## Technical Guidelines

### MkDocs Configuration

- Follow existing `mkdocs.yml` theme and plugin settings.
- Use Material for MkDocs features consistently.
- Enable appropriate extensions for content type.
- Always update navigation when adding new content.

#### Available Extensions

The project uses these MkDocs extensions:

- **pymdownx.highlight**: Code syntax highlighting with line numbers
- **pymdownx.superfences**: Enhanced code blocks and nested content
- **admonition**: Call-out boxes (notes, tips, warnings)
- **pymdownx.details**: Collapsible content sections
- **pymdownx.tabbed**: Tabbed content containers
- **attr_list**: HTML attributes in Markdown
- **tables**: Enhanced table formatting
- **toc**: Table of contents with permalinks

#### Navigation Structure

When adding new content, update the `nav` section in `mkdocs.yml`:

```yaml
nav:
  - Technology Name:
      - Overview: technology/index.md
      - Setup: technology/setup.md
      - Basic Syntax: technology/syntax.md
      - Data Structures: technology/data-structures.md
      - Best Practices: technology/idioms.md
      - Quick Reference: technology/reference.md
```

### Technology Bootstraps

Each technology bootstrap should include the following:

1. **Content directory**: `docs/technology-name/`
2. **Required Topics**:
   - `index.md` - Overview of the learning path with clear navigation
   - `setup/` or `setup.md` - Environment setup instructions
   - `syntax/` or `syntax.md` - Core syntax for the language (as appropriate)
   - `data-structures/` or `data-structures.md` - Common data structures (as appropriate)
   - `idioms/` or `idioms.md` - Common idioms and best practices (as appropriate)
   - `reference.md` - Quick reference/cheat sheet
3. **Content Organization**:
   - Always include an `index.md` as the landing page
   - Use either files or directories based on content complexity
   - Include images or other media in the topic directory
   - Follow consistent naming: `topic-name.md` or `topic-name/index.md`
4. **Navigation Updates**: Add new sections to `mkdocs.yml` nav structure
5. **File Naming**: Use lowercase with hyphens for all files and directories

#### Topic Structure Example

For complex topics, use directory structure:

```
docs/python/
├── index.md
├── setup/
│   ├── index.md
│   ├── windows.md
│   ├── macos.md
│   └── linux.md
├── syntax.md
├── data-structures.md
├── idioms.md
└── reference.md
```

For simple topics, use flat file structure:

```
docs/markdown/
├── index.md
├── setup.md
├── syntax.md
└── reference.md
```

### Developer Operations

- Common developer operations are available as targets in the Makefile.

### Dependencies

- Use `uv` for Python package management.
- Follow `pyproject.toml` dependency specifications.
- Keep dependencies minimal and well-maintained.

## Content Creation Guidelines

### Planning New Content

Before creating new content, consider:

1. **Target Audience**: New developers with minimal experience
2. **Learning Objective**: What specific skill will they gain?
3. **Prerequisites**: What should they know before starting this topic?
4. **Scope**: Keep content focused and digestible (aim for 10-15 minute reads)

### Content Structure Pattern

Follow this consistent structure for all learning content:

```markdown
# Topic Title - Brief Description

Brief introduction explaining what this is and why it matters.

## Why Learn [Topic]?

- **Benefit 1**: Clear, actionable benefit
- **Benefit 2**: Real-world application
- **Benefit 3**: Career/learning advantage

## What You'll Learn

Brief overview of learning path with numbered sections.

### 1. Section Name

Brief description with link to content.
[Learn More →](section.md)

### 2. Next Section

Brief description with link to content.
[Learn More →](next-section.md)
```

### MkDocs Material Features

Use these specific features consistently:

#### Admonitions

```markdown
!!! note "Remember"

    Use for important reminders or clarifications.

!!! tip "Pro Tip"

    Use for helpful shortcuts or best practices.

!!! warning "Common Mistake"

    Use to highlight potential pitfalls.

!!! info "Background Info"

    Use for optional context or deeper explanations.
```

#### Code Blocks

````markdown
```java title="HelloWorld.java"
public class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Hello, World!");
    }
}
```
````

Always include:

- Language identifier for syntax highlighting.
- Descriptive title for files.
- Expected output when relevant.

#### Cross-References

```markdown
<!-- Link to other sections -->

[Learn about variables →](syntax.md#variables)

<!-- Link to external resources -->

[Official Java Documentation](https://docs.oracle.com/javase/)
```

### Content Development Workflow

1. **Draft**: Create content following the structure patterns
2. **Local Test**: Use `make serve` to preview changes
3. **Review**: Check against quality standards (see below)
4. **Validate**: Ensure all links work and code examples run
5. **Commit**: Use descriptive commit messages

### Images and Media Guidelines

- **Format**: Use PNG for screenshots, SVG for diagrams.
- **Size**: Max width 800px, optimize for web.
- **Naming**: `topic-description.png` (lowercase, hyphens).
- **Location**: Store in same directory as the markdown file.
- **Alt Text**: Always include descriptive alt text.

Example:

```markdown
![Java development environment setup showing VS Code with Java extension](setup-vscode-java.png)
```

## Quality Standards

### Code Quality

- Use consistent formatting and style.
- Include comments explaining complex concepts.
- Don't use comments for simple intuitive readable code.
- Provide expected output for examples.
- Test all code examples to ensure they work.
- Use realistic examples that beginners can relate to.
- Keep examples as simple as possible while demonstrating the concept.

#### Code Example Standards

Good example:

```java
// Calculate total price with tax
double price = 19.99;
double taxRate = 0.08;
double total = price + (price * taxRate);
System.out.println("Total: $" + total);  // Output: Total: $21.59
```

Poor example:

```java
// This is a variable that stores a number
int x = 5; // Store 5 in x
int y = 10; // Store 10 in y
int z = x + y; // Add x and y and store in z
```

### Documentation Quality

- Use consistent terminology throughout (maintain a glossary if needed).
- Include cross-references between related topics using relative links.
- Maintain up-to-date external links (check quarterly).
- Follow the tell-show-tell model for instructional content.
- Use active voice consistently.
- Write at an 8th-grade reading level for accessibility.

### Content Review Checklist

Before publishing content, verify:

- [ ] Content follows the standard structure pattern
- [ ] All code examples have been tested and work
- [ ] Links are functional and use appropriate target attributes
- [ ] Images have descriptive alt text
- [ ] Content uses active voice throughout
- [ ] Lists use parallel structure and consistent capitalization
- [ ] Admonitions are used appropriately and sparingly
- [ ] Navigation is updated in `mkdocs.yml` if needed

### Accessibility

- Use descriptive link text (avoid "click here" or "read more").
- Include meaningful alt text for all images.
- Maintain proper heading hierarchy (H1 → H2 → H3, no skipping levels).
- Ensure sufficient color contrast for code examples.
- Use semantic HTML elements appropriately.
- Test content with screen readers when possible.
- Write at an appropriate reading level for beginners.

#### Accessibility Examples

Good link text:

```markdown
[Learn Java syntax fundamentals](syntax.md)
```

Poor link text:

```markdown
[Click here](syntax.md) to learn about syntax.
```

Good alt text:

```markdown
![Terminal window showing successful Java compilation with javac command](java-compile-success.png)
```

Poor alt text:

```markdown
![Screenshot](image.png)
```

## Development Workflow

### Local Development Setup

1. **Clone and Setup**: Use `make setup` to initialize the project
2. **Start Development Server**: Use `make serve` to run MkDocs locally
3. **Preview Changes**: Visit `http://127.0.0.1:8000` to see live updates
4. **Build for Production**: Use `make build` to generate static files

### Content Testing Process

Before committing content changes:

1. **Local Testing**: Verify content renders correctly using `make serve`
2. **Link Validation**: Check all internal and external links work
3. **Code Testing**: Run any code examples to ensure they work
4. **Cross-Platform Check**: Test on different screen sizes if applicable
5. **Accessibility Review**: Check heading structure and alt text

### Commit Guidelines

Use descriptive commit messages following this pattern:

```
content(java): add variables and data types section
content(git): update interactive learning guide
fix(mkdocs): correct navigation structure
```

Prefixes:

- `content`: General content changes
- `feat`: New site features and enhancements
- `docs`: Documentation updates
- `fix`: Bug fixes or corrections
- `style`: Formatting or style changes
- `refactor`: Content or code reorganization

## Deployment

- Site automatically deploys to GitHub Pages via GitHub Actions.
- Build artifacts in `site/` directory are generated, not committed.
- Live site: https://cmlccie.github.io/bootstrap/

## Key Principles Summary

When contributing to Bootstrap, always remember these core principles:

1. **Beginner-First**: Every decision should prioritize clarity and accessibility for new developers
2. **Consistency**: Follow established patterns for structure, style, and navigation
3. **Practical Learning**: Focus on hands-on examples that beginners can immediately apply
4. **Quality Assurance**: Test all code examples and validate all links before publishing
5. **Progressive Complexity**: Start simple and build understanding step by step
6. **Clear Communication**: Use active voice, descriptive language, and proper formatting

Remember: The goal is to help new developers build confidence and skills through clear, structured learning paths.
