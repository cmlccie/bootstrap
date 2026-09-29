# Units and Tests

Three small Java topics that show up the moment sensors do: converting units, comparing decimals, and testing code that talks to hardware.

## 📐 Equations in code

The conversion from counts to inches is an equation with names instead of magic numbers:

```java title="src/main/java/frc/robot/subsystems/RomiDrivetrain.java"
double inchesPerCount =
    (Math.PI * DriveConstants.kWheelDiameterInch) / DriveConstants.kCountsPerRevolution;
```

Order of operations is the same as math class: parentheses first, then `*` and `/` left to right. `Math.PI` is a constant Java provides.

WPILib wants meters. Do not multiply by 0.0254 by hand; there is a named function for it:

```java
import edu.wpi.first.math.util.Units;

Units.inchesToMeters(getLeftDistanceInch())
```

Keep the subsystem in inches (it matches the template and the Romi's size) and convert at the one line where WPILib needs meters.

## 🔬 Decimals are not exact

`double` values are stored in binary and most decimals do not fit exactly. `1440 * (Math.PI * 2.75591 / 1440)` comes out a hair away from `Math.PI * 2.75591`. So tests never ask "is it exactly equal?" They ask "is it within a tolerance?":

```java
static final double DELTA = 1e-6;

assertEquals(expected, actual, DELTA);   // passes if |expected - actual| <= DELTA
```

Always use the three-argument form for `double`s.

## 🧩 Objects made of objects

The odometry code composes WPILib objects:

```java
Rotation2d.fromDegrees(45.0)                        // a rotation, built by a static method
new DifferentialDriveOdometry(getRotation(), 0.0, 0.0)  // built from a rotation and two distances
m_odometry.getPoseMeters()                          // returns a Pose2d: x, y, and a Rotation2d
m_field.setRobotPose(pose)                          // hands the pose to the field drawing
```

You do not need to know what is inside `Pose2d`. You need to know what it is called, how to get one, and where to hand it. That is what reading a class's methods tells you.

## 🧪 Testing code that needs hardware

`RslLogic` and `DriveInput` had no hardware, so their tests were plain. `RomiDrivetrain` creates motors and encoders. In a Codespace those do not exist, so WPILib **simulates** them, and the test gets a handle to set what the fake sensor reports.

Open `src/test/java/frc/robot/subsystems/RomiDrivetrainTest.java` and match each part:

| Code | Meaning |
| ---- | ------- |
| `@BeforeEach void setUp()` | Runs before every test. Gets a clean start each time |
| `HAL.initialize(500, 0)` | Starts WPILib's hardware layer in simulation mode |
| `new RomiDrivetrain()` | Creates the real subsystem. It makes simulated encoders |
| `EncoderSim.createForChannel(4)` | A handle to the fake encoder on DIO 4, so the test can set its count |
| `@AfterEach void tearDown()` | Runs after every test |
| `m_drivetrain.close()` | Frees the simulated channels so the next test can create them again |

`close()` is why `RomiDrivetrain` says `implements AutoCloseable`. It promises to have a `close()` method that cleans up what it created. Without it, the second test would fail with "channel already allocated."

The tests themselves follow one pattern: set the fake sensor, call the real method, compare with a tolerance.

```java
m_leftEncoderSim.setCount(1440);
assertEquals(Math.PI * kWheelDiameterInch, m_drivetrain.getLeftDistanceInch(), DELTA);
```

## ✅ Check yourself

Why does the test create `EncoderSim` *after* `new RomiDrivetrain()` and not before?
