-- Data Control Language (DCL) commands are used to control access to data in a database.

-- Granting privileges to a user
GRANT SELECT, INSERT, UPDATE, DELETE ON table_name TO user_name;

-- Granting all privileges to a user
GRANT ALL PRIVILEGES ON table_name TO user_name;

-- Revoking specific privileges from a user
REVOKE SELECT, INSERT ON table_name FROM user_name;

-- Revoking all privileges from a user
REVOKE ALL PRIVILEGES ON table_name FROM user_name;

-- Granting privileges to a role
GRANT SELECT, INSERT ON table_name TO role_name;

-- Revoking privileges from a role
REVOKE SELECT, INSERT ON table_name FROM role_name;

-- Granting a role to a user
GRANT role_name TO user_name;

-- Revoking a role from a user
REVOKE role_name FROM user_name;

-- Granting WITH GRANT OPTION to allow the user to grant privileges to others
GRANT SELECT ON table_name TO user_name WITH GRANT OPTION;

-- Revoking WITH GRANT OPTION
REVOKE GRANT OPTION FOR SELECT ON table_name FROM user_name;

-- Example of granting system privileges
GRANT CREATE SESSION, CREATE TABLE TO user_name;

-- Example of revoking system privileges
REVOKE CREATE SESSION, CREATE TABLE FROM user_name;