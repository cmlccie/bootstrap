# Logging: Seeing What the Robot Is Thinking

A robot has no screen. Logging is how the code tells you what it is doing. You will use it every time something does not work.

## 🖨️ Two ways to log

```java
System.out.println("Entered Teleop");
```

Plain Java. Prints one line to the console: your terminal in simulation, the Driver Station console on a real robot. Fine for quick checks.

```java
DataLogManager.log("Entered Teleop");
```

WPILib's version. Prints the same line to the console **and** writes it, with a timestamp, into a log file on the robot. Use this one for robot code. You get the file for free, and the file is what you open after a match to find out what happened.

It needs one line of setup, once, in the constructor:

```java
DataLogManager.start();
```

And an import at the top of the file:

```java
import edu.wpi.first.wpilibj.DataLogManager;
```

## 📁 Where the log goes

| Where the program runs | Console shows up in | Log file lands in |
| ---------------------- | ------------------- | ----------------- |
| Your Codespace (`simulateJava`) | The VS Code terminal | `logs/` in the repository |
| A laptop (`simulateJava`) | The terminal and the Sim GUI | `logs/` next to the project |
| A roboRIO | Driver Station console and VS Code's RioLog | A USB stick if one is plugged in, otherwise `/home/lvuser/logs` |

The files end in `.wpilog`. Session 5 opens one in AdvantageScope. The `logs/` folder is already in `.gitignore`, so it never gets committed.

## 🧠 What to log

- **Mode changes.** Every `xxxInit()` gets one line. When you read a log, you can see the match's timeline.
- **Decisions.** "Auto routine selected: Drive forward". "Target seen, turning left".
- **Rare events.** Sensor disconnected. Command timed out.

## 🚫 What not to log

Do not log inside a periodic method without a guard. 50 lines a second fills the console and the log file with noise and can slow the robot down. Log once per second, or only when something changes:

```java
if (m_loopCount % 50 == 0) {
  DataLogManager.log("Heartbeat " + (m_loopCount / 50));
}
```

Numbers you want to plot, like a motor speed or a distance, do not belong in text logs at all. They go to NetworkTables. That is Session 4.
