# Robot, Controller, and Simulator

The numbers, pins, buttons, and names you need to take input from the controller (or the simulator) and send output to the robot. Everything here is also in `Constants.java` or the session references; this page puts it in one place.

## 🤖 The Romi

| Fact | Value | In code |
| ---- | ----- | ------- |
| Wheel diameter | 70 mm = 2.75591 in | `DriveConstants.kWheelDiameterInch` |
| Wheel circumference | 8.66 in | `Math.PI * kWheelDiameterInch` |
| Encoder counts per wheel turn | 1440 | `DriveConstants.kCountsPerRevolution` |
| Inches per count | 0.00601 | computed in `RomiDrivetrain`'s constructor |
| Distance between wheels (track width) | about 5.55 in = 141 mm | not yet a constant; the challenges may want one |
| Robot footprint | about 6.5 in square, 165 mm | |
| Top speed | about 0.5 m/s | |
| Program runs on | Your laptop, in simulation mode, over Wi-Fi | `build.gradle` sets `HALSIMWS_HOST` |
| Address | `10.0.0.2` on its own Wi-Fi network (`WPILibPi-...`) | |
| Web page | `http://10.0.0.2` | |

### Channels on the control board

| Hardware | Channel | In code |
| -------- | ------- | ------- |
| Left motor | PWM 0 | `DriveConstants.kLeftMotorChannel`, `new Spark(0)` |
| Right motor | PWM 1 | `DriveConstants.kRightMotorChannel`. Inverted in the constructor |
| Left encoder | DIO 4 and 5 | `kLeftEncoderChannelA`, `kLeftEncoderChannelB` |
| Right encoder | DIO 6 and 7 | `kRightEncoderChannelA`, `kRightEncoderChannelB` |
| Gyro | Built in | `new RomiGyro()`, `getAngleZ()` in degrees |
| Accelerometer | Built in | `new BuiltInAccelerometer()`, not used in the bootcamp |

### Onboard LEDs and buttons

| Pin | Can be | Set by | `OnBoardIO` method |
| --- | ------ | ------ | ------------------ |
| DIO 0 | Button A | Always a button | `getButtonAPressed()` |
| DIO 1 | Button B **or** green LED | First `ChannelMode` in `new OnBoardIO(...)` | `getButtonBPressed()` or `setGreenLed(on)` |
| DIO 2 | Button C **or** red LED | Second `ChannelMode` | `getButtonCPressed()` or `setRedLed(on)` |
| DIO 3 | Yellow LED | Always an LED | `setYellowLed(on)` |

`ChannelMode.INPUT` makes a shared pin a button; `ChannelMode.OUTPUT` makes it an LED. `main` uses `OUTPUT, INPUT`: green LED and button C. In the Sim GUI's **DIO** panel, an LED that is on reads high.

### External pins (EXT0 to EXT4)

Five three-pin headers for extra hardware such as the arm's servos. Each can be digital, analog, or PWM, chosen on the Romi's web page, which then shows the WPILib channel number.

| Pin | Default | WPILib channel |
| --- | ------- | -------------- |
| EXT0 | Digital | DIO 8 |
| EXT1 | Analog | Analog 0 |
| EXT2 | Analog | Analog 1 |
| EXT3 | PWM | PWM 2 |
| EXT4 | PWM | PWM 3 |

The arm's three servos go on PWM channels; see [Arm Hardware](../capstones/arm/arm-hardware.md).

## 🧭 Directions and units

| Thing | Convention |
| ----- | ---------- |
| Forward | Positive `arcadeDrive` speed. Positive encoder distance |
| Turning | **Counterclockwise is positive**, seen from above: `arcadeDrive` rotation, gyro angle, `Rotation2d`, `TurnDegrees` |
| Xbox stick forward | Reads **negative**. `DriveInput.forwardSpeed` flips it |
| Xbox stick right | Reads positive, which would be counterclockwise. `DriveInput.rotationSpeed` flips it |
| Encoders in this code | Inches (`setDistancePerPulse` in the constructor) |
| Odometry and `Field2d` | Meters, radians inside, degrees at the edges. Convert with `Units.inchesToMeters` |
| Field origin | Where the robot was when the program started, facing +x, until something resets it |
| Gyro sign | `DriveConstants.kGyroReversed`: set `true` if the field drawing turns the wrong way |
| Servo position | 0.0 to 1.0 of the servo's travel. Which end is "up" depends on the horn |

## 🎮 Xbox controller

| Control | `CommandXboxController` | Raw | Value |
| ------- | ----------------------- | --- | ----- |
| Left stick X | `getLeftX()` | axis 0 | -1 left to 1 right |
| Left stick Y | `getLeftY()` | axis 1 | **-1 forward** to 1 back |
| Left trigger | `getLeftTriggerAxis()`, `leftTrigger()` | axis 2 | 0 to 1; the trigger fires past 0.5 |
| Right trigger | `getRightTriggerAxis()`, `rightTrigger()` | axis 3 | 0 to 1 |
| Right stick X | `getRightX()` | axis 4 | -1 left to 1 right |
| Right stick Y | `getRightY()` | axis 5 | -1 forward to 1 back |
| A, B, X, Y | `a()`, `b()`, `x()`, `y()` | buttons 1, 2, 3, 4 | `Trigger` |
| Left bumper, right bumper | `leftBumper()`, `rightBumper()` | 5, 6 | `Trigger` |
| Back, Start | `back()`, `start()` | 7, 8 | `Trigger` |
| Stick clicks | `leftStick()`, `rightStick()` | 9, 10 | `Trigger` |
| D-pad | `povUp()`, `povRight()`, `povDown()`, `povLeft()` | POV 0 / 90 / 180 / 270 | `Trigger` |

The controller plugs into USB port 0: `OperatorConstants.kDriverControllerPort`. In the Sim GUI it must be dragged onto **Joystick[0]**.

### Trigger methods

| Method | Runs the command |
| ------ | ---------------- |
| `onTrue(cmd)` | Once, when pressed |
| `whileTrue(cmd)` | While held; stops on release |
| `toggleOnTrue(cmd)` | Press to start, press again to stop |
| `onFalse(cmd)` | Once, when released |
| `new Trigger(booleanSupplier)` | Any boolean, such as a Romi button, becomes a trigger |

### What this project binds

| Control | Does | Since |
| ------- | ---- | ----- |
| Left stick Y, right stick X | Arcade drive (default command) | Session 4 |
| Right bumper (hold) | Half speed | Session 4 |
| A (hold) | Green LED on | Session 4 |
| Romi button A | Prints a message | Session 3 stretch |
| Y | Turn around | Session 4 challenge |
| Start | Reset odometry to the origin | Session 5 challenge |
| D-pad, X, B | Arm lift, tilt, gripper | Capstone 2 |

## ⌨️ Keyboard 0 in the Sim GUI

When no controller is plugged in, drag **Keyboard 0** onto **Joystick[0]**.

| Keys | Acts as |
| ---- | ------- |
| ++w++ / ++s++ | Axis 1 (left stick Y): ++w++ is forward (negative) |
| ++a++ / ++d++ | Axis 0 (left stick X) |
| ++z++ ++x++ ++c++ ++v++ | Buttons 1 to 4: A, B, X, Y |

The right stick is not mapped. To steer from the keyboard, temporarily read `getLeftX()` instead of `getRightX()` in `RobotContainer`. The D-pad is not mapped either.

## 🖥️ Sim GUI

The **Robot Simulation** window from `./gradlew simulateJava` on a laptop. Missing panels are under the top menus (**Hardware**, **NetworkTables**).

| Panel | Shows | Use it to |
| ----- | ----- | --------- |
| **Robot State** | Disabled / Autonomous / Teleoperated / Test | Be the Driver Station |
| **Timing** | Loop time, uptime | See the 20 ms loop |
| **System Joysticks** | Controllers the laptop can see, plus Keyboard 0 | Drag one onto a slot |
| **Joysticks** | The slots the robot reads, with live axis and button values | Check the controller is in slot 0 |
| **PWM Outputs** | Channel 0 and 1: motor speeds -1 to 1. Channels 2+: servos, 0 to 1 | Watch the drivetrain and arm |
| **DIO** | Digital pins. 1 = green LED, 2 = red LED or button C, 3 = yellow LED | Watch the RSL blink |
| **Encoders** | `Encoder[4,5]` (left), `Encoder[6,7]` (right): count and distance | Type a distance to fake wheel travel |
| **Other Devices → Gyro:RomiGyro** | `angle_z`, `rate_z` | Type an angle to fake a turn |
| **NetworkTables** | Everything published: **SmartDashboard** values, **Field**, **Auto** | Read telemetry, pick an auto with **selected** |

Faking a sensor while a command runs is how you step through an autonomous routine without a robot; see [Run It](../capstones/autonomous/run-it.md).

## 📡 NetworkTables keys this project publishes

| Key | Type | Published by | Since |
| --- | ---- | ------------ | ----- |
| `SmartDashboard/Drive/forward`, `Drive/rotation` | number | `ArcadeDriveCommand.execute()` | Session 4 |
| `SmartDashboard/Drive/leftInch`, `Drive/rightInch`, `Drive/headingDeg` | number | `RomiDrivetrain.periodic()` | Session 5 |
| `SmartDashboard/Field` (with `Robot` = x, y, degrees) | Field2d | `RomiDrivetrain` | Session 5 |
| `Drive/Pose` | Pose2d struct | `RomiDrivetrain.periodic()` | Session 5 challenge |
| `SmartDashboard/Auto` (with `options`, `selected`) | chooser | `RobotContainer` | Capstone 1 |
| `SmartDashboard/Arm/lift`, `Arm/tilt`, `Arm/gripper` | number | `Arm.periodic()` | Capstone 2 |

Text log lines from `DataLogManager.log` go to the console and to `logs/*.wpilog`, which also records every NetworkTables value. AdvantageScope reads both.

## 📏 Sensor and odometry API

| Need | Code |
| ---- | ---- |
| Wheel distance, inches | `m_leftEncoder.getDistance()` |
| Raw counts | `m_leftEncoder.get()` |
| Zero the encoders | `m_leftEncoder.reset()` |
| Heading, degrees | `m_gyro.getAngleZ()` |
| Turn rate, degrees per second | `m_gyro.getRateZ()` |
| Zero the gyro | `m_gyro.reset()` |
| Inches to meters | `Units.inchesToMeters(x)` |
| Degrees to a rotation | `Rotation2d.fromDegrees(x)` |
| Update odometry | `m_odometry.update(rotation, leftMeters, rightMeters)` |
| Current pose | `m_odometry.getPoseMeters()`, then `.getX()`, `.getY()`, `.getRotation()` |
| Reset odometry | `m_odometry.resetPosition(rotation, leftMeters, rightMeters, pose)` |
| Draw it on a field | `m_field.setRobotPose(pose)` after `SmartDashboard.putData("Field", m_field)` |
| Publish a number | `SmartDashboard.putNumber("Name", value)` |
| Publish a pose | `NetworkTableInstance.getDefault().getStructTopic("Drive/Pose", Pose2d.struct).publish()`, then `.set(pose)` |
| Fake an encoder in a test | `EncoderSim.createForChannel(4).setCount(1440)`, after the drivetrain exists |

## 🌐 Networks and addresses

| What | Address |
| ---- | ------- |
| Romi | `10.0.0.2` on its own Wi-Fi. Laptop gets an address automatically |
| Romi web page | `http://10.0.0.2` |
| Robot network pattern | `10.TE.AM.x`, where a team number like 1234 gives `10.12.34.x` |
| Robot radio | `10.TE.AM.1` |
| roboRIO | `10.TE.AM.2`, or `roboRIO-TEAM-FRC.local` by name |
| Driver Station laptop | `10.TE.AM.5` or automatic |
| Simulator and AdvantageScope on the same laptop | `localhost`; **Connect to Simulator** |

Three ways a laptop reaches a competition robot: USB to the roboRIO, Ethernet to the radio, or the radio's Wi-Fi. At competition the field owns the radio and the laptop is wired to the field.

## 📁 Where files go

| What | Where |
| ---- | ----- |
| Robot program | `src/main/java/frc/robot/` |
| Subsystems, commands | `src/main/java/frc/robot/subsystems/`, `.../commands/` |
| Every number | `src/main/java/frc/robot/Constants.java` |
| Tests | `src/test/java/frc/robot/`, same package as what they test |
| Log files | `logs/` (ignored by git); on a roboRIO, a USB stick or `/home/lvuser/logs` |
| Test report | `build/reports/tests/test/index.html` |
| Team roster | `team/yourname.md` |
| Vendor libraries | `vendordeps/*.json` |
