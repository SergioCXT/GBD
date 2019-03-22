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

-- 2.- Obtener por orden alfabético los nombres y salarios de los empleados con comisión, cuyo salario multiplicado por su número de hijos cumpla una, o ambas, de las dos condiciones siguientes:
-- • Que sea inferior de 720 €
-- • Que sea superior a 50 veces su comisión.

SELECT NOMEM, SALAR FROM EMPLEADOS WHERE COMIS IS NOT NULL AND SALAR < 720*NUMHI OR SALAR > COMIS*50*NUMHI ORDER BY NOMEM ASC;

-- PRACTICA 6
-- 1.- Obtener por orden alfa el nombre y el salario de aquellos empleados que comienzan por la letra 'A' y muestra la consulta como aparece en la captura.

SELECT NOMEM, SALAR FROM EMPLEADOS WHERE NOMEM LIKE 'A%' ORDER BY NOMEM ASC;

-- 2.- Obtener por orden alfabético los nombres de los empleados que tengan 8 letras.

SELECT NOMEM FROM EMPLEADOS WHERE NOMEM LIKE '________' ORDER BY NOMEM ASC;

-- 3.- Obtener por orden alfabético los nombres y el presupuesto de los departamentos que incluyen la palabra “SECTOR”. La consulta la deberás mostrar como la imagen.

SELECT NUMDE, PRESU FROM DEPARTAMENTOS WHERE NUMDE LIKE '%SECTOR%' ORDER BY NUMDE ASC;

-- PRACTICA 7
-- 1.- Obtener por orden alfabético los nombres de los empleados cuya extensión telefónica es 250 o 750.

SELECT NOMEM FROM EMPLEADOS WHERE EXTEL= 250 OR EXTEL= 750 ORDER BY NUMEM ASC;

-- 2.- Obtener por orden alfabético los nombres de los empleados que trabajan en el mismo departamento que PILAR o DOROTEA.

SELECT NOMEM FROM EMPLEADOS WHERE NUMDE = ANY(SELECT NUMDE FROM EMPLEADOS WHERE NOMEM IN ('PILAR', 'DOROTEA')) ORDER BY NUMEM ASC;

-- 3.- Obtener por orden alfabético los nombres de los departamentos cuyo director es el mismo que el del departamento: DIRECC.COMERCIAL o el del departamento: PERSONAL Mostrar la consulta como imagen

SELECT NOMDE FROM DEPARTAMENTOS WHERE DIREC = ANY(SELECT DIREC FROM DEPARTAMENTOS WHERE NOMDE IN ('DIRECC.COMERCIAL', 'PERSONAL')) ORDER BY NOMDE ASC;

-- PRACTICA 10
-- 1.- Obtener por orden alfabético, los nombres y fechas de nacimiento de los empleados que cumplen años en el mes de noviembre.

SELECT NOMEM, FECNA FROM EMPLEADOS WHERE EXTRACT(MONTH FROM FECNA) = 11;

-- 2.- Obtener los nombres de los empleados que cumplen años en el día de hoy. NOTA: El resultado dependerá de la fecha en la que realizamos la consulta.

SELECT NOMEM FROM EMPLEADOS WHERE TO_CHAR(FECNA, 'DD/MM') = TO_CHAR(SYSDATE, 'DD/MM');

-- 3.- Obtener los nombres y fecha exacta de nacimiento de los empleados cuya fecha de nacimiento es anterior al año 1950.

SELECT NOMEM, FECNA FROM EMPLEADOS WHERE TO_CHAR(FECNA, 'YYYY') < 1950;

-- 4.- Obtener los nombres y fecha exacta de incorporación de los empleados cuya fecha de incorporación a la empresa es anterior al año 1970.

SELECT NOMEM, FECIN FROM EMPLEADOS WHERE TO_CHAR(FECIN, 'YYYY') < 1970;

-- 5.- Obtener los nombres, fecha de nacimiento y fecha de incorporación de los empleados cuya edad a la fecha de incorporación era inferior a 30 años.

SELECT NOMEM, FECNA, FECIN FROM EMPLEADOS WHERE TO_CHAR(FECIN, 'YYYY')-TO_CHAR(FECNA, 'YYYY') < 30;

-- 6.- Obtener los empleados cuyo nacimiento fue en Lunes.

SELECT NOMEM, TO_CHAR(FECNA, 'DAY') FROM EMPLEADOS WHERE TO_CHAR(FECNA, 'D') = '1';

-- 7.- Obtener los empleados cuyo día de la semana para el nacimiento y la incorporación fue Viernes.

SELECT NOMEM, TO_CHAR(FECIN, 'DAY') FROM EMPLEADOS WHERE TO_CHAR(FECIN, 'D') = '5' AND TO_CHAR(FECNA, 'D') = '5';

-- 8.- Obtener los empleados cuyo día de la semana para el nacimiento y la incorporación coinciden. Es decir nacieron y se incorporaron un Lunes, o nacieron y se incorporaron un Martes, etc

SELECT NOMEM, TO_CHAR(FECIN, 'DAY') FROM EMPLEADOS WHERE TO_CHAR(FECIN, 'D') = TO_CHAR(FECNA, 'D');

-- 9.- Obtener los empleados y su mes de incorporación siempre que esté entre los meses de Enero y Junio (ambos inclusive).

SELECT NOMEM, TO_CHAR(FECIN, 'MONTH') FROM EMPLEADOS WHERE EXTRACT(MONTH FROM FECIN) BETWEEN 1 AND 6;

-- 10.- Obtener los empleados y su mes de incorporación siempre que esté entre los meses de Enero y Junio (ambos inclusive) y el mes de nacimiento coincida en dicho mes.

SELECT NOMEM, TO_CHAR(FECIN, 'MONTH') FROM EMPLEADOS WHERE EXTRACT(MONTH FROM FECIN) BETWEEN 1 AND 6 AND EXTRACT(MONTH FROM FECIN) = EXTRACT(MONTH FROM FECNA);
