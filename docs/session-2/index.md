# Session 2: Anatomy of Robot Code

Today you write your first robot code. You will learn how a robot program starts, how it runs 50 times a second, and how the four operating modes fit in. You will read `Robot.java` line by line, add logging, and watch your program run in your Codespace.

## 🎯 Objectives

By the end of this session you will be able to:

- Name the four robot modes and explain the difference between an `init` and a `periodic` method.
- Read `Robot.java` and say what each part is for: package, imports, class, attributes, constructor, methods.
- Declare a variable, do math with it, and glue it into a text message.
- Log a message from robot code and find it in the terminal and in the log file.
- Run the routine: refresh `main`, branch, code, test, commit, push.

## ✅ Before you arrive

- [ ] Your Codespace from Session 1 still exists at [github.com/codespaces](https://github.com/codespaces). If it was deleted, create a new one from the repository's **Code** button.
- [ ] Skim [The Routine](routine.md). You will do it every session from now on.

## 🗓️ Agenda

| Time | Activity | Page |
| ---- | -------- | ---- |
| 0:00 | Recap Session 1. Questions | |
| 0:05 | The routine: refresh `main`, create today's branch | [The Routine](routine.md) |
| 0:15 | How a robot program runs: modes, init, periodic | [Anatomy of Robot Code](anatomy.md) |
| 0:25 | Reading Java: statements, methods, variables, math, text | [Reading Java](java-basics.md) |
| 0:35 | Logging: two ways, and where it goes | [Logging](logging.md) |
| 0:40 | Exercise: the heartbeat | [Exercise: The Heartbeat](exercise-heartbeat.md) |
| 1:05 | Commit, push, stop your Codespace | [The Routine](routine.md) |
| 1:10 | Wrap up: what Session 3 adds | |

!!! tip "Mentor pacing note"

    Read `Robot.java` on the projector with the students following in their Codespaces. Ask them to find each part before you explain it. The Java page is a reference for what they just saw, not a lecture.

## 🧪 Exercises

1. [The Routine](routine.md) - refresh `main` and create `yourname/session-2`.
2. [Exercise: The Heartbeat](exercise-heartbeat.md) - log mode changes, count loops, run the program, push.

## 📚 Reference

- [Session 2 Reference](reference.md) - modes, `Robot.java` methods, logging, commands.
- [Java Cheat Sheet](java-cheat-sheet.md) - grows every session.

## ⏭️ Next session

In Session 3 you meet subsystems and commands, and you program the Romi's yellow LED to behave like a real robot signal light: solid when disabled, blinking when enabled. You write the logic, and the unit tests already on `main` tell you when you got it right.
