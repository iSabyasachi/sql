-- movies that produced at least 500 % profit and their rating was less than
-- avg rating for all movies(7.94)
-- check also recursive series CTE
-- 1st Approach
-- explain analyze
with 
finance_calc(movie_id, profit_perc) as(
select movie_id, 
round(((revenue - budget) * 100 / budget), 2) as profit_perc 
from financials
),
movie_avg(movie_id, title, imdb_rating) as(
select movie_id, title, imdb_rating from movies
where imdb_rating < (select avg(imdb_rating) from movies)
)
select m.title, f.profit_perc from finance_calc f join movie_avg m on f.movie_id = m.movie_id
where f.profit_perc >= 500;


-- 2nd Approach
with 
movie_profit(title, imdb_rating, budget, profit, profit_perc) as(
select 
m.title,
m.imdb_rating,
f.budget,
(f.revenue - f.budget),
round(((f.revenue - f.budget) * 100 / f.budget), 2) 
from movies m
inner join financials f on m.movie_id = f.movie_id
)
select * from movie_profit
where profit_perc >= 500.00 and 
imdb_rating < (select avg(imdb_rating) from movies);


