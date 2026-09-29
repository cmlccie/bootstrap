# Conditionals

A `boolean` is a value that is either `true` or `false`. Conditionals are how code makes decisions based on booleans. Today's exercise is one decision: should the light be on?

## ⚖️ Comparisons make booleans

| Operator | Asks | Example | Result |
| -------- | ---- | ------- | ------ |
| `<` `<=` | Less than, less or equal | `0.25 < 0.5` | `true` |
| `>` `>=` | Greater than, greater or equal | `0.75 >= 1.0` | `false` |
| `==` | Equal? | `m_loopCount == 50` | depends |
| `!=` | Not equal? | `mode != 3` | depends |

A comparison can be stored, returned, or used directly in an `if`:

```java
boolean firstHalf = secondsIntoCycle < 0.5;
return secondsIntoCycle < 0.5;
if (secondsIntoCycle < 0.5) { ... }
```

## 🔗 Combining booleans

| Operator | Meaning | `true` when |
| -------- | ------- | ----------- |
| `!a` | Not | `a` is `false` |
| `a && b` | And | both are `true` |
| `a \|\| b` | Or | at least one is `true` |

```java
!enabled                          // the robot is disabled
enabled && secondsIntoCycle < 0.5 // enabled, and in the first half of the blink
```

## 🚦 `if` and `else`

```java
if (condition) {
  // runs when condition is true
} else {
  // runs when it is false
}
```

Inside a method that returns a value, `return` ends the method on the spot. That gives a clean pattern: handle the easy case first and return, then handle the rest.

```java
if (!enabled) {
  return true;   // disabled: solid on, and we are done
}
// only enabled robots get this far
```

## 📋 The RSL rule as a truth table

Work it out in English before writing code. Blink period is 1.0 second: on for the first half, off for the second.

| `enabled` | seconds into the cycle | light |
| --------- | ---------------------- | ----- |
| `false` | anything | on |
| `true` | `0.0` up to `0.5` | on |
| `true` | `0.5` up to `1.0` | off |

"Seconds into the cycle" is the remainder operator from Session 2: `timeSeconds % 1.0`. At 10.25 seconds, that is `0.25`. At 10.75, it is `0.75`.

Now each row of the table becomes one line of code. That is the exercise.

## 🧪 Reading a test

Open `src/test/java/frc/robot/RslLogicTest.java`. Each method marked `@Test` is one test. `assertTrue(x)` fails if `x` is `false`. `assertFalse(x)` fails if `x` is `true`.

```java
@Test
void disabledRobotIsSolidOn() {
  assertTrue(RslLogic.shouldBeOn(false, 0.75));
}
```

Read it as a sentence: "with the robot disabled, at 0.75 seconds, the light should be on." The test file is the truth table, written so the computer can check it.

`@Disabled` above the class tells JUnit to skip the whole file. Deleting that line turns the tests on.
