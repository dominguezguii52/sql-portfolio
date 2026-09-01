-- =========================================
-- PROJECT: Streaming Platform Analytics
-- DESCRIPTION: Advanced SQL practice covering multi-table joins, subqueries, and conditional statements (CASE WHEN).
-- =========================================

-- 1. Create users table
CREATE TABLE users (
    user_id INTEGER PRIMARY KEY,
    username TEXT,
    country TEXT,
    subscription_type TEXT
);

-- 2. Create shows table (movies or series)
CREATE TABLE shows (
    show_id INTEGER PRIMARY KEY,
    title TEXT,
    genre TEXT,
    duration_minutes INTEGER,
    release_year INTEGER
);

-- 3. Create watch_history table (linking users and shows with metadata)
CREATE TABLE watch_history (
    watch_id INTEGER PRIMARY KEY,
    user_id INTEGER,
    show_id INTEGER,
    watch_date TEXT,
    completion_percentage INTEGER,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (show_id) REFERENCES shows(show_id)
);

-- 4. Insert sample data into users
INSERT INTO users (user_id, username, country, subscription_type) VALUES 
(1, 'alex_99', 'USA', 'Premium'),
(2, 'sofia_dev', 'Argentina', 'Standard'),
(3, 'liam_smith', 'UK', 'Premium'),
(4, 'carlos_m', 'Spain', 'Basic');

-- 5. Insert sample data into shows
INSERT INTO shows (show_id, title, genre, duration_minutes, release_year) VALUES 
(1, 'The Data Matrix', 'Sci-Fi', 140, 2023),
(2, 'SQL & Queries', 'Documentary', 90, 2024),
(3, 'Debugging Life', 'Comedy', 115, 2022),
(4, 'Cloud Horizons', 'Sci-Fi', 125, 2025);

-- 6. Insert sample data into watch_history
INSERT INTO watch_history (watch_id, user_id, show_id, watch_date, completion_percentage) VALUES 
(1, 1, 1, '2026-05-01', 100),
(2, 2, 2, '2026-05-02', 85),
(3, 1, 3, '2026-05-03', 40),
(4, 3, 4, '2026-05-04', 100),
(5, 4, 1, '2026-05-05', 90),
(6, 2, 3, '2026-05-06', 100);

-- 7. Query 1: Multi-table Join (Connecting Users, Watch History, and Shows)
SELECT u.username, s.title, s.genre, wh.completion_percentage, wh.watch_date
FROM watch_history wh
JOIN users u ON wh.user_id = u.user_id
JOIN shows s ON wh.show_id = s.show_id;

-- 8. Query 2: Subquery (Find shows that are longer than the average duration of all shows)
SELECT title, duration_minutes, genre
FROM shows
WHERE duration_minutes > (SELECT AVG(duration_minutes) FROM shows);

-- 9. Query 3: Conditional Logic (CASE WHEN) to classify user engagement based on completion rate
SELECT 
    u.username,
    s.title,
    wh.completion_percentage,
    CASE 
        wh.completion_percentage 
        WHEN 100 THEN 'Completed'
        ELSE 'In Progress'
    END AS watch_status
FROM watch_history wh
JOIN users u ON wh.user_id = u.user_id
JOIN shows s ON wh.show_id = s.show_id;