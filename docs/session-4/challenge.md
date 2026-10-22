# Challenge: Turn Around

!!! abstract "Optional. No steps. Your call."

    This uses what Session 4 taught: a command class with `execute()`, `end()`, and `isFinished()`, a constant in `Constants.java`, and a button binding. Work on it on your `yourname/session-4` branch, test it in the simulator on a laptop. Open a hint if you are stuck; the hints point, they do not solve.

## 🎯 The goal

Press one button on the controller and the Romi **spins around 180 degrees and stops, by itself**. The driver does not hold anything and does not touch the sticks. When it is done, the sticks drive again.

There is no gyro on the robot yet. That comes in Session 5. So "180 degrees" has to be "turn at *this* speed for *this* long", and both of those numbers are guesses until you try them on the real Romi. Numbers that need tuning on hardware do not get typed into a command. They get a name in `Constants.java`.

## ✅ Done when

- [ ] A new command class turns the robot and finishes on its own.
- [ ] One controller button starts it. `ArcadeDriveCommand` takes over again when it is done.
- [ ] In the simulator: press the button, **PWM Outputs** 0 and 1 split (one positive, one negative) for a moment, then both return to 0 without you doing anything. The sticks work again afterwards.
- [ ] The speed and the duration are constants in `Constants.java`, with names that say what they are.
- [ ] `./gradlew build` passes and the branch is pushed.
- [ ] Street cred: in Session 5, you tune the duration on the real Romi until it turns a clean 180, and commit the number.

## 🧰 What you already know that helps

- `ArcadeDriveCommand` is a complete command class. A command that *finishes* is the same shape with a different answer in `isFinished()`.
- The [Session 4 Reference](reference.md) has the command lifecycle table, including the one method `ArcadeDriveCommand` did not need, and a table of `Trigger` methods. One of them runs a command once per press.
- `DriveConstants` already holds `kDeadband` and `kSlowModeFactor`. Add to it the same way.
- `arcadeDrive(forward, rotation)`: zero forward and a nonzero rotation is a spin in place.

??? tip "Hint 1: how does a command know how long it has been running?"

    Two ways, both in the reference tables. WPILib has a `Timer` class with a method that answers "has this much time passed?". Or count loops the way the heartbeat did: 50 loops is one second. Either way the count has to start over every time the command starts, and there is a lifecycle method for exactly that.

??? tip "Hint 2: which Trigger method?"

    `whileTrue` stops the command when you let go of the button. You want the command to run to the end even if the press was a tap. Look at the table again.

??? tip "Hint 3: the drivetrain needs to hear from you every loop"

    If a command tells the drivetrain a speed once and then goes quiet, the motors stop after a tenth of a second and the terminal prints a motor safety warning. Keep calling `arcadeDrive` in `execute()`, every loop, until the command ends.

??? tip "Hint 4: the no-class route"

    The small-commands table in the reference lists factories that build a command from a lambda, and one method that stops any command after a number of seconds. A whole turn-around can be one statement in `RobotContainer`. It is a fair solution. Writing the class teaches more.

??? tip "Hint 5: testing in the simulator without a controller"

    Keyboard 0 maps keys ++z++ ++x++ ++c++ ++v++ to buttons 1 to 4. Pick a button in that range if you are driving from the keyboard.
