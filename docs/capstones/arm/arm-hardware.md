# Arm Hardware

Everything you need to know about the arm before you write a line. Confirm the pin numbers on your own Romi; the Web UI is the source of truth.

## 🦾 The kit

The [Pololu Robot Arm Kit for Romi](https://www.pololu.com/product/3550) mounts on the back half of the chassis, above the motors, and adds three servos:

| Joint | Servo does | Full range |
| ----- | ---------- | ---------- |
| **Lift** | Raises and lowers the whole arm | About 100 degrees of swing |
| **Tilt** | Pitches the wrist and gripper | About 180 degrees |
| **Gripper** | Opens and closes the paddles | Fully open to fully closed |

Things worth knowing from the [user's guide](https://www.pololu.com/docs/0J76):

- The servos run from 4.8 to 6 V. The lift and tilt servos can draw over an amp for a moment when they strain. A stalled servo gets hot. Never command a joint past where the mechanism stops.
- Lifting something tips the Romi forward. Pololu recommends a second ball caster at the front.
- The gripper servo wants a wider pulse range than a standard hobby servo (0.5 to 2.4 ms instead of 1 to 2 ms). If it does not open all the way at `0.0`, that is why; see the `Servo` notes below.
- Each servo has a fourth, green wire that reports the servo's internal position. The Romi does not read it. For us, a servo is write-only.

## 🔌 How it plugs in

The Romi control board has five external pins, **EXT0** to **EXT4**, each a three-pin servo-style header (ground, power, signal). Each one can be a digital pin, an analog input, or a PWM output, and the Romi's web page decides which.

| EXT pin | Default job | Default WPILib channel |
| ------- | ----------- | ---------------------- |
| EXT0 | Digital | DIO 8 |
| EXT1 | Analog in | Analog 0 |
| EXT2 | Analog in | Analog 1 |
| EXT3 | PWM | PWM 2 |
| EXT4 | PWM | PWM 3 |

Three servos need three PWM outputs and the default gives you two. A mentor reassigns one more pin to PWM on the Romi's web page, and the page then shows which WPILib PWM channel each pin became. **Those numbers go in `ArmConstants`.** Power on the EXT headers is off by default; a jumper ties it to the board's 5 V supply.

!!! info "Mentor checklist"

    - [ ] Arm assembled per the Pololu guide, servos centered before the horns went on.
    - [ ] Servo cables on three EXT pins, ground to ground.
    - [ ] On the Romi web page (`http://10.0.0.2`, **Romi** tab), set those pins to **PWM** and save. Note the channel numbers.
    - [ ] 5 V jumper installed for the EXT power rail.
    - [ ] Front ball caster added if the Romi nods forward.

## 🧑‍💻 The `Servo` class

*Read only.* The WPILib API the arm needs.

```java
import edu.wpi.first.wpilibj.Servo;

private final Servo m_lift = new Servo(2);   // PWM channel from ArmConstants

m_lift.set(0.5);      // position from 0.0 to 1.0; the servo goes there on its own
m_lift.get();         // the last position you set (there is no sensor)
m_lift.setAngle(90);  // the same thing in degrees, 0 to 180
m_lift.close();       // free the channel; tests need this
```

- The position means "a fraction of the servo's travel", not an angle on the arm. Which end is "up" depends on how the horn was installed. Find out on the hardware.
- Values outside 0.0 to 1.0 are not an error, but they tell the servo to go somewhere it cannot. `MathUtil.clamp(value, 0.0, 1.0)` from `edu.wpi.first.math.MathUtil` keeps a number inside a range.
- `Servo` has no `periodic()`. Set a position once and it stays.
- If the gripper needs the wider pulse range, `m_gripper.setBoundsMicroseconds(2400, 0, 0, 0, 500)` widens it. Try it without first.

## 🎮 Suggested controls

Nothing here is required. It is one layout that leaves the driving sticks and the Session 4 buttons alone.

| Control | Does |
| ------- | ---- |
| D-pad up / down | Nudge the lift up / down while held |
| D-pad left / right | Nudge the tilt while held |
| X | Open the gripper |
| B | Close the gripper |
| Y | Still the Session 4 challenge's turn-around, if it is on your branch |

In the simulator, the D-pad is not on Keyboard 0, so test the arm with a real controller or temporarily bind it to keys.

## 📐 Numbers to find on the hardware

Start every one of these at `0.5`, then find the real value by nudging on the Romi with the dashboard open.

| Constant | What it is |
| -------- | ---------- |
| Lift down | The arm resting at the bottom of its travel |
| Lift up | As high as it goes without hitting anything |
| Tilt level | Gripper parallel to the floor with the arm down |
| Gripper open | Paddles fully apart |
| Gripper closed | Paddles touching, or closed on the object you want to carry |
| Nudge per loop | How far a joint moves per 20 ms while a button is held. `0.01` is half the range per second |
| Servo travel time | How long an auto waits after telling a servo to move. One second is safe |
