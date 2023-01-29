-- Report for top market
-- Rank, Market, Net Sales(In Million)
-- Net sales : Gross Price - (Pre Invoice Deduction + Post Invoice Deduction)
-- EXPLAIN ANALYZE
with cte1 as(
select
	s.date,
    s.fiscal_year,
    c.customer_code,
    c.market,
    s.product_code,
    p.product,p.variant,
    s.sold_quantity,
    g.gross_price as gross_price_per_item,
    ROUND(s.sold_quantity * g.gross_price, 2) as gross_price_total,
    pre.pre_invoice_discount_pct	
from fact_sales_monthly s
join dim_customer c on
	c.customer_code = s.customer_code
join dim_product p on
	s.product_code = p.product_code
join fact_gross_price g on 
	g.product_code = s.product_code and
    g.fiscal_year = s.fiscal_year
join fact_pre_invoice_deductions pre on
	pre.customer_code = s.customer_code and
    pre.fiscal_year = s.fiscal_year
where s.fiscal_year = 2021)
select *,
	ROUND(gross_price_total - gross_price_total * pre_invoice_discount_pct, 2) as net_invoice_sales 
from cte1;
