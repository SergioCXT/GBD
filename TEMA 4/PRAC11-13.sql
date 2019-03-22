-- PRACTICA 11
-- 1.- Hallar el salario medio, mínimo y máximo de los empleados de la empresa.

SELECT AVG(SALAR), MIN(SALAR), MAX(SALAR) FROM EMPLEADOS;

-- 2.- Obtener por orden alfabético los salarios y nombres de los empleados tales que su salario más un 40% supera al máximo salario.

SELECT SALAR, NOMEM FROM EMPLEADOS WHERE SALAR*1.4 > (SELECT MAX(SALAR) FROM EMPLEADOS) ORDER BY NOMEM;

-- 3.- Hallar la edad en años cumplidos del empleado más viejo del departamento 110.

SELECT MAX(TRUNC(ABS(MONTHS_BETWEEN(SYSDATE, FECNA)/12),0)) "EDAD" FROM EMPLEADOS WHERE NUMDE=110;

-- 4.- Hallar la edad en años cumplidos y el nombre del empleado más viejo del departamento 110. 

SELECT NOMEM, TRUNC(ABS(MONTHS_BETWEEN(SYSDATE, FECNA)/12),0) "EDAD" FROM EMPLEADOS WHERE NUMDE=110 AND TRUNC(ABS(MONTHS_BETWEEN(SYSDATE, FECNA)/12)) = (SELECT TRUNC(MAX(ABS(MONTHS_BETWEEN(SYSDATE, FECNA)/12))) FROM EMPLEADOS WHERE NUMDE=110);

-- 5.- Hallar el número de empleados del departamento 112, cuántas comisiones distintas hay en ese departamento y la suma de las comisiones.

SELECT COUNT(NUMEM), COUNT(DISTINCT COMIS), SUM(COMIS) FROM EMPLEADOS WHERE NUMDE=112 GROUP BY NUMDE;

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

-- PRACTICA 13
-- 1.- Hallar el número de empleados que usan la misma extensión telefónica. Solamente se desea mostrar aquellos grupos que tienen más de 1 empleado.

SELECT EXTEL, COUNT(NUMEM) FROM EMPLEADOS GROUP BY EXTEL HAVING COUNT(NUMEM) > 1;

-- 2.- Para cada centro, hallar los presupuestos medios de los departamentos.

SELECT NUMCE, AVG(PRESU) || 'k' FROM DEPARTAMENTOS GROUP BY NUMCE;

-- 3.- Para cada centro, hallar los presupuestos medios de los departamentos clasificados según estén dirigidos en propiedad o en funciones.

SELECT NUMCE, TIDIR, AVG(PRESU) FROM DEPARTAMENTOS GROUP BY NUMCE, TIDIR;

-- 4.- Para los departamentos cuyo salario medio supera al de la empresa, hallar cuántas extensiones telefónicas tienen.

SELECT NUMDE, COUNT(EXTEL) FROM EMPLEADOS GROUP BY NUMDE HAVING AVG(SALAR) > (SELECT AVG(SALAR) FROM EMPLEADOS);

-- 5.- Hallar el máximo valor de la suma de los salarios de los departamentos.

SELECT MAX(SUM(SALAR)) FROM EMPLEADOS GROUP BY NUMDE;
