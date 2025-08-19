# Java Quick Reference

Essential Java syntax and patterns for professional development.

## Project Structure

```text
my-java-project/
├── build.gradle                    # Build configuration
├── src/
│   ├── main/java/com/example/      # Source code
│   └── test/java/                  # Tests
└── gradle/                         # Gradle wrapper
```

### Package and Imports

```java
package com.example.service;

import java.util.List;
import java.util.ArrayList;
import static java.lang.Math.PI;

public class MyClass {
    // Class content
}
```

### Main Method

```java
public class Application {
    public static void main(String[] args) {
        System.out.println("Application starting...");
        if (args.length > 0) {
            System.out.println("First argument: " + args[0]);
        }
    }
}
```

## Data Types and Variables

### Primitive Types

```java
// Integer types
int number = 42;               // Most common
long bigNumber = 123456789L;   // Large values

// Floating point
float decimal = 3.14f;         // 32-bit
double precise = 3.14159;      // 64-bit (preferred)

// Other types
boolean isTrue = true;         // true or false
char letter = 'A';             // Single character
```

### Variables and Constants

```java
// Variable declaration
int age = 25;
String name = "Alice";

// Multiple variables
int x = 1, y = 2, z = 3;

// Constants
final double PI = 3.14159;
public static final String APP_NAME = "MyApp";
```

### Access Modifiers

```java
public class Example {
    public int publicVar;        // Accessible everywhere
    private int privateVar;      // Only within this class
    protected int protectedVar;  // Package and subclasses
    int packageVar;              // Package only (default)
}
```

## Methods

### Method Declaration

```java
// Syntax: [access] [static] returnType methodName(parameters)
public static int add(int a, int b) {
    return a + b;
}

public void printMessage(String message) {
    System.out.println("Message: " + message);
}

private boolean isValid(String input) {
    return input != null && !input.trim().isEmpty();
}
```

### Method Overloading

```java
public class Calculator {
    public int add(int a, int b) {
        return a + b;
    }

    public double add(double a, double b) {
        return a + b;
    }

    public int add(int a, int b, int c) {
        return a + b + c;
    }
}
```

### Static vs Instance

```java
public class Counter {
    private static int totalCount = 0;  // Class variable
    private int instanceCount = 0;      // Instance variable

    // Static method - called on class
    public static int getTotalCount() {
        return totalCount;
    }

    // Instance method - called on objects
    public int getInstanceCount() {
        return instanceCount;
    }
}

// Usage
int total = Counter.getTotalCount();  // Static
Counter c = new Counter();
int instance = c.getInstanceCount();  // Instance
```

## Classes and Objects

### Class Structure

```java
public class Student {
    // 1. Constants
    public static final double MAX_GPA = 4.0;

    // 2. Instance variables
    private String name;
    private int age;
    private double gpa;

    // 3. Constructors
    public Student(String name, int age) {
        this.name = name;
        this.age = age;
        this.gpa = 0.0;
    }

    // 4. Public methods
    public String getName() {
        return name;
    }

    public void setGpa(double gpa) {
        if (gpa >= 0.0 && gpa <= MAX_GPA) {
            this.gpa = gpa;
        }
    }

    public boolean isHonorStudent() {
        return gpa >= 3.5;
    }

    @Override
    public String toString() {
        return "Student: " + name + ", Age: " + age + ", GPA: " + gpa;
    }
}
```

### Inheritance

```java
// Parent class
public class Animal {
    protected String name;
    protected int age;

    public Animal(String name, int age) {
        this.name = name;
        this.age = age;
    }

    public void eat() {
        System.out.println(name + " is eating");
    }
}

// Child class
public class Dog extends Animal {
    private String breed;

    public Dog(String name, int age, String breed) {
        super(name, age);  // Call parent constructor
        this.breed = breed;
    }

    @Override
    public void eat() {
        System.out.println(name + " the dog is eating dog food");
    }

    public void bark() {
        System.out.println(name + " is barking: Woof!");
    }
}
```

### Constructor Chaining

```java
public class Student {
    private String name;
    private int age;
    private double gpa;

    // Default constructor
    public Student() {
        this("Unknown", 18, 0.0);
    }

    // Parameterized constructor
    public Student(String name, int age) {
        this(name, age, 0.0);
    }

    // Full constructor
    public Student(String name, int age, double gpa) {
        this.name = Objects.requireNonNull(name);
        this.age = age;
        this.gpa = gpa;
    }
}
```

## Collections and Data Structures

### Arrays

```java
// Declaration and initialization
int[] numbers = {1, 2, 3, 4, 5};
String[] names = {"Alice", "Bob", "Charlie"};
int[][] matrix = {{1, 2}, {3, 4}};

// Array operations
int length = numbers.length;
int first = numbers[0];
int last = numbers[numbers.length - 1];

// Iteration
for (int i = 0; i < numbers.length; i++) {
    System.out.println(numbers[i]);
}

for (int number : numbers) {
    System.out.println(number);
}
```

### ArrayList

```java
import java.util.ArrayList;
import java.util.List;

List<String> list = new ArrayList<>();

// Basic operations
list.add("item");                    // Add to end
list.add(0, "first");               // Add at index
String item = list.get(0);          // Get by index
list.set(0, "updated");             // Update by index
list.remove(0);                     // Remove by index
list.remove("item");                // Remove by value

// Useful methods
int size = list.size();
boolean empty = list.isEmpty();
boolean contains = list.contains("item");
list.clear();

// Iteration
for (String item : list) {
    System.out.println(item);
}
```

### HashMap

```java
import java.util.HashMap;
import java.util.Map;

Map<String, Integer> map = new HashMap<>();

// Basic operations
map.put("key", 123);                    // Add/update
Integer value = map.get("key");         // Get value
map.remove("key");                      // Remove
boolean hasKey = map.containsKey("key");

// Iteration
for (String key : map.keySet()) {
    System.out.println(key + ": " + map.get(key));
}
```

## Control Flow

### Conditional Statements

```java
// If-else
if (condition) {
    // Execute if true
} else if (anotherCondition) {
    // Execute if first false, this true
} else {
    // Execute if all conditions false
}

// Ternary operator
int max = (a > b) ? a : b;
String status = (score >= 70) ? "Pass" : "Fail";

// Switch statement
switch (dayOfWeek) {
    case 1:
        dayName = "Monday";
        break;
    case 2:
        dayName = "Tuesday";
        break;
    case 6:
    case 7:
        dayName = "Weekend";
        break;
    default:
        dayName = "Invalid day";
}

// Modern switch (Java 14+)
String result = switch (grade) {
    case 'A' -> "Excellent";
    case 'B' -> "Good";
    case 'C' -> "Average";
    default -> "Needs improvement";
};
```

### Loops

```java
// For loop
for (int i = 0; i < 10; i++) {
    System.out.println(i);
}

// Enhanced for loop
int[] numbers = {1, 2, 3, 4, 5};
for (int num : numbers) {
    System.out.println(num);
}

// While loop
int count = 0;
while (count < 5) {
    System.out.println(count);
    count++;
}

// Do-while loop
do {
    System.out.println("This runs at least once");
} while (false);

// Loop control
for (int i = 0; i < 10; i++) {
    if (i == 3) continue;  // Skip iteration
    if (i == 7) break;     // Exit loop
    System.out.println(i);
}
```

### Operators

```java
// Arithmetic
int a = 10, b = 3;
int sum = a + b;          // 13
int diff = a - b;         // 7
int product = a * b;      // 30
int quotient = a / b;     // 3
int remainder = a % b;    // 1

// Increment/Decrement
a++;  // Post-increment
++a;  // Pre-increment
a--;  // Post-decrement
--a;  // Pre-decrement

// Comparison
boolean equal = (a == b);        // false
boolean notEqual = (a != b);     // true
boolean less = (a < b);          // false
boolean greater = (a > b);       // true

// Logical
boolean x = true, y = false;
boolean and = x && y;    // false
boolean or = x || y;     // true
boolean not = !x;        // false
```

## Input/Output

### Console Output

```java
// Basic output
System.out.println("Text with newline");
System.out.print("Text without newline");

// Formatted output
System.out.printf("Name: %s, Age: %d, GPA: %.2f%n", name, age, gpa);

// String formatting
String formatted = String.format("Score: %d out of %d", score, total);
```

### Console Input with Scanner

```java
import java.util.Scanner;

Scanner scanner = new Scanner(System.in);

// Reading different types
String name = scanner.nextLine();       // Read entire line
int age = scanner.nextInt();            // Read integer
double gpa = scanner.nextDouble();      // Read double
boolean isStudent = scanner.nextBoolean(); // Read boolean

// Input validation
while (!scanner.hasNextInt()) {
    System.out.print("Please enter a valid number: ");
    scanner.next(); // Clear invalid input
}
int validNumber = scanner.nextInt();

scanner.close(); // Always close resources
```

## Error Handling

### Try-Catch Blocks

```java
try {
    int result = 10 / 0;  // May throw exception
} catch (ArithmeticException e) {
    System.out.println("Cannot divide by zero!");
} catch (Exception e) {
    System.out.println("An error occurred: " + e.getMessage());
} finally {
    System.out.println("This always executes");
}
```

### Try-with-Resources

```java
// Automatically closes resources
try (Scanner scanner = new Scanner(System.in);
     FileWriter writer = new FileWriter("output.txt")) {

    String input = scanner.nextLine();
    writer.write(input);

} catch (IOException e) {
    System.out.println("File error: " + e.getMessage());
}
```

### Throwing Exceptions

```java
public void validateAge(int age) {
    if (age < 0 || age > 150) {
        throw new IllegalArgumentException("Age must be between 0 and 150");
    }
}

public User findUser(String email) throws UserNotFoundException {
    User user = database.findByEmail(email);
    if (user == null) {
        throw new UserNotFoundException("User not found: " + email);
    }
    return user;
}
```

## Common Patterns and Best Practices

### String Operations

```java
String text = "  Hello World  ";
int length = text.length();                    // 15
String trimmed = text.trim();                  // "Hello World"
String upper = text.toUpperCase();             // "  HELLO WORLD  "
String lower = text.toLowerCase();             // "  hello world  "
boolean contains = text.contains("World");     // true
String[] parts = trimmed.split(" ");          // ["Hello", "World"]

// StringBuilder for efficient concatenation
StringBuilder sb = new StringBuilder();
sb.append("Hello").append(" ").append("World");
String result = sb.toString();  // "Hello World"
```

### Input Validation

```java
public void setGrade(double grade) {
    if (grade < 0.0 || grade > 100.0) {
        throw new IllegalArgumentException("Grade must be between 0 and 100");
    }
    this.grade = grade;
}

public void processUser(String name) {
    Objects.requireNonNull(name, "Name cannot be null");
    if (name.trim().isEmpty()) {
        throw new IllegalArgumentException("Name cannot be empty");
    }
    // Process valid name
}
```

### Null Safety

```java
// Defensive programming
public String getUserName(User user) {
    return (user != null && user.getName() != null)
           ? user.getName()
           : "Unknown";
}

// Using Optional (modern approach)
public Optional<User> findUser(String id) {
    User user = database.findById(id);
    return Optional.ofNullable(user);
}

// Usage of Optional
Optional<User> userOpt = findUser("123");
if (userOpt.isPresent()) {
    System.out.println("Found: " + userOpt.get().getName());
} else {
    System.out.println("User not found");
}
```

## Essential Utilities

### Math Class

```java
double max = Math.max(10, 20);          // 20.0
double min = Math.min(10, 20);          // 10.0
double abs = Math.abs(-5);              // 5.0
double sqrt = Math.sqrt(16);            // 4.0
double power = Math.pow(2, 3);          // 8.0
double random = Math.random();          // 0.0 to 1.0
int randomInt = (int)(Math.random() * 10); // 0 to 9
```

### Testing with JUnit 5

```java
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.BeforeEach;
import static org.junit.jupiter.api.Assertions.*;

class CalculatorTest {
    private Calculator calculator;

    @BeforeEach
    void setUp() {
        calculator = new Calculator();
    }

    @Test
    void shouldAddTwoNumbers() {
        // Given
        int a = 5, b = 3;

        // When
        int result = calculator.add(a, b);

        // Then
        assertEquals(8, result);
    }

    @Test
    void shouldThrowExceptionForDivisionByZero() {
        assertThrows(ArithmeticException.class,
                    () -> calculator.divide(10, 0));
    }
}
```

## Naming Conventions

| Element   | Convention | Example                         |
| --------- | ---------- | ------------------------------- |
| Classes   | PascalCase | `StudentManager`, `BankAccount` |
| Methods   | camelCase  | `calculateGrade()`, `isValid()` |
| Variables | camelCase  | `firstName`, `totalScore`       |
| Constants | UPPER_CASE | `MAX_SIZE`, `DEFAULT_NAME`      |
| Packages  | lowercase  | `com.company.project`           |

## Best Practices Summary

- Use meaningful names for variables and methods
- Validate inputs and handle edge cases
- Write unit tests for important functionality
- Use appropriate access modifiers (private by default)
- Follow consistent code formatting
- Document public APIs with Javadoc
- Close resources properly (use try-with-resources)
- Prefer composition over inheritance

---

**Remember**: This reference covers essential Java fundamentals for professional development!
