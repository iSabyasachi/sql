select *,
((1 - post_invoice_discount_pct) * net_invoice_sales) as net_sales
from sales_postinv_discount;