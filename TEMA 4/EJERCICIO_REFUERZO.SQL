-- Nombre y apellidos (en un solo campo llamado "nombre"), fecha de contratación (formato Año-mes-dia hora:minuto:) y salario con comisión (ojo, viene expresada en porcentaje) de los empleados que llevan al menos 12 años en la empresa.

SELECT FIRST_NAME || ' ' || LAST_NAME AS "Nombre", TO_CHAR(HIRE_DATE,'YYYY-MM-DD HH24:MI') "Fecha contratación", SALARY*(1+NVL(COMMISSION_PCT,0))
  FROM EMPLOYEES
  WHERE TRUNC(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)/12,0) > 12;

-- ID, código postal y ciudad de las localizaciones cuyo código postal tiene 5 caracteres y el último es un 9, ordenados por código postal descendiente.

SELECT LOCATION_ID, POSTAL_CODE, CITY
  FROM LOCATIONS
  WHERE POSTAL_CODE LIKE '____9' ORDER BY POSTAL_CODE DESC;

-- Para cada localización y departamento: ciudad, dirección de la calle con código postal entre paréntesis, nombre del departamento, número total de empleados y salario medio (redondeado sin decimales, y representado con 5 cifras), ordenados por número total de empleados descendente.

SELECT L.CITY, L.STREET_ADDRESS || ' ' || '(' || L.POSTAL_CODE || ')', D.DEPARTMENT_NAME, COUNT(EMPLOYEE_ID), LPAD(TRUNC(AVG(E.SALARY),0), 5, '0')
  FROM LOCATIONS L
  JOIN DEPARTMENTS D ON L.LOCATION_ID = D.LOCATION_ID JOIN EMPLOYEES E ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
  GROUP BY L.CITY, L.STREET_ADDRESS, L.POSTAL_CODE, D.DEPARTMENT_NAME
  ORDER BY 4 DESC;

-- Ciudad, nombre de departamento y salario máximo de los empleados en aquellos casos en los que el salario máximo sea menor a 10.000.

SELECT L.CITY, D.DEPARTMENT_NAME, MAX(E.SALARY)
  FROM LOCATIONS L
  JOIN DEPARTMENTS D ON L.LOCATION_ID = D.LOCATION_ID JOIN EMPLOYEES E ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
  GROUP BY L.CITY, D.DEPARTMENT_NAME
  HAVING MAX(SALARY) < 10000;

-- Para todos empleados cuyo puesto de trabajo contiene la palabra "Manager": nombre, apellido, nombre del puesto, email, número de teléfono, dirección con código postal entre paréntesis, ciudad y país.

SELECT E.FIRST_NAME || ' ' || E.LAST_NAME AS "Nombre", J.JOB_TITLE, E.EMAIL, E.PHONE_NUMBER, L.STREET_ADDRESS || ' ' || '(' || L.POSTAL_CODE || ')', L.CITY, C.COUNTRY_NAME
  FROM LOCATIONS L
  JOIN DEPARTMENTS D ON L.LOCATION_ID = D.LOCATION_ID JOIN EMPLOYEES E ON E.DEPARTMENT_ID = D.DEPARTMENT_ID JOIN JOBS J ON J.JOB_ID = E.JOB_ID JOIN COUNTRIES C ON L.COUNTRY_ID = C.COUNTRY_ID
  WHERE JOB_TITLE LIKE '%Manager%';

-- Para todos los departamentos, id, nombre, nombre de la ciudad donde está y salario del jefe (en caso de que tenga jefe, en caso contrario muestra 0). Resultados ordenados por ciudad y nombre de departamento.

SELECT DISTINCT D.DEPARTMENT_ID, D.DEPARTMENT_NAME, L.CITY, NVL(J.SALARY,0)
  FROM LOCATIONS L
  JOIN DEPARTMENTS D ON L.LOCATION_ID = D.LOCATION_ID LEFT JOIN EMPLOYEES E ON E.DEPARTMENT_ID = D.DEPARTMENT_ID LEFT JOIN EMPLOYEES J ON J.EMPLOYEE_ID = E.MANAGER_ID
  ORDER BY 3, 2;

-- Nombre, apellidos y salario del empleado del departamento 100 que menos cobra.

SELECT FIRST_NAME || ' ' || LAST_NAME AS "Nombre", MIN(SALARY)
  FROM EMPLOYEES
  WHERE SALARY = (SELECT MIN(SALARY) FROM EMPLOYEES WHERE DEPARTMENT_ID = 100)
  GROUP BY FIRST_NAME, LAST_NAME;

-- Nombre, apellidos y fecha de contratación de todos los empleados contratados después del empleado cuyo nombre es "Jose Manuel" y su apellido "Urman"

SELECT FIRST_NAME || ' ' || LAST_NAME AS "Nombre", TO_CHAR(HIRE_DATE,'YYYY-MM-DD HH24:MI') "Fecha contratación"
  FROM EMPLOYEES
  WHERE HIRE_DATE > (SELECT HIRE_DATE FROM EMPLOYEES WHERE FIRST_NAME LIKE 'Jose Manuel' AND LAST_NAME LIKE 'Urman')
  ORDER BY 2;
