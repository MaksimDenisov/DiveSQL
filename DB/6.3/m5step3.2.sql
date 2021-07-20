CREATE TABLE Conference(
  id SERIAL PRIMARY KEY, name TEXT UNIQUE);

CREATE TABLE Keyword(
  id SERIAL PRIMARY KEY, value TEXT UNIQUE);

CREATE TABLE Paper(
  id SERIAL PRIMARY KEY, title TEXT);

CREATE TABLE PaperKeyword(
  paper_id INT REFERENCES Paper,
  keyword_id INT REFERENCES Keyword);

CREATE TABLE PaperConference(
  paper_id INT REFERENCES Paper,
  conference_id INT REFERENCES Conference,
  accepted BOOLEAN,
  UNIQUE(paper_id, conference_id));

insert into Conference
values ('AConf'),
       ('BConf'),
       ('CConf')
