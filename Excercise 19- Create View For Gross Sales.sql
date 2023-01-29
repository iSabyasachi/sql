-- Create a view for gross sales. It should have the following columns,

-- date, fiscal_year, customer_code, customer, market, product_code, product, variant,
-- sold_quanity, gross_price_per_item, gross_price_total
select s.date,
	s.fiscal_year,
    c.customer_code,
    c.customer,
    c.market,
    p.product_code,
    p.product,
    p.variant,
    s.sold_quantity,
    g.gross_price as gross_price_per_item,
    ROUND(s.sold_quantity * g.gross_price, 2) as gross_price_total
from fact_sales_monthly s
join dim_customer c on c.customer_code = s.customer_code
join dim_product p on p.product_code = s.product_code
join fact_gross_price g on g.product_code = s.product_code;