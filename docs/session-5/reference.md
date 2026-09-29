# Session 5 Reference

## 📏 Sensor API

| Need | Code |
| ---- | ---- |
| Wheel distance | `m_leftEncoder.getDistance()` (inches, after `setDistancePerPulse`) |
| Raw counts | `m_leftEncoder.get()` |
| Zero the encoders | `m_leftEncoder.reset()` |
| Heading, degrees | `m_gyro.getAngleZ()` |
| Turn rate, degrees per second | `m_gyro.getRateZ()` |
| Zero the gyro | `m_gyro.reset()` |
| Inches to meters | `Units.inchesToMeters(x)` |
| Degrees to a rotation | `Rotation2d.fromDegrees(x)` |
| Update odometry | `m_odometry.update(rotation, leftMeters, rightMeters)` |
| Current pose | `m_odometry.getPoseMeters()` |
| Show it on a field | `m_field.setRobotPose(pose)` after `SmartDashboard.putData("Field", m_field)` |

## 🧪 Simulated hardware in tests

```java
@BeforeEach
void setUp() {
  assertTrue(HAL.initialize(500, 0));
  m_drivetrain = new RomiDrivetrain();
  m_leftEncoderSim = EncoderSim.createForChannel(4);   // after the drivetrain exists
}

@AfterEach
void tearDown() {
  m_drivetrain.close();
}

m_leftEncoderSim.setCount(1440);
m_leftEncoderSim.setDistance(8.66);
```

## 🌐 Addresses

| Robot | Address | Driver Station |
| ----- | ------- | -------------- |
| Romi | `10.0.0.2` on its own Wi-Fi | Sim GUI |
| Competition | `10.TE.AM.2` via the radio | FRC Driver Station app |

## 📊 AdvantageScope quick start

| Do | How |
| -- | --- |
| Open | VS Code: **WPILib: Start Tool → AdvantageScope** |
| Live from the simulator | **File → Connect to Simulator** |
| Live from a robot | **File → Connect to Robot** (address in Preferences; `10.0.0.2` for the Romi) |
| Open a log | **File → Open Log(s)**, pick a `.wpilog` from `logs/` |
| Plot a value | Drag it onto the Line Graph tab |
| Show the robot | Odometry tab, drag `SmartDashboard/Field/Robot` onto the robot slot |
