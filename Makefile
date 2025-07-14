# Bootstrap Makefile

.PHONY: help setup check-uv install serve build deploy lint-md lint-py format lint test check clean status
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

lint-md: ## Lint markdown files
	@command -v markdownlint >/dev/null && markdownlint docs/ || echo "markdownlint not found"

lint-py: ## Lint Python files
	uv run ruff check .

format: ## Format Python files
	uv run ruff format .

lint: lint-md lint-py ## Lint all files

test: build ## Test build

check: lint test ## Run quality checks

clean: ## Clean build files
	rm -rf site/

status: ## Show project status
	@echo "Python: $$(uv run python --version 2>/dev/null || echo 'N/A')"
	@echo "MkDocs: $$(uv run mkdocs --version 2>/dev/null || echo 'N/A')"
	@echo "Built: $$([ -f site/index.html ] && echo 'yes' || echo 'no')"
