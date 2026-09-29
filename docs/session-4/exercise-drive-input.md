# Exercise: Drive Input

Fill in the three methods in `DriveInput` until `DriveInputTest` passes. This is pure math, so it happens in your Codespace.

Before you start, do steps 0-2 of [The Routine](../session-2/routine.md): refresh `main`, then branch `yourname/session-4`.

## 1. Turn the tests on

Open `src/test/java/frc/robot/DriveInputTest.java`. Read the five tests. Each one is a sentence about how the sticks should behave. Then delete the `@Disabled(...)` line and the `import org.junit.jupiter.api.Disabled;` line. Save.

```bash
./gradlew test
```

You will see: `BUILD FAILED` with four failing tests. The stubs return `0.0` for everything, so only `smallStickWobbleIsIgnored` passes by accident.

## 2. Deadband

Open `src/main/java/frc/robot/DriveInput.java`. Replace the body of `applyDeadband`:

```java title="src/main/java/frc/robot/DriveInput.java"
  public static double applyDeadband(double rawAxis) {
    if (Math.abs(rawAxis) < DriveConstants.kDeadband) {
      return 0.0;
    }
    return rawAxis;
  }
```

Run `./gradlew test`. You will see: `valuesPastTheDeadbandPassThrough` now passes. Three failures left.

## 3. Forward

Pushing forward reads `-1.0`. Flip it, after cleaning it up:

```java
  public static double forwardSpeed(double rawAxis) {
    return -applyDeadband(rawAxis);
  }
```

Run `./gradlew test`. You will see: one failure left, `pushingRightTurnsClockwise`.

## 4. Rotation

`arcadeDrive` treats counterclockwise as positive, and pushing the stick right is positive. So right must become negative, the same flip:

```java
  public static double rotationSpeed(double rawAxis) {
    return -applyDeadband(rawAxis);
  }
```

Run `./gradlew test`. You will see: `BUILD SUCCESSFUL`.

## 5. Commit

Stage and commit now, before part 2: `Implement stick deadband and sign handling`. Small commits.

## ✅ Done when

- [ ] All five `DriveInputTest` tests pass.
- [ ] You can say why `forwardSpeed(0.05)` is `0.0` and not `-0.05`.
- [ ] Committed on `yourname/session-4`.
