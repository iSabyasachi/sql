select market, ROUND(sum(net_sales)/1000000, 2) as net_sales from net_sales
where fiscal_year=2021
group by market
order by net_sales desc
limit 3;