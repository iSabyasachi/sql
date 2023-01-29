-- Report for top market
-- Rank, Market, Net Sales(In Million)
-- Net sales : Gross Price - (Pre Invoice Deduction + Post Invoice Deduction)
-- EXPLAIN ANALYZE
select 
	c.market, 
	round(sum(s.sold_quantity * 
    (p.gross_price - 
    p.gross_price * (pre.pre_invoice_discount_pct + post.discounts_pct + post.other_deductions_pct))) / 1000000, 2) as net_sales_in_mil
from fact_sales_monthly s
join dim_customer c on 
	c.customer_code = s.customer_code
join fact_gross_price p on 
	p.product_code = s.product_code and
    p.fiscal_year = s.fiscal_year
join fact_pre_invoice_deductions pre on
	pre.customer_code = s.customer_code and
    pre.fiscal_year = s.fiscal_year
join fact_post_invoice_deductions post on
	post.customer_code = s.customer_code and
    post.product_code = s.product_code and
    post.date = s.date
where s.fiscal_year = 2018
group by c.market 
order by net_sales_in_mil desc limit 3;
