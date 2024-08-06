-- GROUP BY
SELECT CONCAT(author_fname, ' ', author_lname) AS full_name FROM books
    GROUP BY full_name ORDER BY full_name;

-- HAVING: specifies conditions on groups formed by the GROUP BY
SELECT CONCAT(author_fname, ' ', author_lname) AS full_name FROM books
    GROUP BY full_name HAVING full_name = 'Lahiri%' ORDER BY full_name;

-- ========================================================================

-- MIN/MAX
SELECT author_fname, min(released_year) AS first_released_book FROM books
    GROUP BY author_fname ORDER BY first_released_book DESC;

-- Subqueries
SELECT title, released_year FROM books 
    WHERE released_year = (SELECT MIN(released_year) FROM books);

-- SUM
SELECT author_lname, SUM(pages) FROM books
    GROUP BY author_lname;

-- AVG
SELECT released_year, AVG(stock_quantity), COUNT(*) AS 'books count' FROM books
    GROUP BY released_year ORDER BY released_year;
