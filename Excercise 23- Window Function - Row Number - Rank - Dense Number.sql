# Show two top expenses in each category
select * 
from expenses
order by category, amount desc;
