# Java Quick Reference

A concise reference of essential Java syntax, concepts, and best practices for daily programming.

## Basic Syntax

### Program Structure

```java
public class ClassName {
    public static void main(String[] args) {
        // Program starts here
    }
}
```

### Comments

```java
// Single line comment

/*
 * Multi-line comment
 * Useful for longer explanations
 */

/**
 * Javadoc comment for documentation
 * @param paramName description
 * @return description
 */
```

## Data Types and Variables

### Primitive Types

```java
// Integers
byte smallNumber = 127;        // -128 to 127
short mediumNumber = 32000;    // -32,768 to 32,767
int number = 42;               // -2.1B to 2.1B
long bigNumber = 123456789L;   // Very large range

// Floating point
float decimal = 3.14f;         // 32-bit decimal
double precise = 3.14159;      // 64-bit decimal (preferred)

// Other types
boolean isTrue = true;         // true or false
char letter = 'A';             // Single character
```

### Reference Types

```java
String text = "Hello, World!";
String empty = "";
String name = null; // No value assigned
```

### Variable Declaration

```java
// Declare and initialize
int age = 25;
String name = "Alice";

// Declare first, initialize later
double salary;
salary = 50000.0;

// Multiple variables of same type
int x = 1, y = 2, z = 3;
```

## Operators

### Arithmetic

```java
int a = 10, b = 3;
int sum = a + b;          // Addition: 13
int diff = a - b;         // Subtraction: 7
int product = a * b;      // Multiplication: 30
int quotient = a / b;     // Division: 3
int remainder = a % b;    // Modulus: 1

// Increment/Decrement
a++;  // Post-increment: use value, then add 1
++a;  // Pre-increment: add 1, then use value
a--;  // Post-decrement: use value, then subtract 1
--a;  // Pre-decrement: subtract 1, then use value
```

### Comparison

```java
int x = 5, y = 10;
boolean equal = (x == y);        // false
boolean notEqual = (x != y);     // true
boolean less = (x < y);          // true
boolean greater = (x > y);       // false
boolean lessEqual = (x <= y);    // true
boolean greaterEqual = (x >= y); // false
```

### Logical

```java
boolean a = true, b = false;
boolean and = a && b;    // Logical AND: false
boolean or = a || b;     // Logical OR: true
boolean not = !a;        // Logical NOT: false
```

## Control Flow

### If Statements

```java
if (condition) {
    // Execute if true
} else if (anotherCondition) {
    // Execute if first false, this true
} else {
    // Execute if all conditions false
}

// Ternary operator
int max = (a > b) ? a : b;
```

### Switch Statement

```java
switch (variable) {
    case value1:
        // Code for value1
        break;
    case value2:
        // Code for value2
        break;
    default:
        // Default case
        break;
}
```

### Loops

```java
// For loop
for (int i = 0; i < 10; i++) {
    System.out.println(i);
}

// Enhanced for loop (for arrays/collections)
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
    // Execute at least once
} while (condition);
```

## Arrays

### Declaration and Initialization

```java
// Method 1: Declare then initialize
int[] numbers = new int[5];
numbers[0] = 10;

// Method 2: Declare and initialize
int[] scores = {95, 87, 92, 78, 85};
String[] names = {"Alice", "Bob", "Charlie"};

// 2D arrays
int[][] matrix = new int[3][3];
int[][] grid = {{1, 2}, {3, 4}, {5, 6}};
```

### Array Operations

```java
int[] arr = {10, 20, 30, 40, 50};

// Access elements
int first = arr[0];
int last = arr[arr.length - 1];

// Get length
int size = arr.length;

// Loop through array
for (int i = 0; i < arr.length; i++) {
    System.out.println(arr[i]);
}

// Enhanced for loop
for (int value : arr) {
    System.out.println(value);
}
```

## Collections (ArrayList and HashMap)

### ArrayList

```java
import java.util.ArrayList;

ArrayList<String> list = new ArrayList<>();

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
list.clear();                       // Remove all
```

### HashMap

```java
import java.util.HashMap;

HashMap<String, Integer> map = new HashMap<>();

// Basic operations
map.put("key", 123);                // Add/update
Integer value = map.get("key");     // Get value
map.remove("key");                  // Remove

// Useful methods
boolean hasKey = map.containsKey("key");
boolean hasValue = map.containsValue(123);
int size = map.size();

// Iterate through map
for (String key : map.keySet()) {
    System.out.println(key + ": " + map.get(key));
}
```

## Methods

### Method Declaration

```java
// Basic method
public returnType methodName(parameterType parameterName) {
    // Method body
    return value; // If return type is not void
}

// Examples
public int add(int a, int b) {
    return a + b;
}

public void printMessage(String message) {
    System.out.println(message);
}

public boolean isEven(int number) {
    return number % 2 == 0;
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

## Classes and Objects

### Basic Class Structure

```java
public class Student {
    // Instance variables (private)
    private String name;
    private int age;
    private double gpa;

    // Constructor
    public Student(String name, int age) {
        this.name = name;
        this.age = age;
        this.gpa = 0.0;
    }

    // Getters
    public String getName() {
        return name;
    }

    public int getAge() {
        return age;
    }

    // Setters
    public void setGpa(double gpa) {
        if (gpa >= 0.0 && gpa <= 4.0) {
            this.gpa = gpa;
        }
    }

    // Other methods
    public boolean isHonorStudent() {
        return gpa >= 3.5;
    }

    @Override
    public String toString() {
        return "Student: " + name + ", Age: " + age + ", GPA: " + gpa;
    }
}
```

### Using Objects

```java
// Create objects
Student alice = new Student("Alice", 20);
Student bob = new Student("Bob", 19);

// Use methods
alice.setGpa(3.8);
String name = alice.getName();
boolean honors = alice.isHonorStudent();

// Print object
System.out.println(alice); // Calls toString()
```

## Input and Output

### Output

```java
// Print with newline
System.out.println("Hello, World!");

// Print without newline
System.out.print("Hello ");
System.out.print("World!");

// Formatted output
String name = "Alice";
int age = 25;
System.out.printf("Name: %s, Age: %d%n", name, age);

// String formatting
String formatted = String.format("Score: %.2f", 85.678);
```

### Input with Scanner

```java
import java.util.Scanner;

Scanner scanner = new Scanner(System.in);

// Read different types
String text = scanner.nextLine();      // Read entire line
String word = scanner.next();          // Read single word
int number = scanner.nextInt();        // Read integer
double decimal = scanner.nextDouble(); // Read double
boolean flag = scanner.nextBoolean();  // Read boolean

// Always close scanner
scanner.close();
```

## Exception Handling

### Try-Catch

```java
try {
    // Code that might throw exception
    int result = 10 / 0;
} catch (ArithmeticException e) {
    System.out.println("Cannot divide by zero!");
} catch (Exception e) {
    System.out.println("An error occurred: " + e.getMessage());
} finally {
    // Always executes
    System.out.println("Cleanup code here");
}
```

### Throwing Exceptions

```java
public void setAge(int age) {
    if (age < 0) {
        throw new IllegalArgumentException("Age cannot be negative");
    }
    this.age = age;
}
```

## Common Utility Classes

### String Methods

```java
String str = "Hello World";
int length = str.length();              // 11
char charAt = str.charAt(0);            // 'H'
String upper = str.toUpperCase();       // "HELLO WORLD"
String lower = str.toLowerCase();       // "hello world"
boolean contains = str.contains("World"); // true
String[] parts = str.split(" ");       // ["Hello", "World"]
String trimmed = "  text  ".trim();     // "text"
```

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

## Naming Conventions

| Element   | Convention | Example                         |
| --------- | ---------- | ------------------------------- |
| Classes   | PascalCase | `StudentManager`, `BankAccount` |
| Methods   | camelCase  | `calculateGrade()`, `isValid()` |
| Variables | camelCase  | `firstName`, `totalScore`       |
| Constants | UPPER_CASE | `MAX_SIZE`, `DEFAULT_NAME`      |
| Packages  | lowercase  | `com.company.project`           |

## Best Practices

### Code Style

```java
// Good naming
String firstName = "John";
boolean isValid = true;
ArrayList<Student> honorsStudents = new ArrayList<>();

// Method organization
public class Calculator {
    // Constants first
    public static final double PI = 3.14159;

    // Instance variables
    private double result;

    // Constructors
    public Calculator() {
        this.result = 0.0;
    }

    // Public methods
    public double add(double a, double b) {
        return a + b;
    }

    // Private methods
    private void validateInput(double input) {
        if (Double.isNaN(input)) {
            throw new IllegalArgumentException("Input cannot be NaN");
        }
    }
}
```

### Input Validation

```java
public void setGrade(double grade) {
    if (grade < 0.0 || grade > 100.0) {
        throw new IllegalArgumentException("Grade must be between 0 and 100");
    }
    this.grade = grade;
}

public String getName() {
    return name != null ? name : "Unknown";
}
```

### Error Prevention

```java
// Check for null before using
if (list != null && !list.isEmpty()) {
    // Safe to process list
}

// Validate array bounds
if (index >= 0 && index < array.length) {
    return array[index];
}

// Close resources
Scanner scanner = new Scanner(System.in);
try {
    // Use scanner
} finally {
    scanner.close();
}
```

## Common Patterns

### Builder Pattern (Simple)

```java
public class StudentBuilder {
    private String name;
    private int age;
    private double gpa;

    public StudentBuilder setName(String name) {
        this.name = name;
        return this;
    }

    public StudentBuilder setAge(int age) {
        this.age = age;
        return this;
    }

    public Student build() {
        return new Student(name, age, gpa);
    }
}

// Usage
Student student = new StudentBuilder()
    .setName("Alice")
    .setAge(20)
    .build();
```

### Factory Pattern (Simple)

```java
public class ShapeFactory {
    public static Shape createShape(String type) {
        switch (type.toLowerCase()) {
            case "circle":
                return new Circle();
            case "rectangle":
                return new Rectangle();
            default:
                throw new IllegalArgumentException("Unknown shape: " + type);
        }
    }
}
```

---

**Remember**: This reference covers the fundamentals. Java is a rich language with many more features to explore as you advance in your programming journey!
