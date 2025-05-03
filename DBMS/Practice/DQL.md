# Data Query Language (DQL) in SQL

Data Query Language (DQL) is used to retrieve data from a database. The primary command in DQL is `SELECT`. Below is a comprehensive guide to all possible SQL queries under DQL, including simple and complex examples.

---

## 1. Basic `SELECT` Query

```sql
SELECT column1, column2 FROM table_name;
```

- Retrieves specific columns from a table.

### Example:

```sql
SELECT first_name, last_name FROM employees;
```

---

## 2. Selecting All Columns

```sql
SELECT * FROM table_name;
```

- Retrieves all columns from a table.

### Example:

```sql
SELECT * FROM employees;
```

---

## 3. Using `WHERE` Clause

```sql
SELECT column1 FROM table_name WHERE condition;
```

- Filters rows based on a condition.

### Example:

```sql
SELECT first_name FROM employees WHERE department = 'HR';
```

---

## 4. Using `ORDER BY`

```sql
SELECT column1 FROM table_name ORDER BY column2 [ASC|DESC];
```

- Sorts the result set in ascending or descending order.

### Example:

```sql
SELECT first_name, salary FROM employees ORDER BY salary DESC;
```

---

## 5. Using `DISTINCT`

```sql
SELECT DISTINCT column1 FROM table_name;
```

- Removes duplicate values from the result set.

### Example:

```sql
SELECT DISTINCT department FROM employees;
```

---

## 6. Using `LIMIT` or `TOP`

```sql
SELECT column1 FROM table_name LIMIT n;
```

- Limits the number of rows returned.

### Example:

```sql
SELECT * FROM employees LIMIT 5;
```

---

## 7. Using `GROUP BY`

```sql
SELECT column1, COUNT(*) FROM table_name GROUP BY column1;
```

- Groups rows that have the same values in specified columns.

### Example:

```sql
SELECT department, COUNT(*) FROM employees GROUP BY department;
```

---

## 8. Using `HAVING`

```sql
SELECT column1, COUNT(*) FROM table_name GROUP BY column1 HAVING condition;
```

- Filters grouped data.

### Example:

```sql
SELECT department, COUNT(*) FROM employees GROUP BY department HAVING COUNT(*) > 5;
```

---

## 9. Using `JOIN` (Inner Join)

```sql
SELECT t1.column1, t2.column2 FROM table1 t1 INNER JOIN table2 t2 ON t1.common_column = t2.common_column;
```

- Combines rows from two tables based on a related column.

### Example:

```sql
SELECT employees.first_name, departments.department_name
FROM employees
INNER JOIN departments ON employees.department_id = departments.department_id;
```

---

## 10. Using `LEFT JOIN`

```sql
SELECT t1.column1, t2.column2 FROM table1 t1 LEFT JOIN table2 t2 ON t1.common_column = t2.common_column;
```

- Returns all rows from the left table, and matched rows from the right table.

### Example:

```sql
SELECT employees.first_name, departments.department_name
FROM employees
LEFT JOIN departments ON employees.department_id = departments.department_id;
```

---

## 11. Using `RIGHT JOIN`

```sql
SELECT t1.column1, t2.column2 FROM table1 t1 RIGHT JOIN table2 t2 ON t1.common_column = t2.common_column;
```

- Returns all rows from the right table, and matched rows from the left table.

### Example:

```sql
SELECT employees.first_name, departments.department_name
FROM employees
RIGHT JOIN departments ON employees.department_id = departments.department_id;
```

---

## 12. Using `FULL OUTER JOIN`

```sql
SELECT t1.column1, t2.column2 FROM table1 t1 FULL OUTER JOIN table2 t2 ON t1.common_column = t2.common_column;
```

- Returns all rows when there is a match in either table.

### Example:

```sql
SELECT employees.first_name, departments.department_name
FROM employees
FULL OUTER JOIN departments ON employees.department_id = departments.department_id;
```

---

## 13. Using Subqueries

### Subquery in `WHERE` Clause:

```sql
SELECT column1 FROM table_name WHERE column2 IN (SELECT column3 FROM another_table WHERE condition);
```

### Example:

```sql
SELECT first_name FROM employees WHERE department_id IN (SELECT department_id FROM departments WHERE location = 'New York');
```

### Subquery in `FROM` Clause:

```sql
SELECT column1 FROM (SELECT column2 FROM table_name WHERE condition) AS subquery_alias;
```

### Example:

```sql
SELECT AVG(salary) FROM (SELECT salary FROM employees WHERE department = 'HR') AS hr_salaries;
```

---

## 14. Using `UNION` and `UNION ALL`

### `UNION`:

```sql
SELECT column1 FROM table1
UNION
SELECT column1 FROM table2;
```

- Combines results of two queries and removes duplicates.

### Example:

```sql
SELECT first_name FROM employees
UNION
SELECT first_name FROM managers;
```

### `UNION ALL`:

```sql
SELECT column1 FROM table1
UNION ALL
SELECT column1 FROM table2;
```

- Combines results of two queries without removing duplicates.

---

## 15. Using `EXISTS`

```sql
SELECT column1 FROM table_name WHERE EXISTS (subquery);
```

- Checks for the existence of rows in a subquery.

### Example:

```sql
SELECT first_name FROM employees WHERE EXISTS (SELECT 1 FROM departments WHERE department_id = employees.department_id);
```

---

## 16. Using `CASE` Statement

```sql
SELECT column1,
    CASE
        WHEN condition1 THEN result1
        WHEN condition2 THEN result2
        ELSE result3
    END AS alias_name
FROM table_name;
```

### Example:

```sql
SELECT first_name,
    CASE
        WHEN salary > 50000 THEN 'High'
        WHEN salary BETWEEN 30000 AND 50000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_category
FROM employees;
```

---

## 17. Using Window Functions

### `ROW_NUMBER()`:

```sql
SELECT column1, ROW_NUMBER() OVER (PARTITION BY column2 ORDER BY column3) AS row_num
FROM table_name;
```

### Example:

```sql
SELECT first_name, ROW_NUMBER() OVER (PARTITION BY department ORDER BY salary DESC) AS rank
FROM employees;
```

### `RANK()`:

```sql
SELECT column1, RANK() OVER (PARTITION BY column2 ORDER BY column3) AS rank
FROM table_name;
```

---

## 18. Complex Query Example

```sql
SELECT e.first_name, e.salary, d.department_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id
WHERE e.salary > (SELECT AVG(salary) FROM employees WHERE department_id = e.department_id)
ORDER BY e.salary DESC;
```

- Retrieves employees with a salary above the department average, along with their department name.

---
