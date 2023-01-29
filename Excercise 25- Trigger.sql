show triggers;

insert into fact_sales_monthly(date, product_code, customer_code, sold_quantity)
values("2022-01-01", 'A1', 7, 89);
insert into fact_forecast_monthly(date, product_code, customer_code, forecast_quantity)
values("2022-01-01", 'A1', 7, 90);
select * from fact_sales_monthly;
select * from fact_act_est where product_code = 'A1';
