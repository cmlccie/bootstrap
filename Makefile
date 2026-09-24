# FRC Programming Bootcamp - site Makefile

.PHONY: help setup check-uv install serve build lint format check clean
.DEFAULT_GOAL := help

help: ## Show available commands
	@awk 'BEGIN {FS = ":.*##"; printf "Usage: make <target>\n\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  %-10s %s\n", $$1, $$2 }' $(MAKEFILE_LIST)

setup: check-uv install ## Complete project setup

check-uv: ## Check if uv is installed
	@command -v uv >/dev/null || { echo "uv not found. Install: curl -LsSf https://astral.sh/uv/install.sh | sh"; exit 1; }

install: check-uv ## Install dependencies
	uv sync

serve: ## Start the live-reloading development server
	uv run mkdocs serve

build: ## Build the site (strict: warnings fail the build)
	uv run mkdocs build --strict

lint: ## Lint markdown files
	npx --yes markdownlint-cli2 "docs/**/*.md"

format: ## Auto-fix markdown lint issues
	npx --yes markdownlint-cli2 --fix "docs/**/*.md"

check: lint build ## Run the same checks as CI

clean: ## Remove build output
	rm -rf site/
