SELECT DISTINCT conference FROM paper WHERE conference NOT in (select distinct value from conference)
UNION
select conference FROM paper  group by conference HAVING count(DISTINCT location) >1;--
--select distinct value from conference;