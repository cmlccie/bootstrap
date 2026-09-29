# Java Cheat Sheet

This page grows one section per session. Bookmark it.

## Session 2: reading and writing statements

```java
package frc.robot;                          // which folder this file is in
import edu.wpi.first.wpilibj.TimedRobot;    // bring in one class by name

public class Robot extends TimedRobot {     // a class; the file is Robot.java
  private int m_loopCount = 0;              // attribute: lives as long as the object

  @Override                                 // replaces a method TimedRobot already has
  public void robotPeriodic() {             // method definition, returns nothing (void)
    double seconds = m_loopCount * 0.02;    // local variable: lives until the method ends
    CommandScheduler.getInstance().run();   // method call
  }
}
```

| Type | Holds | Example |
| ---- | ----- | ------- |
| `int` | Whole numbers | `int count = 3;` |
| `double` | Decimals | `double speed = 0.5;` |
| `boolean` | `true` / `false` | `boolean on = true;` |
| `String` | Text | `String name = "Romi";` |

| Operator | Meaning | Example | Result |
| -------- | ------- | ------- | ------ |
| `+ - * /` | Math | `3 * 0.02` | `0.06` |
| `/` on two `int`s | Whole-number division | `7 / 2` | `3` |
| `%` | Remainder | `130 % 50` | `30` |
| `++` | Add one | `count++;` | |
| `+=` | Add and store | `count += 5;` | |
| `+` with text | Glue text and numbers | `"Loop " + 50` | `"Loop 50"` |
| `=` | Store | `count = 0;` | |
| `==` | Are they equal? | `count == 50` | `true` or `false` |

```java
if (m_loopCount % 50 == 0) {   // run the block only when the condition is true
  DataLogManager.log("One second");
}
```

Every statement ends with `;`. Every `{` has a `}`. Comments start with `//`.

## Session 3: classes, objects, and decisions

```java
public class SignalLight extends SubsystemBase {        // one class per file: SignalLight.java
  private final OnBoardIO m_onboardIO = new OnBoardIO(...); // attribute, set once (final)
  private boolean m_yellowOn = false;                   // attribute, changes over time

  public boolean isYellowOn() {                         // method that returns a boolean
    return m_yellowOn;
  }

  public void setGreen(boolean on) {                    // method with a parameter, returns nothing
    m_onboardIO.setGreenLed(on);
  }
}
```

```java
SignalLight light = new SignalLight();  // build an object from the class
light.isYellowOn();                     // call a method on an object
RslLogic.shouldBeOn(true, 0.25);        // call a static method on a class (no object)
```

| Word | Meaning |
| ---- | ------- |
| `private` | Only this class can use it |
| `public` | Anyone can use it |
| `final` | Assigned once, never changes |
| `static` | Belongs to the class, not to an object |
| Constructor | `public ClassName() { ... }`, runs once at `new` |

| Operator | Meaning |
| -------- | ------- |
| `<` `<=` `>` `>=` | Compare numbers |
| `==` `!=` | Equal, not equal |
| `!a` | Not |
| `a && b` | Both |
| `a \|\| b` | Either |

```java
if (!enabled) {
  return true;          // return ends the method right here
}
double t = timeSeconds % 1.0;
return t < 0.5;         // a comparison is already a boolean
```

## Session 4: parameters, lambdas, constants

```java
public static double forwardSpeed(double rawAxis) {   // takes a double, returns a double
  return -applyDeadband(rawAxis);                     // call another method, flip the sign
}

Math.abs(x)          // size without sign
x * 0.5              // scale
DriveConstants.kDeadband   // a named constant: public static final double kDeadband = 0.1;
```

```java
public class ArcadeDriveCommand extends Command {     // build on WPILib's Command
  private final DoubleSupplier m_forwardAxis;         // attribute filled by the constructor

  public ArcadeDriveCommand(RomiDrivetrain drivetrain, DoubleSupplier forwardAxis) {
    m_forwardAxis = forwardAxis;                      // parameter -> attribute
    addRequirements(drivetrain);
  }

  @Override
  public void execute() {
    double raw = m_forwardAxis.getAsDouble();         // ask the supplier for a fresh value
  }
}
```

| You write | It means |
| --------- | -------- |
| `m_controller::getLeftY` | Pass this method, call it later |
| `() -> m_controller.getLeftY() * 0.5` | A tiny unnamed method (lambda) |
| `() -> m_signalLight.setGreen(true)` | A lambda that returns nothing |
| `m_controller.a().whileTrue(cmd)` | Run `cmd` while A is held |

## Session 5: units, decimals, and test setup

```java
double inchesPerCount = (Math.PI * kWheelDiameterInch) / kCountsPerRevolution;  // parentheses first
Units.inchesToMeters(inches)                // named conversion, no magic 0.0254
Rotation2d.fromDegrees(90.0)                // build an object with a static method
m_odometry.getPoseMeters()                  // returns a Pose2d (x, y, rotation)

assertEquals(expected, actual, 1e-6);       // decimals: always give a tolerance
```

```java
class RomiDrivetrainTest {
  @BeforeEach void setUp() { ... }          // before every test
  @AfterEach void tearDown() { m_drivetrain.close(); }   // after every test: clean up
}

public class RomiDrivetrain extends SubsystemBase implements AutoCloseable {
  @Override public void close() { ... }     // the promise: I can clean myself up
}
```

```java
double degrees = m_gyro.getAngleZ();
if (DriveConstants.kGyroReversed) {         // a boolean constant as a switch
  degrees = -degrees;
}
```
