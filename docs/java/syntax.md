# Java Syntax and Language Fundamentals

Now that your environment is set up, let's learn the core building blocks of Java programs: variables, data types, methods, and control structures that form the foundation of all Java applications.

## Program Structure and Packages

### Basic Program Structure

Every Java program follows this structure:

```java
// Package declaration (optional for learning, required for projects)
package com.example;

// Import statements
import java.util.Scanner;
import java.util.List;

// Class declaration
public class MyProgram {
    // Class variables (fields)
    private static final String PROGRAM_NAME = "MyProgram";

    // Main method - program entry point
    public static void main(String[] args) {
        // Your code goes here
        System.out.println("Hello, Java!");
    }

    // Other methods
    public static void doSomething() {
        // Method implementation
    }
}
```

### Understanding Packages

**Packages** organize related classes and prevent naming conflicts:

```java
// Package declaration must be first line
package com.example.calculator;

public class Calculator {
    // Calculator implementation
}
```

**Package naming conventions**:

- Use reverse domain names: `com.company.project.module`
- All lowercase: `com.example.myapp.util`
- Separate words with dots: `com.example.data.processing`

### Import Statements

Import statements tell Java where to find classes you want to use:

```java
// Import specific class
import java.util.Scanner;
import java.util.ArrayList;

// Import all classes from package (use sparingly)
import java.util.*;

// Import static method (advanced)
import static java.lang.Math.PI;
import static java.lang.System.out;

public class ImportExample {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        ArrayList<String> names = new ArrayList<>();

        // With static import
        out.println("Pi is: " + PI);
    }
}
```

## Variables and Data Types

Variables store data that your program can use and manipulate.

### Declaring Variables

```java
// Pattern: [access_modifier] [static] type variableName = value;
int age = 25;
String name = "Alice";
double price = 19.99;
boolean isActive = true;
```

### Primitive Data Types

Java has eight primitive (basic) data types:

| Type      | Purpose               | Example      | Range                             |
| --------- | --------------------- | ------------ | --------------------------------- |
| `byte`    | Small whole numbers   | `127`        | -128 to 127                       |
| `short`   | Medium whole numbers  | `32000`      | -32,768 to 32,767                 |
| `int`     | Whole numbers         | `42`         | -2.1 billion to 2.1 billion       |
| `long`    | Large whole numbers   | `123456789L` | Very large range                  |
| `float`   | Small decimal numbers | `3.14f`      | 32-bit floating point             |
| `double`  | Decimal numbers       | `3.14159`    | 64-bit floating point (preferred) |
| `boolean` | True/false values     | `true`       | `true` or `false`                 |
| `char`    | Single characters     | `'A'`        | Any Unicode character             |

### Reference Types

**Strings** are the most common reference type:

```java
String message = "Hello, World!";
String empty = "";
String multiWord = "Java programming is powerful";

// String methods
int length = message.length();              // 13
String upper = message.toUpperCase();       // "HELLO, WORLD!"
boolean contains = message.contains("World"); // true
```

### Variable Declaration Patterns

```java
// Single declaration
int count = 0;

// Multiple variables of same type
int x = 10, y = 20, z = 30;

// Declaration without initialization
double price;
price = 29.99;  // Initialize later

// Constants (final variables)
final double PI = 3.14159;
final int MAX_STUDENTS = 30;
```

## Methods and Functions

**Methods** are reusable blocks of code that perform specific tasks.

### Method Syntax

```java
// Pattern: [access_modifier] [static] return_type methodName(parameters) {
//     method body
//     return value; // if not void
// }

public static int addNumbers(int a, int b) {
    int result = a + b;
    return result;
}

public static void printMessage(String message) {
    System.out.println("Message: " + message);
}

public static double calculateArea(double radius) {
    return Math.PI * radius * radius;
}
```

### Using Methods

```java
public class Calculator {
    public static void main(String[] args) {
        // Call methods
        int sum = addNumbers(5, 3);
        printMessage("Welcome to Java");
        double area = calculateArea(5.0);

        System.out.println("Sum: " + sum);
        System.out.println("Circle area: " + area);
    }

    // Method definitions (same as above)
    public static int addNumbers(int a, int b) {
        return a + b;
    }

    public static void printMessage(String message) {
        System.out.println("Message: " + message);
    }

    public static double calculateArea(double radius) {
        return Math.PI * radius * radius;
    }
}
```

### Method Overloading

You can have multiple methods with the same name but different parameters:

```java
public class MathUtils {
    // Different number of parameters
    public static int add(int a, int b) {
        return a + b;
    }

    public static int add(int a, int b, int c) {
        return a + b + c;
    }

    // Different parameter types
    public static double add(double a, double b) {
        return a + b;
    }

    public static String add(String a, String b) {
        return a + b;  // String concatenation
    }
}
```

## Access Modifiers and Static

### Access Modifiers

Control who can access your code:

```java
public class Example {
    public int publicVar = 1;        // Accessible everywhere
    private int privateVar = 2;      // Only within this class
    protected int protectedVar = 3;  // Within package and subclasses
    int packageVar = 4;              // Within package only (default)

    public static void publicMethod() {
        // Anyone can call this method
    }

    private static void privateMethod() {
        // Only this class can call this method
    }
}
```

### Static vs Instance

```java
public class Counter {
    // Static - belongs to the class
    private static int totalCount = 0;

    // Instance - belongs to each object
    private int instanceCount = 0;

    public Counter() {
        totalCount++;      // Increment class counter
        instanceCount++;   // Increment instance counter
    }

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
Counter c1 = new Counter();
Counter c2 = new Counter();

System.out.println(Counter.getTotalCount());  // 2 (static)
System.out.println(c1.getInstanceCount());    // 1 (instance)
System.out.println(c2.getInstanceCount());    // 1 (instance)
```

## Hands-on Practice: Variables and Methods

Let's create a comprehensive example that demonstrates variables, methods, and basic operations using your Gradle project.

### Update Your Main Class

Replace the content of `app/src/main/java/com/example/App.java`:

```java
package com.example;

public class App {

    public static void main(String[] args) {
        System.out.println("=== Java Syntax Demo ===");

        // Demonstrate variables
        demonstrateVariables();

        // Demonstrate methods
        demonstrateMethods();

        // Demonstrate calculations
        demonstrateCalculations();
    }

    public static void demonstrateVariables() {
        System.out.println("\n--- Variable Examples ---");

        // Primitive types
        int studentAge = 16;
        double gpa = 3.85;
        boolean isHonorStudent = true;
        char grade = 'A';

        // Reference type
        String studentName = "Emma Johnson";

        // Constants
        final double MAX_GPA = 4.0;

        // Output
        System.out.println("Student: " + studentName);
        System.out.println("Age: " + studentAge);
        System.out.println("GPA: " + gpa + "/" + MAX_GPA);
        System.out.println("Honor Student: " + isHonorStudent);
        System.out.println("Grade: " + grade);
    }

    public static void demonstrateMethods() {
        System.out.println("\n--- Method Examples ---");

        // Call different methods
        printWelcome("Java Developer");

        int sum = addNumbers(15, 27);
        System.out.println("15 + 27 = " + sum);

        double area = calculateCircleArea(5.0);
        System.out.println("Circle area (radius 5): " + area);

        // Method overloading examples
        System.out.println("Add integers: " + add(5, 3));
        System.out.println("Add doubles: " + add(5.5, 3.2));
        System.out.println("Add strings: " + add("Hello", " World"));
    }

    public static void demonstrateCalculations() {
        System.out.println("\n--- Calculation Examples ---");

        int a = 10, b = 3;
        System.out.println("a = " + a + ", b = " + b);
        System.out.println("Addition: " + (a + b));
        System.out.println("Subtraction: " + (a - b));
        System.out.println("Multiplication: " + (a * b));
        System.out.println("Division: " + (a / b));
        System.out.println("Remainder: " + (a % b));

        // String operations
        String first = "Java";
        String second = "Programming";
        System.out.println("String concat: " + first + " " + second);
        System.out.println("String length: " + (first + second).length());
    }

    // Helper methods
    public static void printWelcome(String title) {
        System.out.println("Welcome, " + title + "!");
    }

    public static int addNumbers(int x, int y) {
        return x + y;
    }

    public static double calculateCircleArea(double radius) {
        return Math.PI * radius * radius;
    }

    // Method overloading examples
    public static int add(int a, int b) {
        return a + b;
    }

    public static double add(double a, double b) {
        return a + b;
    }

    public static String add(String a, String b) {
        return a + b;
    }
}
```

### Build and Run

```bash
# Build the project
./gradlew build

# Run the application
./gradlew run
```

You should see comprehensive output demonstrating variables, methods, and calculations.

## Comments and Documentation

### Types of Comments

```java
// Single line comment - explains the next line

/*
 * Multi-line comment
 * Useful for longer explanations
 * Can span multiple lines
 */

/**
 * Javadoc comment - generates documentation
 * Used for classes, methods, and fields
 * @param radius the radius of the circle
 * @return the area of the circle
 */
public static double calculateArea(double radius) {
    return Math.PI * radius * radius;  // Formula: π × r²
}
```

### Good Commenting Practices

```java
public class TemperatureConverter {
    // Constants for conversion formulas
    private static final double CELSIUS_TO_FAHRENHEIT_RATIO = 9.0 / 5.0;
    private static final double FAHRENHEIT_OFFSET = 32.0;

    /**
     * Converts temperature from Celsius to Fahrenheit
     * Formula: F = (C × 9/5) + 32
     * @param celsius temperature in Celsius
     * @return temperature in Fahrenheit
     */
    public static double celsiusToFahrenheit(double celsius) {
        return (celsius * CELSIUS_TO_FAHRENHEIT_RATIO) + FAHRENHEIT_OFFSET;
    }
}
```

## Basic Operations

### Arithmetic Operations

```java
int a = 10;
int b = 3;

int sum = a + b;        // Addition: 13
int difference = a - b; // Subtraction: 7
int product = a * b;    // Multiplication: 30
int quotient = a / b;   // Division: 3 (integer division)
int remainder = a % b;  // Modulus (remainder): 1
```

### String Operations

```java
String firstName = "John";
String lastName = "Doe";

// String concatenation
String fullName = firstName + " " + lastName;
System.out.println(fullName); // Prints: John Doe

// String length
int nameLength = fullName.length();
System.out.println("Name has " + nameLength + " characters");
```

### Comparison Operations

```java
int x = 5;
int y = 10;

boolean isEqual = (x == y);      // false
boolean isNotEqual = (x != y);   // true
boolean isLess = (x < y);        // true
boolean isGreater = (x > y);     // false
boolean isLessOrEqual = (x <= y); // true
```

## Input and Output

### Output with System.out

```java
// Different output methods
System.out.println("This prints with a new line");
System.out.print("This prints without a new line");
System.out.printf("Formatted output: %s is %d years old%n", "Alice", 25);

// Print variables with formatting
int number = 42;
double price = 19.99;
System.out.println("The answer is: " + number);
System.out.printf("Price: $%.2f%n", price);  // Formats to 2 decimal places
```

### Input with Scanner

```java
import java.util.Scanner;

public class InputExample {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Reading different types of input
        System.out.print("Enter your name: ");
        String name = scanner.nextLine();

        System.out.print("Enter your age: ");
        int age = scanner.nextInt();
        scanner.nextLine(); // Consume leftover newline

        System.out.print("Enter your GPA: ");
        double gpa = scanner.nextDouble();

        System.out.printf("Hello %s, you are %d years old with a %.2f GPA.%n",
                         name, age, gpa);

        scanner.close(); // Always close resources
    }
}
```

### Input Validation

```java
import java.util.Scanner;

public class SafeInput {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Validate integer input
        int age = getValidAge(scanner);
        System.out.println("Valid age entered: " + age);

        scanner.close();
    }

    public static int getValidAge(Scanner scanner) {
        while (true) {
            System.out.print("Enter your age (1-120): ");

            if (scanner.hasNextInt()) {
                int age = scanner.nextInt();
                if (age >= 1 && age <= 120) {
                    return age;
                } else {
                    System.out.println("Age must be between 1 and 120.");
                }
            } else {
                System.out.println("Please enter a valid number.");
                scanner.next(); // Clear invalid input
            }
        }
    }
}
```

## Control Flow

### If-Else Statements

```java
public static void demonstrateConditionals() {
    int score = 85;
    String grade;

    // Basic if-else
    if (score >= 90) {
        grade = "A";
    } else if (score >= 80) {
        grade = "B";
    } else if (score >= 70) {
        grade = "C";
    } else if (score >= 60) {
        grade = "D";
    } else {
        grade = "F";
    }

    System.out.println("Score: " + score + ", Grade: " + grade);

    // Logical operators
    boolean isWeekend = true;
    boolean isHoliday = false;

    if (isWeekend || isHoliday) {
        System.out.println("No work today!");
    }

    if (score >= 70 && score <= 100) {
        System.out.println("Passing grade");
    }
}
```

### Switch Statements

```java
public static void demonstrateSwitch() {
    int dayOfWeek = 3;
    String dayName;

    switch (dayOfWeek) {
        case 1:
            dayName = "Monday";
            break;
        case 2:
            dayName = "Tuesday";
            break;
        case 3:
            dayName = "Wednesday";
            break;
        case 4:
            dayName = "Thursday";
            break;
        case 5:
            dayName = "Friday";
            break;
        case 6:
        case 7:
            dayName = "Weekend";
            break;
        default:
            dayName = "Invalid day";
    }

    System.out.println("Day " + dayOfWeek + " is " + dayName);
}
```

### Loops

```java
public static void demonstrateLoops() {
    System.out.println("--- For Loop ---");
    // Count from 1 to 5
    for (int i = 1; i <= 5; i++) {
        System.out.println("Count: " + i);
    }

    System.out.println("--- While Loop ---");
    int count = 1;
    while (count <= 3) {
        System.out.println("While iteration: " + count);
        count++;
    }

    System.out.println("--- Do-While Loop ---");
    int num = 1;
    do {
        System.out.println("Do-while: " + num);
        num++;
    } while (num <= 2);

    System.out.println("--- Enhanced For Loop (preview) ---");
    int[] numbers = {10, 20, 30, 40, 50};
    for (int number : numbers) {
        System.out.println("Number: " + number);
    }
}
```

## Comprehensive Practice: Interactive Calculator

Let's create a more sophisticated calculator that demonstrates all the concepts we've learned.

### Create a New Class

Create `app/src/main/java/com/example/InteractiveCalculator.java`:

```java
package com.example;

import java.util.Scanner;

public class InteractiveCalculator {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        boolean continueCalculating = true;

        printWelcome();

        while (continueCalculating) {
            try {
                performCalculation(scanner);
                continueCalculating = askToContinue(scanner);
            } catch (Exception e) {
                System.out.println("An error occurred: " + e.getMessage());
                System.out.println("Please try again.");
            }
        }

        System.out.println("Thank you for using the calculator!");
        scanner.close();
    }

    /**
     * Prints welcome message and instructions
     */
    public static void printWelcome() {
        System.out.println("================================");
        System.out.println("    Interactive Calculator");
        System.out.println("================================");
        System.out.println("Operations: +, -, *, /, %, power");
    }

    /**
     * Performs a single calculation based on user input
     */
    public static void performCalculation(Scanner scanner) {
        System.out.print("\nEnter first number: ");
        double num1 = getValidNumber(scanner);

        System.out.print("Enter operation (+, -, *, /, %, power): ");
        String operation = scanner.next().toLowerCase();

        System.out.print("Enter second number: ");
        double num2 = getValidNumber(scanner);

        double result = calculate(num1, operation, num2);

        // Format output nicely
        System.out.printf("Result: %.2f %s %.2f = %.2f%n",
                         num1, operation, num2, result);
    }

    /**
     * Gets a valid number from user input
     */
    public static double getValidNumber(Scanner scanner) {
        while (!scanner.hasNextDouble()) {
            System.out.print("Invalid input. Please enter a number: ");
            scanner.next(); // Clear invalid input
        }
        return scanner.nextDouble();
    }

    /**
     * Performs the calculation based on the operation
     */
    public static double calculate(double num1, String operation, double num2) {
        switch (operation) {
            case "+":
                return add(num1, num2);
            case "-":
                return subtract(num1, num2);
            case "*":
                return multiply(num1, num2);
            case "/":
                return divide(num1, num2);
            case "%":
                return modulus(num1, num2);
            case "power":
                return power(num1, num2);
            default:
                System.out.println("Unknown operation: " + operation);
                return 0;
        }
    }

    // Basic arithmetic methods
    public static double add(double a, double b) {
        return a + b;
    }

    public static double subtract(double a, double b) {
        return a - b;
    }

    public static double multiply(double a, double b) {
        return a * b;
    }

    public static double divide(double a, double b) {
        if (b == 0) {
            System.out.println("Error: Division by zero!");
            return Double.NaN;
        }
        return a / b;
    }

    public static double modulus(double a, double b) {
        if (b == 0) {
            System.out.println("Error: Modulus by zero!");
            return Double.NaN;
        }
        return a % b;
    }

    public static double power(double base, double exponent) {
        return Math.pow(base, exponent);
    }

    /**
     * Asks user if they want to continue calculating
     */
    public static boolean askToContinue(Scanner scanner) {
        System.out.print("Continue calculating? (y/n): ");
        String response = scanner.next().toLowerCase();
        return response.equals("y") || response.equals("yes");
    }
}
```

### Update build.gradle to Run Multiple Classes

Modify `app/build.gradle` to allow running different main classes:

```gradle
// Add this task to run the InteractiveCalculator
task runCalculator(type: JavaExec) {
    classpath = sourceSets.main.runtimeClasspath
    mainClass = 'com.example.InteractiveCalculator'
}
```

### Run the Calculator

```bash
# Run the default App
./gradlew run

# Run the Interactive Calculator
./gradlew runCalculator
```

## Error Handling Basics

### Common Runtime Errors

```java
public class ErrorExamples {
    public static void demonstrateCommonErrors() {
        // Division by zero
        try {
            int result = 10 / 0;  // ArithmeticException
        } catch (ArithmeticException e) {
            System.out.println("Cannot divide by zero!");
        }

        // Array index out of bounds (preview)
        try {
            int[] numbers = {1, 2, 3};
            int value = numbers[5];  // IndexOutOfBoundsException
        } catch (IndexOutOfBoundsException e) {
            System.out.println("Array index out of bounds!");
        }

        // Number format exception
        try {
            int number = Integer.parseInt("not_a_number");
        } catch (NumberFormatException e) {
            System.out.println("Invalid number format!");
        }
    }
}
```

## Key Concepts to Remember

### Syntax Rules

1. **Case Sensitivity**: Java is case-sensitive (`myVariable` ≠ `MyVariable`)
2. **Semicolons**: Every statement ends with a semicolon (`;`)
3. **Curly Braces**: Use `{}` to group code in blocks
4. **Indentation**: Use consistent indentation (4 spaces recommended)

### Naming Conventions

```java
// Variables and methods: camelCase
int studentAge = 20;
String firstName = "John";
public static void calculateGrade() { }

// Classes: PascalCase
public class StudentManager { }

// Constants: UPPER_CASE with underscores
public static final int MAX_STUDENTS = 30;
public static final double PI = 3.14159;

// Packages: lowercase with dots
package com.example.calculator;
```

### Best Practices

```java
public class BestPractices {
    // Use meaningful names
    int studentCount;           // Good
    int sc;                     // Poor

    // Initialize variables
    int totalScore = 0;         // Good
    int totalScore;             // Potentially problematic

    // Use constants for fixed values
    private static final int PASSING_GRADE = 70;

    // Close resources
    public static void readInput() {
        Scanner scanner = new Scanner(System.in);
        // ... use scanner
        scanner.close();  // Always close
    }
}
```

## Common Mistakes to Avoid

### Syntax Errors

```java
// ❌ Common mistakes
int age = "twenty";              // Type mismatch
if (age = 18) { }               // Assignment instead of comparison
System.out.println("Hello")     // Missing semicolon

// ✅ Correct versions
int age = 20;
if (age == 18) { }
System.out.println("Hello");
```

### Logic Errors

```java
// ❌ Off-by-one error
for (int i = 1; i <= 10; i++) {
    // This runs 10 times (1 to 10)
}

// ✅ If you want 10 iterations starting from 0
for (int i = 0; i < 10; i++) {
    // This runs 10 times (0 to 9)
}
```

## What's Next?

Excellent! You now have a solid foundation in Java syntax, including:

- Package structure and imports
- Variables and data types
- Methods and method overloading
- Access modifiers and static keywords
- Control flow structures
- Input/output operations
- Basic error handling

Next, we'll explore Java's powerful data structures that help you organize and manipulate collections of data.

[Next: Data Structures →](data-structures.md)

## Practice Exercises

Try these exercises to reinforce your learning:

### Exercise 1: Grade Management System

Create a program that:

- Reads student names and test scores
- Calculates letter grades based on numeric scores
- Displays a summary report
- Uses methods for each major operation

### Exercise 2: Unit Converter

Build a converter that:

- Supports multiple unit types (temperature, distance, weight)
- Validates user input
- Uses switch statements for operation selection
- Includes proper error handling

### Exercise 3: Simple Text Analyzer

Create a program that:

- Reads a sentence from the user
- Counts words, characters, and vowels
- Displays statistics in a formatted report
- Uses string methods and loops

Remember: Focus on understanding concepts rather than rushing through code. Practice makes perfect!
