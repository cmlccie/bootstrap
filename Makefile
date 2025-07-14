# Bootstrap Makefile

.PHONY: help setup check-uv install serve build deploy lint-md lint-py format-py format-md format lint test check clean status
.DEFAULT_GOAL := help

help: ## Show available commands
	@awk 'BEGIN {FS = ":.*##"; printf "Usage: make <target>\n\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  %-12s %s\n", $$1, $$2 }' $(MAKEFILE_LIST)

setup: check-uv install ## Complete project setup

check-uv: ## Check if uv is installed
	@command -v uv >/dev/null || { echo "uv not found. Install: curl -LsSf https://astral.sh/uv/install.sh | sh"; exit 1; }

install: check-uv ## Install dependencies
	uv sync --extra dev

serve: ## Start development server
	uv run mkdocs serve

build: ## Build the site
	uv run mkdocs build

deploy: ## Deploy to GitHub Pages
	uv run mkdocs gh-deploy

lint: lint-py lint-md ## Lint all files

lint-py: ## Lint Python files
	uv run ruff check .

lint-md: ## Lint markdown files
	@if command -v markdownlint-cli2 >/dev/null 2>&1; then \
		markdownlint-cli2 "docs/**/*.md"; \
	else \
		echo "markdownlint-cli2 not found"; \
	fi

format: format-py format-md ## Format all files

format-py: ## Format Python files
	uv run ruff format .

format-md: ## Format markdown files
	@if command -v markdownlint-cli2 >/dev/null 2>&1; then \
		markdownlint-cli2 --fix "docs/**/*.md"; \
	else \
		echo "markdownlint-cli2 not found"; \
	fi

test: build ## Test build

check: lint test ## Run quality checks

clean: ## Clean build files
	rm -rf site/

status: ## Show project status
	@echo "Python: $$(uv run python --version 2>/dev/null || echo 'N/A')"
	@echo "MkDocs: $$(uv run mkdocs --version 2>/dev/null || echo 'N/A')"
	@echo "Built: $$([ -f site/index.html ] && echo 'yes' || echo 'no')"
