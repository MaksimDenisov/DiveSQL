with diffTable AS (SELECT company,
                          week,
                          share_price,
                          stockquotes.share_price - LAG(share_price) OVER (PARTITION BY company ORDER BY week) AS diff
                   FROM stockquotes),
     avgTable AS (SELECT company,
                         week,
                         share_price,
                         diff,
                         AVG(diff) OVER (PARTITION BY week) as avgWeek
                  FROM diffTable),
     fullTable as (SELECT company,
                          week,
                          share_price,
                          CASE WHEN diff > avgWeek THEN 1 ELSE 0 END AS success
                   FROM avgTable),
     strikeTable AS (SELECT company,
                             sum(success)
                            OVER (PARTITION BY company ORDER BY week ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS strike
                     FROM fullTable)
SELECT company,SUM(CASE WHEN strike=3 THEN 1 ELSE 0 END )
FROM strikeTable GROUP BY company;
/*SELECT company, sum(CASE WHEN success THEN 1 END)
FROM fullTable
GROUP BY company;*/
/*
fullTable as (SELECT company, week, share_price, diff,success,
    bool_and(success)  OVER(PARTITION BY company ORDER BY week ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)
FROM avgTable)*/