-- Exercise - SQL Joins (INNER, LEFT, RIGHT, FULL)
use moviesdb;
select * from languages;
select * from movies;
-- 1. Show all the movies with their language names
select m.title, l.name from movies m
inner join languages l on l.language_id = m.language_id;

select title, name from movies
join languages using (language_id);

-- 2. Show all Telugu movie names (assuming you don't know the language
-- id for Telugu)
select m.title from movies m
inner join languages l on m.language_id = l.language_id and l.name = 'Telugu';

-- 3. Show the language and number of movies released in that language
select l.name as language, count(m.movie_id) as num_movies from languages l
left join movies m on l.language_id = m.language_id
group by l.name;