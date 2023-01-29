-- show all priviliges for 'wanda'
show grants for 'wanda';

-- grant privileges using command
create user 'thor'@'localhost' identified by 'thor';
select user from mysql.user;
grant select on gdb041.dim_customer to 'thor'@'localhost';
grant select on gdb041.dim_product to 'thor'@'localhost';
grant execute on procedure gdb041.get_forecast_accuracy to 'thor'@'localhost'; 
show grants for 'thor'@'localhost';