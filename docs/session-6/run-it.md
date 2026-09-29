# Run It

Simulator first. The Romi second. Same order as always.

## 1. Simulator: pick a routine

On a laptop, check out your branch and run `./gradlew simulateJava`.

1. Open the **NetworkTables** panel and expand **SmartDashboard → Auto**. Set **selected** to `L shape`.
2. In **Robot State**, click **Autonomous**.

You will see: **PWM Outputs** 0 and 1 go to about 0.5. `DriveDistance` is running. It will run forever, because the simulated encoders never move.

## 2. Simulator: be the sensor

While it runs:

1. In **Encoders**, type `12` into the **Distance** of both `Encoder[4,5]` and `Encoder[6,7]`.

You will see: the PWM outputs change. One goes positive and one negative. `DriveDistance` finished and `TurnDegrees` started.

Next, in **Other Devices → Gyro:RomiGyro**, type `90` into `angle_z`.

You will see: both PWM outputs go to 0.5 again. The second `DriveDistance` is running.

Finally, type `24` into both encoder distances.

You will see: both PWM outputs go to 0. The sequence finished. Click **Disabled**.

You stepped through an entire autonomous routine by hand, and you know exactly what each piece waited for.

## 3. The Romi

Join the Romi's Wi-Fi as in Session 5 and run `./gradlew simulateJava` again.

1. Put the Romi on the floor with a meter of space ahead and to its left.
2. Select **Drive 12 inches** in the chooser.
3. Click **Autonomous**.

You will see: the Romi drives about a foot and stops. It probably coasts a bit past. Measure it. That overshoot is the difference between a sensor check and real control.

Next, click **Disabled**, select **L shape**, and click **Autonomous**.

You will see: a foot forward, a left turn, a foot forward. If it turns right, the gyro sign is wrong: `kGyroReversed` from Session 5.

Finally, run your own routine.

## 4. Tune one number

Pick one: the speed, the distance, or the degrees. Change it in your Codespace, push, pull on the laptop, run again. That loop, code to Romi in under two minutes, is what the rest of the season looks like.

## 🎓 Where to go next

You can now read any command-based FRC robot's code and know where to look. To keep going:

- **Read the WPILib docs** at [docs.wpilib.org](https://docs.wpilib.org/en/stable/). Start with the command-based section. You have already used most of it.
- **Replace bang-bang with PID.** `PIDController` and `ProfiledPIDCommand` make `DriveDistance` stop where it should.
- **Look at last season's robot code** in the team's repositories. Find the subsystems. Find `RobotContainer`. It is the same shape.
- **Pull requests and code review** are next. A mentor will walk you through opening one on the branch you pushed today.

## ✅ Done when

- [ ] You stepped a routine through the simulator by faking sensors.
- [ ] A routine you chose from the dashboard ran on the Romi.
- [ ] You changed one number and ran it again.
