-- ### MANY TO MANY ###
-- Some examples:
-- Books <-> Authors
-- Blog Post <-> Tags
-- Students <-> Classes
-- Series <- Reviews -> Reviewers
-- =============================================================================================
CREATE DATABASE tv_db;
USE tv_db;

CREATE TABLE reviewers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

CREATE TABLE series (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    released_year YEAR,
    genre VARCHAR(100)
);

CREATE TABLE reviews (
    id INT PRIMARY KEY AUTO_INCREMENT,
    rating DECIMAL(2,1),
    series_id INT,
    reviewer_id INT,
    FOREIGN KEY (series_id) REFERENCES series (id) ON DELETE CASCADE,
    FOREIGN KEY (reviewer_id) REFERENCES reviewers (id)
);

-- =============================================================================================
-- EXERCISES

SELECT CONCAT(first_name,' ', last_name) AS USER,
    COUNT(rating) AS COUNT,
    IFNULL(MIN(rating), 0) AS MIN,
    IFNULL(MAX(rating), 0) AS MAX,
    IFNULL(ROUND(AVG(rating), 2), 0) AS AVG,
    CASE 
        WHEN COUNT(rating) >= 10 THEN 'POWERUSER'
        WHEN COUNT(rating) > 0 THEN 'ACTIVE'
        ELSE 'INACTIVE'
    END AS STATUS
FROM reviewers LEFT JOIN reviews ON reviewers.id = reviews.reviewer_id GROUP BY USER;

-- =============================================================================================

SELECT title, rating, CONCAT(first_name, ' ', last_name) AS reviewer 
FROM reviews 
JOIN series ON reviews.series_id = series.id
JOIN reviewers ON reviews.reviewer_id = reviewers.id ORDER BY title;