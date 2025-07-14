# Reference

Quick reference guides and cheat sheets for common programming concepts, syntax, and tools.

## 📚 Language References

### Python Quick Reference

#### Basic Syntax

```python
# Variables
name = "Alice"
age = 30
is_student = True

# Data Types
numbers = [1, 2, 3, 4, 5]
person = {"name": "Bob", "age": 25}
unique_items = {1, 2, 3}

# Functions
def greet(name):
    return f"Hello, {name}!"

# Classes
class Person:
    def __init__(self, name, age):
        self.name = name
        self.age = age

    def introduce(self):
        return f"I'm {self.name}, {self.age} years old"
```

#### Common Operations

```python
# List operations
fruits = ["apple", "banana", "orange"]
fruits.append("grape")
fruits.remove("banana")
sorted_fruits = sorted(fruits)

# Dictionary operations
student = {"name": "Alice", "grade": "A"}
student["subject"] = "Math"
grade = student.get("grade", "Unknown")

# File I/O
with open("file.txt", "r") as f:
    content = f.read()

with open("output.txt", "w") as f:
    f.write("Hello, World!")
```

### JavaScript Quick Reference

#### JavaScript Syntax

```javascript
// Variables
const name = "Alice";
let age = 30;
var isStudent = true;

// Data Types
const numbers = [1, 2, 3, 4, 5];
const person = { name: "Bob", age: 25 };
const uniqueItems = new Set([1, 2, 3]);

// Functions
function greet(name) {
  return `Hello, ${name}!`;
}

// Arrow functions
const multiply = (a, b) => a * b;

// Classes
class Person {
  constructor(name, age) {
    this.name = name;
    this.age = age;
  }

  introduce() {
    return `I'm ${this.name}, ${this.age} years old`;
  }
}
```

#### DOM Manipulation

```javascript
// Selecting elements
const element = document.getElementById("myId");
const elements = document.querySelectorAll(".myClass");

// Modifying content
element.textContent = "New text";
element.innerHTML = "<strong>Bold text</strong>";

// Event handling
element.addEventListener("click", function () {
  console.log("Element clicked!");
});

// Creating elements
const newDiv = document.createElement("div");
newDiv.textContent = "Hello!";
document.body.appendChild(newDiv);
```

## 🌐 Web Development

### HTML Essentials

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Page Title</title>
    <link rel="stylesheet" href="styles.css" />
  </head>
  <body>
    <header>
      <nav>
        <ul>
          <li><a href="#home">Home</a></li>
          <li><a href="#about">About</a></li>
        </ul>
      </nav>
    </header>

    <main>
      <section id="home">
        <h1>Welcome</h1>
        <p>This is a paragraph.</p>
      </section>
    </main>

    <footer>
      <p>&copy; 2023 My Website</p>
    </footer>

    <script src="script.js"></script>
  </body>
</html>
```

### CSS Essentials

```css
/* Selectors */
.class-name {
}
#id-name {
}
element {
}
element.class {
}
element > child {
}

/* Box Model */
.box {
  width: 300px;
  height: 200px;
  padding: 20px;
  border: 2px solid #333;
  margin: 10px;
}

/* Flexbox */
.container {
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 20px;
}

/* Grid */
.grid-container {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  grid-gap: 20px;
}

/* Responsive Design */
@media (max-width: 768px) {
  .container {
    flex-direction: column;
  }
}
```

## 🗄️ Database References

### SQL Basics

```sql
-- Create table
CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(255) UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert data
INSERT INTO users (name, email) VALUES
('Alice', 'alice@example.com'),
('Bob', 'bob@example.com');

-- Query data
SELECT * FROM users;
SELECT name, email FROM users WHERE id = 1;
SELECT * FROM users ORDER BY created_at DESC;

-- Update data
UPDATE users SET name = 'Alice Smith' WHERE id = 1;

-- Delete data
DELETE FROM users WHERE id = 2;

-- Joins
SELECT u.name, p.title
FROM users u
JOIN posts p ON u.id = p.user_id;
```

## 🛠️ Development Tools

### Git Commands

```bash
# Initialize repository
git init
git clone https://github.com/user/repo.git

# Basic workflow
git add .
git commit -m "Commit message"
git push origin main

# Branching
git branch feature-branch
git checkout feature-branch
git checkout -b new-feature

# Merging
git checkout main
git merge feature-branch

# Status and history
git status
git log --oneline
git diff

# Undoing changes
git checkout -- filename
git reset HEAD filename
git revert commit-hash
```

### Package Managers

#### npm (Node.js)

```bash
# Initialize project
npm init -y

# Install packages
npm install package-name
npm install -g global-package
npm install --save-dev dev-package

# Run scripts
npm start
npm test
npm run build

# Update packages
npm update
npm outdated
```

#### pip (Python)

```bash
# Install packages
pip install package-name
pip install -r requirements.txt

# Create requirements file
pip freeze > requirements.txt

# Virtual environments
python -m venv myenv
source myenv/bin/activate  # Linux/Mac
myenv\Scripts\activate     # Windows
deactivate
```

## 🧪 Testing References

### Unit Testing

#### Python (pytest)

```python
import pytest

def add(a, b):
    return a + b

def test_add():
    assert add(2, 3) == 5
    assert add(-1, 1) == 0
    assert add(0, 0) == 0

def test_add_strings():
    with pytest.raises(TypeError):
        add("hello", "world")
```

#### JavaScript (Jest)

```javascript
// math.js
function add(a, b) {
  return a + b;
}

// math.test.js
const { add } = require("./math");

test("adds 1 + 2 to equal 3", () => {
  expect(add(1, 2)).toBe(3);
});

test("adds negative numbers", () => {
  expect(add(-1, -2)).toBe(-3);
});
```

## 🔐 Security Best Practices

### Common Vulnerabilities

- **SQL Injection**: Use parameterized queries
- **XSS**: Sanitize user input
- **CSRF**: Use CSRF tokens
- **Authentication**: Hash passwords, use secure sessions

### Secure Coding Checklist

- [ ] Validate all user inputs
- [ ] Use HTTPS for data transmission
- [ ] Store sensitive data securely
- [ ] Implement proper error handling
- [ ] Keep dependencies updated
- [ ] Use environment variables for secrets

## 📊 Performance Tips

### Frontend Optimization

- Minimize HTTP requests
- Optimize images and assets
- Use browser caching
- Minify CSS and JavaScript
- Implement lazy loading

### Backend Optimization

- Database query optimization
- Implement caching strategies
- Use CDNs for static assets
- Monitor application performance
- Scale horizontally when needed

---

_This reference guide is continuously updated with new technologies and best practices._
