SELECT MAX (mycount)::BIGINT + (select count(*) from planet where galaxy=2)
FROM (select count(planet_id) as mycount from flight where planet_id  in(select id from planet where galaxy=2) GROUP BY planet_id) as fm;
