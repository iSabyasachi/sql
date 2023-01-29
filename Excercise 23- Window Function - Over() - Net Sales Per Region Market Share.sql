-- for FY 2021, contribution of a customer with respect to per region sale
-- Net Sales Per Region Market Share %
with cte1 as(
select 
	c.region, c.customer, round(sum(net_sales)/1000000, 2) as net_sales_mln
from net_sales s
join dim_customer c on 
	c.customer_code = s.customer_code
where fiscal_year = 2021
group by c.customer, c.region
order by net_sales_mln desc)
select
	region,
	customer,
    -- net_sales_mln,
    -- sum(net_sales_mln) over(partition by region) as total_net_Sales,
	round(net_sales_mln * 100 / sum(net_sales_mln) over(partition by region), 2) as net_sales_pct
from cte1
order by region, net_sales_pct desc;