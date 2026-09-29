# Exercise: The RSL

Make `RslLogic.shouldBeOn` follow the robot signal light rule until every test in `RslLogicTest` passes.

Before you start, do steps 0-2 of [The Routine](../session-2/routine.md): refresh `main`, then branch `yourname/session-3`.

## 1. Run the tests as they are

```bash
./gradlew test
```

You will see: `BUILD SUCCESSFUL`. Nothing failed, because `RslLogicTest` is skipped. Open `build/reports/tests/test/index.html` from the Explorer (right-click, **Open Preview**, or download it) and you will see it listed as ignored.

## 2. Turn the tests on

Open `src/test/java/frc/robot/RslLogicTest.java`. Delete the line that starts with `@Disabled`. Delete the matching `import org.junit.jupiter.api.Disabled;` line too. Save.

Run the tests again:

```bash
./gradlew test
```

You will see: `BUILD FAILED`, and above it, two failing tests:

```text
RslLogicTest > disabledRobotIsSolidOn() FAILED
    org.opentest4j.AssertionFailedError: expected: <true> but was: <false>
RslLogicTest > enabledRobotIsOnDuringFirstHalfSecond() FAILED
    org.opentest4j.AssertionFailedError: expected: <true> but was: <false>
```

Red is the correct color right now. The stub returns `false` for everything, so the "should be off" test passes by accident and the two "should be on" tests fail. Your job is to turn all three green.

## 3. Handle the disabled case

Open `src/main/java/frc/robot/RslLogic.java`. Replace the `TODO` line and the `return false;` under it with the first row of the truth table:

```java title="src/main/java/frc/robot/RslLogic.java"
  public static boolean shouldBeOn(boolean enabled, double timeSeconds) {
    if (!enabled) {
      return true; // solid on while disabled
    }
    return false;
  }
```

Run `./gradlew test`.

You will see: one failure left, `enabledRobotIsOnDuringFirstHalfSecond`. The disabled test passes.

## 4. Handle the blink

Below the `if`, work out where we are in the one-second cycle, then return whether that is in the first half:

```java
    // How far are we into the current blink cycle?
    double secondsIntoCycle = timeSeconds % SignalLightConstants.kBlinkPeriodSeconds;
    // On for the first half of the cycle, off for the second half.
    return secondsIntoCycle < SignalLightConstants.kBlinkPeriodSeconds / 2;
```

Replace the `return false;` with those lines. `SignalLightConstants` is already imported at the top of the file and `kBlinkPeriodSeconds` is `1.0`.

Run `./gradlew test`.

You will see: `BUILD SUCCESSFUL`. Open the test report again: three tests, all green.

## 5. Trace it by hand

Before you commit, check one case yourself. `shouldBeOn(true, 10.75)`:

1. `enabled` is `true`, so `!enabled` is `false`. The `if` is skipped.
2. `10.75 % 1.0` is `0.75`.
3. `0.75 < 0.5` is `false`. The method returns `false`. The light is off.

That matches the test named `enabledRobotIsOffDuringSecondHalfSecond`.

## 6. Commit and push

Steps 5-6 of [The Routine](../session-2/routine.md). Message: `Implement the robot signal light rule`.

## 🎉 Stretch: a button on the Romi

Make pressing button A on the Romi's board print a message. Open `RobotContainer.java` and add an import and one line in `configureButtonBindings()`:

```java
import edu.wpi.first.wpilibj2.command.button.Trigger;
```

```java
  private void configureButtonBindings() {
    new Trigger(m_signalLight::isButtonAPressed).onTrue(Commands.print("Romi button A pressed"));
  }
```

A `Trigger` watches a boolean and runs a command when it turns `true`. `m_signalLight::isButtonAPressed` hands the trigger a method to call every loop. Nobody can press the button until Session 5, but `./gradlew build` proves it compiles, and it previews how Session 4 wires up a controller.

## ✅ Done when

- [ ] `./gradlew test` prints `BUILD SUCCESSFUL` with `RslLogicTest` enabled.
- [ ] You can explain, out loud, why `shouldBeOn(true, 0.5)` is `false`.
- [ ] Your branch is pushed to GitHub.
- [ ] Your Codespace is stopped.
