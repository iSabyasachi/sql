-- Using Temporary Table
create temporary table forecast_table_error_2020
	select a.customer_code,   
	sum(abs(a.forecast_quantity - a.sold_quantity)) * 100 / sum(a.forecast_quantity) as abs_error_perc
	from fact_act_est a
	where a.fiscal_year = 2020
	group by a.customer_code;
create temporary table forecast_table_error_2021
	select a.customer_code,   
	sum(abs(a.forecast_quantity - a.sold_quantity)) * 100 / sum(a.forecast_quantity) as abs_error_perc
	from fact_act_est a
	where a.fiscal_year = 2021
	group by a.customer_code;
create temporary table forecast_table_error
select c.customer_code, c.customer, c.market, 
if(fte2020.abs_error_perc > 100, 0, (100 - fte2020.abs_error_perc)) as forcaset_accuracy_2020,
if(fte2021.abs_error_perc > 100, 0, (100 - fte2021.abs_error_perc)) as forcaset_accuracy_2021
from forecast_table_error_2020 fte2020
join forecast_table_error_2021 fte2021 using(customer_code)
join dim_customer c on c.customer_code = fte2020.customer_code;

select * from forecast_table_error e
where e.forcaset_accuracy_2021 < e.forcaset_accuracy_2020;