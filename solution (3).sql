-- Query 1
CREATE TABLE query1(name, moviecount) as SELECT genres.name, count(genres.name) FROM hasagenre NATURAL JOIN genres NATURAL JOIN movies GROUP BY genres.name;

-- Query 2
CREATE TABLE query2(name, rating) as SELECT genres.name, avg(ratings.rating) FROM movies NATURAL JOIN genres NATURAL JOIN ratings NATURAL JOIN hasagenre GROUP BY genres.name;


-- Query 3

create table  query3 as select movie.title, count(1) as CountOfRatings from ratings JOIN movies movie using (movieid) group by movie.title having count(1) >= 10;


-- Query 4
CREATE TABLE query4(movieid, title) as SELECT movieid, title
FROM movies movies JOIN hasagenre hasagenre USING (movieid) JOIN genres genres USING (genreid)
WHERE genres.name = 'Comedy';

--query 5

CREATE TABLE query5 AS SELECT movies.title, avg(rating) as average FROM ratings JOIN movies USING (movieid)GROUP BY movies.title ORDER BY movies.title

-- query 6

CREATE TABLE query6 AS SELECT avg(ratings.rating) AS average FROM movies JOIN ratings USING (movieid) JOIN hasagenre USING (movieid) JOIN genres USING (genreid) WHERE genres.name = 'Comedy';

-- Query 7

CREATE TABLE query7 AS
SELECT avg(rating) as average
FROM ratings JOIN (SELECT movieid FROM movies movies JOIN hasagenre hasagenre USING (movieid) JOIN genres genres USING (genreid) WHERE genres.name IN ('Romance', 'Comedy') GROUP BY movies.movieid HAVING count(1) = 2) Y USING (movieid);

-- Query 8

CREATE TABLE query8(average) as
SELECT avg(ratings.rating)
FROM ratings JOIN (SELECT movieid FROM movies movies JOIN hasagenre hasagenre USING (movieid) JOIN genres genres USING (genreid) WHERE genres.name IN ('Comedy', 'Romance') GROUP BY movies.movieid HAVING array_agg(genres.name) = '{Romance}') Y USING (movieid);

-- Query 9

CREATE TABLE query9 AS SELECT movieid, rating from ratings WHERE userid=:v1;




