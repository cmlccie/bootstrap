#!/bin/bash

# Bootstrap - Development Scripts

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Functions
print_success() {
    echo -e "${GREEN}✓ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠ $1${NC}"
}

print_error() {
    echo -e "${RED}✗ $1${NC}"
}

# Check if uv is installed
check_uv() {
    if ! command -v uv &> /dev/null; then
        print_error "uv is not installed. Please install it first:"
        echo "curl -LsSf https://astral.sh/uv/install.sh | sh"
        exit 1
    fi
    print_success "uv is installed"
}

# Install dependencies
install() {
    print_warning "Installing dependencies..."
    uv sync
    print_success "Dependencies installed"
}

# Start development server
serve() {
    print_warning "Starting MkDocs development server..."
    print_warning "Open http://localhost:8000 in your browser"
    uv run mkdocs serve
}

# Build the site
build() {
    print_warning "Building MkDocs site..."
    uv run mkdocs build
    print_success "Site built successfully in ./site/"
}

# Deploy to GitHub Pages
deploy() {
    print_warning "Deploying to GitHub Pages..."
    uv run mkdocs gh-deploy
    print_success "Deployed to GitHub Pages"
}

# Lint markdown files
lint() {
    print_warning "Linting markdown files..."
    if command -v markdownlint &> /dev/null; then
        markdownlint docs/
        print_success "Markdown linting complete"
    else
        print_warning "markdownlint not installed. Install with: npm install -g markdownlint-cli"
    fi
}

# Clean build artifacts
clean() {
    print_warning "Cleaning build artifacts..."
    rm -rf site/
    print_success "Cleaned build artifacts"
}

# Show help
help() {
    echo "Bootstrap - Development Scripts"
    echo ""
    echo "Usage: ./scripts/dev.sh [command]"
    echo ""
    echo "Commands:"
    echo "  install    Install project dependencies"
    echo "  serve      Start development server"
    echo "  build      Build the static site"
    echo "  deploy     Deploy to GitHub Pages"
    echo "  lint       Lint markdown files"
    echo "  clean      Clean build artifacts"
    echo "  help       Show this help message"
    echo ""
    echo "Examples:"
    echo "  ./scripts/dev.sh install"
    echo "  ./scripts/dev.sh serve"
    echo "  ./scripts/dev.sh build"
}

# Main script logic
main() {
    check_uv

    case "${1:-help}" in
        install)
            install
            ;;
        serve)
            serve
            ;;
        build)
            build
            ;;
        deploy)
            deploy
            ;;
        lint)
            lint
            ;;
        clean)
            clean
            ;;
        help|--help|-h)
            help
            ;;
        *)
            print_error "Unknown command: $1"
            help
            exit 1
            ;;
    esac
}

# Run main function with all arguments
main "$@"
