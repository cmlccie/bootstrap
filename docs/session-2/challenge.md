# Challenge: The Uptime Clock

!!! abstract "Optional. No steps. Your call."

    This uses only what Session 2 taught: attributes, integer math, `%`, gluing text together, and `if`. Nothing new to learn, only something new to build. Work on it on your `yourname/session-2` branch, in your Codespace. Open a hint if you are stuck; the hints point, they do not solve.

## 🎯 The goal

The heartbeat prints `loop 150 at 3.0 s`. Nobody reads a robot log and thinks in loops. Turn the heartbeat into a clock. Once per second, log the program's uptime as **minutes and seconds**, the way a stopwatch shows it:

```text
Uptime 0:58
Uptime 0:59
Uptime 1:00
Uptime 1:01
```

Seconds always have two digits. `1:05`, never `1:5`.

## ✅ Done when

- [ ] `./gradlew simulateJava` prints `Uptime 0:01` after one second and keeps counting.
- [ ] It prints `Uptime 1:00` after sixty seconds, then `Uptime 1:01`. Wait for it. Watching a clock roll over is the test.
- [ ] `Uptime 1:05` has a zero in it. `Uptime 0:09` too.
- [ ] `./gradlew build` passes and the branch is pushed.
- [ ] Street cred: exactly once, when uptime reaches one minute, the log also says `One minute of uptime`.

## 🧰 What you already know that helps

- `m_loopCount / 50` is the number of whole seconds. The [Reading Java](java-basics.md) page explains why dividing two `int`s drops the decimal, and today that is what you want.
- `%` gives the remainder. You used it to find "every fiftieth loop". It also finds "seconds left over after the whole minutes".
- `"Uptime " + minutes + ":" + seconds` glues it together. Java turns the numbers into text for you.
- `if` runs a block only when a condition is true. There is nothing that says the block has to log something.

??? tip "Hint 1: break it into three numbers"

    You already have the total number of beats (seconds). From that you need the whole minutes and the leftover seconds. Both are one operation each, and both are in the operator table on the [Reading Java](java-basics.md) page. Work out by hand what the two numbers are for 65 seconds, then for 120.

??? tip "Hint 2: the zero"

    `1:5` and `1:05` differ by one character, and only when the seconds are small. Ask yourself: small compared to what? That question is a comparison, and a comparison is what goes inside an `if`. The text you glue together can start out as one thing and get a character added to it.

??? tip "Hint 3: you do not have to wait a minute"

    While you are testing, make the clock run faster: log on every loop, or pretend 10 loops is a second. Put the real number back before you commit. Faking time to test time is a trick you will use on the real robot too.

??? tip "Hint 4: exactly once"

    "Every second" happens 60 times in a minute. "Exactly at one minute" happens once. What is different about the condition? Compare the number of seconds to one value instead of taking a remainder.
