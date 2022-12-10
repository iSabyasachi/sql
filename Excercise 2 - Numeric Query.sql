-- Excerise 2 : Retrieve Data Using Numeric Query 
-- (BETWEEN, IN, ORDER BY, LIMIT, OFFSET) 
-- 1. Print all movies in the order of their release year (latest first)
select * from movies order by release_year desc;
-- 2. All movies released in the year 2022
select * from movies where release_year=2022;
-- 3. Now all the movies released after 2020
select * from movies where release_year > 2020;
-- 4. All movies after the year 2020 that have more than 8 rating
select * from movies where release_year > 2020 and imdb_rating > 8.0;
-- 5. Select all movies that are by Marvel studios and Hombale Films
select * from movies where studio in('Marvel studios', 'Hombale Films');
-- 6. Select all THOR movies by their release year
select title, release_year from movies where title LIKE '%THOR%' order by release_year;
-- 7. Select all movies that are not from Marvel Studios
select * from movies where studio != 'Marvel studios';