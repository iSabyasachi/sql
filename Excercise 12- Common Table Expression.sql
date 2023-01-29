use moviesdb;
-- get all actors whose age is between 70 & 85
-- explain analyze
-- 0.329
select name, birth_year, (year(curDate()) - birth_year) as age from actors 
having age > 70 && age < 85 order by age desc;

-- explain analyze
-- 0.130
select actor_name, age from 
(select name as actor_name, (year(curDate()) - birth_year) as age from actors) 
as actor_age
where age > 70 && age < 85 order by age desc;

-- using Common Table Expression
-- explain analyze
-- 0.129
with actor_age(actor_name, age) as(
	select name, (year(curDate()) - birth_year)
    from actors
)
select actor_name, age 
from actor_age 
where age > 70 && age < 85 
order by age desc;