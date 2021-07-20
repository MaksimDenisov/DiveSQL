
-- Table Planet
INSERT INTO planet (id, NAME, distance, galaxy) VALUES (1,  'Carehigh',    172.01, (RANDOM() * 4 + 1)::INT);
INSERT INTO planet (id, NAME, distance, galaxy) VALUES (2,  'Medredfan',   130.84, (RANDOM() * 4 + 1)::INT);
INSERT INTO planet (id, NAME, distance, galaxy) VALUES (3,  'Dandindox',   13.37,  (RANDOM() * 4 + 1)::INT);
INSERT INTO planet (id, NAME, distance, galaxy) VALUES (4,  'Kanron',      3.10,   (RANDOM() * 4 + 1)::INT);
INSERT INTO planet (id, NAME, distance, galaxy) VALUES (5,  'Tanway',      75.28,  (RANDOM() * 4 + 1)::INT);
INSERT INTO planet (id, NAME, distance, galaxy) VALUES (6,  'Vilakix',     40.57,  (RANDOM() * 4 + 1)::INT);
INSERT INTO planet (id, NAME, distance, galaxy) VALUES (7,  'Bioflex',     89.08,  (RANDOM() * 4 + 1)::INT);
INSERT INTO planet (id, NAME, distance, galaxy) VALUES (8,  'Goldenflex',  131.70, (RANDOM() * 4 + 1)::INT);
INSERT INTO planet (id, NAME, distance, galaxy) VALUES (9,  'Opeholding',  90.44,  (RANDOM() * 4 + 1)::INT);
INSERT INTO planet (id, NAME, distance, galaxy) VALUES (10, 'Tanzone',     52.83,  (RANDOM() * 4 + 1)::INT);
INSERT INTO planet (id, NAME, distance, galaxy) VALUES (11, 'Flexplus',    105.87, (RANDOM() * 4 + 1)::INT);
INSERT INTO planet (id, NAME, distance, galaxy) VALUES (12, 'Volholdings', 5.99,   (RANDOM() * 4 + 1)::INT);
INSERT INTO planet (id, NAME, distance, galaxy) VALUES (13, 'Hotla',       195.26, (RANDOM() * 4 + 1)::INT);
INSERT INTO planet (id, NAME, distance, galaxy) VALUES (14, 'Trioline',    15.58,  (RANDOM() * 4 + 1)::INT);
INSERT INTO planet (id, NAME, distance, galaxy) VALUES (15, 'Stimex',      164.43, (RANDOM() * 4 + 1)::INT);
INSERT INTO planet (id, NAME, distance, galaxy) VALUES (16, 'Hotanbam',    126.37, (RANDOM() * 4 + 1)::INT);
INSERT INTO planet (id, NAME, distance, galaxy) VALUES (17, 'Rancare',     57.87,  (RANDOM() * 4 + 1)::INT);
INSERT INTO planet (id, NAME, distance, galaxy) VALUES (18, 'Doubleice',   131.20, (RANDOM() * 4 + 1)::INT);
INSERT INTO planet (id, NAME, distance, galaxy) VALUES (19, 'Geocom',      114.40, (RANDOM() * 4 + 1)::INT);
INSERT INTO planet (id, NAME, distance, galaxy) VALUES (20, 'Techiplus',   164.72, (RANDOM() * 4 + 1)::INT);

-- Table Commander
INSERT INTO commander VALUES (1, 'Johnny Silverbeard');
INSERT INTO commander VALUES (2, 'Salty Ravenbeard');
INSERT INTO commander VALUES (3, 'Henri Shelley');
INSERT INTO commander VALUES (4, 'Bloody Ravenbeard');
INSERT INTO commander VALUES (5, 'Hungry Redblade');
INSERT INTO commander VALUES (6, 'Gold Stoker');
INSERT INTO commander VALUES (7, 'Thomas Silvergrim');
INSERT INTO commander VALUES (8, 'Donna Gull');
INSERT INTO commander VALUES (9, 'Billy Dreadbeard');
INSERT INTO commander VALUES (10, 'James Scarlet');

-- Table Flight
INSERT INTO flight VALUES (1,  2,  8,  '2047-10-28');
INSERT INTO flight VALUES (2,  5,  6,  '2047-12-16');
INSERT INTO flight VALUES (3,  13, 2,  '2048-02-20');
INSERT INTO flight VALUES (4,  6,  2,  '2048-03-02');
INSERT INTO flight VALUES (5,  12, 5,  '2048-03-20');
INSERT INTO flight VALUES (6,  9,  8,  '2048-03-26');
INSERT INTO flight VALUES (7,  14, 9,  '2048-05-01');
INSERT INTO flight VALUES (8,  3,  2,  '2048-05-22');
INSERT INTO flight VALUES (9,  6,  8,  '2048-05-28');
INSERT INTO flight VALUES (10, 6,  7,  '2048-06-04');
INSERT INTO flight VALUES (11, 4,  7,  '2048-06-17');
INSERT INTO flight VALUES (12, 2,  10, '2048-08-10');
INSERT INTO flight VALUES (13, 4,  8,  '2048-08-18');
INSERT INTO flight VALUES (14, 6,  3,  '2048-09-03');
INSERT INTO flight VALUES (15, 5,  10, '2048-10-08');
INSERT INTO flight VALUES (16, 8,  6,  '2048-10-20');
INSERT INTO flight VALUES (17, 9,  6,  '2048-11-23');
INSERT INTO flight VALUES (18, 7,  7,  '2048-12-17');
INSERT INTO flight VALUES (19, 13, 1,  '2048-12-23');
INSERT INTO flight VALUES (20, 10, 5,  '2048-12-28');