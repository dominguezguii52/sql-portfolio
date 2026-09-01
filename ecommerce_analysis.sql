-- =========================================
-- PROJECT: E-Commerce Performance Analysis
-- DESCRIPTION: Advanced SQL practice featuring multi-table relations (JOINs), filtering, sorting, and aggregations.
-- =========================================

-- 1. Create the customers table
CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    customer_name TEXT,
    signup_date TEXT,
    country TEXT
);

-- 2. Create the orders table linked to customers (Foreign Key relationship)
CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    product_category TEXT,
    order_amount REAL,
    order_date TEXT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- 3. Insert sample data into customers
INSERT INTO customers (customer_id, customer_name, signup_date, country) VALUES 
(1, 'Emma Watson', '2025-01-15', 'USA'),
(2, 'Liam Smith', '2025-02-20', 'UK'),
(3, 'Olivia Brown', '2025-03-10', 'USA'),
(4, 'Noah Davis', '2025-04-05', 'Canada');

-- 4. Insert sample data into orders
INSERT INTO orders (order_id, customer_id, product_category, order_amount, order_date) VALUES 
(101, 1, 'Electronics', 450.00, '2026-01-10'),
(102, 2, 'Clothing', 120.50, '2026-01-15'),
(103, 1, 'Clothing', 85.00, '2026-02-01'),
(104, 3, 'Electronics', 899.99, '2026-02-10'),
(105, 4, 'Home & Kitchen', 55.00, '2026-02-12'),
(106, 2, 'Electronics', 300.00, '2026-02-18');

-- 5. Query: Inner Join (Connect customers with their respective orders)
SELECT c.customer_name, o.product_category, o.order_amount, o.order_date
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id;

-- 6. Query: Conditional Filtering & Ordering (Orders greater than 100 sorted from highest to lowest)
SELECT product_category, order_amount, order_date
FROM orders
WHERE order_amount > 100
ORDER BY order_amount DESC;

-- 7. Query: Advanced Aggregation (Total spend and total orders per customer)
SELECT c.customer_name, COUNT(o.order_id) AS total_orders, SUM(o.order_amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY total_spent DESC;