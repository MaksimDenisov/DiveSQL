-- Здесь можно сделать что-нибудь до начала теста
-- CREATE INDEX idx1 ON Commander(name);

----------------------------------------------------------
-- Запрос будет получать параметры _planet_name и _capacity
/*
SELECT COUNT(1)
FROM Flight F JOIN Spacecraft S ON F.spacecraft_id = S.id
              JOIN Planet P ON F.planet_id = P.id
              JOIN Booking B ON F.id = B.flight_id
WHERE S.capacity<_capacity AND S.class=1
  AND P.name=_planet_name;
*/

-- EXPLAINING AREA
/*Запрос находит, сколько резервирований было сделано в кораблях первого класса
  с вместимостью меньше указанного значения _capacity,
  в полетах на указанную планету _planet_name.
*/
/*EXPLAIN ANALYSE SELECT COUNT(1)
FROM Flight F JOIN Spacecraft S ON F.spacecraft_id = S.id
              JOIN Planet P ON F.planet_id = P.id
              JOIN Booking B ON F.id = B.flight_id
WHERE S.capacity<100 AND S.class=1
  AND P.name='Ra';
*/
CREATE INDEX flight_sc_idx ON flight(spacecraft_id);
CREATE INDEX flight_planet_idx ON flight(planet_id);
CREATE INDEX booking_flight_idx ON booking(flight_id);


CREATE INDEX planet_name_idx ON planet(name);
CREATE INDEX sc_capacity_idx ON spacecraft(capacity);
CREATE INDEX sc_class_idx ON spacecraft(class);

DROP INDEX flight_sc_idx;
DROP INDEX flight_planet_idx;
DROP INDEX booking_flight_idx;
DROP INDEX planet_name_idx;
DROP INDEX sc_capacity_idx;
DROP INDEX sc_class_idx;
----
EXPLAIN ANALYSE
SELECT COUNT(1)
FROM Flight F JOIN Spacecraft S ON F.spacecraft_id = S.id
              JOIN Planet P ON F.planet_id = P.id
              JOIN Booking B ON F.id = B.flight_id
WHERE S.capacity<100 AND S.class=1
  AND P.name='Ra';