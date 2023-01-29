# Show two top expenses in each category
-- using row_number(), rank() & dense_rank()
with cte1 as(
select *,
	row_number() over(partition by category order by amount desc) as rn,
    rank() over(partition by category order by amount desc) as rnk,
    dense_rank() over(partition by category order by amount desc) as drnk
from expenses
order by category, amount desc)
select * from cte1 where drnk <= 2;
