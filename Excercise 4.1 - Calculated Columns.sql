-- Calculated Columns (IF, CASE, YEAR, CURYEAR)
-- Find min, average and max age of all actors
select name, birth_year, (YEAR(curdate()) - birth_year) as age from actors;
select 
round(min((YEAR(curdate()) - birth_year)), 2) as min_age,
round(avg((YEAR(curdate()) - birth_year)), 2) as avg_age,
round(max((YEAR(curdate()) - birth_year)), 2) as max_age
from actors;

-- print profit of each movie in inr
select * from financials;
select revenue - budget as profit, 
IF(currency = 'USD', (revenue - budget) * 77, (revenue - budget)) as profit_inr 
from financials;

-- print revenue in million
select 
*,
if(unit = 'Billions', revenue * 1000, revenue) as revenue_mil
from financials;
select distinct(unit) from financials;
select *,
CASE 
	WHEN unit = 'Thousands' THEN round(revenue / 1000, 2)
	WHEN unit = 'Millions' THEN revenue
	WHEN unit = 'Billions' THEN revenue * 1000
	ELSE revenue 
END as revenue_mil
from financials;

select * from movies where imdb_rating between 5 and 6;
