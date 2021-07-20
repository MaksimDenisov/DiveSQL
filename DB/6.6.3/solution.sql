/*
SELECT planet TEXT        -- название планеты

psystem TEXT       -- название политического строя

local_rank BIGINT  -- локальный ранг планеты

global_rank BIGINT -- глобальный ранг планеты*/
With flightCountTable AS (
    SELECT planet.name           AS planet,
           politicalsystem.value AS psystem,
           count(flight.planet_id) AS flightCount
    FROM Planet
             LEFT JOIN flight ON planet.id = flight.planet_id
             LEFT JOIN politicalsystem on planet.psystem_id = politicalsystem.id
    GROUP BY planet.name,psystem)
SELECT planet,
       psystem,
       rank() OVER (PARTITION BY psystem ORDER BY flightCount DESC)::BIGINT AS local_rank,
       rank() OVER ( ORDER BY flightCount DESC)::BIGINT AS global_rank
       FROM flightCountTable;


/*SELECT
    planet.name,
    politicalsystem.value,
    count(flight.planet_id) OVER (PARTITION BY flight.planet_id )    AS flightCount,
    count(politicalsystem.id) OVER (PARTITION BY politicalsystem.id) AS flightSimilar
FROM Planet
         LEFT JOIN flight ON planet.id = flight.planet_id
         LEFT JOIN politicalsystem on planet.psystem_id = politicalsystem.id;*/

/*    select planet,
           psystem,
           flightCount,
           flightWithSimilarPsystemCount,
           rank() OVER ( ORDER BY flightWithSimilarPsystemCount DESC)::BIGINT AS local_rank,
           rank() OVER ( ORDER BY flightCount DESC)::BIGINT                   AS global_rank
    from filghtCountTable;*/
--LEFT JOIN flight f on planet.id = f.planet_id;
-- LEFT JOIN flight ON flight.planet_id = planet_id;
--(SELECT COUNT(*) FROM planet JOIN flight ON planet.id = flight.planet_id GROUP BY flight.planet_id) as pfC;


SELECT /*planet.name                                                                                AS planet,
               politicalsystem.value                                                                      AS psystem*/
/*        planet.name AS planet
        */
    *
FROM Planet
         LEFT JOIN flight ON planet.id = flight.planet_id
         LEFT JOIN politicalsystem on planet.psystem_id = politicalsystem.id;


/*
With filghtCountTable AS (
    SELECT planet.name                                                                                AS planet,
           politicalsystem.value                                                                      AS psystem,
           (SELECt COUNT(*) FROM flight LEFT JOIN planet p on p.id = flight.planet_id
            WHERE planet.id = flight.planet_id AND planet.psystem_id = (SELECT p.psystem_id FROM planet p WHERE planet.id = p.id)
            GROUP BY planet.psystem_id) AS flightWithSimilarPsystemCount,
           (SELECt COUNT(*) FROM flight WHERE planet.id = flight.planet_id GROUP BY flight.planet_id) AS flightCount
    FROM Planet
             LEFT JOIN politicalsystem ON planet.psystem_id = politicalsystem.id)
select planet,
       psystem,
       flightCount,
       flightWithSimilarPsystemCount,
       rank() OVER ( ORDER BY flightWithSimilarPsystemCount DESC)::BIGINT AS local_rank,
       rank() OVER ( ORDER BY flightCount DESC)::BIGINT                   AS global_rank
from filghtCountTable;*/