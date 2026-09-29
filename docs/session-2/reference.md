# Session 2 Reference

## 🔁 Robot modes

| Mode | Picked by | Motors |
| ---- | --------- | ------ |
| Disabled | Startup, or the Driver Station | Off, always |
| Autonomous | Driver Station or field, first 20 s | On, no driver |
| Teleoperated | Driver Station or field | On, driver in control |
| Test | Driver Station only | On, for checking hardware |

## 🧩 Robot.java methods

| Method | Runs |
| ------ | ---- |
| `Robot()` | Once at startup. One-time setup |
| `robotPeriodic()` | Every 20 ms, every mode. Runs the scheduler |
| `disabledInit()` | Once when Disabled begins |
| `disabledPeriodic()` | Every 20 ms while Disabled |
| `autonomousInit()` | Once when Autonomous begins. Schedules the auto command |
| `autonomousPeriodic()` | Every 20 ms while Autonomous |
| `teleopInit()` | Once when Teleop begins. Cancels the auto command |
| `teleopPeriodic()` | Every 20 ms while Teleop |
| `testInit()` | Once when Test begins |
| `testPeriodic()` | Every 20 ms while Test |

## 🖨️ Logging

```java
import edu.wpi.first.wpilibj.DataLogManager;

DataLogManager.start();               // once, in the constructor
DataLogManager.log("Entered Teleop"); // console + logs/*.wpilog
System.out.println("quick check");    // console only
```

| Where it runs | Console | Log file |
| ------------- | ------- | -------- |
| Codespace or laptop | The terminal | `logs/` in the project |
| roboRIO | Driver Station console, RioLog | USB stick, else `/home/lvuser/logs` |

## ⌨️ Commands

```bash
./gradlew build          # compile + run tests
./gradlew test           # run tests only
./gradlew simulateJava   # run the robot program (Ctrl+C stops it)
git checkout main && git pull        # refresh main
git switch -c yourname/session-2     # new branch
git log --oneline -5                 # last five commits
```

## 📖 Expected `simulateJava` output in a Codespace

```text
********** Robot program starting **********
HAL Extensions: No extensions found
********** Robot program startup complete **********
Robot program starting
Entered Disabled
Heartbeat: loop 50 at 1.0 s
```

`HAL Extensions: No extensions found` is correct in a Codespace. It means no simulation window and no Romi connection were loaded.
