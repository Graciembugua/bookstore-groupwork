-- Create database
CREATE DATABASE IF NOT EXISTS BookstoreDB;
USE BookstoreDB;

-- Create Tables
CREATE TABLE country (
    country_id INT PRIMARY KEY,
    country_name VARCHAR(100)
);

CREATE TABLE address_status (
    status_id INT PRIMARY KEY,
    status_name VARCHAR(50)
);

CREATE TABLE book_language (
    language_id INT PRIMARY KEY,
    language_name VARCHAR(50)
);

CREATE TABLE order_status (
    status_id INT PRIMARY KEY,
    status_name VARCHAR(50)
);

CREATE TABLE shipping_method (
    method_id INT PRIMARY KEY,
    method_name VARCHAR(50)
);

CREATE TABLE publisher (
    publisher_id INT PRIMARY KEY,
    publisher_name VARCHAR(100)
);

CREATE TABLE author (
    author_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100)
);

CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE address (
    address_id INT PRIMARY KEY,
    street VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(100),
    zip VARCHAR(20),
    country_id INT,
    FOREIGN KEY (country_id) REFERENCES country(country_id)
);

CREATE TABLE customer_address (
    customer_id INT,
    address_id INT,
    status_id INT,
    PRIMARY KEY (customer_id, address_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (address_id) REFERENCES address(address_id),
    FOREIGN KEY (status_id) REFERENCES address_status(status_id)
);

CREATE TABLE book (
    book_id INT PRIMARY KEY,
    title VARCHAR(255),
    isbn VARCHAR(20),
    language_id INT,
    publisher_id INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (language_id) REFERENCES book_language(language_id),
    FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id)
);

CREATE TABLE book_author (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id),
    FOREIGN KEY (author_id) REFERENCES author(author_id)
);

CREATE TABLE cust_order (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATETIME,
    shipping_method_id INT,
    status_id INT,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (shipping_method_id) REFERENCES shipping_method(method_id),
    FOREIGN KEY (status_id) REFERENCES order_status(status_id)
);

CREATE TABLE order_line (
    order_line_id INT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id)
);

CREATE TABLE order_history (
    history_id INT PRIMARY KEY,
    order_id INT,
    status_id INT,
    status_date DATETIME,
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (status_id) REFERENCES order_status(status_id)
);

-- Insert Data
INSERT INTO country VALUES 
(1, 'Kenya'), (2, 'USA'), (3, 'UK');

INSERT INTO address_status VALUES 
(1, 'current'), (2, 'old');

INSERT INTO book_language VALUES 
(1, 'English'), (2, 'Swahili'), (3, 'French');

INSERT INTO order_status VALUES 
(1, 'pending'), (2, 'shipped'), (3, 'delivered'), (4, 'cancelled');

INSERT INTO shipping_method VALUES 
(1, 'Standard'), (2, 'Express'), (3, 'Pickup');

INSERT INTO publisher VALUES 
(1, 'Penguin'), (2, 'HarperCollins'), (3, 'Macmillan'), (4, 'Random House'), (5, 'Oxford Press');

INSERT INTO author VALUES 
(1, 'Tara', 'Berg'), (2, 'Eric', 'Peterson'), (3, 'John', 'Neal'),
(6, 'Jane', 'Smith'), (9, 'Mike', 'Brown'), (10, 'Sara', 'Connor');

INSERT INTO customer VALUES 
(1, 'Joseph', 'Johnson', 'maciaslevi@wallace-huffman.com'),
(2, 'Stephen', 'Walker', 'rogersrichard@hotmail.com'),
(3, 'Gregory', 'Rogers', 'allisondouglas@mann.com');

INSERT INTO address VALUES 
(1, '53987 Giles Corners', 'New Jennifermouth', 'New Hampshire', '39237', 1),
(2, '4771 Matthew Drive Apt. 376', 'Schneidermouth', 'Oregon', '46397', 2),
(3, '02569 Angela Cliffs Apt. 356', 'South Ryanfort', 'Texas', '71537', 3);

INSERT INTO customer_address VALUES 
(1, 1, 1), (2, 2, 1), (3, 3, 1);

INSERT INTO book VALUES 
(1, 'Goal knowledge floor.', '978-0-405-05811-0', 1, 5, 18.33),
(2, 'Attack sell.', '978-1-72578-810-7', 3, 2, 60.58),
(3, 'Modern car.', '978-0-594-17400-4', 1, 5, 12.67);

INSERT INTO book_author VALUES 
(1, 10), (2, 6), (2, 2), (3, 2), (3, 9);

INSERT INTO cust_order VALUES 
(1, 1, '2025-01-06 15:28:43', 3, 2),
(2, 1, '2025-02-15 09:56:40', 3, 3),
(3, 2, '2025-03-14 07:51:26', 1, 2);

INSERT INTO order_line VALUES 
(1, 1, 1, 3, 70.99),
(2, 1, 2, 2, 78.62),
(3, 2, 2, 1, 19.72),
(4, 2, 2, 3, 41.86),
(5, 3, 3, 2, 67.98);

INSERT INTO order_history VALUES 
(1, 1, 2, '2025-02-28 04:34:11'),
(2, 2, 3, '2025-01-21 11:35:46'),
(3, 3, 2, '2025-03-14 09:57:18');
