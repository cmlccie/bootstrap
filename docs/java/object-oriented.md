# Object-Oriented Programming in Java

Object-oriented programming (OOP) is Java's core paradigm. Everything in Java is organized around classes and objects, making it essential to understand these concepts for effective Java development.

## What is Object-Oriented Programming?

Object-oriented programming organizes code around **objects** - things that have both data (attributes) and behavior (methods). This approach mirrors how we think about the real world.

**Real-world example**: A car has attributes (color, model, speed) and behaviors (start, stop, accelerate).

## Classes and Objects

### Classes - The Blueprint

A **class** is a blueprint or template that defines what an object will look like and what it can do.

```java
public class Car {
    // Attributes (instance variables)
    private String color;
    private String model;
    private int speed;

    // Constructor - creates new objects
    public Car(String color, String model) {
        this.color = color;
        this.model = model;
        this.speed = 0;
    }

    // Methods (behaviors)
    public void start() {
        System.out.println("The " + color + " " + model + " is starting...");
    }

    public void accelerate(int increase) {
        speed += increase;
        System.out.println("Speed is now " + speed + " mph");
    }

    // Getter methods
    public String getColor() {
        return color;
    }

    public int getSpeed() {
        return speed;
    }
}
```

### Objects - Instances of Classes

An **object** is a specific instance created from a class blueprint.

```java
public class CarDemo {
    public static void main(String[] args) {
        // Create objects (instances) of the Car class
        Car myCar = new Car("red", "Honda Civic");
        Car yourCar = new Car("blue", "Toyota Camry");

        // Use the objects
        myCar.start();           // The red Honda Civic is starting...
        myCar.accelerate(30);    // Speed is now 30 mph

        yourCar.start();         // The blue Toyota Camry is starting...
        yourCar.accelerate(25);  // Speed is now 25 mph

        // Access object data
        System.out.println("My car is " + myCar.getColor());  // My car is red
    }
}
```

## Constructors

**Constructors** are special methods that create and initialize new objects.

### Default Constructor

```java
public class Student {
    private String name;
    private int age;

    // Default constructor (no parameters)
    public Student() {
        this.name = "Unknown";
        this.age = 0;
    }
}
```

### Parameterized Constructor

```java
public class Student {
    private String name;
    private int age;

    // Constructor with parameters
    public Student(String name, int age) {
        this.name = name;
        this.age = age;
    }

    // Multiple constructors (overloading)
    public Student(String name) {
        this.name = name;
        this.age = 18; // default age
    }
}
```

### Using Constructors

```java
Student student1 = new Student();                    // Uses default constructor
Student student2 = new Student("Alice", 20);         // Uses parameterized constructor
Student student3 = new Student("Bob");               // Uses single-parameter constructor
```

## Access Modifiers

Access modifiers control who can access your classes, methods, and variables.

### The Four Access Levels

| Modifier    | Class | Package | Subclass | World |
| ----------- | ----- | ------- | -------- | ----- |
| `public`    | ✓     | ✓       | ✓        | ✓     |
| `protected` | ✓     | ✓       | ✓        | ✗     |
| _default_   | ✓     | ✓       | ✗        | ✗     |
| `private`   | ✓     | ✗       | ✗        | ✗     |

### Common Patterns

```java
public class BankAccount {
    // Private data - only this class can access
    private double balance;
    private String accountNumber;

    // Public constructor - anyone can create accounts
    public BankAccount(String accountNumber, double initialBalance) {
        this.accountNumber = accountNumber;
        this.balance = initialBalance;
    }

    // Public methods - controlled access to private data
    public double getBalance() {
        return balance;
    }

    public void deposit(double amount) {
        if (amount > 0) {
            balance += amount;
        }
    }

    // Private helper method - only used within this class
    private boolean isValidAmount(double amount) {
        return amount > 0 && amount <= 10000;
    }
}
```

## The `this` Keyword

The `this` keyword refers to the current object instance.

### Common Uses

```java
public class Person {
    private String name;
    private int age;

    // Use this to distinguish between parameters and instance variables
    public Person(String name, int age) {
        this.name = name;  // this.name refers to the instance variable
        this.age = age;    // age parameter assigns to this.age instance variable
    }

    // Use this to call another constructor
    public Person(String name) {
        this(name, 0);     // Calls the two-parameter constructor
    }

    // Use this to return the current object
    public Person setName(String name) {
        this.name = name;
        return this;       // Enables method chaining
    }
}
```

## Inheritance

**Inheritance** allows classes to inherit attributes and methods from other classes.

### Basic Inheritance

```java
// Parent class (superclass)
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

    public void sleep() {
        System.out.println(name + " is sleeping");
    }
}

// Child class (subclass)
public class Dog extends Animal {
    private String breed;

    public Dog(String name, int age, String breed) {
        super(name, age);  // Call parent constructor
        this.breed = breed;
    }

    // Override parent method
    @Override
    public void eat() {
        System.out.println(name + " the dog is eating dog food");
    }

    // Add new method specific to Dog
    public void bark() {
        System.out.println(name + " is barking: Woof!");
    }
}
```

### Using Inheritance

```java
public class AnimalDemo {
    public static void main(String[] args) {
        Dog myDog = new Dog("Buddy", 3, "Golden Retriever");

        myDog.eat();    // Uses overridden method: "Buddy the dog is eating dog food"
        myDog.sleep();  // Uses inherited method: "Buddy is sleeping"
        myDog.bark();   // Uses Dog-specific method: "Buddy is barking: Woof!"
    }
}
```

## Method Overriding

**Method overriding** allows subclasses to provide specific implementations of methods defined in their parent classes.

### The @Override Annotation

```java
public class Vehicle {
    public void start() {
        System.out.println("Vehicle is starting");
    }

    public void stop() {
        System.out.println("Vehicle is stopping");
    }
}

public class Car extends Vehicle {
    @Override  // Annotation indicates this method overrides the parent
    public void start() {
        System.out.println("Car engine is starting with a key");
    }

    @Override
    public void stop() {
        System.out.println("Car is braking to a stop");
    }
}

public class Motorcycle extends Vehicle {
    @Override
    public void start() {
        System.out.println("Motorcycle is kick-starting");
    }
}
```

## Static Methods and Variables

**Static** members belong to the class itself, not to any specific instance.

### Static Variables

```java
public class Counter {
    private static int totalCount = 0;  // Shared by all instances
    private int instanceCount = 0;      // Unique to each instance

    public Counter() {
        totalCount++;      // Increment class counter
        instanceCount++;   // Increment instance counter
    }

    public static int getTotalCount() {  // Static method
        return totalCount;
    }

    public int getInstanceCount() {      // Instance method
        return instanceCount;
    }
}
```

### Using Static Members

```java
public class CounterDemo {
    public static void main(String[] args) {
        System.out.println("Total: " + Counter.getTotalCount());  // Total: 0

        Counter c1 = new Counter();
        Counter c2 = new Counter();
        Counter c3 = new Counter();

        System.out.println("Total: " + Counter.getTotalCount());  // Total: 3
        System.out.println("C1 instance: " + c1.getInstanceCount());  // C1 instance: 1
    }
}
```

## Packages

**Packages** organize related classes and prevent naming conflicts.

### Creating Packages

```java
// File: src/main/java/com/example/vehicles/Car.java
package com.example.vehicles;

public class Car {
    // Car implementation
}

// File: src/main/java/com/example/vehicles/Motorcycle.java
package com.example.vehicles;

public class Motorcycle {
    // Motorcycle implementation
}
```

### Using Packages

```java
// File: src/main/java/com/example/demo/VehicleDemo.java
package com.example.demo;

import com.example.vehicles.Car;          // Import specific class
import com.example.vehicles.Motorcycle;  // Import another class
// import com.example.vehicles.*;         // Import all classes (alternative)

public class VehicleDemo {
    public static void main(String[] args) {
        Car myCar = new Car();
        Motorcycle myBike = new Motorcycle();
    }
}
```

## Common Patterns and Best Practices

### Encapsulation

Keep data private and provide controlled access through methods:

```java
public class Temperature {
    private double celsius;

    public void setCelsius(double celsius) {
        if (celsius >= -273.15) {  // Absolute zero check
            this.celsius = celsius;
        } else {
            throw new IllegalArgumentException("Temperature cannot be below absolute zero");
        }
    }

    public double getCelsius() {
        return celsius;
    }

    public double getFahrenheit() {
        return (celsius * 9.0 / 5.0) + 32;
    }
}
```

### Method Chaining

Return `this` to enable fluent interfaces:

```java
public class StringBuilder {
    private String content = "";

    public StringBuilder append(String text) {
        content += text;
        return this;  // Enable chaining
    }

    public StringBuilder newLine() {
        content += "\n";
        return this;
    }

    public String build() {
        return content;
    }
}

// Usage
String result = new StringBuilder()
    .append("Hello")
    .append(" ")
    .append("World")
    .newLine()
    .append("Java is awesome!")
    .build();
```

## Practice Exercises

### Exercise 1: Student Management System

Create a `Student` class with:

- Private fields: `name`, `id`, `gpa`
- Constructor to initialize all fields
- Getter and setter methods
- A method to display student information

```java
public class Student {
    // Your implementation here
}

// Test your class
public class StudentTest {
    public static void main(String[] args) {
        Student student = new Student("Alice Johnson", "S12345", 3.75);
        student.displayInfo();

        student.setGpa(3.85);
        System.out.println("Updated GPA: " + student.getGpa());
    }
}
```

### Exercise 2: Shape Hierarchy

Create an inheritance hierarchy:

- Abstract `Shape` class with `area()` and `perimeter()` methods
- `Rectangle` class that extends `Shape`
- `Circle` class that extends `Shape`

```java
public abstract class Shape {
    // Your implementation here
}

public class Rectangle extends Shape {
    // Your implementation here
}

public class Circle extends Shape {
    // Your implementation here
}
```

## What's Next?

Now that you understand object-oriented programming in Java, you're ready to learn professional development practices:

[Learn Professional Java Practices →](idioms.md)

## Additional Resources

- [Oracle OOP Tutorial](https://docs.oracle.com/javase/tutorial/java/concepts/) - Official documentation on OOP concepts
- [Java Inheritance Guide](https://docs.oracle.com/javase/tutorial/java/IandI/) - Deep dive into inheritance and interfaces
- [Effective Java](https://www.oracle.com/java/technologies/javase/effectivejava.html) - Best practices for object-oriented design
