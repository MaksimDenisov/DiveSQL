WITH DangerPlanet AS (
    SELECT * FROM Planet WHERE wiki -> 'danger' = '1'
),
DangersCount AS (SELECT
       'dinosaurs' AS type, SUM(CASE WHEN (wiki-> 'dinosaurs' = '1') THEN 1 ELSE 0 END) AS count
FROM DangerPlanet GROUP BY wiki -> 'danger'
UNION
SELECT
    'weapons' AS type, SUM(CASE WHEN (wiki-> 'weapons' = '1') THEN 1 ELSE 0 END) AS count
FROM DangerPlanet GROUP BY wiki -> 'danger'
UNION
SELECT
    'pirates' AS type, SUM(CASE WHEN (wiki-> 'pirates' = '1') THEN 1 ELSE 0 END) AS count
FROM DangerPlanet GROUP BY wiki -> 'danger'
UNION
SELECT
    'earthquakes' AS type, SUM(CASE WHEN (wiki-> 'earthquakes' = '1') THEN 1 ELSE 0 END) AS count
FROM DangerPlanet GROUP BY wiki -> 'danger'
UNION
SELECT
    'crime' AS type, SUM(CASE WHEN (wiki-> 'crime' = '1') THEN 1 ELSE 0 END) AS count
FROM DangerPlanet GROUP BY wiki -> 'danger'
UNION
SELECT
    'mosquitoes' AS type, SUM(CASE WHEN (wiki-> 'mosquitoes' = '1') THEN 1 ELSE 0 END) AS count
FROM DangerPlanet GROUP BY wiki -> 'danger')
SELECT type, count FROM DangersCount WHERE  count = (select max(count) from DangersCount);