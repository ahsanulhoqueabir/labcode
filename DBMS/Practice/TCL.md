# Transaction Control Language (TCL) in SQL

Transaction Control Language (TCL) commands are used to manage transactions in a database. Below are the commonly used TCL commands:

## 1. `COMMIT`

Used to save all changes made during the current transaction.

```sql
COMMIT;
```

## 2. `ROLLBACK`

Used to undo changes made during the current transaction.

```sql
ROLLBACK;
```

## 3. `SAVEPOINT`

Used to set a point within a transaction to which you can later roll back.

```sql
SAVEPOINT savepoint_name;
```

## 4. `ROLLBACK TO SAVEPOINT`

Used to roll back the transaction to a specific savepoint.

```sql
ROLLBACK TO SAVEPOINT savepoint_name;
```

## 5. `SET TRANSACTION`

Used to set the properties of a transaction, such as isolation level.

```sql
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
```

## Example Usage

```sql
BEGIN TRANSACTION;

INSERT INTO employees (id, name) VALUES (1, 'John Doe');
SAVEPOINT sp1;

INSERT INTO employees (id, name) VALUES (2, 'Jane Doe');
ROLLBACK TO SAVEPOINT sp1;

COMMIT;
```
