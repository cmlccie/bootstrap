# Session 5: Sensors, Telemetry, and the Romi

Today the robot learns where it is, tells you about it, and then the code runs on the real Romi. You add the gyro and odometry to the drivetrain, publish numbers to NetworkTables, plot them in AdvantageScope, and drive the Romi over Wi-Fi from a laptop.

## 🎯 Objectives

By the end of this session you will be able to:

- Explain what an encoder and a gyro measure, and what a setpoint is.
- Convert encoder counts to inches and inches to meters in code, and test the math.
- Read and extend a unit test that uses simulated hardware.
- Publish a robot pose to NetworkTables and see it on a field in AdvantageScope.
- Connect a laptop to the Romi, run your code on it, and check the sensors against reality.

## ✅ Before you arrive

- [ ] Session 4's branch is pushed.
- [ ] Mentors: the Romi is charged, its Wi-Fi network is up, and one laptop is confirmed to reach `10.0.0.2`.

## 🗓️ Agenda

| Time | Activity | Page |
| ---- | -------- | ---- |
| 0:00 | Recap: controller to motor. Questions | |
| 0:05 | The routine: refresh `main`, branch `yourname/session-5` | [The Routine](../session-2/routine.md) |
| 0:10 | Sensors and feedback: encoders, gyro, odometry, setpoints | [Sensors and Feedback](sensors.md) |
| 0:20 | Units, decimals, and tests with fake hardware | [Units and Tests](units-and-tests.md) |
| 0:30 | Exercise part 1: extend the encoder test | [Exercise: Encoder Test](exercise-encoder-test.md) |
| 0:40 | Exercise part 2: odometry and a field on the dashboard | [Exercise: Odometry](exercise-odometry.md) |
| 0:55 | AdvantageScope: live values and log files | [Logs and AdvantageScope](logs.md) |
| 1:05 | The Romi: connect, run, drive, check the gyro sign | [Run It on the Romi](romi.md) |
| 1:25 | Wrap up: what Session 6 adds | |

!!! tip "Mentor pacing note"

    One Romi, many students. While pairs take turns at the Romi laptop, everyone else runs the odometry exercise in the simulator and AdvantageScope on the other laptops or their own machines. The Romi step is a demo plus one turn each at the sticks.

## 🧪 Exercises

1. [The Routine](../session-2/routine.md) - refresh `main` and create `yourname/session-5`.
2. [Exercise: Encoder Test](exercise-encoder-test.md) - add a test for the right encoder.
3. [Exercise: Odometry](exercise-odometry.md) - gyro, odometry, `Field2d`, telemetry.
4. [Logs and AdvantageScope](logs.md) - plot live values and open a log file.
5. [Run It on the Romi](romi.md) - the real thing.

## 📚 Reference

- [Session 5 Reference](reference.md) - sensor API, addresses, AdvantageScope quick start.
- [Java Cheat Sheet](../session-2/java-cheat-sheet.md) - now with units, decimals, and test setup.

## ⏭️ Next session

Session 6 is optional and has no new Java. You write commands that finish on their own, chain them into an autonomous routine, put the routines in a chooser on the dashboard, and run the one you pick on the Romi.
