-- здесь можно создавать индексы, если угодно
-- CREATE INDEX idx1 ON Commander(name);

---- Запрос, нуждающийся в ускорении.
-- Названия и типы возвращаемых столбцов:
-- TABLE(planet_id INT, spacecraft_class INT, takings BIGINT)

CREATE INDEX flight_planet_idx ON flight(planet_id);
CREATE INDEX booking_flight_idx ON booking(flight_id);
CREATE INDEX flight_sc_idx ON flight(spacecraft_id);
CREATE INDEX sc_class_idx ON spacecraft(class);


EXPLAIN ANALYSE
WITH passengers_count as (SELECT P.id AS planet_id, S.class AS class, COUNT(Pax.id) as PC
                          FROM Planet P
                                   JOIN Flight F ON P.id = F.planet_id
                                   JOIN Booking B ON B.flight_id = F.id
                                   JOIN Spacecraft S ON F.spacecraft_id = S.id
                                   JOIN Pax ON B.pax_id = Pax.id GROUP BY s.class, P.id)
SELECT Price.planet_id,
       Price.spacecraft_class,
       Price.price * PC
           AS takings
FROM Price
JOIN passengers_count ON passengers_count.planet_id =Price.planet_id
WHERE passengers_count.class = price.spacecraft_class;

EXPLAIN ANALYSE
SELECT Price.planet_id,
       Price.spacecraft_class,
       Price.price * GetPaxCount(Price.planet_id, Price.spacecraft_class) AS takings
FROM Price;


-- Вспомогательная функция, считающая количество пассажиров, летевших
-- на планету _planet_id в звездолете класса _class

CREATE OR REPLACE FUNCTION GetPaxCount(_planet_id INT, _class INT) RETURNS BIGINT AS
$$
SELECT COUNT(Pax.id)
FROM Planet P
         JOIN Flight F ON P.id = F.planet_id
         JOIN Booking B ON B.flight_id = F.id
         JOIN Spacecraft S ON F.spacecraft_id = S.id
         JOIN Pax ON B.pax_id = Pax.id
WHERE S.class = _class
  AND P.id = _planet_id;
$$ LANGUAGE SQL;