# FRC Programming Bootcamp

The static site for the 2026 FRC Programming Bootcamp: a six-session course that bootstraps new FRC programmers from their first commit to code running on a robot.

- **Live site:** <https://cmlccie.github.io/bootstrap/>
- **Code repository (student exercises):** <https://github.com/gryphoncommand/2026-bootcamp>
- **Last year's content:** git tag [`2025`](https://github.com/cmlccie/bootstrap/tree/2025)

## Quick start

Requires [uv](https://docs.astral.sh/uv/).

```bash
git clone https://github.com/cmlccie/bootstrap.git
cd bootstrap
make setup
make serve     # http://127.0.0.1:8000
```

```bash
make help      # all commands
make build     # strict build (same as CI)
make lint      # markdownlint on docs/
make check     # lint + build
```

## Structure

```text
docs/
├── index.md              # Home
├── session-1/index.md    # One directory per session
├── ...
└── session-6/index.md
mkdocs.yml                # Site configuration and navigation
.claude/CLAUDE.md         # Goals, constraints, and content conventions for Claude Code
```

## Stack

[MkDocs](https://www.mkdocs.org/) with [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/), managed with [uv](https://docs.astral.sh/uv/), built and deployed to GitHub Pages by GitHub Actions.

## License

MIT. See [LICENSE](LICENSE).
