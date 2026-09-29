# Reading Java: The Pieces of Robot.java

You have already seen most of Java's building blocks in `Robot.java`. This page names them so you can write your own. Everything here shows up in today's exercise.

## 🧱 Structure

Java code is made of **statements**. Every statement ends with a semicolon. Code inside `{` and `}` is a **block**. Every `{` has a matching `}`.

```java
package frc.robot;                       // statement

public class Robot extends TimedRobot {  // block starts
  @Override
  public void disabledInit() {           // block inside a block
    System.out.println("Disabled");      // statement
  }                                      // inner block ends
}                                        // outer block ends
```

Two kinds of comments. Java ignores both.

```java
// One line, up to the end of the line.

/**
 * A documentation comment, usually above a class or method.
 */
```

## 🔧 Methods: define vs. call

A **method** is a named block of code. You **define** it once and **call** it as often as you like.

```java
// Defining a method. "void" means it returns nothing.
@Override
public void disabledInit() {
  System.out.println("Robot is disabled");
}
```

```java
// Calling a method. The parentheses are the call.
CommandScheduler.getInstance().run();
System.out.println("Hello");
```

Read `CommandScheduler.getInstance().run()` left to right: get the scheduler, then call its `run` method. The dot means "look inside".

## 📦 Variables

A **variable** is a named box that holds one value. Every box has a **type** that says what kind of value fits.

| Type | Holds | Example |
| ---- | ----- | ------- |
| `int` | Whole numbers | `int loopCount = 0;` |
| `double` | Decimal numbers | `double speed = 0.75;` |
| `boolean` | `true` or `false` | `boolean enabled = false;` |
| `String` | Text, in double quotes | `String mode = "Teleop";` |

Three things happen to variables:

```java
int loopCount;        // declare: make the box
loopCount = 0;        // assign: put a value in it
int loops = 5;        // declare and assign in one line

loopCount = loopCount + 1;  // assign a new value using the old one
```

**Where you declare a variable decides how long it lives.**

- Declared inside a method: it exists only while that method runs. Next call, it starts over.
- Declared inside the class but outside every method: it is an **attribute** of the object and lives as long as the object does. WPILib names these with `m_`.

```java
public class Robot extends TimedRobot {
  private int m_loopCount = 0;   // attribute: keeps its value between loops

  @Override
  public void robotPeriodic() {
    double seconds = m_loopCount * 0.02;   // local: recomputed every loop
  }
}
```

This is the difference that matters today. A loop counter must be an attribute. If you declare it inside `robotPeriodic()`, it resets to zero 50 times a second.

## ➗ Numbers and math

| Operator | Meaning | Example | Result |
| -------- | ------- | ------- | ------ |
| `+` `-` `*` `/` | Add, subtract, multiply, divide | `50 * 0.02` | `1.0` |
| `%` | Remainder after division | `130 % 50` | `30` |
| `++` | Add one | `m_loopCount++;` | |
| `+=` | Add and assign | `m_loopCount += 5;` | |

!!! warning "Integer division drops the decimal"

    `50 / 20` is `2`, not `2.5`, because both numbers are `int`. Make one of them a `double`: `50 / 20.0` is `2.5`. This bites everyone once.

The remainder operator `%` is how you do something "every N times":

```java
m_loopCount % 50   // is 0 on loop 0, 50, 100, 150 ... once per second
```

## 🔤 Text

Glue text and numbers together with `+`. Java turns the numbers into text for you.

```java
String message = "Loop " + m_loopCount + " at " + seconds + " s";
// Loop 150 at 3.0 s
```

Text goes in double quotes `"..."`. Single quotes are for single characters and you will not need them today.

## 🚦 A first look at `if`

`if` runs a block only when a condition is `true`. `==` asks "are these equal?" (one `=` assigns, two `==` compare).

```java
if (m_loopCount % 50 == 0) {
  System.out.println("One second passed");
}
```

That is all the `if` you need today. Session 3 covers `else`, `!`, `&&`, and the rest.

## ✅ Check yourself

Without running it, what does this print on loop 100? On loop 101?

```java
m_loopCount++;
if (m_loopCount % 50 == 0) {
  System.out.println("Heartbeat " + (m_loopCount / 50));
}
```
