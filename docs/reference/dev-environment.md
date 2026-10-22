# Development Environment

The tools you use in the bootcamp, in the order you meet them, and then the rest of the FRC software you will hear about. The first part is what you use. The second part is what the programming team uses on the competition robot.

## ☁️ GitHub Codespaces

A Codespace is VS Code running on a computer in the cloud, shown in your browser. The repository's `.devcontainer/` folder is the recipe: Java 17, Gradle, the Java extensions, and a first `./gradlew build` so WPILib is cached.

| Do | How |
| -- | --- |
| Create one | Repository page, green **Code** button, **Codespaces** tab, **Create codespace on main** |
| Open the one you already have | [github.com/codespaces](https://github.com/codespaces), click its name. Do not create a second one |
| Stop it | Bottom-left Codespaces button, **Stop Current Codespace**, or from the list at github.com/codespaces. Do this every time you finish |
| It is broken | Command Palette, **Codespaces: Rebuild Container**. Your files survive. If that fails, push your branch, delete the Codespace, create a new one |
| Quota | Your personal free hours. 2 cores (the repository asks for it). Stopped Codespaces cost nothing. Unused ones are deleted after 30 days; pushed work is safe |

## 🖥️ VS Code

| Area | Where | For |
| ---- | ----- | --- |
| Explorer | Left bar, top icon | Files. Right-click for **New File...**, **New Folder...** |
| Source Control | Left bar, branch icon | See changes, stage, commit, push |
| Terminal | Bottom panel, ++ctrl+grave++ | `./gradlew ...` and `git ...` |
| Command Palette | ++ctrl+shift+p++ (++cmd+shift+p++ on a Mac) | Search every command |
| Status bar | Bottom edge | Current branch on the left; sync and Codespaces buttons |
| Problems | Bottom panel | Compile errors, clickable |
| Test report preview | Right-click `build/reports/tests/test/index.html`, **Open Preview** | Which tests ran, passed, failed, or were skipped |

| Shortcut | Windows / Chromebook | Mac |
| -------- | -------------------- | --- |
| Save | ++ctrl+s++ | ++cmd+s++ |
| Find in file | ++ctrl+f++ | ++cmd+f++ |
| Find in all files | ++ctrl+shift+f++ | ++cmd+shift+f++ |
| Go to definition | ++f12++ on a name | ++f12++ |
| Format the file | ++shift+alt+f++ | ++shift+option+f++ |
| Toggle terminal | ++ctrl+grave++ | ++ctrl+grave++ |
| Source Control | ++ctrl+shift+g++ | ++ctrl+shift+g++ |

## 🌿 Git in a Codespace

The routine, every session: refresh `main`, branch, code, test, commit, push. The full walkthrough with screenshots-in-words is [The Routine](../session-2/routine.md). The same steps as clicks and as commands:

| Step | Source Control view | Terminal |
| ---- | ------------------- | -------- |
| See what changed | The **Changes** list | `git status` |
| Refresh `main` | Click the branch name, pick `main`, click sync | `git checkout main && git pull` |
| New branch | Click the branch name, **Create new branch...** | `git switch -c yourname/session-3` |
| Stage | **+** next to a file, or next to **Changes** for all | `git add .` |
| Commit | Type a message, **Commit** | `git commit -m "Message"` |
| Push | **Publish Branch** the first time, **Sync Changes** after | `git push -u origin yourname/session-3` |
| History | Timeline view, or the GitHub page | `git log --oneline -5` |
| What did I change? | Click a file under **Changes** | `git diff` |
| Which branch am I on? | Status bar, bottom-left | `git branch` |
| Throw away edits to one file | Right-click the file, **Discard Changes** | `git checkout -- path/to/File.java` |

| Idea | Meaning |
| ---- | ------- |
| `main` | The team's branch. Protected. A mentor merges finished work into it between sessions, so it moves |
| Your branch | `yourname/what-it-does`. Yours forever. Never merged during the bootcamp; `main` gets the reference version instead |
| Commit | A saved snapshot with a message that says what it does, in one present-tense line |
| Push | Your commits go to GitHub. Until then they exist only in your Codespace |
| Pull request | Asking for a branch to be merged into `main`. Taught after the bootcamp (or discovered in Session 1's challenge) |

Common trouble and what to do is in the table at the bottom of [The Routine](../session-2/routine.md#when-things-go-wrong).

## ⚙️ Gradle: `./gradlew`

Gradle builds, tests, and runs the robot program. The wrapper script `./gradlew` is in the repository, so every machine uses the same version. Every `./gradlew` command runs in the terminal, in the repository folder.

| Command | Does | You will see |
| ------- | ---- | ------------ |
| `./gradlew build` | Compile everything and run all tests. What CI runs | `BUILD SUCCESSFUL` or `BUILD FAILED` |
| `./gradlew test` | Run the tests only | Same, faster |
| `./gradlew test --tests '*Rsl*'` | Run only tests whose name matches | |
| `./gradlew simulateJava` | Run the robot program on this computer | Codespace: log lines in the terminal, robot stays Disabled. Laptop: the Sim GUI opens |
| `./gradlew simulateJava -Pheadless` | On a laptop, run it the Codespace way: no window | |
| `./gradlew clean` | Delete `build/`. Fixes "it worked yesterday" problems | |
| `./gradlew --version` | Gradle and Java versions | |
| `./gradlew deploy` | Copy the program to a roboRIO. Not used with the Romi | |

Reading the output:

| You see | It means | Do |
| ------- | -------- | -- |
| `BUILD SUCCESSFUL` | Compiled and every enabled test passed | Carry on |
| `error: cannot find symbol` | A misspelled name, or a missing `import` | Check the file and line it names |
| `error: ';' expected` | A missing semicolon one line above | |
| `error: reached end of file while parsing` | A missing `}` | Count your braces |
| `SomethingTest > name() FAILED` then `expected: <x> but was: <y>` | A test ran and disagreed | Read the test, then your code |
| `85% EXECUTING` and nothing else | The robot program is running | That is normal. ++ctrl+c++ stops it |
| `HAL Extensions: No extensions found` | Headless mode, no Sim GUI, no Romi | Correct in a Codespace |

The test report is at `build/reports/tests/test/index.html`. The log files the program writes are in `logs/`, ignored by git.

## 🕹️ The simulator (Sim GUI)

`./gradlew simulateJava` on a laptop runs your real robot program and opens the **Robot Simulation** window, which plays the part of the Driver Station and lets you see and fake the hardware. The panels, what to drag where, and the keyboard mapping are in the [Robot, Controller, and Simulator](robot.md#sim-gui) reference.

| Do | How |
| -- | --- |
| Pick a mode | **Robot State**: Disabled, Autonomous, Teleoperated, Test |
| Plug in a controller | Drag it from **System Joysticks** onto **Joystick[0]** in **Joysticks** |
| Drive without a controller | Drag **Keyboard 0** instead. ++w++ ++s++ ++a++ ++d++ are the left stick |
| Watch the motors | **PWM Outputs**, channels 0 and 1 |
| Watch the LEDs | **DIO**, pins 1 to 3 |
| Fake a sensor | **Encoders** → type a distance. **Other Devices → Gyro:RomiGyro** → type `angle_z` |
| See published values | **NetworkTables → SmartDashboard** |
| Pick an auto | **NetworkTables → SmartDashboard → Auto → selected** |
| Stop | **Disabled**, then close the window or ++ctrl+c++ |

## 📊 AdvantageScope

The tool for looking at robot data: live from NetworkTables, or from a `.wpilog` file after the fact. It ships with WPILib.

| Do | How |
| -- | --- |
| Open | VS Code Command Palette, **WPILib: Start Tool**, **AdvantageScope**. Or from the WPILib tools folder |
| Live from the simulator | **File → Connect to Simulator** |
| Live from the Romi | The robot program runs on your laptop, so this is also **Connect to Simulator** |
| Live from a real robot | **File → Connect to Robot**, team number in Preferences |
| Open a log | **File → Open Log(s)**, pick a `.wpilog` from the project's `logs/` |
| Plot a number | Drag it from the left sidebar onto the **Line Graph** tab |
| Draw the robot | Add a **2D Field** or **3D Field** tab, drag the pose onto it. Each field tab has options for the field image and the robot's size |
| See every value as text | The **Table** tab |
| Scrub time | The timeline at the bottom when a log is open |

The Romi is 0.16 m wide on a field that is 16 m long. Shrink the robot in the field options and use the 3D view's zoom, or the robot is a dot.

## 💻 The programming laptops

Windows laptops with WPILib installed, used for everything a Codespace cannot do: the Sim GUI, AdvantageScope, and the Romi.

| Do | How |
| -- | --- |
| Open the project | VS Code with the WPILib icon, **File → Open Folder**, the `2026-bootcamp` clone |
| Get your branch | Terminal: `git fetch origin` then `git checkout yourname/session-4` |
| Run | ++f5++ or `./gradlew simulateJava` |
| Talk to the Romi | Join the Romi's Wi-Fi (name starts with `WPILibPi`), then run as usual. `build.gradle` already points at `10.0.0.2` |
| Make a change | Do not commit here; git on the laptop does not know who you are. Note it, change it in your Codespace, push, and `git pull` on the laptop |
| Back to the internet | Leave the Romi's Wi-Fi |

## 🧰 The rest of the FRC software

You will hear these names. The team uses them on the competition robot. None of them is needed for the bootcamp.

| Program | What it is | When you meet it |
| ------- | ---------- | ---------------- |
| **WPILib installer** | Puts VS Code, the WPILib extension, Java, and all the tools below on a laptop. One download per season | Mentors set up the laptops |
| **WPILib VS Code extension** | Creates projects, builds, deploys to the roboRIO, starts the tools, manages vendor libraries | **WPILib:** commands in the Command Palette |
| **FRC Driver Station** | The Windows app that connects to a real robot, picks the mode, enables and disables, and shows battery, comms, and joystick status. The Sim GUI plays its part for the Romi | First time you drive the competition robot |
| **SmartDashboard / Shuffleboard / Elastic** | Dashboards that show NetworkTables values and let the driver choose things, like the auto routine. Elastic is the current one | Alongside the Driver Station |
| **RioLog** | The roboRIO's console output, inside VS Code. Your `DataLogManager.log` lines appear here on a real robot | Deploying to a roboRIO |
| **roboRIO Imaging Tool** | Puts the season's firmware image on a roboRIO | Preseason, mentors |
| **Radio Configuration Utility** | Programs the robot radio with the team number and settings | Preseason, mentors |
| **REV Hardware Client** | Updates firmware and sets CAN IDs on SPARK MAX motor controllers over USB | Any time a motor controller is added |
| **Phoenix Tuner** | The same for CTRE devices (Kraken, Talon, CANcoder) | If the robot uses them |
| **PathPlanner / Choreo** | Draw autonomous paths on a field picture; the robot follows them | Season autonomous |
| **Romi web page** | `http://10.0.0.2` on the Romi's Wi-Fi: status, gyro calibration, external pin setup, Wi-Fi settings | Capstone 2 and whenever the Romi misbehaves |
| **GitHub** | Where the code lives. Branches, pull requests, the Actions tab where CI runs, Codespaces | Every session |
