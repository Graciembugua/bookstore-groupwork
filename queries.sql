-- ============================
-- SAMPLE SQL QUERIES FOR BOOKSTOREDB
-- ============================

-- 1. View all books in the catalog
SELECT * FROM Books;

-- 2. List all customers
SELECT * FROM Customers;

-- 3. View all orders placed
SELECT * FROM Orders;

-- 4. View all items in a specific order (e.g., order_id = 1001)
SELECT * FROM OrderItems WHERE order_id = 1001;

-- 5. Find books by a specific author
SELECT * FROM Books WHERE author LIKE '%Ngugi%';

-- 6. Get total orders placed by each customer
SELECT customer_id, COUNT(order_id) AS total_orders
FROM Orders
GROUP BY customer_id;

-- 7. View the top 5 most ordered books
SELECT book_id, COUNT(*) AS times_ordered
FROM OrderItems
GROUP BY book_id
ORDER BY times_ordered DESC
LIMIT 5;

-- 8. Display customer info with order count
SELECT c.customer_id, c.full_name, COUNT(o.order_id) AS order_count
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id;

-- 9. Check availability of books (assuming a 'stock' column exists)
SELECT title, stock FROM Books WHERE stock > 0;

-- 10. View detailed order summary
SELECT o.order_id, c.full_name, b.title, oi.quantity, oi.price
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
JOIN OrderItems oi ON o.order_id = oi.order_id
JOIN Books b ON oi.book_id = b.book_id;
