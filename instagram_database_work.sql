# Instagram-Style MySQL Database Project

-- =====================================================
-- INSTAGRAM-STYLE MYSQL DATABASE
-- =====================================================
-- Database Name: instagram
-- Tables:
--   1. users      -> ~1200 rows
--   2. posts      -> ~5000 rows
--   3. comments   -> ~20000 rows
--   4. likes_data -> ~50000 rows
-- =====================================================

-- =====================================================
-- CREATE DATABASE
-- =====================================================
CREATE DATABASE IF NOT EXISTS instagram;
USE instagram;

-- =====================================================
-- DROP TABLES IF THEY EXIST
-- =====================================================
DROP TABLE IF EXISTS likes_data;
DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS numbers;

-- =====================================================
-- TABLE 1: USERS
-- =====================================================
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE,
    full_name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    followers_count INT,
    created_at DATETIME
);

-- =====================================================
-- TABLE 2: POSTS
-- =====================================================
CREATE TABLE posts (
    post_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    caption VARCHAR(255),
    location_name VARCHAR(100),
    likes_count INT,
    posted_at DATETIME,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- =====================================================
-- TABLE 3: COMMENTS
-- =====================================================
CREATE TABLE comments (
    comment_id INT PRIMARY KEY AUTO_INCREMENT,
    post_id INT,
    user_id INT,
    comment_text VARCHAR(255),
    comment_likes INT,
    commented_at DATETIME,
    FOREIGN KEY (post_id) REFERENCES posts(post_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- =====================================================
-- TABLE 4: LIKES DATA
-- =====================================================
CREATE TABLE likes_data (
    like_id INT PRIMARY KEY AUTO_INCREMENT,
    post_id INT,
    user_id INT,
    reaction_type VARCHAR(20),
    device_used VARCHAR(50),
    liked_at DATETIME,
    FOREIGN KEY (post_id) REFERENCES posts(post_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- =====================================================
-- INCREASE RECURSION LIMIT
-- =====================================================
SET SESSION cte_max_recursion_depth = 60000;

-- =====================================================
-- HELPER NUMBERS TABLE
-- =====================================================
CREATE TABLE numbers (
    num INT PRIMARY KEY
);

INSERT INTO numbers (num)
WITH RECURSIVE seq AS (
    SELECT 1 AS n

    UNION ALL

    SELECT n + 1
    FROM seq
    WHERE n < 50000
)
SELECT n
FROM seq;

-- =====================================================
-- INSERT USERS (~1200 ROWS)
-- =====================================================
INSERT INTO users (
    username,
    full_name,
    email,
    followers_count,
    created_at
)
SELECT
    CONCAT('user_', num),
    CONCAT('Person ', num),
    CONCAT('user_', num, '@gmail.com'),
    FLOOR(50 + RAND() * 50000),
    DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 1000) DAY)
FROM numbers
WHERE num <= 1200;

-- =====================================================
-- INSERT POSTS (~5000 ROWS)
-- =====================================================
INSERT INTO posts (
    user_id,
    caption,
    location_name,
    likes_count,
    posted_at
)
SELECT
    FLOOR(1 + RAND() * 1200),
    ELT(
        FLOOR(1 + RAND() * 10),
        'Sunset vibes 🌇',
        'Weekend coffee ☕',
        'Gym session done 💪',
        'Travel memories ✈️',
        'Late night coding 💻',
        'Street photography 📸',
        'Nature walk 🌿',
        'Foodie moments 🍔',
        'Beach time 🌊',
        'New reel uploaded 🎬'
    ),
    ELT(
        FLOOR(1 + RAND() * 10),
        'Delhi',
        'Mumbai',
        'Bangalore',
        'New York',
        'London',
        'Dubai',
        'Paris',
        'Tokyo',
        'Singapore',
        'Toronto'
    ),
    FLOOR(10 + RAND() * 10000),
    DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 365) DAY)
FROM numbers
WHERE num <= 5000;

-- =====================================================
-- INSERT COMMENTS (~20000 ROWS)
-- =====================================================
INSERT INTO comments (
    post_id,
    user_id,
    comment_text,
    comment_likes,
    commented_at
)
SELECT
    FLOOR(1 + RAND() * 5000),
    FLOOR(1 + RAND() * 1200),
    ELT(
        FLOOR(1 + RAND() * 15),
        'Amazing post!',
        'Love this 🔥',
        'Great shot 📸',
        'So cool!',
        'Nice aesthetic ✨',
        'This is awesome!',
        'Where is this place?',
        'Beautiful picture ❤️',
        'Keep posting!',
        'Legend 😎',
        'Top content!',
        'Very inspiring!',
        'Looks fun!',
        'Best reel today!',
        'Super creative!'
    ),
    FLOOR(RAND() * 1000),
    DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 365) DAY)
FROM numbers
WHERE num <= 20000;

-- =====================================================
-- INSERT LIKES (~50000 ROWS)
-- =====================================================
INSERT INTO likes_data (
    post_id,
    user_id,
    reaction_type,
    device_used,
    liked_at
)
SELECT
    FLOOR(1 + RAND() * 5000),
    FLOOR(1 + RAND() * 1200),
    ELT(
        FLOOR(1 + RAND() * 3),
        'LIKE',
        'LOVE',
        'FIRE'
    ),
    ELT(
        FLOOR(1 + RAND() * 5),
        'Android',
        'iPhone',
        'iPad',
        'Web',
        'Tablet'
    ),
    DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 365) DAY)
FROM numbers;

-- =====================================================
-- SAMPLE QUERIES
-- =====================================================

-- 1. SHOW TOP 10 USERS BY FOLLOWERS
SELECT *
FROM users
ORDER BY followers_count DESC
LIMIT 10;

-- 2. SHOW POSTS WITH USERNAMES
SELECT
    p.post_id,
    u.username,
    p.caption,
    p.likes_count,
    p.location_name
FROM posts p
JOIN users u
ON p.user_id = u.user_id
LIMIT 20;

-- 3. SHOW COMMENTS WITH POST DETAILS
SELECT
    c.comment_id,
    u.username,
    c.comment_text,
    p.caption
FROM comments c
JOIN users u
ON c.user_id = u.user_id
JOIN posts p
ON c.post_id = p.post_id
LIMIT 20;

-- 4. COUNT TOTAL LIKES PER USER
SELECT
    u.username,
    COUNT(l.like_id) AS total_likes
FROM users u
JOIN likes_data l
ON u.user_id = l.user_id
GROUP BY u.username
ORDER BY total_likes DESC
LIMIT 20;

-- =====================================================
-- VERIFY ROW COUNTS
-- =====================================================
SELECT COUNT(*) AS total_users FROM users;
SELECT COUNT(*) AS total_posts FROM posts;
SELECT COUNT(*) AS total_comments FROM comments;
SELECT COUNT(*) AS total_likes FROM likes_data;

