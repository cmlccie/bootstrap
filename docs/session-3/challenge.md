# Challenge: SOS

!!! abstract "Optional. No steps. Your call."

    This uses what Session 3 taught: a pure-logic class, `static` methods, booleans, `%`, comparisons, `if`, and reading a test. Nothing new to learn. Work on it on your `yourname/session-3` branch. Open a hint if you are stuck; the hints point, they do not solve.

## 🎯 The goal

The yellow LED is the Romi's RSL. The **red LED** is unused. While the robot is **Disabled**, make the red LED flash **SOS** in Morse code, over and over. While the robot is enabled, the red LED stays off.

SOS in Morse is three dots, three dashes, three dots:

```text
. . .   - - -   . . .
```

Morse code has exact timing. Everything is measured in one **unit** (pick a unit, 0.2 seconds is a good one):

| Element | Length |
| ------- | ------ |
| Dot | 1 unit on |
| Dash | 3 units on |
| Gap between dots and dashes inside a letter | 1 unit off |
| Gap between letters | 3 units off |
| Gap between words (before SOS repeats) | 7 units off |

## ✅ Done when

- [ ] A new class holds the Morse logic, with no hardware in it, like `RslLogic`.
- [ ] `SignalLight` uses it to drive the red LED. The yellow LED still does what it did.
- [ ] In the simulator on a laptop (or on the Romi in Session 5), **DIO 2** shows the SOS pattern while Disabled and stays low while Teleop.
- [ ] `./gradlew build` passes and the branch is pushed.
- [ ] Street cred: a test class checks your logic at a few points in the pattern, the way `RslLogicTest` checks the RSL. It passes.

## 🧰 What you already know that helps

- The [Romi onboard I/O table](command-based.md#the-romis-onboard-io): read the row for DIO 2 carefully.
- `RslLogic.shouldBeOn` turns "the time right now" into "on or off" with `%` and `<`. SOS is the same question with a longer answer.
- `SignalLight.periodic()` already knows whether the robot is enabled and what time it is.
- The [Session 3 Reference](reference.md) lists the `OnBoardIO` methods, and the [Robot reference](../reference/robot.md) has the full pin table.

??? tip "Hint 1: the red LED is not plugged in yet"

    `SignalLight` creates its `OnBoardIO` with two `ChannelMode` values. Each one decides what a shared pin is. Which pin is the red LED on, and what is that pin set to right now? One word changes. Something else stops working when you change it; decide whether you care.

??? tip "Hint 2: draw the timeline first"

    Before any code, write the whole SOS pattern as a row of units on paper: `on on off on ...`. Count how many units long one full SOS (with the word gap) is. Then, exactly like the RSL, `%` tells you how many units into the pattern "now" is. From there it is a chain of comparisons, one per on-or-off stretch. Long, but every line is Session 3 Java. Sixteen `if`s that work beat a clever trick that does not.

??? tip "Hint 3: getting from seconds to units"

    The RSL divided time by a period in seconds. If you divide time by your unit length first, the pattern is measured in whole units and the comparisons are small whole numbers. `timeSeconds % periodSeconds / unitSeconds` is one way to write "units into the pattern".

??? tip "Hint 4: the test"

    Copy the shape of `RslLogicTest`: one method per thing you want to be true. Pick times you can reason about by hand, like the middle of the first dot and the middle of the first dash. Use times that are exact in binary (multiples of 0.25 work well when your unit is 0.25) so `%` does not surprise you.
