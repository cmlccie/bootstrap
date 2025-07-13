#!/bin/bash

# Bootstrap - Setup Script
# This script sets up the project for development

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Functions
print_header() {
    echo -e "${BLUE}"
    echo "╔══════════════════════════════════════════════════════════════════════════════╗"
    echo "║                        Bootstrap Setup                                       ║"
    echo "╚══════════════════════════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
}

print_success() {
    echo -e "${GREEN}✓ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠ $1${NC}"
}

print_error() {
    echo -e "${RED}✗ $1${NC}"
}

print_info() {
    echo -e "${BLUE}ℹ $1${NC}"
}

# Check if uv is installed
check_uv() {
    print_info "Checking for uv..."
    if ! command -v uv &> /dev/null; then
        print_warning "uv is not installed. Installing uv..."
        curl -LsSf https://astral.sh/uv/install.sh | sh
        export PATH="$HOME/.cargo/bin:$PATH"
        if ! command -v uv &> /dev/null; then
            print_error "Failed to install uv. Please install manually:"
            echo "curl -LsSf https://astral.sh/uv/install.sh | sh"
            exit 1
        fi
    fi
    print_success "uv is available"
}

# Install project dependencies
install_dependencies() {
    print_info "Installing project dependencies..."
    uv sync
    print_success "Dependencies installed"
}

# Test the build
test_build() {
    print_info "Testing MkDocs build..."
    uv run mkdocs build --quiet
    print_success "Build test passed"
}

# Create development environment info
create_env_info() {
    print_info "Creating environment information..."

    cat > .env.example << EOF
# Environment variables for Bootstrap
# Copy this file to .env and update the values for your setup

# Site configuration
SITE_NAME="Bootstrap Coding Skills"
SITE_URL="https://cmlccie.github.io/bootstrap/"
REPO_URL="https://github.com/cmlccie/bootstrap"

# Analytics (optional)
GOOGLE_ANALYTICS_ID="G-XXXXXXXXXX"

# Development
DEV_ADDR="127.0.0.1:8000"
EOF

    print_success "Created .env.example file"
}

# Setup Git hooks (if in git repository)
setup_git_hooks() {
    if [ -d ".git" ]; then
        print_info "Setting up Git hooks..."

        # Create pre-commit hook
        mkdir -p .git/hooks
        cat > .git/hooks/pre-commit << 'EOF'
#!/bin/bash
# Pre-commit hook for Bootstrap

echo "Running pre-commit checks..."

# Check if mkdocs build succeeds
if ! uv run mkdocs build --quiet; then
    echo "❌ MkDocs build failed. Please fix errors before committing."
    exit 1
fi

echo "✅ Pre-commit checks passed"
EOF

        chmod +x .git/hooks/pre-commit
        print_success "Git hooks configured"
    else
        print_warning "Not a git repository. Skipping Git hooks setup."
    fi
}

# Display next steps
show_next_steps() {
    echo -e "${BLUE}"
    echo "╔══════════════════════════════════════════════════════════════════════════════╗"
    echo "║                                Setup Complete!                               ║"
    echo "╚══════════════════════════════════════════════════════════════════════════════╝"
    echo -e "${NC}"

    echo -e "${GREEN}🎉 Your MkDocs project is ready for development!${NC}"
    echo ""
    echo "Next steps:"
    echo ""
    echo "1. Start the development server:"
    echo -e "   ${YELLOW}./scripts/dev.sh serve${NC}"
    echo -e "   ${YELLOW}# or: uv run mkdocs serve${NC}"
    echo ""
    echo "2. Open your browser and navigate to:"
    echo -e "   ${BLUE}http://localhost:8000${NC}"
    echo ""
    echo "3. Edit the documentation in the ${YELLOW}docs/${NC} directory"
    echo ""
    echo "4. Customize the configuration in ${YELLOW}mkdocs.yml${NC}"
    echo ""
    echo "5. To deploy to GitHub Pages:"
    echo -e "   ${YELLOW}./scripts/dev.sh deploy${NC}"
    echo ""
    echo "📚 Available commands:"
    echo -e "   ${YELLOW}./scripts/dev.sh help${NC}    - Show all available commands"
    echo -e "   ${YELLOW}./scripts/dev.sh build${NC}   - Build the static site"
    echo -e "   ${YELLOW}./scripts/dev.sh clean${NC}   - Clean build artifacts"
    echo ""
    echo "📖 Documentation:"
    echo "   - Getting Started: docs/getting-started.md"
    echo "   - Contributing: docs/contributing.md"
    echo ""
    print_success "Happy coding! 🚀"
}

# Main setup function
main() {
    print_header

    # Run setup steps
    check_uv
    install_dependencies
    test_build
    create_env_info
    setup_git_hooks

    # Show completion message
    show_next_steps
}

# Check if script is run directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
