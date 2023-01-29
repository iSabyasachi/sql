-- select the actor id, actor name and the total number of
-- movies they acted in
-- normal approach
-- explain analyze
select a.actor_id, a.name, count(ma.movie_id) as movie_count from actors a
inner join movie_actor ma on ma.actor_id = a.actor_id
group by a.actor_id order by movie_count desc;
-- subquery
select actor_id,
name,
(select count(*) from movie_actor where actor_id = a.actor_id) as movies_count
from actors a order by movies_count desc;