# Bootstrap

Short bootstrap lessons to help future developers begin their software development journeys.

## 🚀 Quick Start

### Local Development

1. **Clone the repository**

   ```bash
   git clone https://github.com/cmlccie/bootstrap.git
   cd bootstrap
   ```

2. **Install dependencies**

   ```bash
   # Ensure uv is installed
   curl -LsSf https://astral.sh/uv/install.sh | sh

   # Install project dependencies
   uv sync
   ```

3. **Start the development server**

   ```bash
   uv run mkdocs serve
   ```

4. **Open your browser**
   Navigate to [http://localhost:8000](http://localhost:8000)

### Building the Site

```bash
# Build static site
uv run mkdocs build

# Build and deploy to GitHub Pages
uv run mkdocs gh-deploy
```

## 📚 What's Included

- **Getting Started Guide**: Development environment setup and learning paths
- **Comprehensive Tutorials**: Step-by-step programming guides from beginner to advanced
- **Quick Reference**: Cheat sheets and syntax references for common languages
- **Contributing Guide**: How to contribute to the documentation

## 🌟 Features

- **Material Design Theme**: Modern, responsive documentation
- **Search Functionality**: Full-text search across all content
- **Code Syntax Highlighting**: Multi-language code examples
- **Mobile Responsive**: Works great on all devices
- **Dark/Light Mode**: User preference themes
- **GitHub Integration**: Easy editing and contributions

## 🛠️ Technology Stack

- **[MkDocs](https://www.mkdocs.org/)**: Static site generator
- **[Material for MkDocs](https://squidfunk.github.io/mkdocs-material/)**: Premium theme
- **[Python uv](https://docs.astral.sh/uv/)**: Fast Python package manager
- **[GitHub Actions](https://github.com/features/actions)**: Automated deployment
- **[GitHub Pages](https://pages.github.com/)**: Free hosting

## 📝 Content Organization

```
docs/
├── index.md              # Homepage
├── getting-started.md    # Setup and learning paths
├── tutorials.md          # Programming tutorials
├── reference.md          # Quick reference guides
└── contributing.md       # Contribution guidelines
```

## 🤝 Contributing

We welcome contributions! Please see our [Contributing Guide](docs/contributing.md) for details on:

- How to submit improvements
- Content guidelines and standards
- Development setup instructions
- Review process

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🔗 Links

- **Live Site**: [https://cmlccie.github.io/bootstrap/](https://cmlccie.github.io/bootstrap/)
- **Issues**: [GitHub Issues](https://github.com/cmlccie/bootstrap/issues)
- **Discussions**: [GitHub Discussions](https://github.com/cmlccie/bootstrap/discussions)

---

Built with ❤️ to help developers grow their coding skills
