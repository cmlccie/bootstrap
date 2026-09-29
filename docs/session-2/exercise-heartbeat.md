# Exercise: The Heartbeat

Make the robot announce every mode change and print a heartbeat once per second. Then run the program in your Codespace and watch it happen.

Before you start, do steps 0-2 of [The Routine](routine.md): refresh `main`, then branch `yourname/session-2`.

## 1. Start the logger

Open `src/main/java/frc/robot/Robot.java`. Add the import with the others at the top:

```java
import edu.wpi.first.wpilibj.DataLogManager;
```

Then add two lines at the start of the constructor, before `m_robotContainer` is created:

```java title="src/main/java/frc/robot/Robot.java"
  public Robot() {
    // Start writing log messages to the console and to a .wpilog file.
    DataLogManager.start();
    DataLogManager.log("Robot program starting");

    m_robotContainer = new RobotContainer();
  }
```

## 2. Announce every mode

Add one log line to each `xxxInit()` method. `disabledInit()` is empty, so it becomes:

```java
  @Override
  public void disabledInit() {
    DataLogManager.log("Entered Disabled");
  }
```

Do the same for `autonomousInit()`, `teleopInit()`, and `testInit()`. Put the log line first, above the code that is already there.

## 3. Count the loops

The counter has to survive from one loop to the next, so it is an **attribute**, declared with the others near the top of the class:

```java
  private final RobotContainer m_robotContainer;

  // Counts every 20 ms loop since the program started.
  private int m_loopCount = 0;
```

## 4. Beat once per second

In `robotPeriodic()`, after the scheduler line, count the loop and log every fiftieth one:

```java
  @Override
  public void robotPeriodic() {
    CommandScheduler.getInstance().run();

    // 50 loops is one second, so log once per second, not 50 times.
    m_loopCount++;
    if (m_loopCount % 50 == 0) {
      double seconds = m_loopCount * 0.02;
      DataLogManager.log("Heartbeat: loop " + m_loopCount + " at " + seconds + " s");
    }
  }
```

Save with ++ctrl+s++.

## 5. Build it

In the terminal:

```bash
./gradlew build
```

You will see: Gradle compiles your code, runs the existing tests, and prints `BUILD SUCCESSFUL`. If it prints an error, it names the line. The usual suspects are a missing semicolon, a missing `}`, or a misspelled name.

## 6. Run it

```bash
./gradlew simulateJava
```

The first run takes 20 to 40 seconds to start. Gradle shows `85% EXECUTING` the whole time the program runs. That is normal.

You will see, in order:

```text
********** Robot program starting **********
HAL Extensions: No extensions found
...
********** Robot program startup complete **********
Robot program starting
Entered Disabled
Heartbeat: loop 50 at 1.0 s
Heartbeat: loop 100 at 2.0 s
Heartbeat: loop 150 at 3.0 s
```

A Codespace has no screen and no Driver Station, so the robot stays in Disabled mode. You see `disabledInit()` run once and `robotPeriodic()` beating every second. In Session 4 you run the same program on a laptop, switch modes yourself, and see the other three `Entered` lines.

Press ++ctrl+c++ to stop the program.

## 7. Find the log file

Look in the Explorer. A `logs` folder appeared with a file ending in `.wpilog`. That is the same output, saved with timestamps. Session 5 opens one in AdvantageScope. It is already ignored by git, so it will not end up in your commit.

## 8. Commit and push

Steps 4-6 of [The Routine](routine.md): `./gradlew test`, stage, commit with a message like `Log mode changes and a once-per-second heartbeat`, then **Publish Branch**.

## 🎉 Stretch

Change the heartbeat to log every two seconds. Then make it log the number of beats instead of the loop number. Both are one-line changes. What did you change, and why does `m_loopCount / 50` give the beat number?

## ✅ Done when

- [ ] `./gradlew build` prints `BUILD SUCCESSFUL`.
- [ ] `./gradlew simulateJava` prints `Entered Disabled` and a heartbeat every second.
- [ ] Your branch is pushed to GitHub.
- [ ] Your Codespace is stopped.
