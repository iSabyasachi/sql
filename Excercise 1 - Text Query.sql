-- Excercise : Exercise - Retrieve Data Using Text Query 
-- (SELECT, WHERE, DISTINCT, LIKE)
USE moviesdb;
-- 1. Print all movie titles and release year for all Marvel Studios movies.
select m.title, m.release_year from movies m where m.studio = 'Marvel Studios';
-- 2. Print all movies that have Avenger in their name. 
select * from movies m where m.title LIKE '%Avenger%';
-- 3. Print the year when the movie "The Godfather" was released.
select m.release_year from movies m where m.title = 'The Godfather';
-- 4. Print all distinct movie studios in the Bollywood industry.
select distinct m.studio from movies m where m.industry='Bollywood';
