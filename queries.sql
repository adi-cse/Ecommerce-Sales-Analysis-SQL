-- 1. Total Sales
SELECT SUM(p.price * od.quantity) AS total_sales
FROM order_details od
JOIN products p ON od.product_id = p.product_id;

-- 2. Top Selling Product
SELECT p.product_name, SUM(od.quantity) AS total_sold
FROM order_details od
JOIN products p ON od.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC
LIMIT 1;

-- 3. Customer Spending
SELECT c.name, SUM(p.price * od.quantity) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_details od ON o.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
GROUP BY c.name;

-- 4. Monthly Revenue
SELECT MONTH(order_date) AS month,
       SUM(p.price * od.quantity) AS revenue
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
GROUP BY month;

-- 5. Top Customers
SELECT c.name, COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.name
ORDER BY total_orders DESC;
