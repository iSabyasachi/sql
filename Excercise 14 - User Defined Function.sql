-- generate a report of individual product sales(aggregated at monthly basis
-- at the product code level) for FY 2021 for croma india customer.
-- Month - Product Name - Variant - Sold Quantity - 
-- Gross Price Per Item - Gross Price Total
select s.date, p.product_code, p.product, p.variant,
s.sold_quantity, g.gross_price, 
round(g.gross_price * sold_quantity, 2) as gross_price_total
from fact_sales_monthly s
join dim_customer c on c.customer_code = s.customer_code
join dim_product p on p.product_code = s.product_code
join fact_gross_price g on g.product_code = p.product_code
and g.fiscal_year = get_fiscal_year(s.date)
where 
s.product_code='A0118150101' and 
c.customer='Croma' and
get_fiscal_year(s.date) = '2021' order by s.date asc limit 1000000;
-- and get_fiscal_quarter(s.date) = 'Q1';


SELECT YEAR(DATE_ADD("2017-06-15", INTERVAL +2 MONTH));

select * from fact_sales_monthly; 
select * from dim_product;
select * from fact_gross_price;
select * from dim_customer where customer like '%croma%';
-- where product_code='A0118150101' and date = '2017-09-01'; -- 81