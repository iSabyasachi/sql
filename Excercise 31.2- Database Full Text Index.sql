use sakila;
explain analyze
select * from film
where description like '%car%' or
description like '%boat%'; -- scanned total 1000 rows
-- added full text index on description
show indexes in film;
explain analyze
select * from film
where match(description) against ("car -boat" in boolean mode)
limit 1000; -- scanned total 66 rows
