# Capstones

The five sessions gave you the toolkit: the routine, the robot lifecycle, subsystems and commands, controllers, sensors, tests, simulation, and the Romi. A capstone is a project that uses all of it. These pages give you what you need to know. They do not give you the code.

| Capstone | What you build | What you need |
| -------- | -------------- | ------------- |
| [Capstone 1: Autonomous](autonomous/index.md) | Commands that finish on their own, chained into routines, chosen from the dashboard, then routines of your own design | Sessions 2-5 on `main`. A laptop and the Romi |
| [Capstone 2: The Arm](arm/index.md) | A new subsystem for the Romi's robot arm, commands to move it, controller bindings, and an auto that uses it | Capstone 1 on `main`. The arm installed on the Romi |

## 🧭 How a capstone works

- **Same routine.** Refresh `main`, branch `yourname/capstone-1`, code, test, commit, push.
- **Walkthrough first, then your own.** Capstone 1 walks you through two commands and the chooser, the same way the sessions did, so there is a working example to copy the shape of. Then the challenge is yours.
- **Capstone 2 has no walkthrough.** It gives you the hardware facts, the API, a plan, and hints. You write every line.
- **Pairs.** Work in pairs. One Romi, many programmers. Take turns at the laptop and keep the simulator busy while you wait.
- **No published solution.** Mentors have reference solutions and will review your branch. Finish, push, and ask.

!!! tip "Mentor notes"

    Before Capstone 1, merge `solution/session-5` into `main`. Before Capstone 2, merge `solution/capstone-1`. Capstone 2 depends on the Pololu arm kit being assembled and its servos wired and configured; see [Arm Hardware](arm/arm-hardware.md) for the checklist.
