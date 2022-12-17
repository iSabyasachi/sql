-- 1. Generate a report of all Hindi movies sorted by their revenue 
-- amount in millions. Print movie name, revenue, currency, and unit
select m.title, f.revenue, f.currency, f.unit,
CASE WHEN f.unit = 'Billions' THEN round(f.revenue * 1000, 2)
WHEN f.unit = 'Thousands' THEN round(f.revenue / 1000, 2)
ELSE f.revenue
END AS "revenue_million"
from movies m
join financials f on f.movie_id = m.movie_id
join languages l on l.language_id = m.language_id
where l.name = 'Hindi' order by revenue_million desc;
