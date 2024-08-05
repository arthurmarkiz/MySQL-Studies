-- NOT EQUAL:
SELECT * FROM books
WHERE released_year != 2017;

-- ===============================
-- NOT LIKE:
-- % = anything before or anything after
SELECT * FROM books
WHERE title NOT LIKE '%e%';

-- ===============================
-- GREATER, LESS or EQUAL:
SELECT * FROM books
WHERE pages > 500;

SELECT * FROM books
WHERE pages < 200;

SELECT * FROM books
WHERE pages >= 362;

-- ===============================
-- AND:
SELECT title, author_lname, released_year FROM books
WHERE released_year > 2010 
AND author_lname = 'Eggers' 
AND title LIKE '%novel%';

-- ===============================
-- OR:
SELECT title, pages FROM books
WHERE pages < 200
OR title LIKE '%stories%';

-- ===============================
-- BETWEEN:
SELECT title, released_year FROM books
WHERE released_year BETWEEN 2004 AND 2014;

-- ===============================
-- IN / NOT IN:
SELECT title, author_lname FROM books
WHERE author_lname IN ('Carver', 'Lahiri', 'Smith');

SELECT title, author_lname FROM books
WHERE author_lname NOT IN ('Carver', 'Lahiri', 'Smith');

-- ===============================
-- CASE:
SELECT title, stock_quantity,
    CASE
        WHEN stock_quantity <= 40 THEN '*'
        WHEN stock_quantity <= 70 THEN '**'
        WHEN stock_quantity <= 100 THEN '***'
        WHEN stock_quantity <= 140 THEN '****'
        ELSE '*****'
    END AS stock
FROM books;
