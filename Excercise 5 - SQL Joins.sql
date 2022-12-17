use moviesdb;
select * from financials where movie_id=406;
select * from movies where movie_id=406;

select * from financials where movie_id=106;
select * from movies where movie_id=106;

select m.movie_id, title, budget, revenue 
from movies m left join financials f on m.movie_id = f.movie_id
where m.movie_id=106

union 

select f.movie_id, title, budget, revenue 
from movies m right join financials f on m.movie_id = f.movie_id
where f.movie_id=406;

select m.movie_id, title, budget, revenue 
from movies m inner join financials f on m.movie_id = f.movie_id;

select movie_id, title, budget, revenue 
from movies m left join financials f using (movie_id)
where m.movie_id=106;