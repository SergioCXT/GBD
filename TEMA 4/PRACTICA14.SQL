-- PRACTICA 14
-- 1.- Para cada departamento con presupuesto inferior a 35.000 €, hallar le nombre del Centro donde está ubicado y el máximo salario de sus empleados (si dicho máximo excede de 1.500 €). Clasificar alfabéticamente por nombre de departamento.

SELECT D.NOMDE, C.NOMCE, MAX(E.SALAR) FROM DEPARTAMENTOS D JOIN EMPLEADOS E ON D.NUMDE = E.NUMDE JOIN CENTROS C ON D.NUMCE = C.NUMCE WHERE PRESU < 35 AND SALAR > 1500 GROUP BY NOMDE, NOMCE;

-- 2.- Hallar por orden alfabético los nombres de los departamentos que dependen de los que tienen un presupuesto inferior a 30.000 €. También queremos conocer el nombre del departamento del que dependen y su presupuesto.

SELECT D1.NOMDE, D2.NOMDE, D2.PRESU FROM DEPARTAMENTOS D1 JOIN DEPARTAMENTOS D2 ON D2.NUMDE = D1.DEPDE WHERE D2.PRESU < 30;

-- 3.- Obtener los nombres y los salarios medios de los departamentos cuyo salario medio supera al salario medio de la empresa.

SELECT D.NOMDE, AVG(E.SALAR) FROM EMPLEADOS E JOIN DEPARTAMENTOS D ON E.NUMDE = D.NUMDE GROUP BY D.NOMDE HAVING AVG(SALAR) > (SELECT AVG(SALAR) FROM EMPLEADOS);

-- 4.- Para los departamentos cuyo director lo sea en funciones, hallar el número de empleadosy la suma de sus salarios, comisiones y número de hijos.

SELECT D.NOMDE, COUNT(E.NUMEM), SUM(E.SALAR), SUM(E.COMIS), SUM(E.NUMHI) FROM EMPLEADOS E JOIN DEPARTAMENTOS D ON E.NUMDE = D.NUMDE WHERE TIDIR = 'F' GROUP BY NOMDE;

-- 5.- Para los departamentos cuyo presupuesto anual supera los 35.000 €, hallar cuantos empleados hay por cada extensión telefónica.

SELECT D.NOMDE, E.EXTEL, COUNT(E.NUMEM) FROM EMPLEADOS E JOIN DEPARTAMENTOS D ON E.NUMDE = D.NUMDE WHERE PRESU > 35 GROUP BY NOMDE, EXTEL;

-- 6.- Hallar por orden alfabético los nombres de los empleados y su número de hijos para aquellos que son directores en funciones.

SELECT DISTINC2E2.NOMEM, E2.NUMHI FROM EMPLEADOS E JOIN DEPARTAMENTOS D ON E.NUMDE = D.NUMDE JOIN EMPLEADOS E2 ON D.DIREC = E2.NUMEM WHERE D.TIDIR = 'F';

-- 7.- Hallar si hay algún departamento (suponemos que sería de reciente creación) que aún no tenga empleados asignados ni director en propiedad.

SELECT D.NUMDE FROM DEPARTAMENTOS D LEFT JOIN EMPLEADOS E ON D.NUMDE = E.NUMDE WHERE TIDIR = 'P' GROUP BY D.NUMDE HAVING COUNT(E.NUMEM) = 0;

-- 8.- Añadir un nuevo departamento de nombre NUEVO y con director en funciones.

INSERT INTO DEPARTAMENTOS(NUMDE, TIDIR, NOMDE) VALUES(200,'F','NUEVO');

-- 9.- Añadir un nuevo empleado de nombre NORBERTO y sin departamento asignado. Inventar el resto de datos.

INSERT INTO EMPLEADOS(NUMEM, EXTEL, FECNA, FECIN, SALAR, COMIS, NUMHI, NOMEM) VALUES(560,350,'05/10/1997','06/05/2018',347,NULL,0,'NORBERTO');

-- 10.- Muestra los departamentos que no tienen empleados.

SELECT D.NOMDE FROM DEPARTAMENTOS D LEFT JOIN EMPLEADOS E ON D.NUMDE = E.NUMDE GROUP BY NOMDE HAVING COUNT(NOMEM) = 0;

-- 11.- Muestra los nombres de departamentos que no tienen empleados haciendo uso la combinación externa LEFT JOIN. Muestra una segunda columna con los nombres de empleados para asegurarnos que realmente esta a NULL.

SELECT D.NOMDE, E.NOMEM FROM DEPARTAMENTOS D LEFT JOIN EMPLEADOS E ON D.NUMDE = E.NUMDE GROUP BY NOMDE, NOMEM HAVING COUNT(NOMEM) = 0;

-- 12.- Muestra los nombres de departamentos que no tienen empleados haciendo uso la combinación externa RIGH JOIN. Muestra una segunda columna con los nombres de empleados para asegurarnos que realmente esta a NULL.

SELECT D.NOMDE, E.NOMEM FROM EMPLEADOS E RIGHT JOIN DEPARTAMENTOS D ON D.NUMDE = E.NUMDE GROUP BY NOMDE, NOMEM HAVING COUNT(NOMEM) = 0;

-- 13.- Muestra los nombres de empleados que no tienen departamento haciendo uso la combinación externa LEFT JOIN. Muestra una segunda columna con los nombres de departamentos para asegurarnos que realmente esta a NULL.

SELECT E.NOMEM, D.NOMDE FROM EMPLEADOS E LEFT JOIN DEPARTAMENTOS D ON D.NUMDE = E.NUMDE GROUP BY NOMDE, NOMEM HAVING COUNT(NOMDE) = 0;

-- 14.- Muestra los nombres de empleados que no tienen departamento haciendo uso la combinación externa RIGHT JOIN. Muestra una segunda columna con los nombres de empleados para asegurarnos que realmente esta a NULL.

SELECT E.NOMEM, D.NOMDE FROM DEPARTAMENTOS D RIGHT JOIN EMPLEADOS E ON D.NUMDE = E.NUMDE GROUP BY NOMDE, NOMEM HAVING COUNT(NOMDE) = 0;

-- 15.- Muestra los departamentos que no tienen empleados y los empleados que no tiene departamento haciendo uso la combinación externa FULL JOIN.

SELECT E.NOMEM, D.NOMDE FROM DEPARTAMENTOS D FULL JOIN EMPLEADOS E ON D.NUMDE = E.NUMDE GROUP BY NOMDE, NOMEM HAVING COUNT(NOMDE) = 0 OR COUNT(NOMEM) = 0;

-- 16.- Muestra los empleados y sus respectivos departamentos haciendo uso de la combinación interna INNER JOIN. ¿Aparecen el departamento NUEVO y el empleado NORBERTO?¿Por qué?

SELECT E.NOMEM, D.NOMDE FROM DEPARTAMENTOS D INNER JOIN EMPLEADOS E ON D.NUMDE = E.NUMDE GROUP BY NOMDE, NOMEM;

-- 17.- Realiza la misma consulta anterior donde se cumpla la condición que NUMDE está a NULL. ¿Aparece algún resultado?¿Por qué?

SELECT E.NOMEM, D.NOMDE FROM DEPARTAMENTOS D INNER JOIN EMPLEADOS E ON D.NUMDE = E.NUMDE WHERE D.NUMDE IS NULL GROUP BY NOMDE, NOMEM;

-- 18.- Muestra los empleados y sus respectivos departamentos haciendo uso de la combinación interna NATURAL JOIN.

SELECT E.NOMEM, D.NOMDE FROM EMPLEADOS E NATURAL JOIN DEPARTMENTOS D;

-- 19.- Muestra la combinación de las 3 tablas CENTROS, DEPARTAMENTOS y EMPLEADOS haciendo uso de NATURAL JOIN.

SELECT * FROM CENTROS C NATURAL JOIN DEPARTAMENTOS D NATURAL JOIN EMPLEADOS E;

-- 20.- Borra los registros dados de alta para el departamento NUEVO y el empleado introducida en el apartado anterior.

DELETE FROM EMPLEADOS WHERE NOMEM='NORBERTO';
DELETE FROM DEPARTAMENTOS WHERE NOMDE='NUEVO';
