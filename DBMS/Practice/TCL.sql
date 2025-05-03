-- Transaction Control Language (TCL) commands in SQL

-- START TRANSACTION or BEGIN TRANSACTION
START TRANSACTION;
-- or
BEGIN TRANSACTION;

-- COMMIT: Save all changes made during the transaction
COMMIT;

-- ROLLBACK: Undo all changes made during the transaction
ROLLBACK;

-- SAVEPOINT: Set a point within a transaction to which you can later roll back
SAVEPOINT savepoint_name;

-- ROLLBACK TO SAVEPOINT: Roll back to a specific savepoint
ROLLBACK TO SAVEPOINT savepoint_name;

-- RELEASE SAVEPOINT: Remove a savepoint
RELEASE SAVEPOINT savepoint_name;

-- SET TRANSACTION: Set properties for the current transaction
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
-- Other isolation levels: READ UNCOMMITTED, REPEATABLE READ, SERIALIZABLE

-- Example usage of TCL commands
BEGIN TRANSACTION;

UPDATE accounts SET balance = balance - 100 WHERE account_id = 1;
SAVEPOINT deduct_balance;

UPDATE accounts SET balance = balance + 100 WHERE account_id = 2;

-- Rollback to the savepoint if needed
ROLLBACK TO SAVEPOINT deduct_balance;

-- Commit the transaction
COMMIT;