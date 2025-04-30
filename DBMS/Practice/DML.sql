-- INSERT Statement
-- Insert a user
INSERT INTO users (name, email, password)
VALUES ('John Doe', 'john.doe@example.com', 'hashed_password');

-- Insert a post
INSERT INTO posts (user_id, title, content)
VALUES (1, 'First Post', 'This is the content of the first post.');

-- Insert a comment
INSERT INTO comments (post_id, user_id, comment)
VALUES (1, 1, 'This is a comment.');

-- UPDATE Statement
-- Update a user's email
UPDATE users
SET email = 'new.email@example.com'
WHERE id = 1;

-- Update a post's title
UPDATE posts
SET title = 'Updated Post Title'
WHERE id = 1;

-- DELETE Statement
-- Delete a comment
DELETE FROM comments
WHERE id = 1;

-- SELECT Statement
-- Select all users
SELECT * FROM users;

-- Select all posts by a specific user
SELECT * FROM posts
WHERE user_id = 1;

-- MERGE Statement (UPSERT)
-- Merge example for users table
MERGE INTO users AS target
USING (SELECT 'Jane Doe' AS name, 'jane.doe@example.com' AS email, 'hashed_password' AS password) AS source
ON target.email = source.email
WHEN MATCHED THEN
    UPDATE SET target.name = source.name, target.password = source.password
WHEN NOT MATCHED THEN
    INSERT (name, email, password) VALUES (source.name, source.email, source.password);