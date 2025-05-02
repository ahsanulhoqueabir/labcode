To solve this SQL problem set, we need the structure of the insurance database mentioned in "Figure 3.11". While the figure isn’t provided here, this problem is from a well-known database schema commonly used in textbook exercises (like Elmasri & Navathe or Silberschatz). That schema usually includes these tables:

### Assumed Schema (based on typical database structure):

```sql
Person(driver_id, name, address)
Car(license, model, year)
Owns(driver_id, license)
Accident(report_number, date, location)
Participated(driver_id, license, report_number, damage_amount)
```

---

### a. Find the total number of people who owned cars that were involved in accidents in 1989:

```sql
SELECT COUNT(DISTINCT o.driver_id) AS total_people
FROM Owns o
JOIN Participated p ON o.license = p.license
JOIN Accident a ON p.report_number = a.report_number
WHERE EXTRACT(YEAR FROM a.date) = 1989;
```

---

### b. Add a new accident to the database; assume any values:

```sql
INSERT INTO Accident (report_number, date, location)
VALUES (9999, '2025-05-02', 'Dhaka');
```

If also adding participation:

```sql
INSERT INTO Participated (driver_id, license, report_number, damage_amount)
VALUES (123, 'ABC123', 9999, 5000);
```

---

### c. Delete the Mazda belonging to “John Smith”:

```sql
DELETE FROM Car
WHERE license IN (
  SELECT o.license
  FROM Owns o
  JOIN Person p ON o.driver_id = p.driver_id
  JOIN Car c ON o.license = c.license
  WHERE p.name = 'John Smith' AND c.model = 'Mazda'
);
```

Based on the schema from **Figure 3.12**, here are the SQL queries for each sub-question:

---

### a. **Names and cities of employees at First Bank Corporation**:

```sql
SELECT e.employee_name, e.city
FROM employee e
JOIN works w ON e.employee_name = w.employee_name
WHERE w.company_name = 'First Bank Corporation';
```

---

### b. **Names, addresses, and cities of employees at First Bank Corporation earning > $10,000**:

```sql
SELECT e.employee_name, e.street, e.city
FROM employee e
JOIN works w ON e.employee_name = w.employee_name
WHERE w.company_name = 'First Bank Corporation' AND w.salary > 10000;
```

---

### c. **Employees who do _not_ work for First Bank Corporation**:

```sql
SELECT employee_name
FROM employee
WHERE employee_name NOT IN (
    SELECT employee_name
    FROM works
    WHERE company_name = 'First Bank Corporation'
);
```

---

### d. **Employees who earn more than every employee at Small Bank Corporation**:

```sql
SELECT w1.employee_name
FROM works w1
WHERE w1.salary > ALL (
    SELECT w2.salary
    FROM works w2
    WHERE w2.company_name = 'Small Bank Corporation'
);
```

---

### e. **Companies located in every city where Small Bank Corporation is located**:

```sql
SELECT c1.company_name
FROM company c1
WHERE NOT EXISTS (
    SELECT c2.city
    FROM company c2
    WHERE c2.company_name = 'Small Bank Corporation'
    EXCEPT
    SELECT c3.city
    FROM company c3
    WHERE c3.company_name = c1.company_name
);
```

---

### f. **Company with the most employees**:

```sql
SELECT w.company_name
FROM works w
GROUP BY w.company_name
ORDER BY COUNT(*) DESC
LIMIT 1;
```

---

### g. **Companies where average salary > average salary at First Bank Corporation**:

```sql
SELECT w.company_name
FROM works w
GROUP BY w.company_name
HAVING AVG(w.salary) > (
    SELECT AVG(salary)
    FROM works
    WHERE company_name = 'First Bank Corporation'
);
```

Here are the SQL solutions for each part of exercises **3.3**, **3.4**, and **3.5** based on the database schemas and requirements:

---

## ✅ **3.3: Based on Employee Database (Figure 3.12)**

### a. Modify the database so that Jones now lives in Newtown:

```sql
UPDATE employee
SET city = 'Newtown'
WHERE employee_name = 'Jones';
```

---

### b. Raise salary of managers at First Bank Corporation:

```sql
UPDATE works
SET salary =
    CASE
        WHEN salary > 100000 THEN salary * 1.03
        ELSE salary * 1.10
    END
WHERE employee_name IN (
    SELECT employee_name
    FROM manages
)
AND company_name = 'First Bank Corporation';
```

---

## ✅ **3.4: Express a natural full outer join using `coalesce` and `full outer join`**

Assuming:

- Table A(name, address, title)
- Table B(name, address, salary)

```sql
SELECT
    COALESCE(A.name, B.name) AS name,
    COALESCE(A.address, B.address) AS address,
    A.title,
    B.salary
FROM A
FULL OUTER JOIN B
ON A.name = B.name AND A.address = B.address;
```

This ensures that even if some records in A or B are null, they are included in the result with `coalesce` handling null values.

---

## ✅ **3.5: Based on the `marks(student_id, score)` relation**

### a. Display the grade for each student:

```sql
SELECT student_id,
       CASE
           WHEN score < 40 THEN 'F'
           WHEN score < 60 THEN 'C'
           WHEN score < 80 THEN 'B'
           ELSE 'A'
       END AS grade
FROM marks;
```

---

### b. Find the number of students with each grade:

```sql
SELECT grade, COUNT(*) AS num_students
FROM (
    SELECT
        CASE
            WHEN score < 40 THEN 'F'
            WHEN score < 60 THEN 'C'
            WHEN score < 80 THEN 'B'
            ELSE 'A'
        END AS grade
    FROM marks
) AS grades
GROUP BY grade;
```

Here’s the explanation for exercises **3.6** and **3.7**:

---

## ✅ **3.6 – SQL Query Analysis:**

```sql
SELECT p.a1
FROM p, r1, r2
WHERE p.a1 = r1.a1 OR p.a1 = r2.a1;
```

### 🔍 **What this query does:**

- It performs a **cross join** of the three tables: `p × r1 × r2`.
- Then it filters the result where `p.a1` matches either `r1.a1` or `r2.a1`.

### 🧠 **Key points to consider:**

- Because of the cross join, this can result in **many tuples** unless `r1` or `r2` is empty.
- The **`WHERE` condition** ensures that only those combinations are selected where `p.a1 = r1.a1` OR `p.a1 = r2.a1`.

### ✅ **When does it select `p.a1`?**

- When **there exists at least one row** in either `r1` or `r2` where `p.a1` matches.
- If both `r1` and `r2` are **non-empty**, matches in either will result in output.
- If `r1` is **empty**, then the condition `p.a1 = r1.a1` fails entirely, but the query may still succeed **if** `p.a1 = r2.a1`.
- Similarly, if `r2` is **empty**, only matches in `r1` will be considered.
- If **both `r1` and `r2` are empty**, the result is **empty**—no match is possible.

---

## ✅ **3.7 – Use of Marked Nulls in Views:**

### 💡 **Context:**

- **Marked nulls (⊥ᵢ)** represent unknown values but are **distinguishable**.
- A marked null ⊥₁ ≠ ⊥₂ (but ⊥₁ = ⊥₁).
- This allows **insertions** into views where **not all fields are known**.

### 🧩 **Goal:**

- Insert tuple `("Johnson", 1900)` into the view `loan_info`.
- If `loan_info` is a **join of borrower and loan tables**, then:

  - `"Johnson"` belongs to borrower table.
  - `1900` is a loan amount, part of the loan table.
  - But there may be other required fields (like loan number, branch, etc.)

### ✅ **How marked nulls help:**

```sql
INSERT INTO loan_info VALUES ('Johnson', 1900, ⊥₁, ⊥₂);
```

- Here, ⊥₁ might be used as a **loan number**, ⊥₂ as a **branch name**.
- Even though these are unknown, **using marked nulls** keeps them **unique and traceable** for the system.
- This **enables insertion** without violating uniqueness or foreign key constraints.

---

Here are the SQL solutions for Exercises **3.8 to 3.11**, based on the assumed schema from **Figure 3.11 (Insurance Database)** and **Figure 3.12 (Employee Database)**:

---

## ✅ **3.8: Insurance Database SQL Queries**

**a.** Number of accidents involving John Smith's cars:

```sql
SELECT COUNT(DISTINCT p.report_number) AS accident_count
FROM person ps
JOIN owns o ON ps.driver_id = o.driver_id
JOIN participated p ON o.license = p.license
WHERE ps.name = 'John Smith';
```

**b.** Update damage amount for car “AABB2000” in accident “AR2197”:

```sql
UPDATE participated
SET damage_amount = 3000
WHERE license = 'AABB2000' AND report_number = 'AR2197';
```

---

## ✅ **3.9: Employee Database SQL Queries**

**a.** Names of employees working for First Bank Corporation:

```sql
SELECT e.employee_name
FROM employee e
JOIN works w ON e.employee_name = w.employee_name
WHERE w.company_name = 'First Bank Corporation';
```

**b.** Employees living in same city as company:

```sql
SELECT e.employee_name
FROM employee e
JOIN works w ON e.employee_name = w.employee_name
JOIN company c ON w.company_name = c.company_name
WHERE e.city = c.city;
```

**c.** Employees living on same street and city as their managers:

```sql
SELECT e.employee_name
FROM employee e
JOIN manages m ON e.employee_name = m.employee_name
JOIN employee mngr ON m.manager_name = mngr.employee_name
WHERE e.street = mngr.street AND e.city = mngr.city;
```

**d.** Employees earning more than avg salary of their company:

```sql
SELECT w1.employee_name
FROM works w1
WHERE w1.salary > (
    SELECT AVG(w2.salary)
    FROM works w2
    WHERE w1.company_name = w2.company_name
);
```

**e.** Company with smallest payroll:

```sql
SELECT w.company_name
FROM works w
GROUP BY w.company_name
ORDER BY SUM(w.salary) ASC
LIMIT 1;
```

---

## ✅ **3.10: More SQL Queries**

**a.** Give all employees of First Bank Corp a 10% raise:

```sql
UPDATE works
SET salary = salary * 1.10
WHERE company_name = 'First Bank Corporation';
```

**b.** Give all managers of First Bank Corp a 10% raise:

```sql
UPDATE works
SET salary = salary * 1.10
WHERE employee_name IN (SELECT employee_name FROM manages)
AND company_name = 'First Bank Corporation';
```

**c.** Delete works tuples for Small Bank Corp employees:

```sql
DELETE FROM works
WHERE company_name = 'Small Bank Corporation';
```

---

## ✅ **3.11: Relational Algebra to SQL Translation**

Let:

- `R(A, B, C)`
- `S(D, E, F)`
- `r` and `s` are instances

**a.** `π_A(r)` — Projection of attribute A:

```sql
SELECT DISTINCT A FROM r;
```

**b.** `σ_{B=17}(r)` — Selection where B = 17:

```sql
SELECT * FROM r
WHERE B = 17;
```

**c.** `r × s` — Cartesian product:

```sql
SELECT * FROM r CROSS JOIN s;
```

**d.** `π_{A, F}(σ_{C=D}(r × s))` — Join on C=D, then project A, F:

```sql
SELECT r.A, s.F
FROM r
JOIN s ON r.C = s.D;
```

---

Here are the solutions for exercises **3.12 to 3.17**:

---

## ✅ **3.12: SQL Equivalents of Relational Algebra**

Assuming `r1` and `r2` have schema `(A, B, C)`:

**a.** `r1 ∪ r2` (Union):

```sql
SELECT * FROM r1
UNION
SELECT * FROM r2;
```

**b.** `r1 ∩ r2` (Intersection):

```sql
SELECT * FROM r1
INTERSECT
SELECT * FROM r2;
```

**c.** `r1 − r2` (Set Difference):

```sql
SELECT * FROM r1
EXCEPT
SELECT * FROM r2;
```

**d.** `π_AB(r1) ⨝ π_BC(r2)` (Join after projection):

```sql
SELECT r1.A, r1.B, r2.C
FROM (
    SELECT DISTINCT A, B FROM r1
) AS r1
JOIN (
    SELECT DISTINCT B, C FROM r2
) AS r2
ON r1.B = r2.B;
```

---

## ✅ **3.13: Show that `<> ALL` is identical to `NOT IN`**

### Example:

```sql
SELECT * FROM employee
WHERE employee_name <> ALL (
    SELECT manager_name FROM manages
);
```

This is logically the same as:

```sql
SELECT * FROM employee
WHERE employee_name NOT IN (
    SELECT manager_name FROM manages
);
```

✅ **Explanation**:

- `<> ALL (subquery)` means “not equal to any value in the subquery.”
- `NOT IN (subquery)` has the same effect **unless** the subquery contains `NULL`, which can make `NOT IN` return **no rows**. So in practice, they behave the same **only when the subquery has no NULLs**.

---

## ✅ **3.14: View with Manager Name and Average Salary**

### View Definition:

```sql
CREATE VIEW manager_avg_salary AS
SELECT m.manager_name, AVG(w.salary) AS avg_salary
FROM manages m
JOIN works w ON m.employee_name = w.employee_name
GROUP BY m.manager_name;
```

### ❌ Why Updates Should Not Be Allowed:

- This view uses **aggregation** (`AVG`) and **GROUP BY**.
- Updating such views is problematic because:

  - There is **no one-to-one correspondence** between rows in the view and rows in base tables.
  - It’s unclear **which base rows to modify**.
  - **Ambiguity** arises in how to distribute changes across aggregated data.

---

## ✅ **3.15: Branches with Less than Average Deposit**

Assuming `account(branch_name, balance)`:

**a. Using a nested query in the `FROM` clause:**

```sql
SELECT a.branch_name, SUM(a.balance) AS total_deposit
FROM account a
GROUP BY a.branch_name
HAVING SUM(a.balance) < (
    SELECT AVG(total)
    FROM (
        SELECT branch_name, SUM(balance) AS total
        FROM account
        GROUP BY branch_name
    ) AS branch_totals
);
```

**b. Using a nested query in the `HAVING` clause:**

```sql
SELECT branch_name
FROM account
GROUP BY branch_name
HAVING SUM(balance) < (
    SELECT AVG(SUM(balance))
    FROM account
    GROUP BY branch_name
);
```

---

## ✅ **3.16: Reasons Null Values Might Be Introduced**

1. **Missing Data at Time of Entry**: e.g., optional fields like phone number.
2. **Inapplicable Data**: e.g., `spouse_name` for unmarried individuals.

---

## ✅ **3.17: Coalesce Using CASE Expression**

Equivalent to:

```sql
COALESCE(a1, a2, a3)
```

Use:

```sql
CASE
    WHEN a1 IS NOT NULL THEN a1
    WHEN a2 IS NOT NULL THEN a2
    WHEN a3 IS NOT NULL THEN a3
    ELSE NULL
END
```

Here are the answers to exercises **3.18 to 3.21**:

---

## ✅ **3.18: SQL Schema Definition for Employee Database (Figure 3.12)**

```sql
CREATE TABLE employee (
    employee_name VARCHAR(50) PRIMARY KEY,
    street VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE company (
    company_name VARCHAR(50) PRIMARY KEY,
    city VARCHAR(50)
);

CREATE TABLE works (
    employee_name VARCHAR(50),
    company_name VARCHAR(50),
    salary DECIMAL(10, 2),
    PRIMARY KEY (employee_name, company_name),
    FOREIGN KEY (employee_name) REFERENCES employee(employee_name),
    FOREIGN KEY (company_name) REFERENCES company(company_name)
);

CREATE TABLE manages (
    employee_name VARCHAR(50) PRIMARY KEY,
    manager_name VARCHAR(50),
    FOREIGN KEY (employee_name) REFERENCES employee(employee_name),
    FOREIGN KEY (manager_name) REFERENCES employee(employee_name)
);
```

---

## ✅ **3.19: SQL Views Using Bank Database**

Assume these relations exist:

- `account(account_number, branch_name, balance)`
- `depositor(customer_name, account_number)`
- `customer(customer_name, customer_street, customer_city)`
- `loan(loan_number, branch_name, amount)`
- `borrower(customer_name, loan_number)`

**a. Account numbers and customer names for accounts at Deer Park:**

```sql
CREATE VIEW deer_park_accounts AS
SELECT d.account_number, d.customer_name
FROM account a
JOIN depositor d ON a.account_number = d.account_number
WHERE a.branch_name = 'Deer Park';
```

**b. Names and addresses of customers with an account but no loan:**

```sql
CREATE VIEW only_account_customers AS
SELECT DISTINCT c.customer_name, c.customer_street, c.customer_city
FROM customer c
JOIN depositor d ON c.customer_name = d.customer_name
WHERE c.customer_name NOT IN (
    SELECT customer_name FROM borrower
);
```

**c. Name and average balance of customers at Rock Ridge branch:**

```sql
CREATE VIEW rock_ridge_avg_balance AS
SELECT d.customer_name, AVG(a.balance) AS avg_balance
FROM account a
JOIN depositor d ON a.account_number = d.account_number
WHERE a.branch_name = 'Rock Ridge'
GROUP BY d.customer_name;
```

---

## ✅ **3.20: Updates for Views in 3.19**

- **a. deer_park_accounts**: ❌ Not updatable due to `JOIN` and filtering. Cannot tell which base row to update.
- **b. only_account_customers**: ❌ Not updatable due to `NOT IN` and `DISTINCT`.
- **c. rock_ridge_avg_balance**: ❌ Not updatable due to `AVG()` aggregation and `GROUP BY`.

Updates should **not be allowed** for any of these views as the mapping to base tables is not one-to-one and causes ambiguity.

---

## ✅ **3.21: Queries with Schema**

```sql
employee(empno, name, office, age)
books(isbn, title, authors, publisher)
loan(empno, isbn, date)
```

**a. Employees who borrowed _any_ McGraw-Hill book:**

```sql
SELECT DISTINCT e.name
FROM employee e
JOIN loan l ON e.empno = l.empno
JOIN books b ON l.isbn = b.isbn
WHERE b.publisher = 'McGraw-Hill';
```

---

**b. Employees who borrowed _all_ McGraw-Hill books:**

```sql
SELECT e.name
FROM employee e
WHERE NOT EXISTS (
    SELECT b.isbn
    FROM books b
    WHERE b.publisher = 'McGraw-Hill'
    EXCEPT
    SELECT l.isbn
    FROM loan l
    WHERE l.empno = e.empno
);
```

---

**c. For each publisher, employees who borrowed > 5 books from that publisher:**

```sql
SELECT b.publisher, e.name
FROM employee e
JOIN loan l ON e.empno = l.empno
JOIN books b ON l.isbn = b.isbn
GROUP BY b.publisher, e.name
HAVING COUNT(DISTINCT l.isbn) > 5;
```

---

Here are the SQL solutions for **Exercises 3.22 and 3.23**:

---

## ✅ **3.22: Student and Course Count (Even If Zero)**

Given:

```sql
student(student_id, student_name)
registered(student_id, course_id)
```

### SQL Query:

```sql
SELECT s.student_id, s.student_name,
       COUNT(r.course_id) AS total_courses
FROM student s
LEFT JOIN registered r ON s.student_id = r.student_id
GROUP BY s.student_id, s.student_name;
```

✅ **Explanation**:

- `LEFT JOIN` ensures students not registered for any course are still included.
- `COUNT(r.course_id)` returns 0 for those without registrations.

---

## ✅ **3.23: Dense Rank of Students by Score**

Given:

```sql
marks(student_id, score)
```

We need to assign **dense ranks**, where ties share the same rank and the next rank is incremented without gaps.

### SQL Query using `WITH` clause:

```sql
WITH DistinctScores AS (
    SELECT DISTINCT score
    FROM marks
),
RankedScores AS (
    SELECT score, DENSE_RANK() OVER (ORDER BY score DESC) AS dense_rank
    FROM DistinctScores
)
SELECT m.student_id, m.score, r.dense_rank
FROM marks m
JOIN RankedScores r ON m.score = r.score;
```

✅ **Explanation**:

- `DistinctScores`: gets unique scores.
- `RankedScores`: assigns dense ranks based on descending scores.
- Final `JOIN`: matches original marks with their ranks.
