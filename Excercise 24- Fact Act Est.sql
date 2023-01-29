create table fact_act_est
(
	select s.*, f.forecast_quantity 
	from fact_sales_monthly s
	join fact_forecast_monthly f 
	using (date, product_code, customer_code)
);