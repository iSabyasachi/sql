use moviesdb;
-- Generate all movies with budget, revenue and profit
select * from movies;
select * from financials;
-- which movie made highest amount of money
select m.title, f.budget, f.revenue, f.currency, f.unit, 
case 
when f.unit = 'Billions' THEN IF(f.currency = 'USD', round((f.revenue - f.budget) * 75 * 10 ^ 3, 2), round((f.revenue - f.budget) * 10 ^ 3, 2))
when f.unit = 'Thousands' THEN IF(f.currency = 'USD', round((f.revenue - f.budget) * 75 / 10 ^ 3, 2), round((f.revenue - f.budget) / 10 ^3, 2))
else IF(f.currency = 'USD', round((f.revenue - f.budget) * 75, 2), (f.revenue - f.budget))
end as profit_in_millions_inr from movies m
inner join financials f
on f.movie_id = m.movie_id order by profit_in_millions_inr desc;