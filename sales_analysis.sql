-- =========================================
-- PROJECT: Sales Data Analysis
-- DESCRIPTION: Basic SQL practice creating a table, inserting data, and running queries.
-- =========================================

-- 1. Create the table structure
CREATE TABLE sales (
    sale_id INTEGER PRIMARY KEY,
    customer TEXT,
    product TEXT,
    price REAL,
    city TEXT
);

-- 2. Insert sample data manually
INSERT INTO sales (sale_id, customer, product, price, city) VALUES 
(1, 'Mariana', 'Sneakers', 120.50, 'Buenos Aires'),
(2, 'Lucas', 'Jacket', 250.00, 'Cordoba'),
(3, 'Sofia', 'Sneakers', 120.50, 'Buenos Aires'),
(4, 'Mateo', 'Cap', 45.00, 'Rosario'),
(5, 'Valentina', 'Jacket', 250.00, 'Buenos Aires');

-- 3. Query: View all records
SELECT * FROM sales;

-- 4. Query: Filter specific records (Sales in Buenos Aires)
SELECT customer, product, price 
FROM sales 
WHERE city = 'Buenos Aires';

-- 5. Query: Aggregate data (Total revenue per city)
SELECT city, SUM(price) AS total_revenue 
FROM sales 
GROUP BY city;