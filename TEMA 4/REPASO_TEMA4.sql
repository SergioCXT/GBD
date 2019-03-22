-- REPASO
-- El esquema HR contiene la información de recursos humanos (Human Resources) de una empresa. Se pide elaborar las siguientes consultas:
-- 1. Selecciona el nombre y apellidos del empleado, número de departamento y el nombre del puesto de trabajo que desempeña de los departamentos 20, 30 y 60.

SELECT E.FIRST_NAME, E.LAST_NAME, E.DEPARTMENT_ID, J.JOB_TITLE FROM EMPLOYEES E JOIN JOBS J ON E.JOB_ID = J.JOB_ID WHERE E.DEPARTMENT_ID IN (20,30,60);

-- 2. Selecciona el nombre y apellidos del empleado y el nombre y apellidos de su jefe de los empleados cuya ID está entre 100 y 120.

SELECT E.FIRST_NAME, E.LAST_NAME, J.FIRST_NAME, J.LAST_NAME FROM EMPLOYEES E JOIN EMPLOYEES J ON E.MANAGER_ID = J. WHERE J.EMPLOYEE_ID BETWEEN 100 AND 120;

-- 3. Selecciona el nº de departamento, el nombre, el nombre y apellidos del jefe (si es que tiene jefe) y el nombre de la ciudad en la que está situado.

SELECT E.DEPARTMENT_ID, E.FIRST_NAME, J.FIRST_NAME, J.LAST_NAME, L.CITY FROM EMPLOYEES E LEFT JOIN EMPLOYEES J ON J.EMPLOYEE_ID = E.MANAGER_ID JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID ;

-- 4. Selecciona del departamento su nombre y los nombres de la ciudad, el país y la región en la que está situado.

SELECT D.DEPARTMENT_NAME, L.CITY, C.COUNTRY_NAME, R.REGION_NAME FROM DEPARTMENTS D JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID JOIN COUNTRIES C ON L.COUNTRY_ID = C.COUNTRY_ID JOIN REGIONS R ON C.REGION_ID = R.REGION_ID;

-- 5. Selecciona el nombre del departamento y cuál es el salario medio de sus empleados.

SELECT D.DEPARTMENT_NAME, TRUNC(AVG(E.SALARY),2) FROM DEPARTMENTS D JOIN EMPLOYEES E ON D.DEPARTMENT_ID = E.DEPARTMENT_ID GROUP BY D.DEPARTMENT_NAME;

-- 6. Selecciona el nombre del puesto de trabajo y cuantos empleados de ese tipo hay.

SELECT J.JOB_TITLE, COUNT(E.EMPLOYEE_ID) FROM JOBS J JOIN EMPLOYEES E ON J.JOB_ID = E.JOB_ID GROUP BY JOB_TITLE;

-- 7. Selecciona el email del empleado y su salario de aquellos empleados que tienen el puesto de trabajo con el sueldo máximo más bajo.

SELECT E.EMAIL, E.SALARY FROM EMPLOYEES E JOIN JOBS J ON J.JOB_ID = E.JOB_ID WHERE J.MAX_SALARY = (SELECT MIN(MAX_SALARY) FROM JOBS);
