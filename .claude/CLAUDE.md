# FRC Programming Bootcamp - Claude Code Instructions

This repository is the MkDocs static site for the **2026 FRC Programming Bootcamp**: a six-session course that bootstraps new and incoming FRC programming students. The site is published at <https://cmlccie.github.io/bootstrap/>.

A companion repository, **`gryphoncommand/2026-bootcamp`**, holds the robot code for the exercises. Students open it in GitHub Codespaces, work on their own branches, and open pull requests. `main` is protected.

Last year's (2025) site content is preserved at the git tag `2025`. Use it as source material, never as a structure to copy. Read it with `git show 2025:docs/<path>` or `git ls-tree -r --name-only 2025 docs/`.

## Who we are teaching

- New and incoming FRC programming students, most with little or no programming experience.
- They are not going to become experts in six sessions. The bootcamp lays a simple, efficient foundation they will build on through the season.
- They learn best by writing, running, and seeing the results of code. Get them coding on day one and add sophistication each session.

## Mentor goals for the season

1. **More students owning the robot code.** In past years one or two programming leads wrote everything from shared laptops using a shared GitHub account. This year every student has their own GitHub account and learns to collaborate with git and GitHub as a team.
2. **Development environments for everyone.** GitHub Codespaces (with a dev container set up for FRC/WPILib) so any student can write, build, and test code.
3. **Fast feedback with increasing fidelity.** Access to the competition robot is scarce. Students test in three levels:
    1. **Unit tests** in a Codespace (no robot, no GUI).
    2. **Simulation** on a programming laptop (WPILib simulation GUI, AdvantageScope).
    3. **Hardware** on the real robot. If the first two levels are done, robot time is mostly hardware integration and tuning constants.

## Bootcamp goals

- Get students coding fast. Real code runs in session 1.
- Every exercise is real (simplified) FRC code: robot code, Driver Station, AdvantageScope, dashboards. No generic calculator-style examples.
- Teach the FRC hardware and software stack: laptop, Driver Station, FMS, radio, roboRIO, motor controllers, sensors; VS Code, WPILib, REV Hardware Client, Driver Station, SmartDashboard/Shuffleboard/Elastic, AdvantageScope; the wireless, wired, and IP networks that connect them.
- Teach the robot code lifecycle: startup, initialization, and periodic execution across disabled, autonomous, teleop, and test modes.
- Teach the structure of a command-based robot (subsystems, commands, `RobotContainer`, triggers).
- Teach essential Java fundamentals in context, only as needed by the exercises.
- Target platform is one **Romi** robot. By the end, students deploy code to it to accomplish tasks. Many coders, one robot, like the real season.
- Teach the GitHub workflow in VS Code: branch, write, test, commit, push, pull request.

## Key constraints to remember

- **Six sessions total.** Agendas must be effective, not rushed. Cut scope before cramming.
- **Codespaces cannot reach the Romi.** Romi code runs on a laptop in WPILib simulation mode and talks to the Romi over its Wi-Fi network (default `10.0.0.2`). Unit tests and builds happen in Codespaces; simulation and Romi runs happen on programming laptops.
- **One Romi.** Design exercises so students can finish and validate most work without it.
- **WPILib version:** the current season release (2026.x) until the 2027 release lands at kickoff.

## Course outline (draft, revise as sessions are developed)

| Session | Working title | Focus |
| ------- | ------------- | ----- |
| 1 | The FRC stack and your first commit | Stack overview; GitHub accounts and org; first Codespace; branch, commit, push |
| 2 | Anatomy of robot code | Timed robot lifecycle; Java essentials in context; first unit test; first pull request |
| 3 | Subsystems and commands | Command-based structure; subsystems, commands, triggers; Java classes and lambdas |
| 4 | Test, simulate, tune | Unit tests in depth; simulation on the laptop; AdvantageScope and dashboards |
| 5 | Networks, Driver Station, and the Romi | IP addressing, radio/FMS, Driver Station; deploy to the Romi and drive it |
| 6 | Capstone | Teams build an autonomous routine, review each other's PRs, run it on the Romi; next steps |

## Site structure

```text
docs/
├── index.md              # Home: goals, how the bootcamp works, session table
├── session-1/index.md    # One directory per session
├── session-2/index.md
├── ...
└── session-6/index.md
```

- Each session is a top-level nav section in `mkdocs.yml`. The session's `index.md` is its landing page (agenda). Add extra pages inside the session directory when a session needs them (for example `session-3/exercises.md`) and add them to the nav.
- Put images and media in the session directory next to the page that uses them.
- Use lowercase, hyphenated file names.
- Do not reintroduce the 2025 site structure (`docs/git/`, `docs/java/`, generic reference pages). Fold reference material into the session that needs it.

### Session page template

```markdown
# Session N: Title

## 🎯 Objectives
By the end of this session you will be able to: (3-5 concrete, testable outcomes)

## 🗓️ Agenda
Numbered list with rough timing.

## 🧪 Exercises
Step-by-step, tell-show-tell. Every exercise ends with the student running something and seeing a result.

## 📚 Reference
Cheat-sheet material and links needed for this session only.
```

## Writing style

- Friendly, direct, encouraging. Write at an 8th-grade reading level.
- Active voice. Short sentences. One idea per sentence.
- **Tell-show-tell** for instructions: say what they will see, show it, then review what they saw.
- Code samples are as simple as possible and only as sophisticated as necessary. Minimal error handling unless teaching error handling.
- Use comments to explain concepts, never to narrate obvious code.
- Every code example is real FRC code they could put in the `2026-bootcamp` repository. Test it before publishing it.
- Include expected output or the expected on-screen result for every exercise step.
- Lists: parallel structure, consistent capitalization, all sentences or all fragments.
- Descriptive link text, meaningful image alt text, no skipped heading levels.
- Prefer showing over telling. Use emojis in headings sparingly and consistently with the template.

## MkDocs Material features to use

- Admonitions: `!!! note`, `!!! tip`, `!!! warning`, `!!! info`, `??? details` (collapsible).
- Tabbed content for OS-specific steps: `=== "Windows"` / `=== "macOS"`.
- Code blocks with a language and a `title="Robot.java"` when showing a file.
- Keyboard keys: `++ctrl+shift+p++` (pymdownx.keys).
- Task lists for checklists: `- [ ] item`.
- Always update `nav` in `mkdocs.yml` when adding a page. The build runs with `--strict`, so broken links and orphan pages fail CI.

## Developer operations

```bash
make setup    # install uv-managed dependencies
make serve    # live-reloading preview at http://127.0.0.1:8000
make build    # strict build (what CI runs)
make lint     # markdownlint on docs/
make check    # lint + build
```

- Python packaging is managed with `uv` (`pyproject.toml`, `uv.lock`). Commit the lockfile.
- Keep dependencies minimal. Do not add MkDocs plugins without a concrete need.
- `site/` is build output and is never committed.
- CI (`.github/workflows/ci.yml`) runs on every non-main push and pull request. Deploy (`deploy.yml`) publishes `main` to GitHub Pages. Dependabot keeps actions and Python dependencies current.

## Commit messages

Use conventional prefixes with a scope:

```text
content(session-1): add GitHub account setup steps
content(home): update session table
feat(site): enable task lists extension
fix(ci): pin markdownlint action
chore(deps): update mkdocs-material
```

Never include AI model identifiers in commit messages, PR text, or site content.

## Before you finish a change

- [ ] `make check` passes.
- [ ] New pages are in `mkdocs.yml` nav.
- [ ] Every exercise step tells the student what result to expect.
- [ ] Code examples were actually run (in the `2026-bootcamp` repository when they are robot code).
- [ ] Content matches the draft outline above, or the outline was updated on purpose.
