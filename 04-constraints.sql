-- UNIQUE - It can only have a single value equal to this.
CREATE TABLE contacts (
    contact_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    phone VARCHAR(15) NOT NULL UNIQUE
);

-- CHECK - Check if a value is true for some condition.
CREATE TABLE partiers (
    name VARCHAR(50),
    age INT CHECK(age >= 18)
);

-- NAMED CONSTRAINTS => CONSTRAINT ... "constraint"
CREATE TABLE partiers2 (
    name VARCHAR(50),
    age INT, CONSTRAINT age_over_18 CHECK(age >= 18)
);

-- MULTIPLE COLUMN CONTRAINTS - Combos constraints.
CREATE TABLE companies (
    name VARCHAR(255),
    address VARCHAR(255),
    CONSTRAINT name_address_unique UNIQUE(name, address)
);

