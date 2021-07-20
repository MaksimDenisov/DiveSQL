WITH RECURSIVE Solution AS (
    SELECT cities.id, cities.value AS name, 1 as num
    FROM cities
    WHERE cities.id = 0
    UNION ALL
    SELECT cities.id as id, cities.value AS name, 1 + num as num
    FROM Solution,
         cities
    WHERE left(LOWER(cities.value), 1) = right(Solution.name, 1) AND num < (SELECT  count(*) FROM Cities)-1
)
SELECT *
FROM Solution;

EXPLAIN ANALYSE SELECT * FROM cities LEFT JOIN cities ON value;