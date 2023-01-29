create temporary table temp_forecast_err_table
	select a.customer_code,
	sum(a.sold_quantity) as total_sold_qty,
	sum(a.forecast_quantity) as total_forecast_qty,
	sum(a.forecast_quantity - a.sold_quantity) as net_error,
	sum((a.forecast_quantity - a.sold_quantity)) * 100 / sum(a.forecast_quantity) as net_error_perc,
	sum(abs(a.forecast_quantity - a.sold_quantity)) as abs_error,
	sum(abs(a.forecast_quantity - a.sold_quantity)) * 100 / sum(a.forecast_quantity) as abs_error_perc
	from fact_act_est a
	where a.fiscal_year = 2021
	group by a.customer_code;
-- Valid for current session
select c.customer, c.market, 
e.total_sold_qty, e.total_forecast_qty,
e.net_error, e.net_error_perc, e.abs_error,
e.abs_error_perc,
if(abs_error_perc > 100, 0, (100 - abs_error_perc)) as forcaset_accuracy
from temp_forecast_err_table e
join dim_customer c using(customer_code)
order by forcaset_accuracy desc;
