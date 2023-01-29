select customer, round(sum(net_sales)/1000000, 2) as net_sales_mln from net_sales
where 
-- market = 'india' and 
fiscal_year = 2021
group by customer
order by net_sales_mln desc limit 3;