# Exercise: Encoder Test

`RomiDrivetrainTest` checks the left encoder. Add the right one, and a test for the average of both.

Before you start, do steps 0-2 of [The Routine](../session-2/routine.md): refresh `main`, then branch `yourname/session-5`.

## 1. Run what is there

```bash
./gradlew test
```

You will see: `BUILD SUCCESSFUL`. `RomiDrivetrainTest` already runs two tests. Open `src/test/java/frc/robot/subsystems/RomiDrivetrainTest.java` and read them against the table in [Units and Tests](units-and-tests.md).

## 2. Add the average-distance method

The tests will need a method the drivetrain does not have yet. Open `src/main/java/frc/robot/subsystems/RomiDrivetrain.java` and add it below `getRightDistanceInch()`:

```java title="src/main/java/frc/robot/subsystems/RomiDrivetrain.java"
  /** Average of both wheels: how far the robot has driven straight ahead. */
  public double getAverageDistanceInch() {
    return (getLeftDistanceInch() + getRightDistanceInch()) / 2.0;
  }
```

## 3. Add a handle for the right encoder

In the test class, add a second `EncoderSim` attribute and create it in `setUp()`, right after the left one:

```java title="src/test/java/frc/robot/subsystems/RomiDrivetrainTest.java"
  EncoderSim m_leftEncoderSim;
  EncoderSim m_rightEncoderSim;
```

```java
    m_leftEncoderSim = EncoderSim.createForChannel(DriveConstants.kLeftEncoderChannelA);
    m_rightEncoderSim = EncoderSim.createForChannel(DriveConstants.kRightEncoderChannelA);
```

## 4. Write two tests

Add a constant for the wheel circumference near `DELTA`, then two test methods at the bottom of the class:

```java
  static final double CIRCUMFERENCE_INCH = Math.PI * DriveConstants.kWheelDiameterInch;
```

```java
  @Test
  void halfATurnOnTheRightWheelIsHalfACircumference() {
    m_rightEncoderSim.setCount(720);

    assertEquals(CIRCUMFERENCE_INCH / 2.0, m_drivetrain.getRightDistanceInch(), DELTA);
  }

  @Test
  void averageDistanceIsTheMeanOfBothWheels() {
    m_leftEncoderSim.setCount(1440);
    m_rightEncoderSim.setCount(0);

    assertEquals(CIRCUMFERENCE_INCH / 2.0, m_drivetrain.getAverageDistanceInch(), DELTA);
  }
```

Each test: set the fake sensors, call the real method, compare with a tolerance.

```bash
./gradlew test
```

You will see: `BUILD SUCCESSFUL` and four tests in `RomiDrivetrainTest` in the report.

## 5. Break it on purpose

Change `720` to `1440` in the first new test and run again. You will see: `expected: <4.329...> but was: <8.658...>`. Reading that line is the skill. Put it back.

## 6. Commit

`Test the right encoder and average distance`.

## ✅ Done when

- [ ] Four `RomiDrivetrainTest` tests pass.
- [ ] You changed a number, saw the failure, and understood the `expected` / `but was` line.
- [ ] Committed on `yourname/session-5`.
