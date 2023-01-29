-- An aggregated monthly gross sales report for Croma India
-- Month, Total gross sales amount to Croma India in this month
select 
	s.date, 
	sum(round((s.sold_quantity * p.gross_price), 2)) as total_gross_sales_amount
from fact_sales_monthly s
join dim_customer c 
	on c.customer_code = s.customer_code
join fact_gross_price p 
	on p.product_code = s.product_code
	and p.fiscal_year = get_fiscal_year(date)
where c.customer_code = 90002002
group by s.date 
order by s.date asc;
-- and year(date) = 2021 and month(date) = 12;