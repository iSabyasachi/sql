-- Get top n product each division by their quantity sold
-- explain analyze
with 
cte1 as(
select 
	p.division, 
    p.product_code, 
    p.product,
    sum(s.sold_quantity) as total_sold_quantity
from dim_product p
join fact_sales_monthly s 
	on s.product_code = p.product_code
where s.fiscal_year=2021
group by p.product
order by p.division,total_sold_quantity desc
),
cte2 as(
select *,
	row_number() over(partition by division order by total_sold_quantity desc) as rn,
    rank() over(partition by division order by total_sold_quantity desc) as rnk,
    dense_rank() over(partition by division order by total_sold_quantity desc) as drnk
from cte1)
select * from cte2 where drnk <= 3;