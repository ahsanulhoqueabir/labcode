-- Create a Database 
CREATE DATABASE IF NOT EXISTS `practice` 
DEFAULT CHARACTER SET utf8mb4 
COLLATE utf8mb4_0900_ai_ci;


-- Use the Database
USE `practice`;

-- Create a Table
CREATE TABLE IF NOT EXISTS `users` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100) NOT NULL,
    `email` VARCHAR(100) NOT NULL UNIQUE,
    `password` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create another Table
CREATE TABLE IF NOT EXISTS `posts` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `user_id` INT NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `content` TEXT NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE
);

-- Create another Table
CREATE TABLE IF NOT EXISTS `comments` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `post_id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `comment` TEXT NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (`post_id`) REFERENCES `posts`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE
);
-- Create a Temporary Table
CREATE TEMPORARY TABLE `temp_users` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100) NOT NULL,
    `email` VARCHAR(100) NOT NULL UNIQUE,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create a View
CREATE VIEW `user_posts` AS
SELECT u.id AS user_id, u.name, p.id AS post_id, p.title
FROM `users` u
JOIN `posts` p ON u.id = p.user_id;


-- Alter Table to Add Index
ALTER TABLE `users` ADD INDEX (`email`);

-- Alter Table to Drop Index
ALTER TABLE `users` DROP INDEX `email`;

-- Alter Table to Add a New Column
ALTER TABLE `posts` ADD COLUMN `updated_at` TIMESTAMP NULL DEFAULT NULL;

-- Alter Table to Drop a Column
ALTER TABLE `posts` DROP COLUMN `updated_at`;

-- Alter Table to Add a Foreign Key
ALTER TABLE `posts` ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE;

-- Modify a Column
ALTER TABLE `users` MODIFY COLUMN `name` VARCHAR(150) NOT NULL;

-- Add a Unique Constraint
ALTER TABLE `posts` ADD CONSTRAINT `unique_title` UNIQUE (`title`);

-- Rename a Column
ALTER TABLE `users` CHANGE `name` `full_name` VARCHAR(150) NOT NULL;

-- Rename a Column with a Different Data Type
ALTER TABLE `users` CHANGE `full_name` `full_name` VARCHAR(200) NOT NULL;

-- Rename a Column with a Different Data Type and Default Value
ALTER TABLE `users` CHANGE `full_name` `full_name` VARCHAR(200) NOT NULL DEFAULT 'Unknown';

-- Rename a Column with a Different Data Type and Default Value and Nullable
ALTER TABLE `users` CHANGE `full_name` `full_name` VARCHAR(200) NULL DEFAULT 'Unknown';

-- Rename a Table with a Different Name
ALTER TABLE `users` RENAME TO `app_users`;

-- Drop a Table if Needed
DROP TABLE IF EXISTS `archived_posts`;

-- Drop a View if Needed
DROP VIEW IF EXISTS `user_posts`;
-- Drop a Temporary Table if Needed
DROP TEMPORARY TABLE IF EXISTS `temp_users`;



-- Rename a Table
RENAME TABLE `comments` TO `post_comments`;