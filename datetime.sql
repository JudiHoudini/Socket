CREATE TABLE emp (
    empNo int PRIMARY KEY,
    name VARCHAR
);

CREATE TABLE pointage (
    id int PRIMARY KEY,
    empNo BIGINT references emp,
    dateTimeIn TIMESTAMP,
    dateTimeOut TIMESTAMP
);

INSERT INTO emp VALUES (1, 'Jean');
INSERT INTO emp VALUES (2, 'Mouka');

INSERT INTO public.pointage (id, empno, datetimein, datetimeout) VALUES (1, 1, '2022-12-05 08:00:00.000000', '2022-12-05 20:00:00.000000');
INSERT INTO public.pointage (id, empno, datetimein, datetimeout) VALUES (2, 1, '2022-12-06 07:10:00.000000', '2022-12-06 16:51:15.000000');
INSERT INTO public.pointage (id, empno, datetimein, datetimeout) VALUES (4, 2, '2022-12-06 08:51:40.000000', '2022-12-06 17:51:47.000000');
INSERT INTO public.pointage (id, empno, datetimein, datetimeout) VALUES (3, 2, '2022-12-05 10:00:20.000000', '2022-12-05 15:51:37.000000');
INSERT INTO public.pointage (id, empno, datetimein, datetimeout) VALUES (5, 2, '2022-12-07 09:51:52.000000', '2022-12-07 19:52:00.000000');

SELECT EXTRACT(DAY FROM dateTimeIn) jour, empNo, SUM(dateTimeOut-dateTimeIn) duree
FROM pointage GROUP BY jour, empNo;

SELECT EXTRACT(WEEK FROM dateTimeIn) semaine, empNo, SUM(dateTimeOut-dateTimeIn) duree
FROM pointage GROUP BY semaine, empNo;

SELECT EXTRACT(MONTH FROM dateTimeIn) mois, empNo, SUM(dateTimeOut-dateTimeIn) duree
FROM pointage GROUP BY mois, empNo
ORDER BY mois, empNo;


SELECT EXTRACT(DAY FROM dateTimeIn) jour, COUNT(DISTINCT empNo) present FROM pointage GROUP BY jour ORDER BY jour;
SELECT EXTRACT(WEEK FROM dateTimeIn) semaine, COUNT(DISTINCT empno) present FROM pointage GROUP BY semaine;
SELECT EXTRACT(MONTH FROM dateTimeIn) mois, COUNT(DISTINCT empno) present FROM pointage GROUP BY mois;
