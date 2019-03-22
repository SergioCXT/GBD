-- 5.6 Crea una consulta para la tabla empleados que devuelva:

-- El nombre del empleado
-- El número de empleado y el número de extensión separados por un guión.
-- El salario incluyendo la cadena "euros / mes".

SELECT NOMEM, NUMEM || '-' || EXTEL AS "NUM + EXT", SALAR || ' EUROS/MES' AS "SALARIO" FROM EMPLEADOS;

-- 5.7 Crea las siguientes consultas:
-- Número de empleado, nombre y salario de los empleados que cobran menos de 1000 €.

SELECT NUMEM, NOMEM, SALAR SALAR FROM EMPLEADOS WHERE SALAR < 1000;

-- Nombre y extensión de los empleados cuya extensión no sea 880.

SELECT NOMEM, EXTEL FROM EMPLEADOS WHERE EXTEL !=880;

-- 5.8 Crea las siguientes consultas:
-- Nombre, fecha de nacimiento y salario de los empleados nacidos antes de 1970 que cobren más de 1500 €.

SELECT NOMEM, FECNA FROM EMPLEADOS WHERE FECNA < '01-01-1970' AND SALAR > 1500;

-- Nombre, número de hijos y salario de los empleados que no tengan hijos o ganen más de 1800€.

SELECT NOMEM, NUMHI, SALAR FROM EMPLEADOS WHERE NUMHI = 0 OR SALAR > 1800;

-- Nombre, número de hijos y número de departamento de empleados que no pertenezcan al departamento 112 y que no tengan más de un hijo.

SELECT NOMEM, NUMHI, NUMDE FROM EMPLEADOS WHERE NUMDE != 112 AND NUMHI < 2;

-- 5.9 Crea las siguientes consultas:
-- Nombre y fecha de nacimiento de los empleados nacidos entre 1970 y 1975.

SELECT NOMEM, FECNA FROM EMPLEADOS WHERE FECNA BETWEEN '01/01/1970' AND '31/12/1975';

-- Nombre y fecha de nacimiento de los empleados no nacidos entre 1970 y 1975.

SELECT NOMEM, FECNA FROM EMPLEADOS WHERE FECNA NOT BETWEEN '01/01/1970' AND '31/12/1975';

-- Nombre y salario de los empleados que cobren entre 1000 y 1500 €.

SELECT NOMEM, SALAR FROM EMPLEADOS WHERE SALAR BETWEEN 1000 AND 1500;

-- Nombre, salario y número de hijos de los empleados que cobren menos de 1200€ y tengan entre 2 y 3 hijos.

SELECT NOMEM, SALAR, NUMHI FROM EMPLEADOS WHERE SALAR < 1200 AND NUMHI BETWEEN 2 AND 3;

-- 5.10 Crea las siguientes consultas:
-- Número de empleado y número de departamento de los empleados de los departamentos 110 y 112.

SELECT NUMEM, NUMDE FROM EMPLEADOS WHERE NUMDE IN (110,112);

-- Número de empleado y número de extensión de los empleados que no tengan la extensión 880, 760 ni 620.

SELECT NUMEM, EXTEL FROM EMPLEADOS WHERE EXTEL NOT IN (880,760,620);

-- 5.11 Crea las siguientes consultas:
-- Nombre de los empleados que empiecen por A y terminen por O.

SELECT NOMEM FROM EMPLEADOS WHERE NOMEM LIKE 'A%O';

-- Nombre de los empleados cuyo nombre tenga 5 letras y la última sea la A.

SELECT NOMEM FROM EMPLEADOS WHERE NOMEM LIKE '____A';

-- 5.12 Crea las siguientes consultas:
-- Número de empleado, sueldo y comisión de los empleados que tienen comisión.

SELECT NUMEM, SALAR, COMIS FROM EMPLEADOS WHERE COMIS IS NOT NULL;

-- Número de empleado, sueldo y comisión de los empleados que no tienen comisión.

SELECT NUMEM, SALAR, COMIS FROM EMPLEADOS WHERE COMIS IS NULL;

-- 5.13 Crea las siguientes consultas:
-- El nombre de los empleados ordenados por orden ascendente.

SELECT NOMEM FROM EMPLEADOS ORDER BY NOMEM ASC;

-- Número de departamento, número de empleado y nombre ordenados por número de departamento y número de empleado.

SELECT NUMDE, NUMEM, NOMEM FROM EMPLEADOS ORDER BY NUMDE,NUMEM;

-- Número de hijos, número de empleado y nombre ordenado por nº de hijos descendiente y nombre ascendiente.

SELECT NUMHI, NUMEM, NOMEM FROM EMPLEADOS ORDER BY NUMHI DESC, NOMEM ASC;

-- Nombre de empleado y su salario anual (12 veces el mensual), ordenado por salario anual descendiente.

SELECT NOMEM, SALAR*12 "Salario Anual" FROM EMPLEADOS ORDER BY SALAR DESC;

-- 5.14 Crea las siguientes consultas:
-- Nombre y salario de los empleados que cobran más que Micaela.

SELECT NOMEM, SALAR FROM EMPLEADOS WHERE SALAR > (SELECT SALAR FROM EMPLEADOS WHERE NOMEM='MICAELA');

-- Nombre y fecha de incorporación de los empleados que entraron a la empresa después del empleado 250.

SELECT NOMEM, FECIN FROM EMPLEADOS WHERE FECIN > (SELECT FECIN FROM EMPLEADOS WHERE NUMEM = 250);

-- Nombre de los compañeros de departamento de Sancho (no incluir a Sancho).

SELECT NOMEM FROM EMPLEADOS WHERE NUMDE = (SELECT NUMDE FROM EMPLEADOS WHERE NOMEM='SANCHO') AND NOMEM !='SANCHO';

SELECT NOMEM FROM EMPLEADOS WHERE NUMDE = (SELECT NUMDE FROM EMPLEADOS WHERE NOMEM='SANCHO') AND NOMEM NOT IN ('SANCHO');

-- 5.15 Crea las siguientes consultas:
-- Nombre y salario del empleado que menos cobra.

SELECT NOMEM, SALAR FROM EMPLEADOS WHERE SALAR <= ALL(SELECT SALAR FROM EMPLEADOS);

-- Nombre, número de departamento y salario de los empleados que no son del departamento 130 y cobran más que alguno de los empleados de dicho departamento.

SELECT NOMEM, NUMDE, SALAR FROM EMPLEADOS WHERE NUMDE !=130 AND SALAR > ANY(SELECT SALAR FROM EMPLEADOS WHERE NUMDE =130);

-- Nombre y número de departamento de los jefes de departamento.

SELECT NOMEM, NUMDE FROM EMPLEADOS WHERE NUMEM = ANY(SELECT DIREC FROM DEPARTAMENTOS);

-- 5.16 Crea las siguientes consultas:
-- Nombre del empleado en mayúsculas, en minúsculas, en "InitCap" y número de letras que tiene.

SELECT UPPER (NOMEM), LOWER (NOMEM), INITCAP (NOMEM), LENGTH (NOMEM) FROM EMPLEADOS;

-- La cadena " A B C D " sin espacios por la izquierda, sin espacios por la derecha y sin espacios a ambos lados.

SELECT RTRIM(' A B C D '), LTRIM(' A B C D '), TRIM(' A B C D ') FROM DUAL;

-- Obten las tres primeras letras del nombre de los empleados y en otra columna el nombre al revés.

SELECT SUBSTR(NOMEM, 1, 3), REVERSE(NOMEM) FROM EMPLEADOS;

-- Obten el salario de los empleados (rellenando con ceros por la derecha hasta obtener 5 cifras) y el nombre, rellenando con asteriscos por la derecha hasta tener 10 caracteres.

SELECT LPAD(SALAR, 5,0), RPAD(NOMEM, 10,'*') FROM EMPLEADOS;

-- Busca la posición de la arroba en tu correo electrónico.

SELECT INSTR('sergiocxt@gmail.com', '@') FROM DUAL;

-- Selecciona los nombres de los empleados, reemplazando "NA" por "**".

SELECT REPLACE(NOMEM, 'NA', '**') FROM EMPLEADOS;

-- 5.17 Crea las siguientes consultas:
-- Selecciona el nombre del empleado y cuanto gana al día (sin comisiones). Muestra cuanto gana en bruto, redondeándolo a 2 decimales y truncándolo a 2 decimales.

SELECT NOMEM, ROUND(SALAR/30, 2),  TRUNC(SALAR/30, 2) FROM EMPLEADOS;

-- Averigua el resto de dividir 27 entre 4, cuánto es 3 elevado a 5 y la raíz cuadrada de 169.

SELECT MOD (27, 4), POWER(3, 5), SQRT(169) FROM DUAL;

-- 5.18 Crea las siguientes consultas:
-- Selecciona la fecha resultante de sumar 9 meses a la fecha de nacimiento y extrae el año de la fecha de incorporación de los empleados.

SELECT ADD_MONTHS(FECNA, 9), EXTRACT(YEAR FROM FECIN) FROM EMPLEADOS;

SELECT TRUNC(ABS(MONTHS_BETWEEN(FECNA, FECIN)/12),0) "EDAD" FROM EMPLEADOS;

-- 5.21 Crea las siguientes consultas:
-- Seleccione el nombre del empleado y el nombre del departamento en el que trabaja.

SELECT E.NOMEM, D.NOMDE FROM EMPLEADOS E, DEPARTAMENTOS D WHERE E.NUMDE = D.NUMDE; 

-- Seleccione el nombre, salario y número de departamento de los empleados que trabajan en departamentos cuyo presupuesto supera los 60.000€.

SELECT E.NOMEM, E.SALAR, D.NUMDE FROM EMPLEADOS E, DEPARTAMENTOS D WHERE E.NUMDE = D.NUMDE AND D.PRESU > 60;

-- 5.22 Crea las siguientes consultas:
-- Seleccione el nombre del departamento donde trabaja el empleado más joven de la compañia.

SELECT D.NOMDE FROM EMPLEADOS E, DEPARTAMENTOS D WHERE E.NUMDE = D.NUMDE AND E.FECNA = (SELECT MAX(E.FECNA) FROM EMPLEADOS E);

-- Seleccione el nombre del departamento y el gasto total en salarios de cada uno.

SELECT D.NOMDE, SUM(E.SALAR) FROM EMPLEADOS E, DEPARTAMENTOS D WHERE E.NUMDE = D.NUMDE GROUP BY D.NOMDE;

-- Seleccione el nombre del empleado y el nombre del centro en el que trabaja.

SELECT E.NOMEM, C.NOMCE FROM CENTROS C, EMPLEADOS E, DEPARTAMENTOS D WHERE D.NUMCE = C.NUMCE AND E.NUMDE = D.NUMDE;

-- Seleccione el nombre del centro de trabajo y el gasto total en salarios de cada uno.

SELECT C.NOMCE, SUM(E.SALAR) FROM EMPLEADOS E, DEPARTAMENTOS D, CENTROS C WHERE D.NUMCE = C.NUMCE AND E.NUMDE = D.NUMDE GROUP BY C.NOMCE;

-- 5.23 Reescribe las siguientes consultas de las actividades 5.21 y 5.22 usando JOIN:
-- Seleccione el nombre del empleado y el nombre del departamento en el que trabaja.

SELECT E.NOMEM, D.NOMDE FROM EMPLEADOS E JOIN DEPARTAMENTOS D ON E.NUMDE = D.NUMDE; 

-- Seleccione el nombre, salario y nº de departamento de los empleados que trabajan en departamentos cuyo presupuesto supera los 60.000 €.

SELECT E.NOMEM, E.SALAR, D.NUMDE FROM EMPLEADOS E JOIN DEPARTAMENTOS D ON E.NUMDE = D.NUMDE WHERE D.PRESU > 60;

-- Seleccione el nombre del departamento y el gasto total en salarios de cada uno.

SELECT D.NOMDE, SUM(E.SALAR) FROM EMPLEADOS E JOIN DEPARTAMENTOS D ON E.NUMDE = D.NUMDE GROUP BY D.NOMDE;

-- Seleccione el nombre del empleado y el nombre del centro en el que trabaja.

SELECT E.NOMEM, C.NOMCE FROM DEPARTAMENTOS D JOIN CENTROS C ON D.NUMCE = C.NUMCE JOIN EMPLEADOS E ON E.NUMDE = D.NUMDE;

-- 5.24 Crea las siguientes consultas:
-- Para cada departamento, selecciona su nombre y el nombre del departamento del que depende.

SELECT D1.NOMDE, DEP.NOMDE FROM DEPARTAMENTOS D1 JOIN DEPARTAMENTOS DEP ON D1.DEPDE = DEP.NUMDE ORDER BY D1.NOMDE;

-- Selecciona el nombre del empleado, el nombre del departamento y el nombre de su jefe de departamento.

SELECT E1.NOMEM, D.NOMDE, E2.NOMEM FROM EMPLEADOS E1 JOIN DEPARTAMENTOS D ON E1.NUMDE = D.NUMDE JOIN EMPLEADOS E2 ON E2.NUMEM=D.DIREC;

-- 5.25 Reescribe las siguientes consultas de las actividades 5.21 y 5.22 usando NATURAL JOIN:
-- Seleccione el nombre, salario y número de departamento de los empleados que trabajan en departamentos cuyo presupuesto supera los 60.000 €.

SELECT E.NOMEM, E.SALAR, NUMDE FROM EMPLEADOS E NATURAL JOIN DEPARTAMENTOS D WHERE D.PRESU > 60;

-- Seleccione el nombre del departamento donde trabaja el empleado más joven de la compañia.

SELECT D.NOMDE FROM EMPLEADOS E NATURAL JOIN DEPARTAMENTOS D WHERE E.FECNA = (SELECT MAX(E.FECNA) FROM EMPLEADOS E);

-- Seleccione el nombre del departamento y el gasto total en salarios de cada uno.

SELECT D.NOMDE, SUM(E.SALAR) FROM EMPLEADOS E NATURAL JOIN DEPARTAMENTOS D GROUP BY D.NOMDE;

-- 5.26
-- 




-- PRACTICA 4

-- 1.- Obtener por orden alfabético los nombres de los empleados cuyo salario supera al máximo salario de los empleados del departamento 122.

SELECT NOMEM FROM EMPLEADOS WHERE SALAR > (SELECT MAX(SALAR) FROM EMPLEADOS WHERE NUMDE = 122) ORDER BY NOMEM ASC;

-- 2.- La misma consulta pero para el departamento 150. Explica por qué obtenemos la relación de todos los empleados por orden alfabético.

SELECT NOMEM FROM EMPLEADOS WHERE SALAR > (SELECT nvl(MAX(SALAR),0) FROM EMPLEADOS WHERE NOMEM = 150) ORDER BY NUMEM ASC;

-- 3.- Obtener por orden alfabético los nombres de los empleados cuyo salario supera en dos veces y media o más al mínimo salario de los empleados del departamento 122.

SELECT NOMEM FROM EMPLEADOS WHERE SALAR > (SELECT MIN(SALAR) FROM EMPLEADOS WHERE NUMDE = 122)*2.5 ORDER BY NOMEM ASC;

-- 4.- Obtener los nombres y salarios de los empleados cuyo salario coincide con la comisión multiplicada por 10 de algún otro o la suya propia.

SELECT NOMEM, SALAR FROM EMPLEADOS WHERE SALAR = ANY(SELECT COMIS*10 FROM EMPLEADOS);

-- 5.- Obtener por orden alfabético los nombres y salarios de los empleados cuyo salario es superior a la comisión máxima existente multiplicada por 20.

SELECT NOMEM, SALAR FROM EMPLEADOS WHERE SALAR > (SELECT MAX(COMIS)*20 FROM EMPLEADOS) ORDER BY NOMEM ASC;

-- 6.- Obtener por orden alfabético los nombres y salarios de los empleados cuyo salario es inferior a veinte veces la comisión más baja existente.

SELECT NOMEM, SALAR FROM EMPLEADOS WHERE SALAR < (SELECT MIN(COMIS)*20 FROM EMPLEADOS) ORDER BY NOMEM ASC;

-- PRACTICA 5
-- 1.- Obtener por orden alfabético los nombres de los empleados cuyo salario está entre 1500€ y 1600 €.

SELECT NOMEM FROM EMPLEADOS WHERE SALAR BETWEEN 1500 AND 1600 ORDER BY NOMEM ASC;

-- 2.- Obtener por orden alfabético los nombres y salarios de los empleados con comisión, cuyo salario dividido por su número de hijos cumpla una, o ambas, de las dos condiciones siguientes:
-- • Que sea inferior de 720 €
-- • Que sea superior a 50 veces su comisión.

SELECT NOMEM, SALAR FROM EMPLEADOS WHERE COMIS IS NOT NULL SALAR < 720*NUMHI OR SALAR > COMIS*50*NUMHI  ORDER BY NOMEM ASC;

-- PRACTICA 12

-- 1.- Hallar cuántos empleados hay en cada departamento.

SELECT COUNT(*), NUMDE FROM DEPARTAMENTOS GROUP BY NUMDE;

-- 2.- Hallar para cada departamento el salario medio, el mínimo y el máximo.

SELECT NUMDE, AVG(SALAR), MIN(SALAR), MAX(SALAR) FROM EMPLEADOS GROUP BY NUMDE;

-- 3.- Hallar el salario medio y la edad media en años para cada grupo de empleados con igual comisión.

SELECT COMIS, AVG(SALAR), TRUNC(AVG(MONTHS_BETWEEN(SYSDATE, FECNA)/12),0) FROM EMPLEADOS WHERE COMIS=COMIS OR COMIS IS NULL GROUP BY COMIS;

-- 4.- Repite la consulta anterior expresando la edad en años cumplidos. (Aunque en este caso se obtiene lo mismo, la edad media podría variar de una consulta a otra dependiendo del momento en el que se realice la consulta).

SELECT COMIS, AVG(SALAR), TRUNC(AVG(MONTHS_BETWEEN(SYSDATE, FECNA)/12),0) FROM EMPLEADOS WHERE COMIS=COMIS OR COMIS IS NULL GROUP BY COMIS;

-- 5.- Hallar el salario medio y la edad media en años cumplidos para cada grupo de empleados del mismo departamento y con igual comisión.

SELECT NUMDE, COMIS, AVG(SALAR), TRUNC(AVG(MONTHS_BETWEEN(SYSDATE, FECNA)/12),0) FROM EMPLEADOS WHERE COMIS=COMIS AND NUMDE=NUMDE OR COMIS IS NULL GROUP BY COMIS, NUMDE;

-- 6.- Para los departamentos en los que hay algún empleado cuyo salario sea mayor que 2.500 € al mes, hallar el número de empleados y la suma de sus salarios.

SELECT NUMDE, COUNT(NUMEM), SUM(SALAR) FROM EMPLEADOS WHERE SALAR > 2500 GROUP BY NUMDE;

