-- Exercise - Calculated Columns (IF, CASE, YEAR, CURYEAR)
use moviesdb;
-- 1. Print profit % for all the movies
select 
m.title as movie_name, 
(f.revenue - f.budget) as profit,
(f.revenue - f.budget) * 100 / f.budget as profit_perc
from movies m
inner join financials f on m.movie_id = f.movie_id;