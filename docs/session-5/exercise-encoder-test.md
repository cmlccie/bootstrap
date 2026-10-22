# Exercise: Encoder Test

`RomiDrivetrainTest` checks the left encoder. Add the right one, and a test for the average of both.

Before you start, do steps 0-2 of [The Routine](../session-2/routine.md): refresh `main`, then branch `yourname/session-5`.

!!! note "What is new on `main`"

    `DriveInput`, `ArcadeDriveCommand`, and the controller bindings from Session 4 are on `main`. Your branch today drives the Romi because of them.

## 1. Run what is there

**Run** the tests:

```bash
./gradlew test
```

You will see: `BUILD SUCCESSFUL`. `RomiDrivetrainTest` already runs two tests. Open `src/test/java/frc/robot/subsystems/RomiDrivetrainTest.java` and read them against the table in [Units and Tests](units-and-tests.md).

## 2. Add the average-distance method

The tests will need a method the drivetrain does not have yet. Open `src/main/java/frc/robot/subsystems/RomiDrivetrain.java`. **Add** this method directly below `getRightDistanceInch()`:

```java title="src/main/java/frc/robot/subsystems/RomiDrivetrain.java"
  /** Average of both wheels: how far the robot has driven straight ahead. */
  public double getAverageDistanceInch() {
    return (getLeftDistanceInch() + getRightDistanceInch()) / 2.0;
  }
```

## 3. Add a handle for the right encoder

Open `src/test/java/frc/robot/subsystems/RomiDrivetrainTest.java`. **Add** a second `EncoderSim` attribute directly below `m_leftEncoderSim`, so the two read:

```java title="src/test/java/frc/robot/subsystems/RomiDrivetrainTest.java"
  EncoderSim m_leftEncoderSim;
  EncoderSim m_rightEncoderSim;
```

In `setUp()`, **add** one line directly below the one that creates `m_leftEncoderSim`, so the pair reads:

```java
    m_leftEncoderSim = EncoderSim.createForChannel(DriveConstants.kLeftEncoderChannelA);
    m_rightEncoderSim = EncoderSim.createForChannel(DriveConstants.kRightEncoderChannelA);
```

## 4. Write two tests

**Add** a constant for the wheel circumference directly below the `DELTA` line:

```java
  static final double CIRCUMFERENCE_INCH = Math.PI * DriveConstants.kWheelDiameterInch;
```

**Add** two test methods at the bottom of the class, after `resetEncodersGoesBackToZero()` and before the final `}`:

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

Each test: set the fake sensors, call the real method, compare with a tolerance. Session 2's test still has `double circumferenceInch = ...` inside it; that is fine, or **replace** it with the new constant.

**Run** the tests:

```bash
./gradlew test
```

You will see: `BUILD SUCCESSFUL` and four tests in `RomiDrivetrainTest` in the report.

## 5. Break it on purpose

**Change** `720` to `1440` in the first new test and run again. You will see: `expected: <4.329...> but was: <8.658...>`. Reading that line is the skill. Put it back.

## 6. Commit

Stage and commit: `Test the right encoder and average distance`.

## ✅ Done when

- [ ] Four `RomiDrivetrainTest` tests pass.
- [ ] You changed a number, saw the failure, and understood the `expected` / `but was` line.
- [ ] Committed on `yourname/session-5`.
