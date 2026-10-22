# Capstone 1: Autonomous

No new Java. You use everything from Sessions 2-5 to make the Romi drive on its own: commands that finish when a sensor says so, chained into a routine, chosen from a dashboard before the match starts, and run in autonomous mode. The walkthrough builds two commands and the chooser. The challenge is the routines you design yourself.

## 🎯 Objectives

By the end of this capstone you will be able to:

- Write a command that finishes on its own by checking a sensor in `isFinished()`.
- Chain commands into a routine with `Commands.sequence`.
- Put routines in a `SendableChooser` so the driver picks one from the dashboard.
- Explain how `Robot.autonomousInit()` starts the chosen routine and `teleopInit()` stops it.
- Run a routine in the simulator by faking sensors, then on the Romi.
- Design a routine of your own that drives a shape, and tune it on the floor.

## ✅ Before you start

- [ ] Session 5's branch is pushed. `main` has Sessions 2 through 5 in it, including the gyro and odometry.
- [ ] Mentors: `solution/session-5` is merged into `main`. The Romi is charged. The routines need floor space, about a meter square.
- [ ] Do the routine: refresh `main`, branch `yourname/capstone-1`.

## 🗓️ Suggested agenda

| Time | Activity | Page |
| ---- | -------- | ---- |
| 0:00 | Recap: sensors, telemetry, the Romi. Questions | |
| 0:05 | The routine: refresh `main`, branch `yourname/capstone-1` | [The Routine](../../session-2/routine.md) |
| 0:10 | Commands that finish: `DriveDistance` and `TurnDegrees` | [Autonomous Commands](autonomous-commands.md) |
| 0:25 | Sequences and the chooser: building and picking a routine | [Sequences and the Chooser](sequences-and-chooser.md) |
| 0:40 | Run it: simulator first, then the Romi | [Run It](run-it.md) |
| 1:00 | Challenge: your own shapes | [Challenge: Shapes](challenge.md) |

!!! tip "Mentor pacing note"

    Work in pairs. One pair's routine on the Romi at a time, everyone else faking sensors in the simulator. The walkthrough should take under an hour; the challenge is where the time goes, and it can spill into another day.

## 🧪 Walkthrough

1. [Autonomous Commands](autonomous-commands.md) - write `DriveDistance` and `TurnDegrees`.
2. [Sequences and the Chooser](sequences-and-chooser.md) - build routines and the chooser.
3. [Run It](run-it.md) - simulator, then Romi.

## 🏆 Challenge

[Shapes](challenge.md) - a square, a triangle, a hexagon, and an S-curve, from the chooser, on the floor. No steps.

## 📚 Reference

- [Capstone 1 Reference](reference.md) - command lifecycle, composition, chooser, faking sensors.
- [Java Syntax](../../reference/java-syntax.md) - everything so far, plus the `for` loop the challenge may want.
