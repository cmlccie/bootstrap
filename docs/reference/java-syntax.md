# Java Syntax

Every piece of Java syntax that appears in the `2026-bootcamp` repository and its solution branches, grouped by what it does. Every block on this page is *read only*. The **Where** column points to a file in the repository where you can see it used for real.

When you meet a line you cannot read, find the symbol or word here first. If it is not here, it is not in the bootcamp's code, and a mentor can explain it.

## 📄 Files and structure

| You see | It means | Where |
| ------- | -------- | ----- |
| `package frc.robot;` | Which folder this file lives in. `frc.robot` is `src/main/java/frc/robot/` | Top of every file |
| `import edu.wpi.first.wpilibj.TimedRobot;` | Bring in one class so you can use its short name | Below `package` |
| `import static org.junit.jupiter.api.Assertions.assertTrue;` | Bring in one `static` method so you can call it without the class name | Test files |
| `import frc.robot.Constants.DriveConstants;` | Bring in a class nested inside another class | `DriveInput.java` |
| `;` | Ends a statement | Everywhere |
| `{ ... }` | A block. Every `{` has a matching `}` | Everywhere |
| `// text` | A comment to the end of the line. Java ignores it | Everywhere |
| `/* text */` | A comment that can span lines | Rare here |
| `/** text */` | A documentation comment, read by tools and by humans, placed above a class or method | Above most methods |

Inside a doc comment you will see `@param name what it is`, `@return what comes back`, `{@link ClassName}` for a clickable name, and `<p>` to start a new paragraph. They are documentation, not code.

```java
/**
 * Creates the command.
 *
 * @param drivetrain the drivetrain to drive
 * @return nothing: this is a constructor
 */
```

## 🧱 Classes

| You see | It means | Where |
| ------- | -------- | ----- |
| `public class Robot extends TimedRobot {` | Define a class named `Robot` that starts from everything `TimedRobot` already does | `Robot.java` |
| `public class RomiDrivetrain extends SubsystemBase implements AutoCloseable {` | Also promise to have the methods `AutoCloseable` requires (just `close()`) | `RomiDrivetrain.java` |
| `public final class Constants {` | A class nobody can extend | `Constants.java` |
| `public static final class DriveConstants {` | A class nested inside another, used as a named group | `Constants.java` |
| `class RslLogicTest {` | No `public`: only code in the same package can see it. Normal for tests | Test files |
| `private Constants() {}` | A constructor nobody can call, so nobody can write `new Constants()`. Used for classes that are only a bag of `static` things | `Constants.java`, `RslLogic.java` |

One class per file, and the file name is the class name. The folder matches the `package` line.

### Attributes

Variables declared inside the class but outside every method. They belong to the object and live as long as it does.

```java
private final RomiDrivetrain m_drivetrain = new RomiDrivetrain();  // set once, never changes
private boolean m_yellowOn = false;                                // changes over time
private double m_startInch;                                        // set later, in a method
```

| Word | Meaning |
| ---- | ------- |
| `private` | Only this class can use it. Everything else goes through a method |
| `public` | Anyone can use it |
| `final` | Assigned once, never reassigned |
| `static` | Belongs to the class, not to any one object. One copy, shared |
| `static final` | A constant. By WPILib habit, named with a `k` prefix: `kDeadband` |
| `m_` prefix | WPILib habit marking an attribute, so you can tell it from a local variable |

### The constructor

Same name as the class, no return type. Runs once, when `new` builds the object. Setup goes here.

```java
public ArcadeDriveCommand(RomiDrivetrain drivetrain, DoubleSupplier forwardAxis) {
  m_drivetrain = drivetrain;      // parameter -> attribute
  m_forwardAxis = forwardAxis;
  addRequirements(drivetrain);    // a method inherited from Command
}
```

A class with nothing to set up can skip the constructor and Java supplies an empty one (`SignalLight`).

### `@Override`

Placed above a method that replaces one the parent class already has (`robotPeriodic()`, `execute()`, `close()`). If you misspell the method name, `@Override` turns that into a compile error instead of a silent bug.

### `new`

Builds an object from a class and runs its constructor.

```java
new RomiDrivetrain()                       // no arguments
new Spark(DriveConstants.kLeftMotorChannel)  // one argument
new OnBoardIO(ChannelMode.OUTPUT, ChannelMode.INPUT)
new Pose2d()                               // a pose at the origin
```

## 🔧 Methods

| You see | It means | Where |
| ------- | -------- | ----- |
| `public void disabledInit() { ... }` | Define a method. `void` means it returns nothing | `Robot.java` |
| `public boolean isYellowOn() { return m_yellowOn; }` | Define a method that returns a `boolean` | `SignalLight.java` |
| `public static double forwardSpeed(double rawAxis)` | `static`: call it on the class, no object needed. Takes one `double` parameter | `DriveInput.java` |
| `private static boolean dot(double unitsIn, int startUnit)` | A helper only this class can call | `MorseLogic.java` (challenge) |
| `return x;` | Hand `x` back to the caller and leave the method right now | Everywhere |
| `public static void main(String... args)` | Where the program starts. `String...` means "any number of `String`s". You never edit it | `Main.java` |

Reading a signature left to right: who can call it, `static` or not, what it returns, its name, its parameters.

### Calling

```java
m_signalLight.isYellowOn()              // on an object: this particular light
RslLogic.shouldBeOn(enabled, now)       // on a class: a static method
CommandScheduler.getInstance().run()    // chained: get the scheduler, then call run on it
m_controller.a().whileTrue(cmd)         // chained: a() returns a Trigger, then whileTrue on that
Units.inchesToMeters(inches)            // a static helper
Rotation2d.fromDegrees(90.0)            // a static method that builds and returns an object
```

The parentheses are the call. `getLeftY` is a name; `getLeftY()` runs it. A method call that returns a value can be used anywhere a value can.

## 📦 Types and variables

| Type | Holds | Example |
| ---- | ----- | ------- |
| `int` | Whole numbers | `int loopCount = 0;` |
| `double` | Decimal numbers | `double speed = 0.75;` |
| `boolean` | `true` or `false` | `boolean enabled = false;` |
| `String` | Text in double quotes | `String mode = "Teleop";` |
| A class name | An object of that class | `Pose2d pose = m_odometry.getPoseMeters();` |

```java
int loopCount;              // declare: make the box
loopCount = 0;              // assign: put a value in it
int loops = 5;              // declare and assign in one line
loopCount = loopCount + 1;  // assign a new value using the old one
```

**Where you declare a variable decides how long it lives.** Inside a method: until the method ends, then it starts over next call. Inside the class but outside every method: an attribute, alive as long as the object.

| You see | It means | Where |
| ------- | -------- | ----- |
| `1e-6` | Scientific notation: 0.000001. Used for test tolerances | Test files |
| `(int) DriveConstants.kCountsPerRevolution` | A **cast**: turn the `double` 1440.0 into the `int` 1440 because the method wants an `int` | `RomiDrivetrainTest.java` |
| `null` | "No object here." `if (m_autonomousCommand != null)` asks whether there is one before using it | `Robot.java` |
| `Math.PI`, `Math.abs(x)` | Java's math constants and helpers | `RomiDrivetrain.java`, `DriveInput.java` |
| `ChannelMode.OUTPUT` | One value of an **enum**, a type with a fixed list of named choices | `SignalLight.java` |
| `SendableChooser<Command>` | A chooser **of** commands. The `<...>` says what kind of thing it holds | `RobotContainer.java` |
| `new SendableChooser<>()` | The empty `<>` means "same kind as on the left" | `RobotContainer.java` |
| `Pose2d.struct` | A `static` attribute of a class, read without an object | Session 5 challenge |

!!! warning "Integer division drops the decimal"

    `7 / 2` is `3` because both numbers are `int`. `7 / 2.0` is `3.5`. The heartbeat uses this on purpose (`m_loopCount / 50` is whole seconds). Everywhere else, keep one side a `double`.

## ➗ Operators

| Operator | Meaning | Example | Result |
| -------- | ------- | ------- | ------ |
| `+ - * /` | Math | `50 * 0.02` | `1.0` |
| `%` | Remainder after division | `130 % 50` | `30` |
| `-x` | Flip the sign | `-applyDeadband(rawAxis)` | |
| `++` | Add one | `m_loopCount++;` | |
| `+=` | Add and store | `count += 5;` | |
| `+` with text | Glue text and values together | `"Loop " + 50` | `"Loop 50"` |
| `=` | Store | `count = 0;` | |
| `==` `!=` | Equal? Not equal? | `count == 50` | `true`/`false` |
| `<` `<=` `>` `>=` | Compare numbers | `0.25 < 0.5` | `true` |
| `!a` | Not | `!enabled` | |
| `a && b` | Both must be true | `enabled && t < 0.5` | |
| `a \|\| b` | At least one is true | `dot(u, 0) \|\| dot(u, 2)` | |

A comparison is already a `boolean`. `return secondsIntoCycle < 0.5;` returns `true` or `false` directly.

## 🚦 Control flow

```java
if (condition) {            // run the block only when condition is true
  ...
} else {                    // otherwise run this one (optional)
  ...
}

if (!enabled) {
  return true;              // handle the easy case and leave; the rest of the method is the other case
}
```

### The `for` loop

The one piece of syntax the sessions did not need. "Do this N times":

```java
for (int i = 0; i < sides; i++) {   // start i at 0; keep going while i < sides; add one each time
  routine = routine.andThen(new DriveDistance(0.5, sideInch, m_drivetrain));
}
```

Three parts inside the parentheses: where the counter starts, the condition to keep going, and what happens after each pass. The block runs `sides` times. Used in the Capstone 1 challenge.

## λ Lambdas and method references

Ways to hand a *method* to another object, so it can call the method later and get a fresh value each time.

| You write | It means | Where |
| --------- | -------- | ----- |
| `m_controller::getLeftY` | A **method reference**: "here is a method, call it when you need the value" | `RobotContainer.java` |
| `m_leftMotor::set` | The same, for a method that takes a value | `RomiDrivetrain.java` |
| `Robot::new` | A reference to a constructor | `Main.java` |
| `() -> m_controller.getLeftY() * 0.5` | A **lambda**: a tiny method with no name that returns the expression | `RobotContainer.java` |
| `() -> m_signalLight.setGreen(true)` | A lambda that returns nothing | `RobotContainer.java` |
| `m_drivetrain::resetOdometry` | A reference used where a `Runnable` is wanted | Session 5 challenge |

Read `() ->` as "when called with nothing, give back". The lambda is not run where you write it. It runs when the object you handed it to decides to.

The object stores it under a type that says what shape it is:

| Type | Shape | You get the value with |
| ---- | ----- | ---------------------- |
| `DoubleSupplier` | No input, returns a `double` | `.getAsDouble()` |
| `Runnable` | No input, returns nothing | the framework calls it |
| `BooleanSupplier` | No input, returns a `boolean` | the framework calls it (`new Trigger(...)`) |

## 🏷️ Annotations

Words starting with `@`, placed above a class or method, that tell a tool something.

| Annotation | Tells | Where |
| ---------- | ----- | ----- |
| `@Override` | The compiler: this replaces a parent's method | Everywhere |
| `@Test` | JUnit: this method is a test | Test files |
| `@Disabled("why")` | JUnit: skip this test or class | Tests on `main` waiting for you |
| `@BeforeEach` | JUnit: run before every test in the class | `RomiDrivetrainTest.java` |
| `@AfterEach` | JUnit: run after every test in the class | `RomiDrivetrainTest.java` |

## 🧪 Tests

```java
import static org.junit.jupiter.api.Assertions.assertEquals;

class SomethingTest {               // same package as the class it tests, named ClassNameTest
  static final double DELTA = 1e-9;

  @Test
  void describesWhatShouldHappen() {       // one test per thing that should be true
    assertTrue(condition);                 // fails if false
    assertFalse(condition);                // fails if true
    assertEquals(expected, actual);        // whole numbers, text, booleans
    assertEquals(expected, actual, DELTA); // decimals: always give a tolerance
  }
}
```

Test files live in `src/test/java/` in the same package as the class they test. Tests that create hardware start with `HAL.initialize(500, 0)` and end by calling `close()` on what they made; see [Session 5](../session-5/reference.md).

## 📛 Naming habits in this code

| Pattern | Means |
| ------- | ----- |
| `m_name` | An attribute |
| `kName` | A constant (`static final`) |
| `ClassName` | Classes start with a capital letter |
| `methodName`, `variableName` | Methods and variables start lowercase, then capitalize each word |
| `xxxInit()`, `xxxPeriodic()` | Runs once when entering mode `xxx`; runs every 20 ms while in it |
| `isSomething()`, `getSomething()`, `setSomething(value)` | Returns a boolean; returns a value; changes a value |
| `SomethingCommand`, `SomethingTest` | A command class; a test class |
