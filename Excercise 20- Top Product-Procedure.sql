-- Write a stored procedure to get the top n products by net sales for a given year.  
-- Use product name without a variant. Input of stored procedure is fiscal_year and 
-- top_n parameter
select 
	product, 
    round(sum(net_sales) / 1000000, 2) as net_sales_mln 
from net_sales
group by product
order by net_sales_mln desc 
limit 3;