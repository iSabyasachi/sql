-- Create a stored procedure that can determine
-- the market badge.
-- If total sold quantity > 5 million that market is considered
-- Gold, else it is silver.
-- input : market & fiscal year :: output : market badge
select 
	c.market, 
	p.fiscal_year,
	if(sum(s.sold_quantity) > 5000000, 'Gold', 'Silver') as market_badge
from dim_customer c
join fact_sales_monthly s 
	on s.customer_code = c.customer_code
join fact_gross_price p 
	on p.fiscal_year = get_fiscal_year(s.date) 
where c.market = 'India' and p.fiscal_year = 2021;
-- group by c.market, p.fiscal_year
-- order by market_badge desc limit 100000;
-- 4592977286 India 2021