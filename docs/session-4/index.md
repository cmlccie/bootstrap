# Session 4: Controllers, Commands, and Simulation

Today the robot moves, on screen. You write the math that turns a controller stick into a motor speed, write the command that drives the Romi, bind buttons to behaviors, and run it all in the WPILib simulator on a programming laptop.

## 🎯 Objectives

By the end of this session you will be able to:

- Trace a stick movement from the controller, through `RobotContainer`, a command, and a subsystem, to a motor.
- Write a method that takes a parameter and returns a value, and test it.
- Write a command class with a constructor, attributes, `execute()`, `end()`, and `isFinished()`.
- Bind a controller button to a command, and explain what a lambda is.
- Run the robot program in the WPILib simulator, switch modes, and watch motor outputs and dashboard values change.

## ✅ Before you arrive

- [ ] Session 3's branch is pushed.
- [ ] A programming laptop with WPILib 2026 installed, the repository cloned, and an Xbox controller. Mentors set these up. You will share them.

## 🗓️ Agenda

| Time | Activity | Page |
| ---- | -------- | ---- |
| 0:00 | Recap: subsystems, commands, scheduler. Questions | |
| 0:05 | The routine in your Codespace: refresh `main`, branch `yourname/session-4` | [The Routine](../session-2/routine.md) |
| 0:10 | Controllers to motors: the end-to-end path; PWM Spark vs SPARK MAX | [Controllers to Motors](controllers.md) |
| 0:20 | Methods with parameters, lambdas, constants | [Methods and Lambdas](methods-and-lambdas.md) |
| 0:30 | Exercise part 1: `DriveInput` passes its tests | [Exercise: Drive Input](exercise-drive-input.md) |
| 0:40 | Exercise part 2: `ArcadeDriveCommand` and button bindings | [Exercise: Arcade Drive](exercise-arcade-drive.md) |
| 0:55 | Push, then simulate on a laptop | [Simulate It](simulate.md) |
| 1:15 | Wrap up: what Session 5 adds | |

!!! tip "Mentor pacing note"

    Part 1 is small on purpose: three methods, tests already written. Keep it to ten minutes so the command and the simulator get the time. If laptops are scarce, have pairs push from their Codespaces and take turns at a laptop while others finish.

## 🧪 Exercises

1. [The Routine](../session-2/routine.md) - refresh `main` and create `yourname/session-4`.
2. [Exercise: Drive Input](exercise-drive-input.md) - deadband and sign math, tested.
3. [Exercise: Arcade Drive](exercise-arcade-drive.md) - the command, the default command, two button bindings, dashboard values.
4. [Simulate It](simulate.md) - run it on a laptop with a controller.

## 📚 Reference

- [Session 4 Reference](reference.md) - controller map, `Trigger` methods, Sim GUI windows.
- [Java Cheat Sheet](../session-2/java-cheat-sheet.md) - now with methods, lambdas, and constants.

## ⏭️ Next session

Session 5 adds sensors: encoders and the gyro tell the robot where it is, the numbers go to AdvantageScope, and the code finally runs on the real Romi.
