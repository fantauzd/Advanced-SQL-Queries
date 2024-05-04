-- Find the film_title of all films which feature both RALPH CRUZ and WILL WILSON
-- Order the results by film_title in ascending order.
--  Warning: this is a tricky one and while the syntax is all things you know, you have to think a bit oustide the box to figure out how to get a table that shows pairs of actors in movies.


-- Put your query for q5 here.


SELECT will_movies.title AS film_title
FROM (
    SELECT
        actor.first_name,
        actor.last_name,
        film.film_id,
        film.title
    FROM actor
        INNER JOIN film_actor ON actor.actor_id = film_actor.actor_id
        INNER JOIN film ON film_actor.film_id = film.film_id
        WHERE actor.first_name = 'WILL' AND actor.last_name = 'WILSON'
) AS will_movies
INNER JOIN (
    SELECT
        actor.first_name,
        actor.last_name,
        film.film_id,
        film.title
    FROM actor
        INNER JOIN film_actor ON actor.actor_id = film_actor.actor_id
        INNER JOIN film ON film_actor.film_id = film.film_id
        WHERE actor.first_name = 'RALPH' AND actor.last_name = 'CRUZ'
) AS ralph_movies
ON will_movies.film_id = ralph_movies.film_id
