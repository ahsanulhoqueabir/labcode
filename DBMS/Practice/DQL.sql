-- SELECT statement to retrieve all columns from a table
SELECT * FROM table_name;

-- SELECT specific columns from a table
SELECT column1, column2 FROM table_name;

-- SELECT with WHERE clause to filter rows
SELECT * FROM table_name
WHERE condition;

-- SELECT with ORDER BY to sort the result set
SELECT * FROM table_name
ORDER BY column_name ASC; -- Use DESC for descending order

-- SELECT with GROUP BY to group rows
SELECT column_name, COUNT(*)
FROM table_name
GROUP BY column_name;

-- SELECT with HAVING to filter grouped rows
SELECT column_name, COUNT(*)
FROM table_name
GROUP BY column_name
HAVING COUNT(*) > 1;

-- SELECT with LIMIT to restrict the number of rows returned (MySQL/PostgreSQL)
SELECT * FROM table_name
LIMIT 10;

-- SELECT with OFFSET for pagination (PostgreSQL)
SELECT * FROM table_name
LIMIT 10 OFFSET 20;

-- SELECT with TOP to restrict rows (SQL Server)
SELECT TOP 10 * FROM table_name;

-- SELECT with DISTINCT to remove duplicates
SELECT DISTINCT column_name FROM table_name;

-- SELECT with JOIN to combine rows from multiple tables
SELECT a.column1, b.column2
FROM table1 a
JOIN table2 b ON a.common_column = b.common_column;

-- SELECT with LEFT JOIN to include unmatched rows from the left table
SELECT a.column1, b.column2
FROM table1 a
LEFT JOIN table2 b ON a.common_column = b.common_column;

-- SELECT with RIGHT JOIN to include unmatched rows from the right table
SELECT a.column1, b.column2
FROM table1 a
RIGHT JOIN table2 b ON a.common_column = b.common_column;

-- SELECT with FULL OUTER JOIN to include unmatched rows from both tables
SELECT a.column1, b.column2
FROM table1 a
FULL OUTER JOIN table2 b ON a.common_column = b.common_column;

-- SELECT with UNION to combine results from multiple queries
SELECT column1 FROM table1
UNION
SELECT column1 FROM table2;

-- SELECT with UNION ALL to include duplicates
SELECT column1 FROM table1
UNION ALL
SELECT column1 FROM table2;

-- SELECT with subquery in WHERE clause
SELECT * FROM table_name
WHERE column_name IN (SELECT column_name FROM another_table);

-- SELECT with EXISTS to check for the existence of rows
SELECT * FROM table_name
WHERE EXISTS (SELECT 1 FROM another_table WHERE condition);

-- SELECT with CASE for conditional expressions
SELECT column_name,
    CASE
        WHEN condition1 THEN result1
        WHEN condition2 THEN result2
        ELSE default_result
    END AS alias_name
FROM table_name;

-- SELECT with aggregate functions
SELECT COUNT(*), AVG(column_name), SUM(column_name), MIN(column_name), MAX(column_name)
FROM table_name;

-- SELECT with window functions
SELECT column_name,
    ROW_NUMBER() OVER (PARTITION BY partition_column ORDER BY order_column) AS row_num
FROM table_name;