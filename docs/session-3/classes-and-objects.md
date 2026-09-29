# Classes and Objects

Every `.java` file in this project defines one **class**. This page uses two files you will work with today to show what a class is made of.

## 🏗️ A class is a blueprint, an object is a thing built from it

```java title="src/main/java/frc/robot/RobotContainer.java"
private final RomiDrivetrain m_drivetrain = new RomiDrivetrain();
private final SignalLight m_signalLight = new SignalLight();
```

`SignalLight` is a class: the description of what a signal light has and can do. `new SignalLight()` builds one **object** from that description. `m_signalLight` is the variable that holds it. You could build two if the robot had two boards. This robot has one, so there is one object.

**One class per file, and the file name is the class name.** `SignalLight` lives in `SignalLight.java`. The folder matches the `package` line: `frc.robot.subsystems` is `src/main/java/frc/robot/subsystems/`.

## 🧩 What a class contains

Open `src/main/java/frc/robot/subsystems/SignalLight.java`. Ignore the comments and it is short.

### Attributes: what the object has

```java
private final OnBoardIO m_onboardIO = new OnBoardIO(ChannelMode.OUTPUT, ChannelMode.INPUT);

private boolean m_yellowOn = false;
```

Attributes are variables that belong to the object and live as long as it does. `m_onboardIO` is the hardware. `m_yellowOn` remembers the LED's current state between loops.

- `private` means only code inside this class can touch them. Everything else has to go through a method.
- `final` means the variable is assigned once and never changes. The `OnBoardIO` object is the same one forever. `m_yellowOn` is not `final`, because it changes every loop.

### Methods: what the object can do

```java
public boolean isYellowOn() {
  return m_yellowOn;
}

public void setGreen(boolean on) {
  m_onboardIO.setGreenLed(on);
}
```

A method's first line is its **signature**: who can call it (`public`), what it gives back (`boolean`, or `void` for nothing), its name, and its parameters in parentheses. `return` hands a value back to whoever called the method and ends the method.

`periodic()` is a method too. The scheduler calls it 50 times a second. That is where `SignalLight` decides what the yellow LED should do.

### The constructor: how the object is built

`RomiDrivetrain` has one; `SignalLight` does not need one.

```java title="src/main/java/frc/robot/subsystems/RomiDrivetrain.java"
public RomiDrivetrain() {
  m_leftEncoder.setDistancePerPulse(inchesPerCount);
  m_rightEncoder.setDistancePerPulse(inchesPerCount);
  resetEncoders();
  m_rightMotor.setInverted(true);
}
```

A constructor has the class's name and no return type. It runs once, when `new` builds the object. Setup goes here. A class with nothing to set up can skip it, and Java supplies an empty one.

## 🔌 Calling a method: on an object, or on a class

Two ways to call a method, and you have seen both.

```java
m_signalLight.isYellowOn()        // on an object: this particular signal light
RslLogic.shouldBeOn(enabled, now) // on a class: no object needed
```

Open `src/main/java/frc/robot/RslLogic.java`. Its one method is marked `static`:

```java
public static boolean shouldBeOn(boolean enabled, double timeSeconds) {
```

`static` means the method belongs to the class, not to any object. It does not read or change any attributes. It works only with what you pass in. That is why `SignalLight` can call `RslLogic.shouldBeOn(...)` without ever writing `new RslLogic()`.

Rule of thumb: if a method needs to remember something between calls or talk to hardware, it belongs on an object. If it is pure math or pure logic, `static` is fine, and it is far easier to test.

## ✅ Check yourself

In `SignalLight.java`, find: two attributes, one method that returns something, one method that returns nothing, and the line where a `static` method is called. Which attribute is `final`, and why?
