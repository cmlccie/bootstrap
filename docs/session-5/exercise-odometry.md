# Exercise: Odometry

Give the drivetrain a gyro, let odometry track the robot's pose, draw it on a field, and publish the sensor numbers.

## 1. A constant for the gyro's direction

WPILib counts counterclockwise turns as positive. The Romi's gyro may count the other way. Rather than guess, make it a switch. In `Constants.java`, add to `DriveConstants`:

```java title="src/main/java/frc/robot/Constants.java"
    /**
     * WPILib counts counterclockwise turns as positive. If the robot on the field drawing turns
     * the opposite way from the real Romi, set this to true.
     */
    public static final boolean kGyroReversed = false;
```

You will find out which value is right on the Romi, later today.

## 2. New imports

At the top of `src/main/java/frc/robot/subsystems/RomiDrivetrain.java`, add:

```java
import edu.wpi.first.math.geometry.Pose2d;
import edu.wpi.first.math.geometry.Rotation2d;
import edu.wpi.first.math.kinematics.DifferentialDriveOdometry;
import edu.wpi.first.math.util.Units;
import edu.wpi.first.wpilibj.romi.RomiGyro;
import edu.wpi.first.wpilibj.smartdashboard.Field2d;
import edu.wpi.first.wpilibj.smartdashboard.SmartDashboard;
```

## 3. Three new attributes

Below `m_diffDrive`:

```java
  // The gyro on the Romi's control board measures how far the robot has turned.
  private final RomiGyro m_gyro = new RomiGyro();

  // Odometry adds up wheel travel and heading to estimate where the robot is.
  private final DifferentialDriveOdometry m_odometry =
      new DifferentialDriveOdometry(getRotation(), 0.0, 0.0);

  // A drawing of the field with the robot on it, published to the dashboard.
  private final Field2d m_field = new Field2d();
```

Order matters: `m_odometry` calls `getRotation()`, which uses `m_gyro`, so the gyro must be declared first.

## 4. Publish the field once

At the end of the constructor:

```java
    SmartDashboard.putData("Field", m_field);
```

## 5. Heading methods

Below `getAverageDistanceInch()`:

```java
  /** Heading in degrees, straight from the gyro. Increases as the robot turns. */
  public double getGyroAngleDegrees() {
    return m_gyro.getAngleZ();
  }

  public void resetGyro() {
    m_gyro.reset();
  }

  /** Heading as a WPILib rotation, counterclockwise positive. */
  public Rotation2d getRotation() {
    double degrees = m_gyro.getAngleZ();
    if (DriveConstants.kGyroReversed) {
      degrees = -degrees;
    }
    return Rotation2d.fromDegrees(degrees);
  }

  /** Where odometry thinks the robot is, in meters, relative to where it started. */
  public Pose2d getPose() {
    return m_odometry.getPoseMeters();
  }
```

## 6. Update every loop

Replace the empty `periodic()`:

```java
  @Override
  public void periodic() {
    // Feed odometry the latest heading and wheel distances (in meters, as WPILib expects).
    m_odometry.update(
        getRotation(),
        Units.inchesToMeters(getLeftDistanceInch()),
        Units.inchesToMeters(getRightDistanceInch()));
    m_field.setRobotPose(m_odometry.getPoseMeters());

    // Telemetry: numbers worth plotting go to NetworkTables, not the text log.
    SmartDashboard.putNumber("Drive/leftInch", getLeftDistanceInch());
    SmartDashboard.putNumber("Drive/rightInch", getRightDistanceInch());
    SmartDashboard.putNumber("Drive/headingDeg", getGyroAngleDegrees());
  }
```

## 7. Clean up in `close()`

Add two lines at the end of `close()` so tests can free the gyro and the field too:

```java
    m_gyro.close();
    m_field.close();
```

## 8. Build and test

```bash
./gradlew build
```

You will see: `BUILD SUCCESSFUL`, and the four drivetrain tests still pass. Commit: `Add gyro, odometry, and drive telemetry`. **Publish Branch**.

## 9. Be the sensor, in the simulator

On a laptop, check out your branch and run `./gradlew simulateJava` as in Session 4. The robot can stay **Disabled**: `periodic()` runs in every mode, so odometry updates anyway.

1. Find the **Encoders** panel. It lists `Encoder[4,5]` and `Encoder[6,7]`.
2. Type `10` into the **Distance** field of both.

You will see: in the **NetworkTables** panel, `SmartDashboard/Drive/leftInch` reads 10, and `SmartDashboard/Field/Robot` shows x near `0.254`, which is 10 inches in meters.

Next, find **Other Devices** and expand **Gyro:RomiGyro**. Type `90` into `angle_z`.

You will see: `Drive/headingDeg` reads 90 and the robot's rotation in `Field/Robot` changes.

You just tested odometry without a robot. [Logs and AdvantageScope](logs.md) draws it on a field.

## ✅ Done when

- [ ] `./gradlew build` passes with the gyro and odometry in place.
- [ ] Your branch is pushed.
- [ ] In the simulator, faking encoder distance moved `Field/Robot`.
