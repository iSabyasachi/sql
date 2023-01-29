use moviesdb;
-- select actors who acted in any of these movies (101, 110, 121)
select a.* from actors a 
join movie_actor ma on ma.actor_id = a.actor_id
where ma.movie_id = any(
select movie_id from movies where movie_id in (101, 110, 121));

-- select all movies whose rating is greater than *any*
-- of the marvel movies rating
select * from movies where imdb_rating > (
select min(imdb_rating) from movies where studio = 'Marvel Studios'
);
select * from movies where imdb_rating > any(
select imdb_rating from movies where studio = 'Marvel Studios'
);
select * from movies where imdb_rating > some(
select imdb_rating from movies where studio = 'Marvel Studios'
);
-- select all movies whose rating is greater than all
-- of the marvel movies rating
select * from movies where imdb_rating > (
select max(imdb_rating) from movies where studio = 'Marvel Studios'
);
select * from movies where imdb_rating > all(
select imdb_rating from movies where studio = 'Marvel Studios'
);