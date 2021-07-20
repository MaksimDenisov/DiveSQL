-- Здесь можно сделать что-нибудь до начала теста
-- CREATE INDEX idx1 ON Commander(name);

-------- Запрос, нуждающийся в оптимизации
--
-- Запрос будет получать параметры commander_name и pax_count
-- Названия и типы возвращаемых столбцов:
-- TABLE(flight_id INT, commander_name TEXT, pax_count INT)
CREATE INDEX flight_commander_idx ON flight (commander_id);
CREATE INDEX commander_name_idx ON commander (name);
CREATE INDEX booking_flight_idx ON booking (flight_id);
CREATE INDEX booking_pax_idx ON booking (pax_id);
CREATE INDEX pax_race_idx ON pax (race);

DROP INDEX flight_commander_idx;
DROP INDEX commander_name_idx;
DROP INDEX booking_flight_idx;
DROP INDEX booking_pax_idx;
DROP INDEX pax_race_idx;
-----
EXPLAIN ANALYSE
WITH flight_commander AS (
    SELECT F.id, C.name
    FROM Commander C
             JOIN Flight F ON F.commander_id = C.id
    WHERE F.date BETWEEN '2084-04-01' AND '2084-05-01'
      AND C.name = 'Громозека'---replace
)
, flight_count as (
    SELECT B.flight_id AS id, COUNT(B.pax_id)::INT AS pax_count
    FROM flight_commander F
             JOIN Booking B ON B.flight_id = F.id
             JOIN Pax P ON B.pax_id=P.id
    WHERE P.race='Men'
    GROUP BY B.flight_id)
SELECT id AS flight_id, name AS commander_name, pax_count
FROM flight_commander AS R
         JOIN flight_count AS T USING (id)
WHERE T.pax_count > 1;---replace

EXPLAIN ANALYSE
WITH flight_commander AS (
    SELECT F.id, C.name
    FROM Commander C
             JOIN Flight F ON F.commander_id = C.id
    WHERE F.date BETWEEN '2084-04-01' AND '2084-05-01'
      AND C.name = 'Громозека'---replace
)
SELECT F.id, COUNT(P.id)::INT AS pax_count
FROM flight_commander F
         JOIN Booking B ON B.flight_id = F.id
         JOIN Pax P ON B.pax_id=P.id
WHERE P.race='Men'
GROUP BY F.id;

EXPLAIN ANALYSE
SELECT id AS flight_id, name AS commander_name, pax_count FROM (
                                                                   SELECT F.id, C.name
                                                                   FROM Commander C
                                                                            JOIN Flight F ON F.commander_id=C.id
                                                                   WHERE F.date BETWEEN '2084-04-01' AND '2084-05-01'
                                                                     AND C.name = 'Громозека'---replace
                                                               ) R
                                                                   JOIN (
    SELECT F.id, COUNT(P.id)::INT AS pax_count
    FROM Flight F
             JOIN Booking B ON B.flight_id = F.id
             JOIN Pax P ON B.pax_id=P.id
    WHERE P.race='Men'
    GROUP BY F.id
) T USING(id) WHERE T.pax_count>1;

EXPLAIN ANALYSE
WITH flight_commander AS (
    SELECT F.id, C.name
    FROM Commander C
             JOIN Flight F ON F.commander_id = C.id
    WHERE F.date BETWEEN '2084-04-01' AND '2084-05-01'
      AND C.name = 'Громозека'---replace
)
   , flight_count as (
    SELECT B.flight_id AS id, COUNT(B.pax_id)::INT AS pax_count
    FROM  Booking B
              JOIN Pax P ON B.pax_id = P.id
    WHERE P.race = 'Men'
    GROUP BY B.flight_id)
SELECT id AS flight_id, name AS commander_name, pax_count
FROM flight_commander AS R
         JOIN flight_count AS T USING (id)
WHERE T.pax_count > 1;---replace
