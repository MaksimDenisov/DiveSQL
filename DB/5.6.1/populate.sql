INSERT INTO conference VALUES (100, 'KONFA');
INSERT INTO conference VALUES (200, 'SPEAKTALK');

INSERT INTO conferenceevent VALUES (30, 100, 2015);
INSERT INTO conferenceevent VALUES (40, 100, 2017);
INSERT INTO conferenceevent VALUES (50, 200, 2019);

INSERT INTO paper VALUES (1, 30, 'notbaasgfd', True);
INSERT INTO paper VALUES (2, 30, 'notbad', True);
INSERT INTO paper VALUES (3, 40, 'noasfasdf', False);
INSERT INTO paper VALUES (4, 40, 'noaasfsadfassasdf', True);
INSERT INTO paper VALUES (5, 40, 'nassf', False);
INSERT INTO paper VALUES (6, 50, 'nasdsf', False);
INSERT INTO paper VALUES (7, 50, 'nassf', True);