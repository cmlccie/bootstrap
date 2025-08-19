# Java Collections and Data Structures

Java provides a rich Collections Framework that offers powerful, flexible data structures for modern applications. Understanding these collections is essential for professional Java development.

## Why Learn Java Collections?

- **Professional Standard**: Collections are used extensively in enterprise Java applications
- **Type Safety**: Generic collections prevent runtime errors and improve code clarity
- **Performance**: Different collections optimize for different use cases (speed vs memory)
- **Algorithms**: Built-in methods for sorting, searching, and data manipulation
- **Thread Safety**: Options for concurrent programming scenarios

## Core Collection Interfaces

Java's Collections Framework is built around key interfaces that define common behaviors:

```java
Collection<E>     // Root interface for all collections
├── List<E>       // Ordered, allows duplicates (ArrayList, LinkedList)
├── Set<E>        // No duplicates allowed (HashSet, TreeSet)
└── Queue<E>      // FIFO operations (LinkedList, PriorityQueue)

Map<K,V>          // Key-value pairs (HashMap, TreeMap, LinkedHashMap)
```

## Lists - Ordered Collections

Lists maintain insertion order and allow duplicate elements. Perfect for sequences of data.

### ArrayList - Dynamic Arrays

ArrayList is the most commonly used collection in Java applications:

```java
import java.util.*;

public class ArrayListExample {
    public static void main(String[] args) {
        // Type-safe collection
        List<String> employees = new ArrayList<>();

        // Adding elements
        employees.add("Alice Johnson");
        employees.add("Bob Smith");
        employees.add("Carol Davis");

        // Accessing elements
        String firstEmployee = employees.get(0);
        int totalEmployees = employees.size();

        // Iterating (modern approaches)
        employees.forEach(System.out::println);

        // Stream operations (Java 8+)
        employees.stream()
                .filter(name -> name.startsWith("A"))
                .forEach(System.out::println);
    }
}
```

### Professional ArrayList Usage

```java
import java.util.*;

public class EmployeeManager {
    private final List<String> employees;

    public EmployeeManager() {
        this.employees = new ArrayList<>();
    }

    public void addEmployee(String name) {
        Objects.requireNonNull(name, "Employee name cannot be null");
        if (name.trim().isEmpty()) {
            throw new IllegalArgumentException("Employee name cannot be empty");
        }
        employees.add(name.trim());
    }

    public List<String> getEmployees() {
        return new ArrayList<>(employees); // Defensive copy
    }

    public Optional<String> findEmployee(String name) {
        return employees.stream()
                .filter(emp -> emp.equalsIgnoreCase(name))
                .findFirst();
    }

    public List<String> searchEmployees(String searchTerm) {
        return employees.stream()
                .filter(emp -> emp.toLowerCase().contains(searchTerm.toLowerCase()))
                .collect(Collectors.toList());
    }
}
```

### LinkedList vs ArrayList

Choose the right implementation based on your use case:

```java
// ArrayList: Fast random access, slower insertion/deletion
List<String> arrayList = new ArrayList<>();
String item = arrayList.get(1000); // O(1) - very fast

// LinkedList: Fast insertion/deletion, slower random access
List<String> linkedList = new LinkedList<>();
String item = linkedList.get(1000); // O(n) - slower for large lists

// When to use each:
// ArrayList: Reading data frequently, random access
// LinkedList: Frequent insertion/deletion in middle of list
```

## Sets - Unique Collections

Sets ensure no duplicate elements. Essential for maintaining data integrity.

### HashSet - Fast Unique Collections

```java
import java.util.*;

public class UniqueEmailCollector {
    private final Set<String> emails = new HashSet<>();

    public boolean addEmail(String email) {
        if (isValidEmail(email)) {
            return emails.add(email.toLowerCase()); // Returns false if already exists
        }
        return false;
    }

    public Set<String> getUniqueEmails() {
        return new HashSet<>(emails); // Defensive copy
    }

    public int getEmailCount() {
        return emails.size();
    }

    private boolean isValidEmail(String email) {
        return email != null && email.contains("@") && email.contains(".");
    }
}
```

### TreeSet - Sorted Unique Collections

```java
import java.util.*;

public class PriorityTaskManager {
    private final Set<String> tasks = new TreeSet<>(); // Automatically sorted

    public void addTask(String task) {
        tasks.add(task);
    }

    public void displayTasks() {
        System.out.println("Tasks (alphabetically sorted):");
        tasks.forEach(task -> System.out.println("- " + task));
    }

    public String getNextTask() {
        return tasks.isEmpty() ? null : tasks.iterator().next();
    }
}
```

## Maps - Key-Value Associations

Maps associate keys with values, enabling fast lookups and data relationships.

### HashMap - Fast Key-Value Storage

```java
import java.util.*;

public class UserPreferences {
    private final Map<String, String> preferences = new HashMap<>();

    public void setPreference(String key, String value) {
        Objects.requireNonNull(key, "Preference key cannot be null");
        preferences.put(key, value);
    }

    public Optional<String> getPreference(String key) {
        return Optional.ofNullable(preferences.get(key));
    }

    public String getPreference(String key, String defaultValue) {
        return preferences.getOrDefault(key, defaultValue);
    }

    public Map<String, String> getAllPreferences() {
        return new HashMap<>(preferences); // Defensive copy
    }

    public void displayPreferences() {
        preferences.entrySet().stream()
                .sorted(Map.Entry.comparingByKey())
                .forEach(entry ->
                    System.out.println(entry.getKey() + " = " + entry.getValue()));
    }
}
```

### Professional Map Usage Pattern

```java
import java.util.*;
import java.util.stream.Collectors;

public class SalesAnalyzer {
    private final Map<String, List<Double>> salesByRegion = new HashMap<>();

    public void recordSale(String region, double amount) {
        salesByRegion.computeIfAbsent(region, k -> new ArrayList<>()).add(amount);
    }

    public Map<String, Double> calculateTotalsByRegion() {
        return salesByRegion.entrySet().stream()
                .collect(Collectors.toMap(
                    Map.Entry::getKey,
                    entry -> entry.getValue().stream().mapToDouble(Double::doubleValue).sum()
                ));
    }

    public Optional<String> getTopPerformingRegion() {
        return calculateTotalsByRegion().entrySet().stream()
                .max(Map.Entry.comparingByValue())
                .map(Map.Entry::getKey);
    }
}
```

## Working with Collections - Modern Patterns

### Stream API Operations

```java
import java.util.*;
import java.util.stream.Collectors;

public class DataProcessor {

    public List<String> processNames(List<String> names) {
        return names.stream()
                .filter(Objects::nonNull)
                .map(String::trim)
                .filter(name -> !name.isEmpty())
                .map(this::formatName)
                .distinct()
                .sorted()
                .collect(Collectors.toList());
    }

    public Map<Integer, List<String>> groupByLength(List<String> words) {
        return words.stream()
                .filter(Objects::nonNull)
                .collect(Collectors.groupingBy(String::length));
    }

    public OptionalDouble calculateAverage(List<Integer> numbers) {
        return numbers.stream()
                .mapToInt(Integer::intValue)
                .average();
    }

    private String formatName(String name) {
        return name.substring(0, 1).toUpperCase() +
               name.substring(1).toLowerCase();
    }
}
```

### Builder Pattern with Collections

```java
import java.util.*;

public class ConfigurationBuilder {
    private final Map<String, String> config = new HashMap<>();
    private final List<String> features = new ArrayList<>();

    public ConfigurationBuilder addProperty(String key, String value) {
        config.put(key, value);
        return this;
    }

    public ConfigurationBuilder enableFeature(String feature) {
        features.add(feature);
        return this;
    }

    public Configuration build() {
        return new Configuration(
            Map.copyOf(config),      // Immutable copy (Java 10+)
            List.copyOf(features)    // Immutable copy (Java 10+)
        );
    }
}

public class Configuration {
    private final Map<String, String> properties;
    private final List<String> enabledFeatures;

    public Configuration(Map<String, String> properties, List<String> features) {
        this.properties = properties;
        this.enabledFeatures = features;
    }

    // Getters return immutable views
    public Map<String, String> getProperties() { return properties; }
    public List<String> getEnabledFeatures() { return enabledFeatures; }
}
```

## Performance Considerations

### Collection Performance Characteristics

| Operation  | ArrayList | LinkedList | HashSet | TreeSet  | HashMap | TreeMap  |
| ---------- | --------- | ---------- | ------- | -------- | ------- | -------- |
| Get/Access | O(1)      | O(n)       | O(1)    | O(log n) | O(1)    | O(log n) |
| Add        | O(1)\*    | O(1)       | O(1)    | O(log n) | O(1)    | O(log n) |
| Remove     | O(n)      | O(1)\*\*   | O(1)    | O(log n) | O(1)    | O(log n) |
| Contains   | O(n)      | O(n)       | O(1)    | O(log n) | O(1)    | O(log n) |

\*Amortized, \*\*If you have a reference to the node

### Choosing the Right Collection

```java
// Use ArrayList when:
// - Frequent random access by index
// - More reads than writes
// - Memory efficiency is important
List<String> frequentReads = new ArrayList<>();

// Use LinkedList when:
// - Frequent insertion/deletion in middle
// - Implementing queue/deque operations
List<String> frequentModifications = new LinkedList<>();

// Use HashSet when:
// - Need unique elements
// - Fast lookup/contains operations
// - Order doesn't matter
Set<String> uniqueItems = new HashSet<>();

// Use TreeSet when:
// - Need unique elements
// - Want automatic sorting
// - Need range operations
Set<String> sortedUniqueItems = new TreeSet<>();

// Use HashMap when:
// - Fast key-value lookup
// - Order doesn't matter
Map<String, String> fastLookup = new HashMap<>();

// Use LinkedHashMap when:
// - Need insertion order preserved
// - Fast lookup required
Map<String, String> orderedFastLookup = new LinkedHashMap<>();

// Use TreeMap when:
// - Need sorted keys
// - Range operations on keys
Map<String, String> sortedKeys = new TreeMap<>();
```

## Thread Safety and Concurrent Collections

### Thread-Safe Options

```java
import java.util.concurrent.*;

public class ConcurrentCollectionExample {

    // Thread-safe alternatives
    private final List<String> safeList = new CopyOnWriteArrayList<>();
    private final Set<String> safeSet = ConcurrentHashMap.newKeySet();
    private final Map<String, String> safeMap = new ConcurrentHashMap<>();
    private final Queue<String> safeQueue = new ConcurrentLinkedQueue<>();

    // Synchronized wrappers (less preferred)
    private final List<String> syncList = Collections.synchronizedList(new ArrayList<>());
    private final Set<String> syncSet = Collections.synchronizedSet(new HashSet<>());

    public void demonstrateThreadSafety() {
        // ConcurrentHashMap allows concurrent reads/writes
        safeMap.put("key1", "value1");
        safeMap.computeIfAbsent("key2", k -> "computed value");

        // Thread-safe iteration
        safeMap.forEach((key, value) -> {
            System.out.println(key + " = " + value);
        });
    }
}
```

## Practical Application - E-commerce Order System

```java
import java.util.*;
import java.util.stream.Collectors;

public class OrderManager {
    private final Map<String, Order> orders = new HashMap<>();
    private final Map<String, Set<String>> customerOrders = new HashMap<>();

    public void addOrder(Order order) {
        Objects.requireNonNull(order, "Order cannot be null");

        orders.put(order.getId(), order);
        customerOrders.computeIfAbsent(order.getCustomerId(), k -> new HashSet<>())
                     .add(order.getId());
    }

    public Optional<Order> getOrder(String orderId) {
        return Optional.ofNullable(orders.get(orderId));
    }

    public List<Order> getCustomerOrders(String customerId) {
        return customerOrders.getOrDefault(customerId, Collections.emptySet())
                .stream()
                .map(orders::get)
                .filter(Objects::nonNull)
                .sorted(Comparator.comparing(Order::getOrderDate).reversed())
                .collect(Collectors.toList());
    }

    public Map<String, Double> getTotalsByCustomer() {
        return customerOrders.entrySet().stream()
                .collect(Collectors.toMap(
                    Map.Entry::getKey,
                    entry -> entry.getValue().stream()
                            .map(orders::get)
                            .filter(Objects::nonNull)
                            .mapToDouble(Order::getTotal)
                            .sum()
                ));
    }
}

public class Order {
    private final String id;
    private final String customerId;
    private final List<OrderItem> items;
    private final LocalDateTime orderDate;

    public Order(String id, String customerId, List<OrderItem> items) {
        this.id = Objects.requireNonNull(id);
        this.customerId = Objects.requireNonNull(customerId);
        this.items = new ArrayList<>(items);
        this.orderDate = LocalDateTime.now();
    }

    public double getTotal() {
        return items.stream()
                .mapToDouble(item -> item.getPrice() * item.getQuantity())
                .sum();
    }

    // Getters...
    public String getId() { return id; }
    public String getCustomerId() { return customerId; }
    public LocalDateTime getOrderDate() { return orderDate; }
    public List<OrderItem> getItems() { return new ArrayList<>(items); }
}
```

## Best Practices Summary

### Design Principles

1. **Program to Interfaces**: Use `List<T>` instead of `ArrayList<T>`
2. **Defensive Copying**: Return copies of mutable collections from public methods
3. **Null Safety**: Handle null values appropriately with Optional
4. **Generic Types**: Always use parameterized types for type safety
5. **Immutability**: Prefer immutable collections when data won't change

### Code Quality

```java
// ✅ Good: Interface-based programming
public List<String> getNames() {
    return new ArrayList<>(names); // Defensive copy
}

// ❌ Poor: Implementation-based programming
public ArrayList<String> getNames() {
    return names; // Exposes internal state
}

// ✅ Good: Null-safe operations
public Optional<String> findName(String search) {
    return names.stream()
            .filter(name -> name.contains(search))
            .findFirst();
}

// ❌ Poor: Null-prone operations
public String findName(String search) {
    for (String name : names) {
        if (name.contains(search)) {
            return name; // Could return null
        }
    }
    return null; // Explicit null return
}
```

### Performance Guidelines

1. **Size Hints**: Provide initial capacity when size is known
2. **Bulk Operations**: Use `addAll()`, `removeAll()` for multiple elements
3. **Stream vs Loop**: Use streams for complex operations, loops for simple ones
4. **Memory Management**: Remove references to large collections when done

## What's Next?

Excellent work! You now understand Java's powerful Collections Framework. You're ready to explore professional development practices that will make your code production-ready.

[Next: Professional Practices →](idioms.md)

---

**Key Takeaway**: Java Collections provide type-safe, performant data structures that are essential for professional software development. Master these fundamentals and you'll be well-equipped for enterprise Java development.
