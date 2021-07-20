--Commander 5 Spacecraft 1 2020-06-01
--Commander 5 Spacecraft 2 2020-08-01
--Commander 5 Spacecraft 3 2020-10-01

SELECT  c.name, s.name, start_date FROM flight
    JOIN commander c on flight.commander_id = c.id
    JOIN spacecraft s on s.id = flight.spacecraft_id
WHERE commander_id = 5
