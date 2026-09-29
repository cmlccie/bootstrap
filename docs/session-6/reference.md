# Session 6 Reference

## 🔁 Command lifecycle

| Method | When | Typical use |
| ------ | ---- | ----------- |
| constructor | Once, at `new` | Store parameters, `addRequirements` |
| `initialize()` | Each time the command starts | Record the starting sensor value |
| `execute()` | Every 20 ms while running | Drive |
| `isFinished()` | Every 20 ms | Compare the sensor to the target |
| `end(interrupted)` | Once, when it stops | Stop the motors |

## 🧩 Composition

| Factory | Runs |
| ------- | ---- |
| `Commands.sequence(a, b, c)` | One after another |
| `Commands.parallel(a, b)` | At the same time, until all finish |
| `Commands.race(a, b)` | At the same time, until one finishes |
| `Commands.waitSeconds(1.0)` | Nothing, for one second |
| `Commands.print("text")` | Logs a line, finishes at once |
| `Commands.none()` | Nothing, finishes at once |
| `a.withTimeout(3.0)` | `a`, but give up after three seconds |

## 🎛️ Chooser

```java
private final SendableChooser<Command> m_autoChooser = new SendableChooser<>();

m_autoChooser.setDefaultOption("Do nothing", Commands.none());
m_autoChooser.addOption("Name on the dashboard", command);
SmartDashboard.putData("Auto", m_autoChooser);

m_autoChooser.getSelected()   // what the driver picked
```

The chooser shows up in NetworkTables as `SmartDashboard/Auto`. Set `selected` in the Sim GUI, or pick from the dropdown in a dashboard.

## 🖥️ Faking sensors in the Sim GUI

| Sensor | Panel | Field |
| ------ | ----- | ----- |
| Left encoder | Encoders → `Encoder[4,5]` | Distance (inches) or Count |
| Right encoder | Encoders → `Encoder[6,7]` | Distance (inches) or Count |
| Gyro heading | Other Devices → `Gyro:RomiGyro` | `angle_z` (degrees) |

## 📐 Romi numbers

| | Value |
| --- | ----- |
| Wheel diameter | 70 mm, 2.75591 in |
| Wheel circumference | 8.66 in |
| Encoder counts per wheel turn | 1440 |
| Distance between wheels | about 5.55 in |
