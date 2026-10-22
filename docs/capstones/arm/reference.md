# Capstone 2 Reference

## 🦾 Servo API

```java
import edu.wpi.first.wpilibj.Servo;
import edu.wpi.first.math.MathUtil;

Servo servo = new Servo(channel);                 // PWM channel from the Romi web page
servo.set(position);                              // 0.0 to 1.0
servo.get();                                      // the last position set
servo.setAngle(degrees);                          // 0 to 180, same thing in degrees
servo.close();                                    // free the channel (tests)
MathUtil.clamp(value, 0.0, 1.0);                  // keep a number inside a range
servo.setBoundsMicroseconds(2400, 0, 0, 0, 500);  // wider pulse range, only if the gripper needs it
```

## 🔌 Romi external pins

| EXT pin | Default | Can be |
| ------- | ------- | ------ |
| EXT0 | DIO 8 | Digital or PWM |
| EXT1 | Analog 0 | Digital, analog, or PWM |
| EXT2 | Analog 1 | Digital, analog, or PWM |
| EXT3 | PWM 2 | Digital, analog, or PWM |
| EXT4 | PWM 3 | Digital, analog, or PWM |

Set on the Romi's web page at `http://10.0.0.2`, **Romi** tab. The page shows the WPILib channel number for each pin after you save.

## 🎮 Controller triggers you have not used yet

| `CommandXboxController` | Button |
| ----------------------- | ------ |
| `povUp()`, `povDown()`, `povLeft()`, `povRight()` | D-pad directions |
| `x()`, `b()` | X and B |
| `leftTrigger()`, `rightTrigger()` | Triggers pulled past halfway |
| `getLeftTriggerAxis()`, `getRightTriggerAxis()` | Trigger position, 0.0 to 1.0 |
| `start()`, `back()` | Start and Back |

## 🧰 Building commands without a class

| Code | Runs |
| ---- | ---- |
| `m_arm.runOnce(() -> m_arm.setLift(0.8))` | Once, then finishes at once |
| `m_arm.run(() -> m_arm.nudgeLift(0.01))` | Every loop until interrupted |
| `m_arm.startEnd(() -> ..., () -> ...)` | First at start, second when it stops |
| `Commands.waitSeconds(1.0)` | Nothing, for one second, then finishes |
| `Commands.sequence(a, b, c)` | One after another |
| `Commands.parallel(a, b)` | At the same time |

A subsystem can also hand out its own commands. A method on `Arm` like `public Command openGripper() { return runOnce(...); }` lets `RobotContainer` write `m_arm.openGripper()`.

## 🧪 Testing with simulated servos

```java
@BeforeEach
void setUp() {
  assertTrue(HAL.initialize(500, 0));
  m_arm = new Arm();
}

@AfterEach
void tearDown() {
  m_arm.close();           // Arm implements AutoCloseable and closes its servos
}

assertEquals(0.75, m_arm.getTilt(), 1e-3);   // positions are stored in whole microseconds
```

## 🖥️ Sim GUI

| Panel | Shows |
| ----- | ----- |
| PWM Outputs | Channels 2 to 4 (or whatever you chose): the servo positions as a fraction |
| NetworkTables → SmartDashboard | Whatever you publish, such as `Arm/lift` |
