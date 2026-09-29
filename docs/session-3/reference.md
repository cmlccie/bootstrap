# Session 3 Reference

## 🧱 Command-based vocabulary

| Word | Meaning |
| ---- | ------- |
| Subsystem | A class that owns one piece of hardware and offers simple methods for it |
| Command | A class that describes one behavior using one or more subsystems |
| Scheduler | Runs subsystems' `periodic()` and commands' `execute()` every 20 ms |
| Requirement | A subsystem a command needs. Two commands cannot require the same subsystem at once |
| Default command | The command a subsystem runs when nothing else needs it. Session 4 |
| Trigger | Watches a boolean and starts a command when it changes |

## 💡 Romi onboard I/O

| Pin | Used as | Code |
| --- | ------- | ---- |
| DIO 0 | Button A | `m_onboardIO.getButtonAPressed()` |
| DIO 1 | Green LED | `m_onboardIO.setGreenLed(true)` |
| DIO 2 | Button C | `m_onboardIO.getButtonCPressed()` |
| DIO 3 | Yellow LED | `m_onboardIO.setYellowLed(true)` |

## 🧪 JUnit cheat sheet

```java
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;
import org.junit.jupiter.api.Test;

class SomethingTest {
  @Test
  void describesWhatShouldHappen() {
    assertTrue(condition);                    // fails if false
    assertFalse(condition);                   // fails if true
    assertEquals(expected, actual);           // whole numbers, text, booleans
    assertEquals(expected, actual, 1e-9);     // decimals: allow a tiny difference
  }
}
```

| Annotation | Meaning |
| ---------- | ------- |
| `@Test` | This method is a test |
| `@Disabled("why")` | Skip this test or class |
| `@BeforeEach` | Run before every test in the class. Session 5 |
| `@AfterEach` | Run after every test in the class. Session 5 |

Test files live in `src/test/java/`, in the same package as the class they test, named `ClassNameTest.java`.

The HTML report after `./gradlew test` is at `build/reports/tests/test/index.html`.

## ⌨️ Commands

```bash
./gradlew test                 # run all enabled tests
./gradlew test --tests '*Rsl*' # run only tests whose name matches
```
