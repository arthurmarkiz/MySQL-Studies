-- Views with certain methods are no longer updated
-- (We cannot insert, delete or change data)

-- Instead of typing the query all the time, we can create a view:
CREATE VIEW full_reviews AS
SELECT title, released_year, genre, rating, first_name, last_name FROM reviews
JOIN series ON series.id = reviews.series_id
JOIN reviewers ON reviewers.id = reviews.reviewer_id;

-- Now we can use this query, just typing:
SELECT * FROM full_reviews;

-- REPLACE VIEW:
CREATE OR REPLACE VIEW full_reviews AS
SELECT .......;

-- ALTER VIEW:
ALTER VIEW full_reviews AS
SELECT ....... ;

-- DROP VIEW:
DROP VIEW full_reviews;

