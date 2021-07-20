
CREATE TABLE Government(id SERIAL PRIMARY KEY, value TEXT UNIQUE);
INSERT INTO Government(value)
SELECT unnest(ARRAY['Анархия', 'Коммунизм', 'Конфедерация', 'Олигархия', 'Демократия', 'Диктатура', 'Феодализм']);

CREATE TABLE Planet(
                       id SERIAL PRIMARY KEY,
                       name TEXT UNIQUE,
                       distance NUMERIC(5,2),
                       government_id INT REFERENCES Government,
                       wiki HSTORE);

INSERT INTO Planet (name, distance, government_id, wiki) VALUES
('Planet_01', 100.00, 1, 'danger=>0, dinosaurs=>1, weapons=>1, pirates=>1, earthquakes=>1, crime=>1, mosquitoes=>1'),
('Planet_02', 100.00, 2, 'danger=>1, dinosaurs=>1, weapons=>0, pirates=>0, earthquakes=>0, crime=>0, mosquitoes=>0'),
('Planet_03', 100.00, 3, 'danger=>1, dinosaurs=>0, weapons=>1, pirates=>0, earthquakes=>0, crime=>0, mosquitoes=>0'),
('Planet_04', 100.00, 4, 'danger=>1, dinosaurs=>0, weapons=>0, pirates=>1, earthquakes=>0, crime=>0, mosquitoes=>0'),
('Planet_05', 100.00, 5, 'danger=>1, dinosaurs=>0, weapons=>0, pirates=>0, earthquakes=>1, crime=>0, mosquitoes=>0'),
('Planet_06', 100.00, 6, 'danger=>1, dinosaurs=>0, weapons=>0, pirates=>0, earthquakes=>0, crime=>1, mosquitoes=>0'),
('Planet_07', 100.00, 7, 'danger=>1, dinosaurs=>0, weapons=>0, pirates=>0, earthquakes=>0, crime=>0, mosquitoes=>1'),
('Planet_08', 100.00, 1, 'danger=>1, dinosaurs=>0, weapons=>1, pirates=>0, earthquakes=>0, crime=>0, mosquitoes=>0'),
('Planet_09', 100.00, 2, 'danger=>1, dinosaurs=>0, weapons=>0, pirates=>1, earthquakes=>0, crime=>0, mosquitoes=>0'),
('Planet_10', 100.00, 3, 'danger=>1, dinosaurs=>0, weapons=>0, pirates=>0, earthquakes=>1, crime=>0, mosquitoes=>0'),
('Planet_11', 100.00, 4, 'danger=>1, dinosaurs=>0, weapons=>0, pirates=>0, earthquakes=>0, crime=>1, mosquitoes=>0'),
('Planet_12', 100.00, 5, 'danger=>1, dinosaurs=>0, weapons=>0, pirates=>0, earthquakes=>0, crime=>0, mosquitoes=>1'),
('Planet_13', 100.00, 6, 'danger=>1, dinosaurs=>0, weapons=>0, pirates=>0, earthquakes=>1, crime=>0, mosquitoes=>0'),
('Planet_14', 100.00, 7, 'danger=>1, dinosaurs=>0, weapons=>0, pirates=>0, earthquakes=>0, crime=>1, mosquitoes=>0'),
('Planet_15', 100.00, 1, 'danger=>1, dinosaurs=>0, weapons=>0, pirates=>0, earthquakes=>0, crime=>0, mosquitoes=>1'),
('Planet_16', 100.00, 2, 'danger=>1, dinosaurs=>0, weapons=>0, pirates=>0, earthquakes=>0, crime=>1, mosquitoes=>0'),
('Planet_17', 100.00, 3, 'danger=>1, dinosaurs=>0, weapons=>0, pirates=>0, earthquakes=>0, crime=>0, mosquitoes=>1'),
('Planet_18', 100.00, 4, 'danger=>1, dinosaurs=>0, weapons=>0, pirates=>0, earthquakes=>0, crime=>0, mosquitoes=>1'),
('Planet_19', 100.00, 5, 'danger=>1, dinosaurs=>0, weapons=>0, pirates=>0, earthquakes=>0, crime=>0, mosquitoes=>1'),
('Planet_20', 100.00, 6, 'danger=>1, dinosaurs=>0, weapons=>0, pirates=>0, earthquakes=>0, crime=>0, mosquitoes=>1')