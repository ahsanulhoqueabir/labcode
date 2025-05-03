# SQL Triggers with Explanations

A **trigger** in SQL is a set of instructions that automatically executes in response to certain events on a particular table or view. Below are examples of different types of triggers with explanations.

---

## 1. **BEFORE INSERT Trigger**

This trigger executes before a new record is inserted into the table.

```sql
CREATE TRIGGER before_insert_trigger
BEFORE INSERT ON your_table
FOR EACH ROW
BEGIN
    -- Example: Validate data before insertion
    IF NEW.column_name IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Column cannot be NULL';
    END IF;
END;
```

### Explanation:

- `BEFORE INSERT`: Trigger fires before the `INSERT` operation.
- `NEW`: Refers to the new row being inserted.
- Validation ensures data integrity before insertion.

---

## 2. **AFTER INSERT Trigger**

This trigger executes after a new record is inserted into the table.

```sql
CREATE TRIGGER after_insert_trigger
AFTER INSERT ON your_table
FOR EACH ROW
BEGIN
    -- Example: Log the insertion into an audit table
    INSERT INTO audit_table (action, timestamp)
    VALUES ('INSERT', NOW());
END;
```

### Explanation:

- `AFTER INSERT`: Trigger fires after the `INSERT` operation.
- Useful for logging or cascading changes to other tables.

---

## 3. **BEFORE UPDATE Trigger**

This trigger executes before an update operation on the table.

```sql
CREATE TRIGGER before_update_trigger
BEFORE UPDATE ON your_table
FOR EACH ROW
BEGIN
    -- Example: Prevent updates to a specific column
    IF OLD.protected_column != NEW.protected_column THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Protected column cannot be updated';
    END IF;
END;
```

### Explanation:

- `BEFORE UPDATE`: Trigger fires before the `UPDATE` operation.
- `OLD`: Refers to the existing row before the update.
- `NEW`: Refers to the updated row.

---

## 4. **AFTER UPDATE Trigger**

This trigger executes after an update operation on the table.

```sql
CREATE TRIGGER after_update_trigger
AFTER UPDATE ON your_table
FOR EACH ROW
BEGIN
    -- Example: Log the update into an audit table
    INSERT INTO audit_table (action, timestamp, old_value, new_value)
    VALUES ('UPDATE', NOW(), OLD.column_name, NEW.column_name);
END;
```

### Explanation:

- `AFTER UPDATE`: Trigger fires after the `UPDATE` operation.
- Useful for tracking changes to data.

---

## 5. **BEFORE DELETE Trigger**

This trigger executes before a record is deleted from the table.

```sql
CREATE TRIGGER before_delete_trigger
BEFORE DELETE ON your_table
FOR EACH ROW
BEGIN
    -- Example: Prevent deletion of critical records
    IF OLD.critical_column = 'YES' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Critical records cannot be deleted';
    END IF;
END;
```

### Explanation:

- `BEFORE DELETE`: Trigger fires before the `DELETE` operation.
- Prevents accidental deletion of important data.

---

## 6. **AFTER DELETE Trigger**

This trigger executes after a record is deleted from the table.

```sql
CREATE TRIGGER after_delete_trigger
AFTER DELETE ON your_table
FOR EACH ROW
BEGIN
    -- Example: Log the deletion into an audit table
    INSERT INTO audit_table (action, timestamp, deleted_value)
    VALUES ('DELETE', NOW(), OLD.column_name);
END;
```

### Explanation:

- `AFTER DELETE`: Trigger fires after the `DELETE` operation.
- Useful for maintaining an audit trail.

---

## Notes:

- Triggers are defined using `CREATE TRIGGER`.
- Use `FOR EACH ROW` to apply the trigger to each affected row.
- Use `OLD` and `NEW` to reference the row values before and after the operation.
- Be cautious with triggers to avoid performance issues or unintended side effects.
