select s.*, f.forecast_quantity 
from fact_sales_monthly s
left join fact_forecast_monthly f 
using (date, fiscal_year, product_code, customer_code)
union
select s.*, f.forecast_quantity
from fact_forecast_monthly f
left join fact_sales_monthly s
using (date, fiscal_year, product_code, customer_code);