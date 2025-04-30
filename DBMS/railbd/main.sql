-- Active: 1741584315038@@127.0.0.1@3306@jnubank


CREATE VIEW Branch_Customers AS
SELECT DISTINCT b.branch_name, c.customer_name,c.customer_street,c.customer_city
FROM branch b
JOIN account a ON b.branch_name = a.branch_name
JOIN depositor d ON a.account_number = d.account_number
JOIN customer c ON d.customer_name = c.customer_name;


