select s.date, s.fiscal_year,
    s.customer_code, s.market,
    s.product_code, s.product,s.variant,
    s.sold_quantity, s.gross_price_per_item,
	ROUND((1 - s.pre_invoice_discount_pct) * s.gross_price_total, 2) as net_invoice_sales,    
    po.discounts_pct + po.other_deductions_pct as post_invoice_discount_pct    
from sales_preinv_discount s
join fact_post_invoice_deductions po
on po.customer_code = s.customer_code and
	po.product_code = s.product_code and
	po.date = s.date;

