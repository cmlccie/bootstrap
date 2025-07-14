# Idiomatic Java

Writing code that works is just the first step. Writing code that is clean, readable, and follows Java conventions is what makes you a professional developer. This lesson covers the essential practices that make your Java code idiomatic.

## Naming Conventions

Good names make your code self-documenting and easier to understand.

### Classes

Use **PascalCase** (first letter capitalized):

```java
// Good
public class StudentGradeManager {
    // class content
}

public class BankAccount {
    // class content
}

// Avoid
public class studentgrademanager { }
public class bank_account { }
```

### Variables and Methods

Use **camelCase** (first letter lowercase):

```java
// Good
String firstName = "John";
int studentAge = 18;
double accountBalance = 1500.75;

public void calculateTotalGrade() {
    // method implementation
}

public boolean isValidEmail(String email) {
    // method implementation
}

// Avoid
String first_name = "John";
int StudentAge = 18;
public void CalculateTotalGrade() { }
```

### Constants

Use **UPPER_CASE** with underscores:

```java
// Good
public static final int MAX_STUDENTS = 30;
public static final double PI = 3.14159;
public static final String DEFAULT_NAME = "Unknown";

// Avoid
public static final int maxStudents = 30;
public static final double pi = 3.14159;
```

## Code Organization and Structure

### Class Organization

Organize class members in this order:

```java
public class Student {
    // 1. Constants
    public static final int MAX_CREDITS = 20;

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
        if (gpa >= 0.0 && gpa <= 4.0) {
            this.gpa = gpa;
        }
    }

    // 5. Private methods
    private boolean isValidGpa(double gpa) {
        return gpa >= 0.0 && gpa <= 4.0;
    }
}
```

### Method Guidelines

Keep methods focused and reasonably sized:

```java
// Good - does one thing well
public double calculateGPA(ArrayList<Double> grades) {
    if (grades.isEmpty()) {
        return 0.0;
    }

    double sum = 0.0;
    for (double grade : grades) {
        sum += grade;
    }

    return sum / grades.size();
}

// Good - clear and descriptive
public boolean isEligibleForHonors(double gpa, int creditHours) {
    return gpa >= 3.5 && creditHours >= 12;
}
```

## Comments and Documentation

### When to Comment

```java
public class BankAccount {
    private double balance;

    // Constructor initializes account with starting balance
    public BankAccount(double initialBalance) {
        if (initialBalance < 0) {
            throw new IllegalArgumentException("Initial balance cannot be negative");
        }
        this.balance = initialBalance;
    }

    /**
     * Withdraws money from the account
     * @param amount the amount to withdraw
     * @return true if withdrawal successful, false if insufficient funds
     */
    public boolean withdraw(double amount) {
        if (amount <= 0) {
            return false; // Invalid amount
        }

        if (amount > balance) {
            return false; // Insufficient funds
        }

        balance -= amount;
        return true;
    }

    // Simple getter - no comment needed
    public double getBalance() {
        return balance;
    }
}
```

### Comment Guidelines

- **Explain why, not what** - the code shows what it does
- **Comment complex logic** - help others understand your reasoning
- **Use Javadoc** for public methods that others will use
- **Keep comments current** - update them when you change code

## Error Handling

### Input Validation

Always validate inputs to prevent errors:

```java
public class Calculator {
    public double divide(double numerator, double denominator) {
        if (denominator == 0) {
            throw new IllegalArgumentException("Cannot divide by zero");
        }
        return numerator / denominator;
    }

    public int getArrayElement(int[] array, int index) {
        if (array == null) {
            throw new IllegalArgumentException("Array cannot be null");
        }
        if (index < 0 || index >= array.length) {
            throw new IndexOutOfBoundsException("Index out of bounds: " + index);
        }
        return array[index];
    }
}
```

### Defensive Programming

```java
public class StudentManager {
    private ArrayList<String> students;

    public StudentManager() {
        this.students = new ArrayList<>();
    }

    public void addStudent(String name) {
        // Validate input
        if (name == null || name.trim().isEmpty()) {
            throw new IllegalArgumentException("Student name cannot be null or empty");
        }

        // Check for duplicates
        if (students.contains(name.trim())) {
            System.out.println("Student " + name + " already exists");
            return;
        }

        students.add(name.trim());
    }

    public ArrayList<String> getStudents() {
        // Return a copy to prevent external modification
        return new ArrayList<>(students);
    }
}
```

## Object-Oriented Best Practices

### Encapsulation

Keep instance variables private and provide controlled access:

```java
public class Temperature {
    private double celsius;

    public Temperature(double celsius) {
        setCelsius(celsius);
    }

    public void setCelsius(double celsius) {
        if (celsius < -273.15) {
            throw new IllegalArgumentException("Temperature cannot be below absolute zero");
        }
        this.celsius = celsius;
    }

    public double getCelsius() {
        return celsius;
    }

    public double getFahrenheit() {
        return (celsius * 9.0 / 5.0) + 32;
    }

    public double getKelvin() {
        return celsius + 273.15;
    }
}
```

### Constructors

Provide clear, useful constructors:

```java
public class Book {
    private String title;
    private String author;
    private int pages;
    private boolean isAvailable;

    // Primary constructor
    public Book(String title, String author, int pages) {
        if (title == null || title.trim().isEmpty()) {
            throw new IllegalArgumentException("Title cannot be empty");
        }
        if (author == null || author.trim().isEmpty()) {
            throw new IllegalArgumentException("Author cannot be empty");
        }
        if (pages <= 0) {
            throw new IllegalArgumentException("Pages must be positive");
        }

        this.title = title.trim();
        this.author = author.trim();
        this.pages = pages;
        this.isAvailable = true; // Default to available
    }

    // Convenience constructor
    public Book(String title, String author) {
        this(title, author, 0); // Unknown page count
    }
}
```

## Hands-on Practice: Refactoring Example

Here's a poorly written class that we'll improve:

**Before (not idiomatic):**

```java
public class student {
    public String n;
    public int a;
    public double g;

    public student(String name, int age, double grade) {
        n = name;
        a = age;
        g = grade;
    }

    public void printinfo() {
        System.out.println(n + " " + a + " " + g);
    }
}
```

**After (idiomatic):**

```java
/**
 * Represents a student with basic information and academic data
 */
public class Student {
    private String name;
    private int age;
    private double gpa;

    /**
     * Creates a new student
     * @param name the student's full name
     * @param age the student's age in years
     * @param gpa the student's GPA (0.0 to 4.0)
     */
    public Student(String name, int age, double gpa) {
        if (name == null || name.trim().isEmpty()) {
            throw new IllegalArgumentException("Name cannot be null or empty");
        }
        if (age < 0 || age > 150) {
            throw new IllegalArgumentException("Age must be between 0 and 150");
        }
        if (gpa < 0.0 || gpa > 4.0) {
            throw new IllegalArgumentException("GPA must be between 0.0 and 4.0");
        }

        this.name = name.trim();
        this.age = age;
        this.gpa = gpa;
    }

    // Getters
    public String getName() {
        return name;
    }

    public int getAge() {
        return age;
    }

    public double getGpa() {
        return gpa;
    }

    // Setters with validation
    public void setGpa(double gpa) {
        if (gpa < 0.0 || gpa > 4.0) {
            throw new IllegalArgumentException("GPA must be between 0.0 and 4.0");
        }
        this.gpa = gpa;
    }

    /**
     * Returns a formatted string representation of the student
     */
    public String getStudentInfo() {
        return String.format("Student: %s, Age: %d, GPA: %.2f", name, age, gpa);
    }

    /**
     * Checks if the student is eligible for honors (GPA >= 3.5)
     */
    public boolean isHonorsEligible() {
        return gpa >= 3.5;
    }

    @Override
    public String toString() {
        return getStudentInfo();
    }
}
```

## String Handling Best Practices

### String Formatting

Use `String.format()` for complex string building:

```java
// Good
String message = String.format("Student %s (age %d) has GPA %.2f",
                               name, age, gpa);

// Avoid for complex formatting
String message = "Student " + name + " (age " + age + ") has GPA " + gpa;
```

### StringBuilder for Multiple Concatenations

```java
// Good for multiple concatenations
StringBuilder sb = new StringBuilder();
sb.append("Student Report:\n");
for (Student student : students) {
    sb.append(student.getName()).append(": ").append(student.getGpa()).append("\n");
}
String report = sb.toString();

// Avoid for many concatenations (inefficient)
String report = "";
for (Student student : students) {
    report += student.getName() + ": " + student.getGpa() + "\n";
}
```

## Performance and Efficiency

### Choose Appropriate Data Structures

```java
// Use ArrayList for frequent access by index
ArrayList<String> names = new ArrayList<>();

// Use HashMap for key-based lookups
HashMap<String, Student> studentMap = new HashMap<>();

// Use HashSet for uniqueness checking
HashSet<String> uniqueEmails = new HashSet<>();
```

### Avoid Premature Optimization

Focus on correctness first, then optimize if needed:

```java
// Good - clear and correct
public double calculateAverage(ArrayList<Double> grades) {
    if (grades.isEmpty()) {
        return 0.0;
    }

    double sum = 0.0;
    for (double grade : grades) {
        sum += grade;
    }

    return sum / grades.size();
}
```

## Essential Practices Checklist

### Code Style

- ✅ Use consistent naming conventions
- ✅ Keep methods focused and small
- ✅ Organize class members logically
- ✅ Use meaningful variable names
- ✅ Follow Java indentation standards (4 spaces or 1 tab)

### Functionality

- ✅ Validate all inputs
- ✅ Handle edge cases (null, empty, negative values)
- ✅ Use appropriate data types
- ✅ Make instance variables private
- ✅ Provide useful constructors

### Documentation

- ✅ Comment complex logic
- ✅ Use Javadoc for public methods
- ✅ Choose descriptive names over comments when possible
- ✅ Keep comments up to date

## What's Next?

Congratulations! You now have a solid foundation in Java fundamentals and best practices. You're ready to write clean, professional Java code.

To continue your Java journey:

- **Build Projects**: Apply these concepts in real programs
- **Study Open Source Code**: See how professionals structure Java projects
- **Learn Advanced Topics**: Objects, inheritance, interfaces, and design patterns
- **Practice Regularly**: The more you code, the more natural these practices become

[Check out our Java Quick Reference →](reference.md) for a handy summary of syntax and best practices.

## Practice Exercises

1. **Library System**: Create a `Book` class and `Library` class that demonstrates all the principles covered

2. **Bank Account Manager**: Build a complete bank account system with proper validation and error handling

3. **Student Grade System**: Create a comprehensive student management system with multiple classes

4. **Refactoring Challenge**: Take some of your earlier code and refactor it using these best practices
