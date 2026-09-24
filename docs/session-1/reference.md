# Session 1 Reference

## 🔩 Stack glossary

| Term | Meaning |
| ---- | ------- |
| **Driver Station (DS)** | The laptop and app that connect to the robot, pick the mode, and enable or disable it |
| **FMS** | Field Management System. The computer at competition that controls every robot's mode and timing |
| **Robot radio** | The Wi-Fi bridge on the robot |
| **roboRIO** | The robot's computer. Runs your Java program |
| **PDH** | Power Distribution Hub. Sends battery power to everything through breakers |
| **Motor controller** | Device that powers a motor based on your program's command. SPARK MAX is the common one |
| **CAN bus** | The wired network between the roboRIO and motor controllers |
| **Encoder** | Sensor that counts how far a shaft has turned |
| **Gyro** | Sensor that measures how far the robot has rotated |
| **RSL** | Robot Signal Light. Solid when disabled, blinking when enabled |
| **WPILib** | The library and tools every FRC Java program uses |
| **AdvantageScope** | Tool for plotting and replaying robot data |
| **Romi** | Small practice robot. Your program runs on a laptop and talks to it over Wi-Fi |
| **Codespace** | A VS Code development environment that runs in the cloud, in your browser |
| **Dev container** | The recipe in the repository that tells a Codespace what to install |

## 🌐 Addresses

| What | Value |
| ---- | ----- |
| Robot network pattern | `10.TE.AM.x` (team 1234 is `10.12.34.x`) |
| Robot radio | `10.TE.AM.1` |
| roboRIO | `10.TE.AM.2` |
| roboRIO by name | `roboRIO-TEAM-FRC.local` |
| Romi | `10.0.0.2` on the Romi's own Wi-Fi |

## 🌿 Git vocabulary

| Word | Meaning |
| ---- | ------- |
| **Repository (repo)** | A project and its full history |
| **Clone** | A copy of a repository on another computer. Your Codespace has one |
| **main** | The team's official branch. Protected. Changes reach it through pull requests |
| **Branch** | Your own line of work, named `yourname/what-it-does` |
| **Stage** | Choose which changes go in the next commit |
| **Commit** | A saved snapshot with a message |
| **Push** | Send your commits to GitHub |
| **Pull** | Get commits from GitHub |
| **Pull request (PR)** | Ask the team to review and merge your branch into `main`. Session 2 |

## ⌨️ Commands used today

```bash
./gradlew --version      # show Gradle and Java versions
git status               # what has changed
git log --oneline -3     # last three commits
```

## ⌨️ VS Code shortcuts

| Action | Windows / Chromebook | Mac |
| ------ | -------------------- | --- |
| Command Palette | ++ctrl+shift+p++ | ++cmd+shift+p++ |
| Toggle terminal | ++ctrl+grave++ | ++ctrl+grave++ |
| Save | ++ctrl+s++ | ++cmd+s++ |
| Source Control view | ++ctrl+shift+g++ | ++ctrl+shift+g++ |
