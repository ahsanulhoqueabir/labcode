-- Trigger for INSERT operation
CREATE TRIGGER trg_after_insert
AFTER INSERT ON your_table_name
FOR EACH ROW
BEGIN
    -- Your logic here
END;

-- Trigger for UPDATE operation
CREATE TRIGGER trg_after_update
AFTER UPDATE ON your_table_name
FOR EACH ROW
BEGIN
    -- Your logic here
END;

-- Trigger for DELETE operation
CREATE TRIGGER trg_after_delete
AFTER DELETE ON your_table_name
FOR EACH ROW
BEGIN
    -- Your logic here
END;

-- Trigger for BEFORE INSERT operation
CREATE TRIGGER trg_before_insert
BEFORE INSERT ON your_table_name
FOR EACH ROW
BEGIN
    -- Your logic here
END;

-- Trigger for BEFORE UPDATE operation
CREATE TRIGGER trg_before_update
BEFORE UPDATE ON your_table_name
FOR EACH ROW
BEGIN
    -- Your logic here
END;

-- Trigger for BEFORE DELETE operation
CREATE TRIGGER trg_before_delete
BEFORE DELETE ON your_table_name
FOR EACH ROW
BEGIN
    -- Your logic here
END;

-- Trigger for INSERT OR UPDATE operation
CREATE TRIGGER trg_after_insert_or_update
AFTER INSERT OR UPDATE ON your_table_name
FOR EACH ROW
BEGIN
    -- Your logic here
END;

-- Trigger for INSERT OR DELETE operation
CREATE TRIGGER trg_after_insert_or_delete
AFTER INSERT OR DELETE ON your_table_name
FOR EACH ROW
BEGIN
    -- Your logic here
END;

-- Trigger for UPDATE OR DELETE operation
CREATE TRIGGER trg_after_update_or_delete
AFTER UPDATE OR DELETE ON your_table_name
FOR EACH ROW
BEGIN
    -- Your logic here
END;

-- Trigger for INSERT OR UPDATE OR DELETE operation
CREATE TRIGGER trg_after_insert_update_delete
AFTER INSERT OR UPDATE OR DELETE ON your_table_name
FOR EACH ROW
BEGIN
    -- Your logic here
END;