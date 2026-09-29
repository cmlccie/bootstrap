# FRC Programming Bootcamp - Claude Code Instructions

This repository is the MkDocs static site for the **2026 FRC Programming Bootcamp**: a five-session course (plus an optional sixth) that bootstraps new and incoming FRC programming students. The site is published at <https://cmlccie.github.io/bootstrap/>.

A companion repository, **`gryphoncommand/2026-bootcamp`**, holds the robot code for the exercises. Students open it in GitHub Codespaces, work on their own branches, and push them. `main` is protected; a mentor merges. Pull requests, review, and merge conflicts are taught after the bootcamp, so no session mentions them.

Last year's (2025) site content is preserved at the git tag `2025`. Use it as source material, never as a structure to copy. Read it with `git show 2025:docs/<path>` or `git ls-tree -r --name-only 2025 docs/`.

## Who we are teaching

- New and incoming FRC programming students, most with little or no programming experience.
- They are not going to become experts in five sessions. The bootcamp lays a simple, efficient foundation they will build on through the season.
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
- Teach the GitHub routine in VS Code, the same way every session: refresh `main`, branch `yourname/session-N`, write, test, commit, push. It lives in `docs/session-2/routine.md` and every later session links to it.

## Key constraints to remember

- **Five sessions of 60 to 90 minutes, plus an optional sixth.** Plan for 75 minutes with a 60-minute core and optional stretch material. Cut scope before cramming.
- **No team name or number in this repository.** Students from other teams may use this site. Where a team number matters (IP addresses, mDNS names, WPILib project settings) use `TE.AM` placeholders and explain how a real number fills them in. Team-specific details live in the `gryphoncommand` organization's repositories.
- **Students use personal GitHub accounts and their personal free Codespaces quota.** Teach them to use the smallest machine and stop Codespaces when done.
- **Session 1 has no Java.** Creating a Codespace, a branch, and a pushed commit counts as "running code" on day one. Real robot code starts in session 2.
- **Session 6 has no new Java.** It teaches autonomous routines and selecting one for a match.
- **`./gradlew simulateJava` runs headless in Codespaces** (`CODESPACES=true` or `-Pheadless` in `build.gradle`): no Sim GUI, no Romi websocket, robot stays Disabled, logs print to the terminal. That is Session 2's "see it run" moment.
- **Exercise tests ship on `main` marked `@Disabled("Session N: ...")`.** Step one of the exercise is deleting that line. Completed exercises are on CI-verified `solution/session-N` branches in the code repo; site code blocks are copied from them, never typed fresh.
- **Codespaces cannot reach the Romi.** Romi code runs on a laptop in WPILib simulation mode and talks to the Romi over its Wi-Fi network (default `10.0.0.2`). Unit tests and builds happen in Codespaces; simulation and Romi runs happen on programming laptops.
- **One Romi.** Design exercises so students can finish and validate most work without it.
- **WPILib version:** the current season release (2026.x) until the 2027 release lands at kickoff. Java 17.
- **The mentor generates the Romi project** with the WPILib VS Code extension (Romi Command Bot template, desktop support enabled). Do not hand-write a WPILib project skeleton; add code to the generated one.

## Course outline

| Session | Title | FRC | Java (taught in context, used in the exercise) | Exercise | Where code runs |
| ------- | ----- | --- | ---------------------------------------------- | -------- | --------------- |
| 1 | The FRC Stack and Your First Commit | Hardware, software, network tour; GitHub account and org | none | First Codespace, branch, commit, push | Codespace (git only) |
| 2 | Anatomy of Robot Code | Modes; init vs periodic; file structure; logging | File structure, methods (define vs call), variables and types, numeric and string operators, first `if` | Heartbeat: log mode changes, count loops, headless `simulateJava` | Codespace |
| 3 | Subsystems, Commands, and the Romi RSL | Command-based; `OnBoardIO`; the RSL rule | Classes, objects, attributes, constructors, `static`; booleans, comparisons, `if/else`, `!`, `&&`, `||`; reading a JUnit test | `RslLogic.shouldBeOn` passes provided tests | Codespace |
| 4 | Controllers, Commands, and Simulation | Xbox axes/buttons; controller to motor path; PWM Spark vs SPARK MAX, PID concepts; Sim GUI; SmartDashboard/NetworkTables | Parameters and returns, `Math.abs`, constants, writing a class, `extends`, lambdas and method references | `DriveInput` tests, `ArcadeDriveCommand`, button bindings, simulate | Codespace + laptop |
| 5 | Sensors, Telemetry, and the Romi | Encoders, gyro, odometry, setpoints; AdvantageScope; Romi Wi-Fi and running on it | Unit math, `double` tolerance, objects of objects, `@BeforeEach`/`@AfterEach`, `AutoCloseable` | Extend `RomiDrivetrainTest`; gyro + odometry + `Field2d`; drive the Romi; check gyro sign | Codespace + laptop + Romi |
| 6 (opt) | Autonomous | Commands that finish; `Commands.sequence`; `SendableChooser`; the auto handoff in `Robot` | none new | `DriveDistance`, `TurnDegrees`, chooser; step through in sim; run on Romi | Laptop + Romi |

Each session: 5 min recap, 10 min routine, 10 min FRC concept, 10 min Java concept, 30 min exercise, 5 min wrap. A cumulative Java cheat sheet lives at `docs/session-2/java-cheat-sheet.md` and gains one section per session.

Design rules for exercises:

- Every Java exercise is code that deploys to the Romi, even when the session only runs it in unit tests.
- Teach Java syntax through robot behavior, never through generic examples. Example: booleans and `if` through the RSL-style LED, `double` and math through drive speeds, classes through subsystems.
- Sessions 2-3 run code in unit tests (and headless sim) in Codespaces. Session 4 adds the Sim GUI on laptops. Sessions 5-6 run on the Romi.
- Students write and commit in Codespaces and only run on the shared laptops, so git identity stays theirs. Pages say so.
- The Romi onboard I/O (`OnBoardIO`: green, yellow, and red LEDs; buttons A, B, C) is the safe playground for early exercises because it needs no motors.

## Site structure

```text
docs/
├── index.md              # Home: goals, how the bootcamp works, session table
├── session-1/index.md    # One directory per session
├── session-2/            # index, routine, concept pages, exercise pages, java-cheat-sheet, reference
├── ...
└── session-6/index.md
```

- Each session is a top-level nav section in `mkdocs.yml`. The session's `index.md` is its landing page (objectives, before-you-arrive, agenda table, exercises, reference, next session). Pages per session, in nav order: FRC concept page(s), Java page, exercise page(s), `reference.md`. Add every page to the nav.
- Shared pages live in `session-2/` and are linked with relative paths from later sessions: `routine.md` and `java-cheat-sheet.md`.
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
