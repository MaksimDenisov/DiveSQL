drop table if exists Flight;
drop table if exists Planet;
drop table if exists Commander;

CREATE TABLE Planet(
                       id SERIAL PRIMARY KEY,
                       name TEXT UNIQUE,
                       distance NUMERIC(5,2),
                       galaxy INT CHECK(galaxy > 0)
);

CREATE TABLE Commander(
                          id SERIAL PRIMARY KEY,
                          name TEXT
);

CREATE TABLE Flight(
                       id INT PRIMARY KEY,
                       planet_id INT REFERENCES Planet,
                       commander_id INT REFERENCES Commander,
                       start_date DATE,
                       UNIQUE(commander_id, start_date)
);

/*UPDATE
    Flight
SET
    Flight.commander_id = 2
FROM
    Flight AS flight
        INNER JOIN Planet AS planet
                   ON flight.planet_id = planet.id
WHERE
        planet.galaxy = 2 AND Flight.commander_id = 1*/