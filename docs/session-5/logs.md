# Logs and AdvantageScope

AdvantageScope is the tool for looking at robot data: live from NetworkTables, or from a `.wpilog` file after the fact. It ships with WPILib.

## 1. Open it

On the laptop, in VS Code, open the Command Palette (++ctrl+shift+p++) and run **WPILib: Start Tool**, then pick **AdvantageScope**. Or launch it from the WPILib tools folder.

## 2. Connect to the simulator

With `./gradlew simulateJava` still running, choose **File → Connect to Simulator**.

You will see: the left sidebar fills with fields. Expand **SmartDashboard**. `Drive/leftInch`, `Drive/rightInch`, `Drive/headingDeg`, and `Field` are there.

## 3. Plot a number

Drag `Drive/leftInch` onto the **Line Graph** tab. Back in the Sim GUI, type a new distance into `Encoder[4,5]`.

You will see: the line jumps to the new value. Type a few values and you get a staircase. On a real robot this is a smooth curve as the wheel turns.

## 4. Draw the robot on the field

Click the **+** to add an **Odometry** tab (it may be called **2D Field**). Drag `SmartDashboard/Field/Robot` onto the robot slot.

You will see: a field with a robot on it. Change the encoder distance and the gyro angle in the Sim GUI and the robot moves and turns.

## 5. Open a log file

Every time the program ran, `DataLogManager` wrote a file. Choose **File → Open Log(s)** and pick the newest file in the project's `logs/` folder.

You will see: the same field tree, but now with a timeline. Scrub the playhead. Your `Entered Disabled` and `Heartbeat` lines from Session 2 are under **messages**. Every `SmartDashboard` value you published is there too, because `DataLogManager` records NetworkTables by default.

!!! info "On the real robot"

    The roboRIO writes the same files to a USB stick. After a match, plug the stick into a laptop and open the log. That is how teams find out what really happened during the 15 seconds nobody was looking at the dashboard.

## ✅ Done when

- [ ] You plotted `Drive/leftInch` live.
- [ ] You saw the robot on the field view move when you faked the sensors.
- [ ] You opened a `.wpilog` and found the Session 2 heartbeat messages.
