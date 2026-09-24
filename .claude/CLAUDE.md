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

- **Six sessions of 60 to 90 minutes.** Plan for 75 minutes with a 60-minute core and optional stretch material. Cut scope before cramming.
- **No team name or number in this repository.** Students from other teams may use this site. Where a team number matters (IP addresses, mDNS names, WPILib project settings) use `TE.AM` placeholders and explain how a real number fills them in. Team-specific details live in the `gryphoncommand` organization's repositories.
- **Students use personal GitHub accounts and their personal free Codespaces quota.** Teach them to use the smallest machine and stop Codespaces when done.
- **Session 1 has no Java.** Creating a Codespace, a branch, and a pushed commit counts as "running code" on day one. Real robot code starts in session 2.
- **Codespaces cannot reach the Romi.** Romi code runs on a laptop in WPILib simulation mode and talks to the Romi over its Wi-Fi network (default `10.0.0.2`). Unit tests and builds happen in Codespaces; simulation and Romi runs happen on programming laptops.
- **One Romi.** Design exercises so students can finish and validate most work without it.
- **WPILib version:** the current season release (2026.x) until the 2027 release lands at kickoff. Java 17.
- **The mentor generates the Romi project** with the WPILib VS Code extension (Romi Command Bot template, desktop support enabled). Do not hand-write a WPILib project skeleton; add code to the generated one.

## Course outline (draft, revise as sessions are developed)

| Session | Title | Focus | Where code runs |
| ------- | ----- | ----- | --------------- |
| 1 | The FRC Stack and Your First Commit | Hardware, software, and network tour; GitHub account and org; first Codespace; branch, commit, push | Codespace (git only) |
| 2 | Your First Robot Code | `Robot.java` lifecycle (init and periodic across disabled, autonomous, teleop, test); Java variables, types, and methods through the Romi yellow LED as a makeshift RSL; run unit tests; first pull request | Codespace (unit tests) |
| 3 | Subsystems and Commands | Command-based structure: subsystems, commands, `RobotContainer`, triggers; Romi buttons drive LEDs; Java classes, objects, lambdas; tests for commands | Codespace (unit tests) |
| 4 | Simulate It | Drivetrain subsystem and arcade drive; WPILib simulation GUI and keyboard joystick; AdvantageScope; dashboards and NetworkTables; tuning constants | Laptop (simulation) |
| 5 | Networks, Driver Station, and the Romi | IP addressing and mDNS; radio, FMS, Driver Station; Romi Wi-Fi vs roboRIO; deploy to the Romi and drive it; sensor data in AdvantageScope | Laptop + Romi |
| 6 | Capstone | Small teams write an autonomous routine (encoders, gyro), review each other's pull requests, run it on the Romi; where to go next | Codespace, laptop, Romi |

Design rules for exercises:

- Every Java exercise is code that deploys to the Romi, even when the session only runs it in unit tests.
- Teach Java syntax through robot behavior, never through generic examples. Example: booleans and `if` through the RSL-style LED, `double` and math through drive speeds, classes through subsystems.
- Sessions 2-3 run code in unit tests in Codespaces. Sessions 4-5 add simulation on laptops. Sessions 5-6 deploy to the Romi.
- The Romi onboard I/O (`OnBoardIO`: green, yellow, and red LEDs; buttons A, B, C) is the safe playground for early exercises because it needs no motors.

## Site structure

```text
docs/
├── index.md              # Home: goals, how the bootcamp works, session table
├── session-1/index.md    # One directory per session
├── session-2/index.md
├── ...
└── session-6/index.md
```

- Each session is a top-level nav section in `mkdocs.yml`. The session's `index.md` is its landing page (objectives, agenda, pre-work). Each agenda step that students do hands-on gets its own page in the session directory (see `session-1/`), plus a `reference.md` cheat sheet. Add every page to the nav.
- Mermaid diagrams render natively (` ```mermaid ` fences). Prefer a small diagram over a paragraph for anything about how components connect.
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
