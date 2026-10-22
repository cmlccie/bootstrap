# FRC Programming Bootcamp

Welcome! This five-session bootcamp bootstraps new FRC programmers. By the end, you will have written, tested, simulated, and deployed Java robot code - and you will know how to collaborate on that code with your team using GitHub. Two capstone projects take you further once the sessions are done.

!!! info "Bootstrap"

    In computing, _bootstrapping_ means starting a system with a small amount of code that then loads everything else. That is the goal here: a small, solid foundation you will keep building on all season.

## 🎯 What you will be able to do

- **Use the FRC software stack** - VS Code, WPILib, Driver Station, AdvantageScope, and the networks that connect your laptop to the robot.
- **Read and write robot code** - understand the robot code lifecycle and the structure of a command-based robot.
- **Test before you touch the robot** - run unit tests in a GitHub Codespace, then simulate on a laptop, then deploy to the Romi.
- **Work like a team** - refresh, branch, code, test, commit, and push from your own GitHub account, the same way every session.

## 🧭 How the bootcamp works

Each session is 60 to 90 minutes and hands-on. You leave every session having made something run, starting on day one.

- **This site** holds the agenda, instructions, and reference material for each session.
- **The [`2026-bootcamp` repository](https://github.com/gryphoncommand/2026-bootcamp)** holds the code. You will open it in a GitHub Codespace, work on your own branch, and push it. Between sessions a mentor merges the finished exercise into `main`, so every session starts from a working robot.
- **One Romi robot** is the shared target for your code - just like the competition robot will be during the season.
- **Every session ends with an optional challenge.** The exercise walks you through the code. The challenge gives you a goal and no steps. That is where the learning sticks.

## 📅 Sessions

| Session | Topic | Challenge |
| ------- | ----- | --------- |
| [Session 1](session-1/index.md) | The FRC Stack and Your First Commit - hardware, software, networks, GitHub, Codespaces, branch, commit, push | Sign the Wall |
| [Session 2](session-2/index.md) | Anatomy of Robot Code - modes, init and periodic, reading Java, logging, the heartbeat exercise | The Uptime Clock |
| [Session 3](session-3/index.md) | Subsystems, Commands, and the Romi RSL - command-based structure, classes and objects, conditionals, unit tests | SOS |
| [Session 4](session-4/index.md) | Controllers, Commands, and Simulation - controller to motor, methods and lambdas, arcade drive, the Sim GUI | Turn Around |
| [Session 5](session-5/index.md) | Sensors, Telemetry, and the Romi - encoders, gyro, odometry, AdvantageScope, driving the real Romi | See It Drive |

## 🏔️ Capstones

| Capstone | Topic |
| -------- | ----- |
| [Capstone 1: Autonomous](capstones/autonomous/index.md) | Commands that finish, sequences, the dashboard chooser, then routines of your own design |
| [Capstone 2: The Arm](capstones/arm/index.md) | A new subsystem for the Romi's robot arm, commands to move it, controls, and an auto that uses it |

## 📖 Reference

The [Reference](reference/index.md) tab collects everything in one place: every piece of [Java syntax](reference/java-syntax.md) in the code, the [development environment](reference/dev-environment.md) you work in, and the [robot, controller, and simulator](reference/robot.md) numbers you need. Each session also has its own short reference page.

## 📋 How to read the code blocks

Every code block on this site starts with a sentence that says what to do with it.

| It says | You do |
| ------- | ------ |
| **Add** ... | Type or paste the block into the place named, keeping what is already there |
| **Replace** ... | Delete the lines named, and put the block in their place |
| **Create** ... | Make a new file at that path and type the whole block into it |
| **Run** ... | Type the command into the terminal and press ++enter++ |
| *Read only* or "already in the file" | Look, do not type. The block shows code that exists or an example |

Blocks with a file name in the top corner show you which file. Blocks without one continue the file above them.

## 💡 How to get the most out of it

- **Type the code yourself.** Copy and paste teaches your clipboard, not you.
- **Break things on purpose.** You learn the most when something does not work and you find out why.
- **Ask questions early.** If you are stuck for more than a few minutes, ask a mentor or a teammate.
- **Commit often.** Small commits with clear messages are how professionals work, and they make it easy to recover from mistakes.
- **Try the challenge.** Even an unfinished challenge teaches more than a finished walkthrough.

!!! quote "Chris Lunsford"

    "Things are only complicated until they are understood, then they are simple."
