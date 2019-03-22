-- PRÁCTICA 2

-- 1.- Hallar, por orden alfabético, los nombres de los departamentos cuyo director lo es en funciones y no en propiedad.

SELECT NOMDE FROM DEPARTAMENTOS WHERE TIDIR='F' ORDER BY NOMDE ASC;

-- 2.- Obtener un listín telefónico de los empleados del departamento 121 incluyendo nombre de empleado, número de empleado y extensión telefónica. Por orden alfabético.

SELECT NOMEM, NUMEM, EXTEL FROM EMPLEADOS WHERE NUMDE=121 ORDER BY NOMEM ASC;

-- 3.- Obtener por orden creciente una relación de todos los números de extensiones telefónicas de los empleados, junto con el nombre de estos, para aquellos que trabajen en el departamento 110. Mostrar la consulta tal y como aparece en la imagen.

SELECT NOMEM AS "Nombre", EXTEL AS "Extensión Telefónica" FROM EMPLEADOS WHERE NUMDE=110ORDER BY EXTEL ASC;

-- 4.- Hallar la comisión, nombre y salario de los empleados que tienen tres hijos, clasificados por comisión, y dentro de comisión por orden alfabético.

SELECT COMIS, NOMEM, SALAR FROM EMPLEADOS WHERE NUMHI=3 ORDER BY COMIS ASC;

-- 5.- Hallar la comisión, nombre y salario de los empleados que tienen tres hijos, clasificados por comisión, y dentro de comisión por orden alfabético, para aquellos empleados que tienen comisión.

SELECT COMIS, NOMEM, SALAR FROM EMPLEADOS WHERE NUMHI=3 AND COMIS IS NOT NULL ORDER BY COMIS ASC;

-- 6.- Obtener salario y nombre de los empleados sin hijos y cuyo salario es mayor que 1200 y menor que 1500 €. Se obtendrán por orden decreciente de salario y por orden alfabético dentro de salario.

SELECT SALAR, NOMEM FROM EMPLEADOS WHERE NUMHI=0 AND SALAR BETWEEN 1201 AND 1499 ORDER BY SALAR DESC, NOMEM ASC;

-- 7.- Obtener los números de los departamentos donde trabajan empleados cuyo salario seainferior a 1500 €.

SELECT DISTINCT NUMDE FROM EMPLEADOS WHERE SALAR<1500;

-- 8.- Obtener las distintas comisiones que hay en el departamento 110.

SELECT DISTINCT COMIS FROM EMPLEADOS WHERE NUMDE=110;

-- PRÁCTICA 3

-- 1.- Obtener una relación por orden alfabético de los departamentos cuyo presupuesto es inferior a 30.000 € El nombre de los departamentos vendrá precedido de las palabras 'DEPARTAMENTO DE '. Nota: El presupuesto de los departamentos viene expresado en miles de €.

SELECT  'DEPARTAMENTO DE ' || NOMDE AS "NOMBRE" FROM DEPARTAMENTOS WHERE PRESU < 30 ORDER BY NOMDE ASC;

-- 2.- Muestra el número y el nombre de cada departamento separados por un guión y en un mismo campo llamado “Número-Nombre”, además del tipo de director mostrado como “Tipo de Director”, para aquellos departamentos con presupuesto inferior a 30.000 €.

SELECT NUMDE ||'-'|| NOMDE AS "Número-nombre", tidir AS "Tipo de Director" FROM DEPARTAMENTOS WHERE PRESU < 30; 

-- 3.- Suponiendo que en los próximos dos años el coste de vida va a aumentar un 8% anual y que se suben los salarios solo un 2% anual, hallar para los empleados con más de 4 hijos su nombre y su sueldo anual, actual y para cada uno de los próximos dos años, clasificados por orden alfabético. Muestra la consulta tal y como aparece en la captura.

SELECT NOMEM "Nombre", 12*SALAR AS "Salario 2014", 12*1.02*SALAR AS "Salario 2015", 12*1.02*1.02*SALAR AS "Salario 2016" FROM EMPLEADOS WHERE NUMHI > 4 ORDER BY NOMEM ASC; 

-- 4.- Hallar, por orden alfabético, los nombres de los empleados tales que si se les da una gratificación de 120 € por hijo, el total de esta gratificación supera el 20% de su salario.

SELECT nomem FROM EMPLEADOS WHERE 120*numhi > 0.2*salar ORDER BY NOMEM ASC; 

-- 5.- Para los empleados del departamento 112 hallar el nombre y el salario total (salario más comisión), por orden de salario total decreciente, y por orden alfabético dentro de salario total.

SELECT NOMEM AS "NOMBRE", SALAR+COMIS AS "SALARIO TOTAL" FROM EMPLEADOS WHERE NUMDE = 112 ORDER BY SALAR+COMIS DESC, NOMEM ASC; 

-- 6.- Vemos que para Micaela no se muestra nada en Salario Total, esto es debido a que su comisión es Nula (Lo que no significa que sea 0--> significa que no se ha introducido ningún valor). Esto impide hacer el cálculo de la suma. Muestra entonces la misma consulta anterior pero sólo para aquellos empleados cuya comisión no sea nula.

SELECT NOMEM AS "NOMBRE", SALAR+COMIS AS "SALARIO TOTAL" FROM EMPLEADOS WHERE NUMDE = 112 AND COMIS IS NOT NULL ORDER BY SALAR+COMIS DESC, NOMEM ASC;

-- 7.- Repite la consulta anterior para mostrarla como sigue:

SELECT NOMEM AS "NOMBRE", SALAR+COMIS || ' €' AS "SALARIO TOTAL" FROM EMPLEADOS WHERE NUMDE = 112 AND COMIS IS NOT NULL ORDER BY SALAR+COMIS DESC, NOMEM ASC; 

-- 8.- En una campaña de ayuda familiar se ha decidido dar a los empleados una paga extra de 60 € por hijo, a partir del cuarto inclusive. Obtener por orden alfabético para estos empleados: nombre y salario total que van a cobrar incluyendo esta paga extra. Mostrarlo como en la imagen.

SELECT NOMEM AS "NOMBRE", SALAR+60*(NUMHI-3) || ' €' AS "SALARIO TOTAL" FROM EMPLEADOS WHERE NUMHI >= 4 ORDER BY NOMEM ASC; 

-- 9.- Introducción a SELECT subordinado. Imaginemos la misma consulta anterior, pero en la que se nos pide mostrar los mismos campos pero para aquellos empleados cuyo número de hijos iguale o supere a los de Juliana. Es decir, Juliana tiene 4 hijos pero no lo sabemos. Lo que sabemos es el nombre. En este caso haremos otro SELECT cuyo resultado de la búsqueda sea el número de hijos de Juliana.

SELECT NOMEM AS "NOMBRE", SALAR+60*(NUMHI-3) || ' €' AS "SALARIO TOTAL" FROM EMPLEADOS WHERE NUMHI >= (SELECT NUMHI FROM EMPLEADOS WHERE NOMEM='JULIANA') ORDER BY NOMEM ASC;

-- 10.- Obtener por orden alfabético los nombres de los empleados cuyos sueldos igualan o superan al de CLAUDIA en más del 15%.

SELECT NOMEM FROM EMPLEADOS WHERE SALAR >=(SELECT 1.15*SALAR FROM EMPLEADOS WHERE NOMEM='CLAUDIA') ORDER BY NOMEM ASC;

-- 11.- Obtener los nombres de los departamentos que no dependen funcionalmente de otro.

SELECT NOMDE FROM DEPARTAMENTOS WHERE DEPDE IS NULL;