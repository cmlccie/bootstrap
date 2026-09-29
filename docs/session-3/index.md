# Session 3: Subsystems, Commands, and the Romi RSL

Today you learn how a command-based robot is organized, and you make the Romi's yellow LED behave like a real robot signal light: solid when the robot is disabled, blinking when it is enabled. The unit tests are already on `main`. Your job is to write the logic that makes them pass.

## 🎯 Objectives

By the end of this session you will be able to:

- Explain what a subsystem is, what a command is, and what the scheduler does with them.
- Read a class and point to its attributes, its constructor, and its methods.
- Tell the difference between a `static` method you call on a class and a method you call on an object.
- Write an `if` statement with `!`, `%`, and `<` that returns a `boolean`.
- Run unit tests, read a failing test, and make it pass.

## ✅ Before you arrive

- [ ] Session 2's branch is pushed. Today starts from a fresh `main`.

## 🗓️ Agenda

| Time | Activity | Page |
| ---- | -------- | ---- |
| 0:00 | Recap: modes, init, periodic. Questions | |
| 0:05 | The routine: refresh `main`, branch `yourname/session-3` | [The Routine](../session-2/routine.md) |
| 0:15 | Command-based robots: subsystems, commands, the scheduler, the Romi's LEDs | [Command-Based Robots](command-based.md) |
| 0:25 | Classes and objects: reading `SignalLight` and `RslLogic` | [Classes and Objects](classes-and-objects.md) |
| 0:35 | Booleans and conditionals: the RSL rule in English, then in Java | [Conditionals](conditionals.md) |
| 0:45 | Exercise: make the RSL tests pass | [Exercise: The RSL](exercise-rsl.md) |
| 1:05 | Commit, push, stop your Codespace | [The Routine](../session-2/routine.md) |
| 1:10 | Wrap up: what Session 4 adds | |

!!! tip "Mentor pacing note"

    Write the RSL rule as a truth table on the board before anyone types. Disabled: on. Enabled, first half second: on. Enabled, second half second: off. The code is three lines once the table is right.

## 🧪 Exercises

1. [The Routine](../session-2/routine.md) - refresh `main` and create `yourname/session-3`.
2. [Exercise: The RSL](exercise-rsl.md) - enable the tests, watch them fail, write `shouldBeOn`, watch them pass, push.

## 📚 Reference

- [Session 3 Reference](reference.md) - JUnit cheat sheet, `OnBoardIO` pins, command-based vocabulary.
- [Java Cheat Sheet](../session-2/java-cheat-sheet.md) - now with classes and conditionals.

## ⏭️ Next session

Session 4 moves to the programming laptops. You write a command that drives the Romi from an Xbox controller, bind buttons to behaviors, and run it all in the WPILib simulator.
