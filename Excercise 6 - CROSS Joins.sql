USE food_db;
select i.name, i.price, v.variant_name, v.variant_price,
CONCAT(v.variant_name, ' ', i.name) as item_name,
if(v.variant_price > 0, round(v.variant_price * i.price, 2), i.price) as item_price
from items i 
cross join variants v;