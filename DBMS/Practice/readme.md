# SQL Statements Tree View

## 1. Data Definition Language (DDL)

- **Purpose**: Defines the structure of the database.
  - `CREATE`: Create new database objects (e.g., tables, views, indexes).
  - `ALTER`: Modify existing database objects.
  - `DROP`: Delete database objects.
  - `TRUNCATE`: Remove all records from a table (faster than DELETE).
  - `RENAME`: Rename database objects.

## 2. Data Manipulation Language (DML)

- **Purpose**: Manipulates data stored in the database.
  - `INSERT`: Add new records to a table.
  - `UPDATE`: Modify existing records in a table.
  - `DELETE`: Remove specific records from a table.
  - `MERGE`: Combine `INSERT` and `UPDATE` operations.

## 3. Data Query Language (DQL)

- **Purpose**: Retrieve data from the database.
  - `SELECT`: Fetch data from one or more tables.

## 4. Data Control Language (DCL)

- **Purpose**: Control access to the database.
  - `GRANT`: Provide specific privileges to users.
  - `REVOKE`: Remove specific privileges from users.

## 5. Transaction Control Language (TCL)

- **Purpose**: Manage transactions in the database.
  - `COMMIT`: Save changes made by a transaction.
  - `ROLLBACK`: Undo changes made by a transaction.
  - `SAVEPOINT`: Set a point within a transaction to roll back to.
  - `SET TRANSACTION`: Define transaction properties.

## 6. Other SQL Statements

- **Purpose**: Miscellaneous operations.
  - `EXPLAIN`: Display execution plan of a query.
  - `DESCRIBE`: Show structure of a table.
  - `USE`: Select a specific database.
  - `SHOW`: Display database information (e.g., tables, users).

```markdown
## SQL Statements Tree View Diagram

├── Data Definition Language (DDL)
│ ├── CREATE
│ ├── ALTER
│ ├── DROP
│ ├── TRUNCATE
│ └── RENAME
├── Data Manipulation Language (DML)
│ ├── INSERT
│ ├── UPDATE
│ ├── DELETE
│ └── MERGE
├── Data Query Language (DQL)
│ └── SELECT
├── Data Control Language (DCL)
│ ├── GRANT
│ └── REVOKE
├── Transaction Control Language (TCL)
│ ├── COMMIT
│ ├── ROLLBACK
│ ├── SAVEPOINT
│ └── SET TRANSACTION
└── Other SQL Statements
├── EXPLAIN
├── DESCRIBE
├── USE
└── SHOW
```
