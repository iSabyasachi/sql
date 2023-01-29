explain analyze
select * from fact_act_est where fiscal_year = 2020;
-- -> Filter: (fact_act_est.fiscal_year = 2020)  
-- (cost=139747.00 rows=138681) (actual time=140.403..1172.948 rows=353289
-- loops=1)
-- -> Table scan on fact_act_est  (cost=139747.00 rows=1386805) 
-- (actual time=0.118..993.845 rows=1390838 loops=1)

-- After index created
-- -> Index lookup on fact_act_est using idx_fyear (fiscal_year=2020)  
-- (cost=72539.70 rows=693402) 
-- (actual time=0.395..1433.985 rows=353289 loops=1)

show indexes in fact_act_est;