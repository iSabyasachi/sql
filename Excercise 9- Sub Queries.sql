use moviesdb;
-- select a movie with highest imdb_rating
select *  from movies order by imdb_rating desc limit 1;
select * from movies where imdb_rating in
(select max(imdb_rating) from movies);

-- find movies with lowest and highest imdb_rating
select * from movies where imdb_rating in
	((select min(imdb_rating) from movies),
	(select max(imdb_rating) from movies)); 
-- select all the actors whose age > 70 and < 85
select name, birth_year, (year(curdate()) - birth_year) as age from actors
having age > 70 && age < 85;
select * from actors where birth_year in(
select birth_year from actors where 
(year(curdate()) - birth_year) > 70 &&
(year(curdate()) - birth_year) < 85
);

-- better way
select * from
(select 
	name, 
	(year(curdate()) - birth_year) as age 
from actors) as actors_age 
where age > 70 && age < 85;