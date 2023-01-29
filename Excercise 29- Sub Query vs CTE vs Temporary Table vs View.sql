-- Using Sub Query
select actor_name, age
from (select name as actor_name,
		(year(curdate()) - birth_year) as age
	from actors) as actor_age_table
where age > 70 and age < 85;

-- where single result is expetected in select or where clause
-- better to use sub query
select * from movies where 
imdb_rating > (select avg(imdb_rating) from movies);

-- Using CTEs
-- better to use in "Reuse sub result", "Recursive Sub Result"
with cte as(
	select name as actor_name,
		(year(curdate()) - birth_year) as age
	from actors
)
select * from cte where age > 70 and age < 85;