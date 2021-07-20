SELECT * FROM (
                  SELECT conference_id,
                         COUNT(*) AS paper_count
                  FROM PaperConference
                  GROUP BY conference_id
                  HAVING COUNT(*) > 100) BigConfs
                  JOIN ((
    SELECT P.id as paper_id,
           SUM(CASE
                   WHEN PK.keyword_id IS NULL THEN 0
                   ELSE 1 END) AS kw_count
    FROM Paper P LEFT OUTER JOIN PaperKeyword PK
                                 ON P.id = PK.paper_id
    GROUP BY P.id)  T
    JOIN
    PaperConference PC
    ON T.paper_id = PC.paper_id) KwPerPaper
                       ON BigConfs.conference_id = KwPerPaper.conference_id
WHERE KwPerPaper.kw_count < 2