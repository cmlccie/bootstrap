# Challenge: Shapes

!!! abstract "No steps. This is the capstone."

    Everything you need is in the walkthrough you just did, the [Capstone 1 Reference](reference.md), and one new piece of Java on the [Java Syntax](../../reference/java-syntax.md) page. Work in pairs on your `yourname/capstone-1` branch. Open a hint if you are stuck; the hints point, they do not solve.

## 🎯 The goal

Add routines to the chooser that drive the Romi in these shapes and bring it back to where it started, facing the way it started:

| Routine | Shape |
| ------- | ----- |
| **Square** | Four equal sides, four turns |
| **Triangle** | Three equal sides, three turns |
| **Hexagon** | Six equal sides, six turns |
| **S-curve** | Forward while curving one way, then forward while curving the other. No stopping in the middle |

Each one is an option in the chooser, each one runs from **Autonomous** in the Sim GUI, and each one runs on the Romi.

## ✅ Done when

- [ ] All four routines are in the chooser and the default is still "Do nothing".
- [ ] In the simulator, you can step each routine through by faking the encoders and the gyro, and it finishes.
- [ ] On the Romi, the square ends within a hand's width of where it started. Measure it. Tune one number and run it again.
- [ ] The S-curve never stops in the middle: the robot keeps rolling while the turn flips direction.
- [ ] `./gradlew build` passes and the branch is pushed.
- [ ] Street cred: the square, the triangle, and the hexagon share one piece of code. Adding an octagon is one line.

## 🧰 What you already know that helps

- `DriveDistance` and `TurnDegrees` are the building blocks. The L shape in the chooser is a three-piece sequence; a square is a longer one.
- Geometry: at each corner of a regular polygon, the robot turns by the **exterior angle**, 360 divided by the number of sides.
- `arcadeDrive(speed, rotation)` with both values nonzero drives a curve. `DriveDistance` only ever passes `0.0` for rotation.
- `Commands.sequence(...)` takes any number of commands. Every `Command` also has an `andThen(...)` method that builds a sequence one piece at a time.
- Twelve commands in a row for a hexagon is a lot of typing. Java has a `for` loop for "do this N times". It is on the [Java Syntax](../../reference/java-syntax.md) page.

??? tip "Hint 1: the square first"

    Write it out longhand: drive, turn, drive, turn, drive, turn, drive, turn. Eight `new` commands in one `Commands.sequence`. Run it in the simulator, faking the sensors eight times. Then ask what the triangle has in common with it.

??? tip "Hint 2: the shared piece"

    A method that takes the number of sides and the side length and *returns a `Command`* can build any polygon. Inside it, a `for` loop runs once per side, and each pass adds one `DriveDistance` and one `TurnDegrees` to a sequence that starts empty. `Commands.none()` is an empty command, and `andThen` grows it.

??? tip "Hint 3: the S-curve needs a new command"

    `DriveDistance` with a rotation would do it. Copy `DriveDistance` into a new class, give the constructor one more parameter, and pass it to `arcadeDrive`. The distance check in `isFinished()` still works, because the average of the two wheels is still how far the robot went along its path.

??? tip "Hint 4: it does not end where it started"

    It never does, the first time. Bang-bang control overshoots. Three things to try, in order: a slower speed, a slightly smaller turn number (the gyro keeps reading after the motors stop), and a short `Commands.waitSeconds` between pieces so each one starts from a standstill. Change one thing per run.
