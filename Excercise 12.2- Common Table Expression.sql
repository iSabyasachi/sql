use moviesdb;
-- Select all Hollywood movies released after the year 2000 
-- that made more than 500 million $ profit or more profit. 
-- Note that all Hollywood movies have millions as a unit hence 
-- you don't need to do the unit conversion. Also, you can write 
-- this query without CTE as well but you should try to write this 
-- using CTE only
select * from movies where industry='Hollywood' and release_year > 2000;
select *, (revenue - budget) as profit from financials where unit = 'Millions' and currency='USD';
-- with out CTE
-- explain analyze
-- 0.219
select m.title, m.release_year,(revenue - budget) as profit  from movies m 
inner join financials f on m.movie_id = f.movie_id
where m.industry='Hollywood' and m.release_year > 2000
and f.unit = 'Millions' and f.currency='USD' and (revenue - budget) >= 500
order by profit desc;

-- with CTE
-- explain analyze
-- 0.225
with
X(movie_id, title, release_year) as (
select movie_id, title, release_year from movies where industry='Hollywood' and release_year > 2000
),
Y(movie_id, profit) as (
select movie_id, (revenue - budget) from financials where unit = 'Millions' and currency='USD'
)
select x.title, 
x.release_year,
y.profit from X x join Y y on x.movie_id = y.movie_id
where y.profit >= 500 order by profit desc;
explain analyze
-- 0.190
with
cte(title, release_year, profit) as (
select m.title, m.release_year,(revenue - budget) from movies m 
inner join financials f on m.movie_id = f.movie_id
where m.industry='Hollywood' and m.release_year > 2000
)
select * from cte where cte.profit >= 500 
order by cte.profit desc;