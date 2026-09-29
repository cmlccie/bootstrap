# Exercise: Arcade Drive

Write the command that drives the Romi from the sticks, make it the drivetrain's default, and bind two buttons.

## 1. Create the command file

In the Explorer, right-click `src/main/java/frc/robot/commands` and choose **New File...**. If the `commands` folder does not exist, right-click `frc/robot`, choose **New Folder...**, name it `commands`, then create the file inside it. Name the file `ArcadeDriveCommand.java` and type:

```java title="src/main/java/frc/robot/commands/ArcadeDriveCommand.java"
package frc.robot.commands;

import edu.wpi.first.wpilibj.smartdashboard.SmartDashboard;
import edu.wpi.first.wpilibj2.command.Command;
import frc.robot.DriveInput;
import frc.robot.subsystems.RomiDrivetrain;
import java.util.function.DoubleSupplier;

/** Drives the Romi from two controller sticks for as long as the command is scheduled. */
public class ArcadeDriveCommand extends Command {
  private final RomiDrivetrain m_drivetrain;
  private final DoubleSupplier m_forwardAxis;
  private final DoubleSupplier m_rotationAxis;

  public ArcadeDriveCommand(
      RomiDrivetrain drivetrain, DoubleSupplier forwardAxis, DoubleSupplier rotationAxis) {
    m_drivetrain = drivetrain;
    m_forwardAxis = forwardAxis;
    m_rotationAxis = rotationAxis;
    // Only one command may use the drivetrain at a time.
    addRequirements(drivetrain);
  }

  /** Runs every 20 ms while scheduled: read the sticks, drive, and report what we did. */
  @Override
  public void execute() {
    double forward = DriveInput.forwardSpeed(m_forwardAxis.getAsDouble());
    double rotation = DriveInput.rotationSpeed(m_rotationAxis.getAsDouble());
    m_drivetrain.arcadeDrive(forward, rotation);

    SmartDashboard.putNumber("Drive/forward", forward);
    SmartDashboard.putNumber("Drive/rotation", rotation);
  }

  /** Runs once when the command stops, for any reason. Never leave the motors running. */
  @Override
  public void end(boolean interrupted) {
    m_drivetrain.arcadeDrive(0.0, 0.0);
  }

  /** Driving never finishes on its own. Another command interrupts it. */
  @Override
  public boolean isFinished() {
    return false;
  }
}
```

Read it once more before moving on. Three attributes, one constructor that fills them, three methods the scheduler calls.

Run `./gradlew build`. You will see: `BUILD SUCCESSFUL`. The command exists but nothing uses it yet.

## 2. Create the controller

Open `src/main/java/frc/robot/RobotContainer.java`. Add these imports with the others:

```java
import edu.wpi.first.wpilibj2.command.button.CommandXboxController;
import frc.robot.Constants.DriveConstants;
import frc.robot.Constants.OperatorConstants;
import frc.robot.commands.ArcadeDriveCommand;
```

Add the controller as an attribute, below the two subsystems:

```java
  // The driver's controller, plugged into USB port 0 on the Driver Station.
  private final CommandXboxController m_controller =
      new CommandXboxController(OperatorConstants.kDriverControllerPort);
```

## 3. Make driving the default

In `configureButtonBindings()`, add the default command first:

```java
    // Default: drive from the sticks whenever nothing else needs the drivetrain.
    m_drivetrain.setDefaultCommand(
        new ArcadeDriveCommand(m_drivetrain, m_controller::getLeftY, m_controller::getRightX));
```

`m_controller::getLeftY` hands the command a method to call every loop. No parentheses: you are passing the method, not calling it.

## 4. Bind two buttons

Below the default command:

```java
    // Hold the right bumper for half speed. While held, this command replaces the default one.
    m_controller
        .rightBumper()
        .whileTrue(
            new ArcadeDriveCommand(
                m_drivetrain,
                () -> m_controller.getLeftY() * DriveConstants.kSlowModeFactor,
                () -> m_controller.getRightX() * DriveConstants.kSlowModeFactor));

    // Hold A on the controller to light the green LED on the Romi.
    m_controller
        .a()
        .whileTrue(
            m_signalLight.startEnd(
                () -> m_signalLight.setGreen(true), () -> m_signalLight.setGreen(false)));
```

- `whileTrue` runs the command while the button is held and stops it on release. When the slow-mode command stops, the scheduler restarts the default command by itself.
- `startEnd` builds a small command from two lambdas: one to run at the start, one at the end. No new class needed for two one-liners.

Run `./gradlew build`. You will see: `BUILD SUCCESSFUL`.

## 5. Commit and push

Commit: `Add arcade drive from the controller with slow mode and LED button`. **Publish Branch**. Then head to a laptop: [Simulate It](simulate.md).

## ✅ Done when

- [ ] `./gradlew build` passes.
- [ ] `RobotContainer` has a controller, a default command, and two bindings.
- [ ] Your branch is pushed.
