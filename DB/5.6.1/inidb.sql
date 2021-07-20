DROP TABLE IF EXISTS  paper;
DROP TABLE IF EXISTS  ConferenceEvent;
DROP TABLE IF EXISTS  Conference;

-- Серия ежегодных конференций

CREATE TABLE Conference (
                            id   INT PRIMARY KEY,
                            name TEXT
);

-- "Событие" -- конференция в конкретном году

CREATE TABLE ConferenceEvent (
                                 id               INT PRIMARY KEY,
                                 conference_id    INT REFERENCES Conference,
                                 year             INT,
                                 total_papers     INT,
                                 accepted_papers  INT,
                                 acceptance_ratio NUMERIC(3, 2),
                                 UNIQUE (conference_id, year)
);
