-- Exercise - Summary Analytics (MIN, MAX, AVG, GROUP BY)
use moviesdb;
-- 1. How many movies were released between 2015 and 2022
select count(*) from movies where release_year between 2015 and 2022;
-- 2. Print the max and min movie release year
select max(release_year) as min_year, min(release_year) as max_year from movies;
-- 3. Print a year and how many movies were released in that year 
-- starting with the latest year
select release_year, count(*) from movies group by release_year order by release_year desc;
-- 4. Find min, max & average of IMDB Rating
select min(imdb_rating) as min_rating,
max(imdb_rating) as max_rating,
ROUND(avg(imdb_rating), 2) as avg_rating from movies;
-- 5. count number of movies per industry
select industry, count(*) as num_movies from movies 
group by industry order by num_movies desc;
-- 6. Find average rating in each industry
select industry, count(*) as num_movies, round(avg(imdb_rating),2) as avg_rating from movies 
group by industry order by num_movies desc;
-- 7. Find average rating in each studio
select studio, count(*) as num_movies, round(avg(imdb_rating),2) as avg_rating from movies 
group by studio order by avg_rating desc;
