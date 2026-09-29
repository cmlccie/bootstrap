# Simulate It

Time to see the robot respond. The WPILib simulator runs your real robot program on the laptop and gives you a window to act as the Driver Station.

## 1. Get your branch onto the laptop

The laptop has the repository cloned. Open it in VS Code (the WPILib one, with the WPILib icon). In the terminal:

```bash
git fetch origin
git checkout yourname/session-4
```

You will see: `Switched to a new branch 'yourname/session-4'` and your files.

!!! tip "Where to make changes"

    Write and commit in your Codespace, where git knows who you are. Use the laptop to run. If you find something to tweak while simulating, note it and change it in your Codespace afterwards.

## 2. Plug in the controller

Plug the Xbox controller into the laptop's USB port before starting the simulator.

## 3. Start the simulator

Press ++f5++, or run in the terminal:

```bash
./gradlew simulateJava
```

You will see: after 20 to 40 seconds, a window titled **Robot Simulation** with several small panels. The terminal shows the same startup lines as in your Codespace, but this time without `No extensions found`.

## 4. Tour the window

| Panel | What it shows |
| ----- | ------------- |
| **Robot State** | Radio buttons: Disabled, Autonomous, Teleoperated, Test. This is your Driver Station |
| **System Joysticks** | Every controller the laptop can see, plus **Keyboard 0** |
| **Joysticks** | The slots the robot program reads. Slot 0 is `kDriverControllerPort` |
| **PWM Outputs** | Channels 0 and 1: the motor speeds your code is sending |
| **DIO** | Digital pins. DIO 3 is the yellow LED |
| **NetworkTables** | Every published value, including `SmartDashboard/Drive/forward` |

## 5. Connect the controller

Drag your controller from **System Joysticks** onto slot **Joystick[0]** in the **Joysticks** panel.

You will see: the axis and button readouts in the Joysticks panel move when you move the sticks.

!!! info "No controller? Use the keyboard"

    Drag **Keyboard 0** onto slot 0 instead. By default, ++w++ / ++s++ move axis 1 (left stick Y) and ++a++ / ++d++ move axis 0 (left stick X). The right stick is not mapped, so rotation will not work with the keyboard as written. For keyboard driving, temporarily change `m_controller::getRightX` to `m_controller::getLeftX` in `RobotContainer`, then ++a++ / ++d++ steer.

## 6. Enable and drive

1. In **Robot State**, click **Teleoperated**.
2. Push the left stick forward.

You will see: **PWM Outputs** channels 0 and 1 both go positive. Push the right stick right: they split, one up and one down. Let go: both return to 0.

Watch **DIO 3** while enabled: it flips between high and low twice a second. That is your Session 3 code blinking the RSL. Click **Disabled**: it goes solid.

## 7. Try the buttons

- Hold the **right bumper** and push forward: PWM values top out at half of before.
- Hold **A**: **DIO 1** goes high. Release: low. That is the green LED.

## 8. Watch the dashboard values

Open the **NetworkTables** panel (from the top menu if it is not visible) and expand **SmartDashboard**. `Drive/forward` and `Drive/rotation` update live as you move the sticks. That is the same table a real dashboard and AdvantageScope read from.

## 9. Stop

Click **Disabled**, then close the window or press ++ctrl+c++ in the terminal.

## ✅ Done when

- [ ] Your branch ran in the simulator and the PWM outputs followed the sticks.
- [ ] You saw the RSL blink on DIO 3 while enabled and go solid while disabled.
- [ ] You found `Drive/forward` in the NetworkTables panel.
