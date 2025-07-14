# Basic Java Syntax and Data Types

Now that your environment is set up, let's learn the fundamental building blocks of Java programs: variables, data types, and basic syntax.

## Java Program Structure

Every Java program follows this basic structure:

```java
public class ClassName {
    public static void main(String[] args) {
        // Your code goes here
    }
}
```

Let's break this down:

- `public class ClassName` - Defines a class (the filename must match)
- `public static void main(String[] args)` - The starting point of your program
- `{}` - Curly braces group code together
- `//` - Single line comments (ignored when running)

## Variables and Data Types

Variables store data that your program can use and manipulate.

### Declaring Variables

```java
// Pattern: type variableName = value;
int age = 25;
String name = "Alice";
double price = 19.99;
boolean isActive = true;
```

### Primitive Data Types

Java has eight primitive (basic) data types:

| Type      | Purpose               | Example      | Range                          |
| --------- | --------------------- | ------------ | ------------------------------ |
| `int`     | Whole numbers         | `42`         | -2.1 billion to 2.1 billion    |
| `double`  | Decimal numbers       | `3.14`       | Very large range with decimals |
| `boolean` | True/false values     | `true`       | `true` or `false`              |
| `char`    | Single characters     | `'A'`        | Any Unicode character          |
| `byte`    | Small whole numbers   | `127`        | -128 to 127                    |
| `short`   | Medium whole numbers  | `32000`      | -32,768 to 32,767              |
| `long`    | Large whole numbers   | `123456789L` | Very large range               |
| `float`   | Small decimal numbers | `3.14f`      | Smaller range than double      |

### String (Reference Type)

`String` is not a primitive type, but it's used so frequently it feels like one:

```java
String message = "Hello, World!";
String empty = "";
String multiWord = "Java is fun";
```

## Hands-on Practice: Variables

Create a file called `Variables.java`:

```java
public class Variables {
    public static void main(String[] args) {
        // Declare and initialize variables
        int studentAge = 16;
        double gpa = 3.85;
        String studentName = "Emma";
        boolean isHonorStudent = true;
        char grade = 'A';

        // Print the variables
        System.out.println("Student Information:");
        System.out.println("Name: " + studentName);
        System.out.println("Age: " + studentAge);
        System.out.println("GPA: " + gpa);
        System.out.println("Honor Student: " + isHonorStudent);
        System.out.println("Grade: " + grade);
    }
}
```

Compile and run:

```bash
javac Variables.java
java Variables
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

### Output with System.out.println()

```java
System.out.println("This prints with a new line");
System.out.print("This prints without a new line");
System.out.println(" - continuing on same line");

// Print variables
int number = 42;
System.out.println("The answer is: " + number);
```

### Input with Scanner

```java
import java.util.Scanner;

public class InputExample {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Enter your name: ");
        String name = scanner.nextLine();

        System.out.print("Enter your age: ");
        int age = scanner.nextInt();

        System.out.println("Hello " + name + ", you are " + age + " years old.");

        scanner.close();
    }
}
```

## Hands-on Practice: Simple Calculator

Create `Calculator.java`:

```java
import java.util.Scanner;

public class Calculator {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.println("Simple Calculator");
        System.out.print("Enter first number: ");
        double num1 = scanner.nextDouble();

        System.out.print("Enter second number: ");
        double num2 = scanner.nextDouble();

        // Perform calculations
        double sum = num1 + num2;
        double difference = num1 - num2;
        double product = num1 * num2;
        double quotient = num1 / num2;

        // Display results
        System.out.println("Results:");
        System.out.println(num1 + " + " + num2 + " = " + sum);
        System.out.println(num1 + " - " + num2 + " = " + difference);
        System.out.println(num1 + " * " + num2 + " = " + product);
        System.out.println(num1 + " / " + num2 + " = " + quotient);

        scanner.close();
    }
}
```

## Control Flow Basics

### If Statements

```java
int score = 85;

if (score >= 90) {
    System.out.println("Grade: A");
} else if (score >= 80) {
    System.out.println("Grade: B");
} else if (score >= 70) {
    System.out.println("Grade: C");
} else {
    System.out.println("Grade: F");
}
```

### For Loops

```java
// Count from 1 to 5
for (int i = 1; i <= 5; i++) {
    System.out.println("Count: " + i);
}
```

### While Loops

```java
int count = 1;
while (count <= 3) {
    System.out.println("Loop iteration: " + count);
    count++;
}
```

## Common Patterns and Examples

### Temperature Converter

```java
import java.util.Scanner;

public class TemperatureConverter {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Enter temperature in Celsius: ");
        double celsius = scanner.nextDouble();

        double fahrenheit = (celsius * 9.0 / 5.0) + 32;

        System.out.println(celsius + "°C = " + fahrenheit + "°F");

        scanner.close();
    }
}
```

### Number Guessing Game

```java
import java.util.Scanner;
import java.util.Random;

public class NumberGuess {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        Random random = new Random();

        int secretNumber = random.nextInt(10) + 1; // 1-10

        System.out.println("Guess a number between 1 and 10:");
        int guess = scanner.nextInt();

        if (guess == secretNumber) {
            System.out.println("Correct! The number was " + secretNumber);
        } else {
            System.out.println("Wrong! The number was " + secretNumber);
        }

        scanner.close();
    }
}
```

## Key Concepts to Remember

1. **Case Sensitivity**: Java is case-sensitive (`myVariable` ≠ `MyVariable`)
2. **Semicolons**: Every statement ends with a semicolon (`;`)
3. **Curly Braces**: Use `{}` to group code in blocks
4. **Naming Conventions**:
   - Variables and methods: `camelCase`
   - Classes: `PascalCase`
   - Constants: `UPPER_CASE`

## Common Mistakes to Avoid

- ❌ Forgetting semicolons at the end of statements
- ❌ Mismatching variable types (`int age = "twenty"`)
- ❌ Not closing Scanner objects
- ❌ Using `=` instead of `==` for comparison
- ✅ Reading error messages carefully - they tell you exactly what's wrong

## What's Next?

Great! You now understand Java's basic syntax and data types. Next, we'll explore Java's built-in data structures that help you work with collections of data.

[Next: Data Structures →](data-structures.md)

## Practice Exercises

Try these exercises to reinforce your learning:

1. **Personal Info Program**: Create a program that asks for and displays personal information (name, age, favorite color)

2. **BMI Calculator**: Calculate Body Mass Index using weight and height inputs

3. **Simple Interest Calculator**: Calculate simple interest given principal, rate, and time

4. **Grade Calculator**: Input multiple test scores and calculate the average grade
