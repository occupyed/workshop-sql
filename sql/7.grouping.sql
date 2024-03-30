-- Create the sales table
CREATE TABLE sales (
    order_id INT PRIMARY KEY,
    order_date DATE,
    product_name VARCHAR(50),
    quantity INT,
    price DECIMAL(10, 2)
);

-- Insert sample data into the sales table
INSERT INTO sales (order_id, order_date, product_name, quantity, price)
VALUES
    (1, '2023-09-01', 'Laptop', 3, 900.00),
    (2, '2023-09-02', 'Smartphone', 5, 500.00),
    (3, '2023-09-03', 'Tablet', 2, 300.00),
    (4, '2023-09-04', 'Laptop', 2, 900.00),
    (5, '2023-09-04', 'Smartphone', 3, 500.00),
    (6, '2023-09-05', 'Tablet', 4, 300.00);

-- Example 1: Calculate Total Sales Amount by Product
SELECT product_name, SUM(quantity * price) AS total_sales
FROM sales
GROUP BY product_name;

-- Example 2: Find the Number of Orders Placed on Each Date
SELECT order_date, COUNT(order_id) AS order_count
FROM sales
GROUP BY order_date;

-- Example 3: Calculate the Average Price for Each Product
SELECT product_name, AVG(price) AS average_price
FROM sales
GROUP BY product_name;

-- Example 4: Find the Maximum Quantity Ordered for Each Product
SELECT product_name, MAX(quantity) AS max_quantity
FROM sales
GROUP BY product_name;

-- Example 5: Calculate the Total Sales Amount for Each Day
SELECT DATE(order_date) AS order_day, SUM(quantity * price) AS daily_sales
FROM sales
GROUP BY order_day;

