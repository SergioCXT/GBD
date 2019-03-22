-- 5.1 Carga el archivo empleados.sql como administrador y crea las siguientes consultas:
-- Selecciona todos los datos de los empleados.

SELECT * FROM EMPLEADOS;

-- Selecciona sólamente el nombre del empleado y sufecha de nacimiento (llámala "CUMPLE").

SELECT NOMEM, FECNA "CUMPLE" FROM EMPLEADOS;

-- Obten las distintas extensiones de teléfono que tiene la empresa.

SELECT EXTEL FROM EMPLEADOS;

-- 5.2 Crea una consulta para la tabla empleados quedevuelva:
-- El número de empleado
-- El nombre del empleado
-- Su salario mensual
-- Su salario anual (12 veces el mensual). Llámalo"ANUAL"

SELECT NUMEM, NOMEM, SALAR, SALAR*12 "ANUAL" FROM EMPLEADOS;

-- 5.3 Crea una consulta para la tabla empleados que devuelva:
-- El número de empleado
-- El nombre del empleado
-- Su salario mensual
-- Su salario con un 5% de subida. Llámalo "SUBIDA".

SELECT NUMEM, NOMEM, SALAR, SALAR*1.05 "SUBIDA" FROM EMPLEADOS;

-- 5.4 Crea una consulta para la tabla empleados que devuelva:
-- El número de empleado
-- El nombre del empleado
-- Su salario mensual
-- Su paga extra (500 € + 10% del salario mensual). Llama al campo "BONUS".

SELECT NUMEM, NOMEM, SALAR, 500+SALAR*0.1 "BONUS" FROM EMPLEADOS;

-- 5.5 Crea una consulta para la tabla empleados que devuelva:
-- El número de empleado
-- El nombre del empleado
-- Su salario mensual
-- Su salario mensual más la comisión. Utiliza NVL si esnecesario.

SELECT NUMEM, NOMEM, SALAR, NVL(SALAR+COMIS,0) FROM EMPLEADOS;

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

-- Nombre Dep, Num. Jefe, Tipo (Propiedad, Funciones)

SELECT NOMDE, DIREC, DECODE (TIDIR , 'P', 'PRODIEDAD' , 'F', 'FUNCIONES') FROM DEPARTAMENTOS;

-- Nombre, NumHijos, Hijos (Sin hijos, 1, 2, Familia numerosa)

SELECT NOMEM, NUMHI, CASE NUMHI WHEN 0 THEN 'SIN HIJOS'
WHEN 1 THEN '1'
WHEN 2 THEN '2'
ELSE 'FAMILIA NUMEROSA'
END FROM EMPLEADOS;

-- 5.19 Crea las siguientes consultas
-- Selecciona el número de departamento, el salario medio, mínimo y máximo de los empleados agrupados por departamento.

SELECT NUMDE, AVG(SALAR), MIN(SALAR), MAX(SALAR) FROM EMPLEADOS GROUP BY NUMDE;

-- Averigua cuántos empleados hay agrupados por número de hijos.

SELECT COUNT(*), NUMHI FROM EMPLEADOS GROUP BY NUMHI;

-- Averigua cuántos empleados hay agrupados por departamento y extensión, en este mismo orden.

SELECT COUNT(*), NUMDE, EXTEL FROM EMPLEADOS GROUP BY NUMDE, EXTEL;

-- Averigua cuánto dinero en total debe pagar en salarios (sin comisiones) la empresa para cada departamento.

SELECT SUM(SALAR), NUMDE FROM EMPLEADOS GROUP BY NUMDE;

-- 5.20 Crea las siguientes consultas:
-- Averigue el número de empleados de los departamentos cuyo salario medio supera los 1700 euros.

SELECT COUNT(*), NUMDE FROM EMPLEADOS GROUP BY NUMDE HAVING AVG(SALAR)>1700;

-- Averigüe el salario mínimo de los empleados con familia numerosa (más de 3 hijos) agrupados por el número de hijos.

SELECT NUMHI, MIN(SALAR) FROM EMPLEADOS GROUP BY NUMHI HAVING NUMHI>3 ORDER BY NUMHI;

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

-- 5.26 Carga el archivo vehiculos.sql y realizas las siguientes consultas:
-- Seleccione el número y el nombre de los empleados con vehículo de empresa y la matrícula, marca y modelo de dicho vehículo.

SELECT E.NUMEM, E.NOMEM FROM EMPLEADOS E JOIN VEHICULOS V ON E.NUMEM = V.NUMEM; 

-- Seleccione el número y el nombre de todos los empleados y la matrícula, marca y modelo del vehículo de empresa si disponen de este.

SELECT E.NUMEM, E.NOMEM, V.MATRI, V.MARCA, V.MODEL FROM EMPLEADOS E LEFT JOIN VEHICULOS V ON E.NUMEM = V.NUMEM; 

-- Seleccione la matrícula, marca y modelo de todos los vehículo de empresa y, si están asociados a un empleado, su número y nombre.

SELECT V.MATRI, V.MARCA, V.MODEL, E.NUMEM, E.NOMEM FROM EMPLEADOS E RIGHT JOIN VEHICULOS V ON E.NUMEM = V.NUMEM;

-- Seleccione el número y el nombre de los empleados y la matrícula, marca y modelo de su vehículo oficial asociado, incluyendo empleados sin vehículo o vehículos sin empleado.

SELECT E.NUMEM, E.NOMEM, V.MATRI, V.MARCA, V.MODEL FROM EMPLEADOS E FULL JOIN VEHICULOS V ON E.NUMEM = V.NUMEM; 

-- 5.27
-- Seleccione el nombre y salario de los empleados que tengan más hijos que RÓMULO y que también ganen más dinero que PILAR.

SELECT NOMEM, SALAR FROM EMPLEADOS WHERE NUMHI > (SELECT NUMHI FROM EMPLEADOS WHERE NOMEM = 'ROMULO') 
INTERSECT
SELECT NOMEM, SALAR FROM EMPLEADOS WHERE SALAR > (SELECT SALAR FROM EMPLEADOS WHERE NOMEM = 'PILAR');

-- Seleccione el nombre y número de los empleados nacidos antes de 1978 y de aquellos empleados cuyo salario más la comisión superan los 1000€.

SELECT NOMEM, NUMEM FROM EMPLEADOS WHERE FECNA < TO_DATE(1978, 'YYYY')
UNION
SELECT NOMEM, NUMEM FROM EMPLEADOS WHERE SALAR+NVL(COMIS,0) > 1000;

-- Seleccione el nombre y el presupuesto de los departamentos cuyo presupuesto supere los 40k, descartando los departamentos en los que haya empleados con comisión.

SELECT NOMDE, PRESU FROM DEPARTAMENTOS WHERE PRESU > 40
MINUS
SELECT NOMDE, PRESU FROM DEPARTAMENTOS WHERE NUMDE = ANY(SELECT NUMDE FROM EMPLEADOS WHERE COMIS IS NOT NULL);
