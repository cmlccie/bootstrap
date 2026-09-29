# Methods and Lambdas

Session 3 covered methods that return a value. Today's methods also take values in, and today you hand a method to another object to call later. That second idea has a name: a lambda.

## 📥 Parameters and return values

Open `src/main/java/frc/robot/DriveInput.java`. Read one signature:

```java
public static double forwardSpeed(double rawAxis)
```

Left to right: anyone can call it, no object needed, it gives back a `double`, its name is `forwardSpeed`, and it takes one `double` called `rawAxis`. Inside the method, `rawAxis` is a variable holding whatever the caller passed in.

```java
double forward = DriveInput.forwardSpeed(-0.6);   // rawAxis is -0.6 inside the call
```

A method can call another method and return the result. That is how you build big behavior from small pieces:

```java
public static double forwardSpeed(double rawAxis) {
  return -applyDeadband(rawAxis);
}
```

## 🔢 Math you need today

| Need | Code |
| ---- | ---- |
| Flip the sign | `-x` |
| Size of a number, ignoring sign | `Math.abs(x)` |
| Scale by a factor | `x * 0.5` |
| Ignore tiny values | `if (Math.abs(x) < 0.1) { return 0.0; }` |

Controller sticks never sit at exactly 0.0. A **deadband** treats anything within 0.1 of center as zero so the robot does not creep.

## 🏷️ Constants

The number 0.1 should not be typed into `DriveInput`. It lives in `Constants.java` with a name:

```java title="src/main/java/frc/robot/Constants.java"
public static final class DriveConstants {
  public static final double kDeadband = 0.1;
  public static final double kSlowModeFactor = 0.5;
}
```

`static final` means one shared value that never changes. The `k` prefix is a WPILib habit that marks a constant. Use it as `DriveConstants.kDeadband`. When the driver wants a bigger deadband, you change one line and every use follows.

## 🏗️ A class you write from scratch

`ArcadeDriveCommand` is the first class you build yourself. Its shape:

```java
public class ArcadeDriveCommand extends Command {
  private final RomiDrivetrain m_drivetrain;      // attributes, filled in by the constructor
  private final DoubleSupplier m_forwardAxis;

  public ArcadeDriveCommand(RomiDrivetrain drivetrain, DoubleSupplier forwardAxis) {
    m_drivetrain = drivetrain;                   // parameter -> attribute
    m_forwardAxis = forwardAxis;
    addRequirements(drivetrain);
  }

  @Override
  public void execute() { ... }                  // the scheduler calls these
}
```

- `extends Command` means "start from WPILib's `Command` and fill in the parts that differ." `Command` already knows how to be scheduled, required, and interrupted. You write `execute()`, `end()`, and `isFinished()`.
- The constructor's job is to take what the command needs and store it in attributes so `execute()` can use it later.
- `@Override` marks each method that replaces one from `Command`.

## λ Lambdas: handing over a method

The command needs to read the stick every loop. It cannot read it once in the constructor; that would freeze the first value forever. So `RobotContainer` hands the command *the method to call*, not the value:

```java
new ArcadeDriveCommand(m_drivetrain, m_controller::getLeftY, m_controller::getRightX)
```

`m_controller::getLeftY` is a **method reference**: "here is a method, call it whenever you need the value." The command stores it as a `DoubleSupplier` and calls `.getAsDouble()` in `execute()`.

When you need a little math too, write a **lambda**, a tiny method with no name:

```java
() -> m_controller.getLeftY() * DriveConstants.kSlowModeFactor
```

Read `() ->` as "when called with nothing, give back". The parentheses are the (empty) parameter list, the arrow separates it from the body.

| You write | Meaning |
| --------- | ------- |
| `m_controller::getLeftY` | Call this existing method |
| `() -> m_controller.getLeftY() * 0.5` | Call this one-line method I just made up |
| `() -> m_signalLight.setGreen(true)` | Same, but it returns nothing |

Both are ways to pass **behavior** to another object. `Trigger.onTrue`, `whileTrue`, and `startEnd` all take them.

## ✅ Check yourself

Why does `() -> m_controller.getLeftY() * 0.5` still read the stick fresh every loop, when `m_controller.getLeftY() * 0.5` (no arrow) would not?
