ALTER TABLE ConferenceEvent DROP COLUMN total_papers;
ALTER TABLE ConferenceEvent DROP COLUMN accepted_papers;
ALTER TABLE ConferenceEvent DROP COLUMN acceptance_ratio;
CREATE TABLE Paper(
                      id INT PRIMARY KEY,
                      event_id INT REFERENCES ConferenceEvent,
                      title TEXT,
                      accepted BOOLEAN);

/*SELECT C.name, CE.year, CE.total_papers, CE.acceptance_ratio
FROM ConferenceEvent CE
         JOIN Conference C ON C.id = CE.conference_id
WHERE CE.total_papers > 5 AND CE.acceptance_ratio > 0.75;*/