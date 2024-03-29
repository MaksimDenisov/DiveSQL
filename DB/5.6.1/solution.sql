--SELECT C.name, CE.year, CE.total_papers, CE.acceptance_ratio
--FROM ConferenceEvent CE
--         JOIN Conference C ON C.id = CE.conference_id
--WHERE CE.total_papers > 5 AND CE.acceptance_ratio > 0.75;
SELECt * FROM
(SELECT C.name, CE.year ,
       COUNT(P.accepted) as total_papers,
       (COUNT(CASE WHEN P.accepted THEN 1 END)::NUMERIC/COUNT(P.accepted)::NUMERIC)::NUMERIC(3,2)as acceptance_ratio
FROM ConferenceEvent CE
         JOIN Conference C ON C.id = CE.conference_id
         JOIN paper P ON CE.id = P.event_id
         GROUP BY C.name, CE.year) as CCP
WHERE acceptance_ratio>0.75 AND total_papers > 5;
--WHERE CE.total_papers > 5 AND CE.acceptance_ratio > 0.75;