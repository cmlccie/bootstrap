# Session 4 Reference

## 🎮 Xbox controller map

| Control | `CommandXboxController` | Axis or button | Value |
| ------- | ----------------------- | -------------- | ----- |
| Left stick X | `getLeftX()` | axis 0 | -1 left to 1 right |
| Left stick Y | `getLeftY()` | axis 1 | **-1 forward** to 1 back |
| Right stick X | `getRightX()` | axis 4 | -1 left to 1 right |
| Right stick Y | `getRightY()` | axis 5 | -1 forward to 1 back |
| Left trigger | `getLeftTriggerAxis()` | axis 2 | 0 to 1 |
| Right trigger | `getRightTriggerAxis()` | axis 3 | 0 to 1 |
| A, B, X, Y | `a()`, `b()`, `x()`, `y()` | 1, 2, 3, 4 | Trigger |
| Bumpers | `leftBumper()`, `rightBumper()` | 5, 6 | Trigger |
| Back, Start | `back()`, `start()` | 7, 8 | Trigger |

## 🔘 Trigger methods

| Method | Runs the command |
| ------ | ---------------- |
| `onTrue(cmd)` | Once, when the button is pressed |
| `whileTrue(cmd)` | While held; stops on release |
| `toggleOnTrue(cmd)` | Press to start, press again to stop |
| `onFalse(cmd)` | Once, when released |

## 🧰 Small commands without a class

| Factory | Meaning |
| ------- | ------- |
| `subsystem.runOnce(() -> ...)` | Do this once |
| `subsystem.run(() -> ...)` | Do this every loop until interrupted |
| `subsystem.startEnd(() -> start, () -> end)` | Do the first at start, the second when it stops |
| `Commands.print("text")` | Print a line, then finish |

## 🖥️ Sim GUI

| Panel | Use |
| ----- | --- |
| Robot State | Pick the mode. This is your Driver Station |
| System Joysticks | Drag a controller or Keyboard 0 to a slot in Joysticks |
| PWM Outputs | Motor speeds by channel |
| DIO | Digital pins: 3 is the yellow LED, 1 the green LED |
| Encoders | Session 5: type in a distance to fake wheel travel |
| NetworkTables | Everything published with SmartDashboard |

Keyboard 0 defaults: ++w++ / ++s++ axis 1, ++a++ / ++d++ axis 0, ++z++ ++x++ ++c++ ++v++ buttons 1-4.

## ⌨️ Commands

```bash
./gradlew test                       # in the Codespace
git fetch origin && git checkout yourname/session-4   # on the laptop
./gradlew simulateJava               # on the laptop: opens the Sim GUI
./gradlew simulateJava -Pheadless    # on the laptop, no GUI
```
