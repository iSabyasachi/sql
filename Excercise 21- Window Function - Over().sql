-- Find the percentage expenses of given item compare to total item
SELECT 
*,
amount * 100 / sum(amount) over() as pct
FROM expenses
order by category;

-- Find the percentage expenses of given item compare to total item in each category
SELECT 
*,
amount * 100 / sum(amount) over(partition by category) as pct
FROM expenses
order by category;

-- Find cumulative expenses
SELECT 
*,
sum(amount) over(partition by category order by date) as cumulative_expense
FROM expenses
order by category, date, amount desc;