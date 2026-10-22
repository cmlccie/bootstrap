# Capstone 2: The Arm

!!! warning "Only if the arm is installed"

    This capstone needs the [Pololu Robot Arm Kit for Romi](https://www.pololu.com/product/3550) assembled on the Romi, its three servos plugged in and powered, and the Romi's external pins configured. Ask a mentor whether that is done before you start. [Arm Hardware](arm-hardware.md) has the checklist.

The Romi's arm has three servos: one lifts the arm, one tilts the wrist, one opens and closes the gripper. There is no subsystem for it, no commands, no buttons, and no test. You write all of it. The pages here give you the hardware facts, the API, and a plan. The shape of the code is the shape of everything you have already written.

## 🎯 Objectives

By the end of this capstone you will be able to:

- Write a subsystem from scratch for hardware the project has never used.
- Keep every tunable number in `Constants.java` and find its real value on the hardware.
- Build small commands from a subsystem's methods and bind them to controller buttons.
- Test a hardware subsystem with simulated devices.
- Use your subsystem inside an autonomous routine alongside the drivetrain.

## ✅ Before you start

- [ ] Capstone 1 is on `main`. Mentors: merge `solution/capstone-1`.
- [ ] The arm is assembled, wired, and configured. See [Arm Hardware](arm-hardware.md).
- [ ] Do the routine: refresh `main`, branch `yourname/capstone-2`.

## 🗺️ The plan

Work in this order. Each milestone is something you can see.

| Milestone | You build | You see |
| --------- | --------- | ------- |
| 1. Constants | An `ArmConstants` class in `Constants.java`: three PWM channels and the positions that matter (down, up, level, open, closed) | `./gradlew build` passes |
| 2. Subsystem | `subsystems/Arm.java`: three `Servo` objects, a `set` and a `get` for each joint, with positions kept between 0.0 and 1.0 | `./gradlew build` passes; the arm is an attribute of `RobotContainer` |
| 3. Test | `ArmTest` with simulated hardware, like `RomiDrivetrainTest`: a position you set is the one you get back, and out-of-range values are clamped | `./gradlew test` green |
| 4. Controls | Buttons on the controller move each joint. Hold to nudge, or press for a preset, or both | In the simulator, **PWM Outputs** 2 to 4 follow the buttons. On the Romi, the arm moves |
| 5. Telemetry | Each joint's position on the dashboard | `Arm/lift` and friends in the NetworkTables panel and AdvantageScope |
| 6. Calibration | The real up, down, open, and closed positions, found on the Romi and written into `ArmConstants` | The arm goes where the names say |
| 7. Auto | A routine in the chooser that uses the arm and the drivetrain: grab something, carry it, put it down | The Romi does it by itself |

## ✅ Done when

- [ ] `Arm` is a subsystem with one method per thing it can do, and no number typed into it that belongs in `Constants`.
- [ ] `ArmTest` passes in your Codespace.
- [ ] The driver can move all three joints from the controller and the drivetrain still drives.
- [ ] An autonomous routine in the chooser moves the arm and the drivetrain in a sequence.
- [ ] It ran on the Romi. Something was picked up.
- [ ] The branch is pushed and a mentor has looked at it.

## 🧰 What you already know that helps

- `RomiDrivetrain` is the model for a subsystem that owns hardware and `implements AutoCloseable`. `SignalLight` is the model for a tiny one.
- `Servo` is the only new WPILib class. It takes a position from 0.0 to 1.0. Everything about it is on the [Arm Hardware](arm-hardware.md) page.
- The [Session 4 Reference](../../session-4/reference.md) small-commands table: `runOnce`, `run`, and `startEnd` build commands from lambdas, so every arm command can be one line.
- `CommandXboxController` has triggers for buttons you have not used: the D-pad (`povUp()` and friends), `x()`, `b()`, `leftTrigger()`, `rightTrigger()`.
- Capstone 1's chooser takes any `Command`. `Commands.sequence` and `Commands.waitSeconds` are how you give a servo time to arrive before the next step.

??? tip "Hint 1: a servo does not report where it is"

    Unlike an encoder, a hobby servo has no feedback the Romi can read. The position you asked for is all you know. WPILib's `Servo.get()` returns the last value you set. Your subsystem's "where is the lift" is "where did I last send it".

??? tip "Hint 2: nudging"

    "Hold a button and the lift creeps up" is a command that runs every loop and adds a small amount to the current position. `subsystem.run(() -> ...)` with `whileTrue` does it. The small amount belongs in `Constants`. Decide what happens at the top: `MathUtil.clamp` is in the reference.

??? tip "Hint 3: finding the real limits"

    Start every position constant in the middle, 0.5. On the Romi, nudge each joint toward its end slowly, watching the dashboard number. Stop when the arm reaches the frame or the gripper closes fully. Write that number down. Push past the mechanical limit and the servo strains and gets hot.

??? tip "Hint 4: the test cannot see a real servo"

    `HAL.initialize(500, 0)` in `@BeforeEach` and `close()` in `@AfterEach`, exactly like `RomiDrivetrainTest`. A `Servo` in simulation still remembers what you set. Positions are stored as whole microseconds of pulse width, so compare with a tolerance a little larger than usual.

??? tip "Hint 5: the auto"

    Servos take time to move and a `runOnce` command finishes at once. Put a short wait after each arm step in the sequence, with the wait time in `Constants` so you can shorten it once you have seen the arm move.
