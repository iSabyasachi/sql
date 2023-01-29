/* 
Generate a yearly report for Croma India where there are two columns

1. Fiscal Year
2. Total Gross Sales amount In that year from Croma
*/
select year(s.date) as fiscal_year, 
sum(round((s.sold_quantity * p.gross_price), 2)) as total_gross_sales_amount 
from fact_sales_monthly s
join dim_customer c on c.customer_code = s.customer_code
join fact_gross_price p on p.product_code = s.product_code
and p.fiscal_year = get_fiscal_year(s.date)
where c.customer = 'Croma' group by p.fiscal_year order by p.fiscal_year;