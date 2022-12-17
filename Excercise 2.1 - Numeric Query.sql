use moviesdb;
# print all the years where more than 2 movies were released.
# Execution order : FROM -> WHERE -> GROUP BY -> HAVING -> ORDER BY
select release_year, count(*) as num_movies from movies group by release_year
having num_movies > 2 order by release_year desc;