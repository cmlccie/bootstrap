# Session 6 (Optional): Autonomous

No new Java today. You use everything from Sessions 2-5 to make the Romi drive on its own: commands that finish when a sensor says so, chained into a routine, chosen from a dashboard before the match starts, and run in autonomous mode.

## 🎯 Objectives

By the end of this session you will be able to:

- Write a command that finishes on its own by checking a sensor in `isFinished()`.
- Chain commands into a routine with `Commands.sequence`.
- Put routines in a `SendableChooser` so the driver picks one from the dashboard.
- Explain how `Robot.autonomousInit()` starts the chosen routine and `teleopInit()` stops it.
- Run a routine in the simulator by faking sensors, then on the Romi.

## ✅ Before you arrive

- [ ] Session 5's branch is pushed, with the gyro and odometry in place.
- [ ] Mentors: the Romi is charged. The routines need floor space, about a meter square.

## 🗓️ Agenda

| Time | Activity | Page |
| ---- | -------- | ---- |
| 0:00 | Recap: sensors, telemetry, the Romi. Questions | |
| 0:05 | The routine: refresh `main`, branch `yourname/session-6` | [The Routine](../session-2/routine.md) |
| 0:10 | Commands that finish: `DriveDistance` and `TurnDegrees` | [Autonomous Commands](autonomous-commands.md) |
| 0:25 | Sequences and the chooser: building and picking a routine | [Sequences and the Chooser](sequences-and-chooser.md) |
| 0:40 | Run it: simulator first, then the Romi | [Run It](run-it.md) |
| 1:15 | Wrap up: where to go from here | [Run It](run-it.md#where-to-go-next) |

!!! tip "Mentor pacing note"

    Work in pairs. One pair's routine on the Romi at a time, everyone else faking sensors in the simulator. Have each pair design one extra routine (a square, a there-and-back) and add it to the chooser. That is the real deliverable.

## 🧪 Exercises

1. [The Routine](../session-2/routine.md) - refresh `main` and create `yourname/session-6`.
2. [Autonomous Commands](autonomous-commands.md) - write `DriveDistance` and `TurnDegrees`.
3. [Sequences and the Chooser](sequences-and-chooser.md) - build routines and the chooser.
4. [Run It](run-it.md) - simulator, then Romi.

## 📚 Reference

- [Session 6 Reference](reference.md) - command lifecycle, composition, chooser.
- [Java Cheat Sheet](../session-2/java-cheat-sheet.md) - everything so far.
