# Java Data Structures

Data structures help you organize and store multiple pieces of related data. Java provides several built-in data structures that are essential for most programs.

## Arrays - Fixed-Size Collections

Arrays store multiple values of the same type in a fixed-size collection.

### Creating Arrays

```java
// Method 1: Declare then initialize
int[] numbers = new int[5];  // Array of 5 integers
numbers[0] = 10;
numbers[1] = 20;
numbers[2] = 30;

// Method 2: Declare and initialize at once
int[] scores = {95, 87, 92, 78, 85};
String[] names = {"Alice", "Bob", "Charlie"};
```

### Array Operations

```java
int[] numbers = {10, 20, 30, 40, 50};

// Access elements (0-indexed)
int firstNumber = numbers[0];  // 10
int lastNumber = numbers[4];   // 50

// Get array length
int length = numbers.length;   // 5

// Modify elements
numbers[2] = 35;  // Changes 30 to 35
```

### Looping Through Arrays

```java
int[] scores = {95, 87, 92, 78, 85};

// Traditional for loop
for (int i = 0; i < scores.length; i++) {
    System.out.println("Score " + (i + 1) + ": " + scores[i]);
}

// Enhanced for loop (for-each)
for (int score : scores) {
    System.out.println("Score: " + score);
}
```

## ArrayList - Dynamic Collections

ArrayList can grow and shrink as needed, making it more flexible than arrays.

### Creating and Using ArrayList

```java
import java.util.ArrayList;

public class ArrayListExample {
    public static void main(String[] args) {
        // Create ArrayList
        ArrayList<String> fruits = new ArrayList<>();

        // Add elements
        fruits.add("apple");
        fruits.add("banana");
        fruits.add("orange");

        // Access elements
        String firstFruit = fruits.get(0);  // "apple"

        // Get size
        int size = fruits.size();  // 3

        // Remove elements
        fruits.remove("banana");
        fruits.remove(0);  // Remove by index

        // Check if contains
        boolean hasApple = fruits.contains("apple");
    }
}
```

### ArrayList Methods

```java
ArrayList<Integer> numbers = new ArrayList<>();

// Adding elements
numbers.add(10);           // Add to end
numbers.add(0, 5);         // Add at specific index

// Accessing elements
int first = numbers.get(0);
int size = numbers.size();
boolean isEmpty = numbers.isEmpty();

// Modifying elements
numbers.set(1, 15);        // Replace element at index 1

// Removing elements
numbers.remove(0);         // Remove by index
numbers.remove(Integer.valueOf(15)); // Remove by value
numbers.clear();           // Remove all elements
```

## Hands-on Practice: Student Grade Manager

Create `GradeManager.java`:

```java
import java.util.ArrayList;
import java.util.Scanner;

public class GradeManager {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        ArrayList<Double> grades = new ArrayList<>();

        System.out.println("Student Grade Manager");
        System.out.println("Enter grades (enter -1 to finish):");

        // Collect grades
        while (true) {
            System.out.print("Enter grade: ");
            double grade = scanner.nextDouble();

            if (grade == -1) {
                break;
            }

            if (grade >= 0 && grade <= 100) {
                grades.add(grade);
            } else {
                System.out.println("Please enter a grade between 0 and 100");
            }
        }

        // Calculate and display results
        if (grades.size() > 0) {
            double sum = 0;
            double highest = grades.get(0);
            double lowest = grades.get(0);

            for (double grade : grades) {
                sum += grade;
                if (grade > highest) highest = grade;
                if (grade < lowest) lowest = grade;
            }

            double average = sum / grades.size();

            System.out.println("\nGrade Summary:");
            System.out.println("Number of grades: " + grades.size());
            System.out.println("Average: " + String.format("%.2f", average));
            System.out.println("Highest: " + highest);
            System.out.println("Lowest: " + lowest);
        } else {
            System.out.println("No grades entered.");
        }

        scanner.close();
    }
}
```

## HashMap - Key-Value Pairs

HashMap stores data as key-value pairs, useful for creating associations between pieces of data.

### Creating and Using HashMap

```java
import java.util.HashMap;

public class HashMapExample {
    public static void main(String[] args) {
        // Create HashMap
        HashMap<String, Integer> ages = new HashMap<>();

        // Add key-value pairs
        ages.put("Alice", 25);
        ages.put("Bob", 30);
        ages.put("Charlie", 22);

        // Access values
        int aliceAge = ages.get("Alice");  // 25

        // Check if key exists
        boolean hasBob = ages.containsKey("Bob");

        // Get all keys and values
        for (String name : ages.keySet()) {
            System.out.println(name + " is " + ages.get(name) + " years old");
        }

        // Remove entries
        ages.remove("Bob");
    }
}
```

## Hands-on Practice: Simple Phone Book

Create `PhoneBook.java`:

```java
import java.util.HashMap;
import java.util.Scanner;

public class PhoneBook {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        HashMap<String, String> phoneBook = new HashMap<>();

        System.out.println("Simple Phone Book");

        while (true) {
            System.out.println("\nOptions:");
            System.out.println("1. Add contact");
            System.out.println("2. Find contact");
            System.out.println("3. List all contacts");
            System.out.println("4. Exit");
            System.out.print("Choose option: ");

            int choice = scanner.nextInt();
            scanner.nextLine(); // Consume newline

            switch (choice) {
                case 1:
                    System.out.print("Enter name: ");
                    String name = scanner.nextLine();
                    System.out.print("Enter phone number: ");
                    String phone = scanner.nextLine();
                    phoneBook.put(name, phone);
                    System.out.println("Contact added!");
                    break;

                case 2:
                    System.out.print("Enter name to find: ");
                    String searchName = scanner.nextLine();
                    if (phoneBook.containsKey(searchName)) {
                        System.out.println(searchName + ": " + phoneBook.get(searchName));
                    } else {
                        System.out.println("Contact not found.");
                    }
                    break;

                case 3:
                    System.out.println("All contacts:");
                    for (String contactName : phoneBook.keySet()) {
                        System.out.println(contactName + ": " + phoneBook.get(contactName));
                    }
                    break;

                case 4:
                    System.out.println("Goodbye!");
                    scanner.close();
                    return;

                default:
                    System.out.println("Invalid option.");
            }
        }
    }
}
```

## Choosing the Right Data Structure

| Data Structure | Use When                                        | Advantages                    | Disadvantages                             |
| -------------- | ----------------------------------------------- | ----------------------------- | ----------------------------------------- |
| **Array**      | Fixed number of elements, fast access by index  | Fast access, memory efficient | Fixed size, difficult to insert/delete    |
| **ArrayList**  | Need dynamic resizing, frequent adding/removing | Dynamic size, easy to use     | Slower than arrays for large datasets     |
| **HashMap**    | Need to associate keys with values              | Fast lookup by key, flexible  | No guaranteed order, more memory overhead |

## Common Operations Summary

### Array Quick Reference

```java
// Declaration and initialization
int[] numbers = {1, 2, 3, 4, 5};

// Access and modify
int value = numbers[index];
numbers[index] = newValue;

// Loop through
for (int num : numbers) {
    System.out.println(num);
}
```

### ArrayList Quick Reference

```java
ArrayList<String> list = new ArrayList<>();
list.add("item");           // Add
String item = list.get(0);  // Get
list.set(0, "new item");    // Update
list.remove(0);             // Remove
```

### HashMap Quick Reference

```java
HashMap<String, Integer> map = new HashMap<>();
map.put("key", 123);        // Add/Update
int value = map.get("key"); // Get
map.remove("key");          // Remove
boolean has = map.containsKey("key"); // Check
```

## Multidimensional Arrays

For more complex data, you can create arrays of arrays:

```java
// 2D array (like a table)
int[][] matrix = {
    {1, 2, 3},
    {4, 5, 6},
    {7, 8, 9}
};

// Access elements
int value = matrix[1][2];  // Gets 6 (row 1, column 2)

// Loop through 2D array
for (int row = 0; row < matrix.length; row++) {
    for (int col = 0; col < matrix[row].length; col++) {
        System.out.print(matrix[row][col] + " ");
    }
    System.out.println();
}
```

## Best Practices

1. **Choose ArrayList over Array** when size might change
2. **Use enhanced for loops** when you don't need the index
3. **Initialize collections with expected size** when possible for performance
4. **Use meaningful variable names** that describe the data stored
5. **Check for null/empty** before accessing elements

## Common Mistakes to Avoid

- ❌ `ArrayIndexOutOfBoundsException` - accessing invalid array indices
- ❌ `NullPointerException` - trying to use null references
- ❌ Using wrong data types for HashMap keys
- ❌ Modifying collections while iterating (can cause errors)
- ✅ Always check bounds before accessing array elements
- ✅ Use `.containsKey()` before `.get()` with HashMap

## What's Next?

Excellent! You now understand Java's essential data structures. Next, we'll learn about writing clean, idiomatic Java code that follows professional standards.

[Next: Idiomatic Java →](idioms.md)

## Practice Exercises

1. **Shopping List**: Create a program that manages a shopping list using ArrayList

2. **Grade Book**: Use HashMap to store student names and their grades, with methods to add, update, and calculate class average

3. **Tic-Tac-Toe Board**: Create a 2D array to represent a tic-tac-toe game board

4. **Word Counter**: Count the frequency of words in a sentence using HashMap
