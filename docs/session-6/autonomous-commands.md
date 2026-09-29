# Autonomous Commands

`ArcadeDriveCommand` never finishes; a button interrupts it. An autonomous command is the opposite: it decides for itself when it is done, by watching a sensor. Two of them cover most of what a Romi can do.

Before you start, do steps 0-2 of [The Routine](../session-2/routine.md): refresh `main`, then branch `yourname/session-6`.

## 🔁 The command lifecycle, complete

| Method | The scheduler calls it |
| ------ | ---------------------- |
| `initialize()` | Once, when the command starts |
| `execute()` | Every 20 ms while it runs |
| `isFinished()` | Every 20 ms, after `execute()`. Return `true` to stop |
| `end(boolean interrupted)` | Once, when it stops. `interrupted` is `true` if something else stopped it |

## 1. `DriveDistance`

Create `src/main/java/frc/robot/commands/DriveDistance.java`:

```java title="src/main/java/frc/robot/commands/DriveDistance.java"
package frc.robot.commands;

import edu.wpi.first.wpilibj2.command.Command;
import frc.robot.subsystems.RomiDrivetrain;

/** Drives straight for a set distance, then stops. Finishes on its own. */
public class DriveDistance extends Command {
  private final RomiDrivetrain m_drivetrain;
  private final double m_speed;
  private final double m_distanceInch;

  // Where the wheels were when the command started.
  private double m_startInch;

  public DriveDistance(double speed, double distanceInch, RomiDrivetrain drivetrain) {
    m_speed = speed;
    m_distanceInch = distanceInch;
    m_drivetrain = drivetrain;
    addRequirements(drivetrain);
  }

  /** Runs once when the command starts: remember where we began. */
  @Override
  public void initialize() {
    m_startInch = m_drivetrain.getAverageDistanceInch();
  }

  /** Runs every 20 ms: keep driving. */
  @Override
  public void execute() {
    m_drivetrain.arcadeDrive(m_speed, 0.0);
  }

  /** Runs once when the command stops: never leave the motors running. */
  @Override
  public void end(boolean interrupted) {
    m_drivetrain.arcadeDrive(0.0, 0.0);
  }

  /** Done when the wheels have traveled far enough since we started. */
  @Override
  public boolean isFinished() {
    double traveledInch = m_drivetrain.getAverageDistanceInch() - m_startInch;
    return Math.abs(traveledInch) >= m_distanceInch;
  }
}
```

Two things to notice:

- `m_startInch` is not `final`. It is set in `initialize()`, not the constructor, so the command works correctly every time it runs, not only the first time.
- `isFinished()` compares distance traveled **since the start** instead of resetting the encoders. Resetting would confuse odometry, which trusts the encoders to keep counting.

## 2. `TurnDegrees`

Create `src/main/java/frc/robot/commands/TurnDegrees.java`:

```java title="src/main/java/frc/robot/commands/TurnDegrees.java"
package frc.robot.commands;

import edu.wpi.first.wpilibj2.command.Command;
import frc.robot.subsystems.RomiDrivetrain;

/** Turns in place by a number of degrees, using the gyro. Finishes on its own. */
public class TurnDegrees extends Command {
  private final RomiDrivetrain m_drivetrain;
  private final double m_speed;
  private final double m_degrees;

  // The heading when the command started.
  private double m_startDegrees;

  public TurnDegrees(double speed, double degrees, RomiDrivetrain drivetrain) {
    m_speed = speed;
    m_degrees = degrees;
    m_drivetrain = drivetrain;
    addRequirements(drivetrain);
  }

  @Override
  public void initialize() {
    m_startDegrees = m_drivetrain.getGyroAngleDegrees();
  }

  @Override
  public void execute() {
    double rotation = m_speed;
    if (m_degrees < 0) {
      rotation = -m_speed; // turn the other way
    }
    m_drivetrain.arcadeDrive(0.0, rotation);
  }

  @Override
  public void end(boolean interrupted) {
    m_drivetrain.arcadeDrive(0.0, 0.0);
  }

  /** Done when the heading has changed by enough, in either direction. */
  @Override
  public boolean isFinished() {
    double turnedDegrees = m_drivetrain.getGyroAngleDegrees() - m_startDegrees;
    return Math.abs(turnedDegrees) >= Math.abs(m_degrees);
  }
}
```

Positive degrees turn left (counterclockwise), because `arcadeDrive` treats positive rotation as counterclockwise. `Math.abs` on both sides makes the finish check work for either direction.

## 3. Build

```bash
./gradlew build
```

You will see: `BUILD SUCCESSFUL`. Nothing uses the commands yet. Commit: `Add DriveDistance and TurnDegrees commands`.

!!! info "Why these overshoot"

    Both commands drive at full `m_speed` until the sensor crosses the target, then stop. The Romi coasts a little past. That is bang-bang control. A PID controller would slow down as it approached. WPILib's `PIDCommand` and `ProfiledPIDCommand` are the next step after the bootcamp.

## ✅ Done when

- [ ] Both command files compile.
- [ ] You can say what `initialize()`, `execute()`, `isFinished()`, and `end()` each do in `DriveDistance`.
