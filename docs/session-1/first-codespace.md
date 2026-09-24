# Your First Codespace

A **Codespace** is a full development environment that runs on a computer in the cloud and shows up in your browser as VS Code. The repository comes with a recipe (the dev container) that installs Java, Gradle, and the VS Code extensions you need. You do not install anything on your own computer.

## 1. Create the Codespace

1. Open the [`2026-bootcamp` repository](https://github.com/gryphoncommand/2026-bootcamp).
2. Click the green **Code** button, then the **Codespaces** tab.
3. Click **Create codespace on main**.

You will see: a new browser tab with VS Code loading. The first time takes a few minutes while it builds the environment. The editor becomes usable before the setup in the terminal finishes.

!!! tip "Do the next page while you wait"

    The terminal at the bottom will show Gradle downloading WPILib and building the project. You can keep going with the tour below while that runs.

## 2. Tour VS Code

Find each of these. You will use all of them every session.

| Area | Where | What it is for |
| ---- | ----- | -------------- |
| **Explorer** | Left bar, top icon (two pages) | The files in the repository |
| **Source Control** | Left bar, branch icon | Git: see your changes, commit, push |
| **Terminal** | Bottom panel. Toggle with ++ctrl+grave++ | Run commands like `./gradlew test` |
| **Command Palette** | ++ctrl+shift+p++ (++cmd+shift+p++ on a Mac) | Search every command VS Code has |
| **Status bar** | Bottom edge | Shows the current branch on the left |

Open the Explorer and click into `src/main/java/frc/robot`. That folder is where the robot program lives. You will spend most of the bootcamp there. Open `Robot.java` and skim it. Do not worry about understanding it yet. Session 2 is all about this file.

## 3. Run a command

Open the terminal and type:

```bash
./gradlew --version
```

You will see: Gradle and Java version information. Gradle is the tool that builds, tests, and deploys the robot program. Every time you see `./gradlew` in these pages, it means "run this in the terminal in your Codespace".

## 4. Know your quota

Codespaces run on your personal GitHub account, which comes with a free monthly allowance. It is plenty for the bootcamp if you follow two rules:

- Use the smallest machine (2 cores). The repository already asks for it.
- **Stop your Codespace when you finish a session.** Click the Codespaces button in the bottom-left corner of VS Code and choose **Stop Current Codespace**, or open [github.com/codespaces](https://github.com/codespaces) and stop it from the list.

A stopped Codespace keeps all your work. Next time, open the same one from [github.com/codespaces](https://github.com/codespaces) instead of creating a new one.

!!! warning "Unused Codespaces get deleted"

    GitHub deletes a Codespace after 30 days without use. Anything you committed and pushed is safe on GitHub. Anything you did not push is gone. Push your work at the end of every session.

## ✅ Done when

- [ ] You have a Codespace open in your browser.
- [ ] You found the Explorer, Source Control, Terminal, and Command Palette.
- [ ] `./gradlew --version` printed version information.
