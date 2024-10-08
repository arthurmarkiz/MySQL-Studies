-- ADDING COLUMNS
ALTER TABLE companies
ADD COLUMN city VARCHAR(25) NOT NULL;

-- DROPING/REMOVING COLUMNS
ALTER TABLE companies
DROP COLUMN city;

-- RENAME TABLES
ALTER TABLE companies RENAME TO suppliers;

-- RENAME COLUMNS
ALTER TABLE suppliers 
RENAME COLUMN phone TO phone_number;

-- MODIFY COLUMN TYPE DEFINITIONS
ALTER TABLE suppliers
MODIFY phone_number VARCHAR(100) DEFAULT 'unknown';

-- CHANGING COLUMNS => Use CHANGE to RENAME AND MODIFY the TYPE
ALTER TABLE suppliers
CHANGE name supplier_name VARCHAR(100);

-- ADDING CONSTRAINTS
ALTER TABLE suppliers 
ADD CONSTRAINT 'positive_order_value' CHECK(order_value >= 0);

-- DROPING/REMOVING CONSTRAINTS
ALTER TABLE
DROP CONSTRAINT 'positive_order_value';