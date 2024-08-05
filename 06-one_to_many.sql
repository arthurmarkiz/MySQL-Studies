-- CUSTOMERS & ORDERS
-- * Customers can have many orders, but an order only has one customer.

-- * e.g: We have two tables, CUSTOMERS and ORDERS. CUSTOMERS table have id,
-- first_name, last_name, email. ORDERS table have id, order_date, amount, customer_id.
-- The customer_id in the ORDERS table makes connection with customer_id in the CUSTOMERS table.

-- * To connect we use FOREIGN KEY in the ORDERS table like this:
-- FOREIGN KEY (customer_id) REFERENCES customers (id)

-- =============================================================================================

-- ### DATA ###
CREATE DATABASE shop;

USE shop;

CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50)
);

-- FOREIGN KEY: Connect this column with that column.
-- ON DELETE CASCADE: Delete this when that column is deleted.
CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT,
    FOREIGN KEY (customer_id) 
        REFERENCES customers (id) 
        ON DELETE CASCADE
);

INSERT INTO customers (first_name, last_name, email)
VALUES ('Boy', 'George', 'george@gmail.com'),
        ('George', 'Michael', 'gm@gmail.com'),
        ('David', 'Bowie', 'david@gmail.com'),
        ('Blue', 'Steele', 'blue@gmail.com'),
        ('Bette', 'Davis',  'bette@gmail.com');

INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016-02-10', 99.99, 1),
       ('2017-11-11', 35.50, 1),
       ('2014-12-12', 800.67, 2),
       ('2015-01-03', 12.50, 2),
       ('1999-04-11', 450.25, 5);

-- =============================================================================================

-- CROSS JOIN (kind of useless): Combine all columns in the customers and orders 
SELECT * FROM customers, orders;

-- INNER JOIN: Show all matches from the two tables
SELECT * FROM customers
JOIN orders ON orders.customer_id = customers.id;

SELECT first_name, last_name, SUM(amount) AS total FROM customers
JOIN orders ON orders.customer_id = customers.id
GROUP BY first_name, last_name
ORDER BY total;

-- LEFT JOIN: Select everything from left side, along with any matching 
-- records in the right side.
SELECT first_name, last_name, order_date, amount FROM customers
LEFT JOIN orders ON orders.customer_id = customers.id;

SELECT first_name, last_name, IFNULL(SUM(amount), 0) AS money_spent FROM customers
LEFT JOIN orders ON orders.customer_id = customers.id
GROUP BY first_name, last_name
ORDER BY money_spent;

-- RIGHT JOIN: Select everything from right side, along with any matching 
-- records in the left side.
SELECT first_name, last_name, order_date, amount FROM customers
RIGHT JOIN orders ON orders.customer_id = customers.id;