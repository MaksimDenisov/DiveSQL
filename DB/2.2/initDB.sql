DROP TABLE IF EXISTS Location;
DROP TABLE IF EXISTS Conference;
DROP TABLE IF EXISTS Paper;
CREATE TABLE Location(id SERIAL, value TEXT);
CREATE TABLE Conference(id SERIAL, value TEXT);
CREATE TABLE Paper(id SERIAL, title TEXT, conference TEXT, location TEXT);

-- COPY Location FROM '/resources/task2-location.csv' CSV;
-- COPY Conference FROM '/resources/task2-conference.csv' CSV;
