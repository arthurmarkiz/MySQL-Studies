-- SHOW DATABASES or TABLES:
SHOW DATABASES;
SHOW TABLES;

-- SHOW TABLE INFOS:
DESC customers;
SHOW COLUMNS FROM customers;

-- CREATE, USE and DELETE a DATABASE:
CREATE DATABASE shop;
USE shop;
DROP DATABASE shop;

-- CREATE or DELETE a TABLE:
CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);
DROP TABLE customers;

-- INSERT DATA:
INSERT INTO customers (first_name, last_name)
VALUES ('Arthur', 'Markiz'),
        ('Will', 'Smith');

-- SHOW TABLE DATA:
SELECT * FROM customers;

-- UPDATE DATA FROM TABLE:
UPDATE customers SET last_name = 'Smith!!!' WHERE last_name = 'Smith';

-- DELETE DATA FROM TABLE:
DELETE FROM customers WHERE first_name = 'Will';