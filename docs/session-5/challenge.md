# Challenge: See It Drive

!!! abstract "Optional. No steps. Your call."

    This uses what Session 5 taught: the odometry objects, NetworkTables, AdvantageScope, a subsystem method, a button binding, and a test with simulated hardware. It needs a laptop with the simulator or the Romi. Work on it on your `yourname/session-5` branch. Open a hint if you are stuck; the hints point, they do not solve.

## 🎯 The goal

The odometry exercise publishes a `Field2d`. Drag it onto AdvantageScope's field and the robot appears. Then drive the Romi, and the little robot on the screen barely seems to move. Something is off, and it is not the math.

Make it so that you can **put the Romi on the floor, press a button, drive a foot forward and turn, and watch the robot on AdvantageScope's field do exactly that**, on the **2D field** and on the **3D field**.

## ✅ Done when

- [ ] A button on the controller resets the robot to the origin of the field: encoders, gyro, and odometry all back to zero.
- [ ] The robot's pose is published to NetworkTables in a form AdvantageScope's **3D Field** tab accepts, not only the 2D one.
- [ ] On a laptop, with the Romi or with faked sensors in the simulator: you can see the robot drive a foot and turn on both field views, clearly.
- [ ] A test in `RomiDrivetrainTest` proves the reset: fake some wheel travel, update, reset, and the pose is back at the origin.
- [ ] `./gradlew build` passes and the branch is pushed.
- [ ] Street cred: you can explain why the field drawing looked wrong before you changed anything in the code.

## 🧰 What you already know that helps

- `RomiDrivetrain` already has `resetEncoders()` and `resetGyro()`. The [Session 5 Reference](reference.md) sensor API table lists what else the odometry object can do.
- `SmartDashboard.putNumber` publishes a number. `SmartDashboard.putData` published the field. The WPILib docs have a page on publishing **structs** like `Pose2d` to NetworkTables. Search for "NetworkTables struct publisher".
- `m_controller.start()` is a `Trigger` nobody has used yet. `subsystem.runOnce(...)` builds a one-shot command from a method.
- `RomiDrivetrainTest` already shows how to fake encoder counts. `periodic()` is a method like any other; a test can call it.
- The [Robot reference](../reference/robot.md) has the Romi's real size. The FRC field in AdvantageScope is about 16 by 8 meters.

??? tip "Hint 1: why it looks broken"

    Do the arithmetic. A foot is 0.3 meters. The field drawing is 16 meters across. How many pixels is a foot on your screen? The code was right the whole time. AdvantageScope's field views have settings for the robot's size and, on the 3D field, you can zoom and orbit. Look in the tab's options, and look for a smaller field.

??? tip "Hint 2: the 3D field wants a pose, not three numbers"

    `Field2d` publishes `Robot` as three loose numbers. AdvantageScope's 3D field wants a proper `Pose2d` or `Pose3d` object. WPILib can publish a `Pose2d` as a **struct** with a `StructPublisher`. It takes three lines: get a topic by name from `NetworkTableInstance`, publish it, and call `set(pose)` every loop. The `Pose2d` class has a field named `struct` you hand over when you ask for the topic. Remember to `close()` it with the rest.

??? tip "Hint 3: the reset"

    Three things remember where the robot is: the two encoders, the gyro, and the odometry object. Reset all three in one new method on the drivetrain, in that order, and the odometry object's reset method takes the fresh heading, the two fresh distances, and the pose you want. A `Pose2d` built with no arguments is the origin.

??? tip "Hint 4: the test"

    Set both encoders to one full turn, call `periodic()` so odometry updates, then check `getPose().getX()` against one circumference, in meters. Then call your reset and check it reads zero. `Units.inchesToMeters` is the conversion, and `DELTA` is the tolerance.
