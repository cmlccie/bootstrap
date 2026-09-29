# Sequences and the Chooser

A routine is commands run one after another. A chooser lets the driver pick which routine runs before the match starts. Both go in `RobotContainer`.

## 🔗 Sequences

`Commands.sequence(a, b, c)` builds one command that runs `a` until it finishes, then `b`, then `c`. It requires whatever its pieces require, so it plays by the same rules as any command.

```java
Commands.sequence(
    new DriveDistance(0.5, 12.0, m_drivetrain),
    new TurnDegrees(0.5, 90.0, m_drivetrain),
    new DriveDistance(0.5, 12.0, m_drivetrain))
```

Drive a foot, turn left, drive a foot. An L.

There are siblings for other shapes: `Commands.parallel` runs pieces at the same time, `Commands.waitSeconds(1.0)` pauses, `Commands.print("...")` logs. They all nest.

## 🎛️ The chooser

At a competition, which routine to run depends on where the robot starts. Nobody wants to change code on the field. `SendableChooser` puts a dropdown on the dashboard.

## 1. Imports

In `RobotContainer.java`, add:

```java
import edu.wpi.first.wpilibj.smartdashboard.SendableChooser;
import edu.wpi.first.wpilibj.smartdashboard.SmartDashboard;
import frc.robot.commands.DriveDistance;
import frc.robot.commands.TurnDegrees;
```

## 2. The chooser attribute

Below the controller:

```java
  // The list of autonomous routines the driver picks from on the dashboard.
  private final SendableChooser<Command> m_autoChooser = new SendableChooser<>();
```

`SendableChooser<Command>` is a chooser whose options are commands. The `<...>` says what kind of thing it holds.

## 3. Fill it

Call a new method from the constructor:

```java
  public RobotContainer() {
    configureButtonBindings();
    configureAutoChooser();
  }
```

And write it:

```java
  /** Every autonomous routine goes in the chooser. The first one is the default. */
  private void configureAutoChooser() {
    m_autoChooser.setDefaultOption("Do nothing", Commands.none());
    m_autoChooser.addOption("Drive 12 inches", new DriveDistance(0.5, 12.0, m_drivetrain));
    m_autoChooser.addOption(
        "L shape",
        Commands.sequence(
            new DriveDistance(0.5, 12.0, m_drivetrain),
            new TurnDegrees(0.5, 90.0, m_drivetrain),
            new DriveDistance(0.5, 12.0, m_drivetrain)));
    SmartDashboard.putData("Auto", m_autoChooser);
  }
```

The default is "Do nothing" on purpose. A robot that does nothing is safe. A robot that runs the wrong routine into a wall is not.

## 4. Hand over the selection

Replace `getAutonomousCommand()`:

```java
  /** The routine the driver selected on the dashboard. Robot.autonomousInit() schedules it. */
  public Command getAutonomousCommand() {
    return m_autoChooser.getSelected();
  }
```

## 🔁 How it runs

Open `Robot.java` and read it one more time. Session 2's tour ends here.

- `autonomousInit()` calls `m_robotContainer.getAutonomousCommand()` and schedules whatever came back. That is the chooser's selection.
- `teleopInit()` cancels it, so a routine still running when teleop starts stops immediately.
- The scheduler in `robotPeriodic()` does the rest: `execute()` and `isFinished()` on the running piece, then the next piece.

## 5. Build and push

```bash
./gradlew build
```

You will see: `BUILD SUCCESSFUL`. Commit: `Add autonomous routines and a dashboard chooser`. **Publish Branch**.

## 🎉 Your own routine

Add a fourth option. A square is four `DriveDistance` and four `TurnDegrees`. A there-and-back is drive, turn 180, drive. Name it after your pair. This is the routine you run on the Romi.

## ✅ Done when

- [ ] The chooser has at least three options and the default is "Do nothing".
- [ ] `getAutonomousCommand()` returns the chooser's selection.
- [ ] Your branch is pushed.
