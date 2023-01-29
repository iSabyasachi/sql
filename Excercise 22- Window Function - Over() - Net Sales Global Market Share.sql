-- for FY 2021, contribution of a customer with respect to global sale
-- Net Sales Global Market Share %
with cte1 as(
select 
	customer, round(sum(net_sales)/1000000, 2) as net_sales_mln
from net_sales
where fiscal_year = 2021
group by customer
order by net_sales_mln desc)
select 
	customer,
	round(net_sales_mln * 100 / sum(net_sales_mln) over(), 2) as net_sales_pct
from cte1;