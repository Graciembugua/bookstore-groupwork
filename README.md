# bookstore-groupwork
# Bookstore Database Project

## Overview

This project involves the creation and management of a MySQL database for a bookstore. The database is designed to handle various aspects of bookstore operations, including managing book inventory, customer data, orders, authors, shipping methods, and more. The goal is to create an efficient and functional database structure that can support the daily activities of a bookstore.

## Database Structure

The database consists of the following tables:

1. **country**: Stores the countries of customers.
2. **address_status**: Stores the status of customer addresses (e.g., current, old).
3. **book_language**: Stores the languages of books.
4. **order_status**: Stores the status of orders (e.g., pending, shipped, delivered).
5. **shipping_method**: Stores the available shipping methods (e.g., standard, express, pickup).
6. **publisher**: Stores the publishers of the books.
7. **author**: Stores authors and their names.
8. **customer**: Stores customer information such as first and last names, and email.
9. **address**: Stores customer addresses, including street, city, state, country, and zip code.
10. **customer_address**: Links customers to their addresses with the status of the address.
11. **book**: Stores information about books, including title, ISBN, language, publisher, and price.
12. **book_author**: Links books to authors (many-to-many relationship).
13. **cust_order**: Stores customer orders, including order date, shipping method, and status.
14. **order_line**: Stores details of the books in each order, including quantity and price.
15. **order_history**: Stores the history of order status changes.

## Features

- **Customer Management**: Track customer details and associated addresses.
- **Book Management**: Store information about books, authors, publishers, and languages.
- **Order Management**: Handle orders from customers, including order status and history.
- **Shipping and Delivery**: Manage shipping methods and track order status.
- **Data Integrity**: Foreign keys and relationships ensure data integrity across tables.

## Technologies Used

- **MySQL**: The relational database management system used for creating and managing the database.
- **SQL**: The language used to define, manipulate, and query the database.


