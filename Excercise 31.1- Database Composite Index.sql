explain analyze
select * from fact_sales_monthly
where product_code = 'A0118150101'
and customer_code = 70002017
limit 5000000;