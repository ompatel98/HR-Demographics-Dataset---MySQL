-- QUESTION 1

CREATE DATABASE EMPLOYEE;

USE EMPLOYEE;

SELECT FIRST_NAME, LAST_NAME, DEPARTMENT_ID, SALARY
FROM EMPLOYEE.Employee_HR_Data
WHERE 1=1
AND salary > 9000

-- QUESTION 2

SELECT employee_id, first_name, last_name, email, phone_number, hire_date, job_id, 
salary,commission_pct, manager_id, department_id
FROM EMPLOYEE.Employee_HR_Data
WHERE 1 = 1
AND department_id = 0

-- QUESTION 3

SELECT CONCAT(first_name, last_name) as Full_Name, first_name, last_name, hire_date, salary, department_id
FROM EMPLOYEE.Employee_HR_Data
WHERE 1 = 1
AND first_name NOT LIKE '%T%'
ORDER BY department_id ASC

-- QUESTION 4

SELECT employee_id, first_name, last_name, salary, commission_pct
FROM EMPLOYEE.Employee_HR_Data
WHERE 1 = 1
AND salary BETWEEN 9000 and 12000
AND commission_pct > 0

-- QUESTION 5

SELECT employee_id, first_name, last_name, salary, commission_pct
FROM EMPLOYEE.Employee_HR_Data
WHERE 1 = 1
AND commission_pct = 0

-- QUESTION 6
SELECT employee_id, first_name, last_name, salary, manager_id
FROM EMPLOYEE.Employee_HR_Data
WHERE 1 = 1
AND manager_id != 0
-- (! = exclamation mark for NOT EQUAL TO)
-- (YOU CAN ALSO USE <> SIGN AS NOT EQUAL TO)

-- QUESTION 7

SELECT employee_id, first_name, last_name, email, phone_number, hire_date, job_id,
salary, commission_pct, manager_id, department_id
FROM EMPLOYEE.Employee_HR_Data
WHERE 1 = 1
AND first_name LIKE '%F%' OR first_name LIKE '%T%' OR first_name LIKE '%M%'
ORDER BY salary Desc

-- QUESTION 8

SELECT first_name, last_name, email, phone_number, hire_date, salary, commission_pct
FROM EMPLOYEE.Employee_HR_Data
WHERE
salary > 12000
OR phone_number LIKE '________3%'
ORDER BY first_name DESC

-- QUESTION 9

SELECT first_name, last_name, department_id
FROM EMPLOYEE.Employee_HR_Data
WHERE trim(first_name) LIKE '__S%'

-- QUESTION 10

SELECT employee_id, count(*) as employee_count
FROM Job_History_Hr_Data
GROUP BY employee_id
HAVING COUNT(*) > 1


-- QUESTION 11

SELECT job_id, count(*) AS count, sum(salary) AS sum_salary, MAX(salary) - MIN(salary) AS salary_diff
FROM EMPLOYEE.Employee_HR_Data
GROUP BY job_id;

-- QUESTION 12

SELECT job_id
FROM Job_History_Hr_Data
WHERE END_DATE - START_DATE > 300
GROUP BY job_id
HAVING (SELECT COUNT(*) FROM Job_History_Hr_Data ) > 1;

-- QUESTION 13

SELECT manager_id, count(*) as count
FROM EMPLOYEE.Employee_HR_Data
WHERE manager_id != 0
GROUP BY manager_id

-- QUESTION 14

SELECT department_id, AVG(salary)
FROM EMPLOYEE.Employee_HR_Data
WHERE commission_pct > 0.0 
GROUP BY department_id

-- QUESTION 15

SELECT department_id
FROM EMPLOYEE.Employee_HR_Data
WHERE commission_pct IS NOT NULL
GROUP BY department_id
HAVING COUNT(commission_pct) > 10

-- QUESTION 16

SELECT job_title, max_salary, min_salary
FROM EMPLOYEE.Jobs_HR_Data
WHERE max_salary BETWEEN 10000 AND 15000

-- QUESTION 17

SELECT *
FROM EMPLOYEE.Jobs_HR_Data
WHERE min_salary > 9000

-- QUESTION 18
SELECT department_id
FROM EMPLOYEE.Employee_HR_Data
WHERE trim(first_name) = 'Clara'

SELECT first_name, last_name, hire_date
FROM EMPLOYEE.Employee_HR_Data
WHERE department_id IN (80)
AND trim(first_name) <> 'Clara'
            OR            
SELECT first_name, last_name, hire_date
FROM EMPLOYEE.Employee_HR_Data
WHERE department_id IN (SELECT department_id
FROM EMPLOYEE.Employee_HR_Data
WHERE trim(first_name) = 'Clara')
AND trim(first_name) <> 'Clara'

-- QUESTION 19

SELECT AVG(salary)
FROM EMPLOYEE.Employee_HR_Data

SELECT DISTINCT (department_id)
FROM EMPLOYEE.Employee_HR_Data
WHERE trim(first_name) LIKE '%J%'

SELECT employee_id, first_name, salary, department_id
FROM EMPLOYEE.Employee_HR_Data
WHERE 1 = 1
AND SALARY >
(SELECT AVG(salary)
FROM EMPLOYEE.Employee_HR_Data)
AND department_id IN
(SELECT DISTINCT (department_id)
FROM EMPLOYEE.Employee_HR_Data
WHERE trim(first_name) LIKE '%J%')

-- QUESTION 20

SELECT employee_id, first_name, last_name, job_id,
CASE TRIM(job_id)
WHEN 'ST_MAN' THEN 'SALESMAN'
WHEN 'IT_PROG' THEN 'DEVELOPER'
ELSE job_id
END AS DESIGNATION,
SALARY
FROM EMPLOYEE.Employee_HR_Data
ORDER BY TRIM(job_id) ASC;

-- PART 2
-- QUESTION 1

SELECT A.first_name, A.last_name, B.department_name, C.city, C.state_province
FROM Employee_HR_Data A
JOIN Department_HR_Data B
ON A.department_id = B.department_id
JOIN location_HR_Data C
ON B.location_id = C.location_id

-- QUESTION 2

SELECT * FROM EMPLOYEE.Job_Grades_HR_Data
USE EMPLOYEE;

SELECT E.FIRST_NAME, E.LAST_NAME, E.SALARY, J.GRADE_LEVEL,
J.LOWEST_SAL, J.HIGHEST_SAL
FROM EMPLOYEE.EMPLOYEE_HR_DATA E
JOIN EMPLOYEE.JOB_GRADES_HR_DATA J 
ON E.SALARY BETWEEN J.LOWEST_SAL AND J.HIGHEST_SAL

-- QUESTION 3

SELECT * FROM EMPLOYEE.Employee_HR_Data
USE EMPLOYEE;

SELECT E.FIRST_NAME, E.LAST_NAME, E.DEPARTMENT_ID,
D.DEPARTMENT_NAME
FROM EMPLOYEE.EMPLOYEE_HR_DATA E
JOIN EMPLOYEE.DEPARTMENT_HR_DATA D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE D.DEPARTMENT_ID IN (80,40)

-- QUESTION 4

SELECT * FROM EMPLOYEE.LOCATION_HR_DATA
USE EMPLOYEE;

SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_ID,
L.CITY, L.STATE_PROVINCE
FROM EMPLOYEE.EMPLOYEE_HR_DATA E
JOIN Department_HR_Data D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
JOIN EMPLOYEE.LOCATION_HR_DATA L
ON D.LOCATION_ID = L.LOCATION_ID
WHERE trim(first_name) LIKE '%Z%'

-- QUESTION 5

-- SELECT * FROM EMPLOYEE.LOCATION_HR_DATA
USE EMPLOYEE;

SELECT CONCAT(A.FIRST_NAME, A.LAST_NAME) AS EMPLOYEE_NAME
,B.DEPARTMENT_NAME
,C.START_DATE
,D.JOB_TITLE
FROM EMPLOYEE.EMPLOYEE_HR_DATA A
JOIN EMPLOYEE.DEPARTMENT_HR_DATA B
ON A.DEPARTMENT_ID = B.DEPARTMENT_ID
JOIN JOB_HISTORY_HR_DATA C
ON B.DEPARTMENT_ID = C.DEPARTMENT_ID
JOIN JOBS_HR_DATA D
ON C.JOB_ID = D.JOB_ID
WHERE C.START_DATE >= '1993-01-01' AND C.END_DATE <= '1997-08-31';



-- AND JH.START_DATE >= '1993-01-01'
-- AND JH.END_DATE <= '1997-08-31'
-- JOIN EMPLOYEE_JOBS_HR_DATA J
-- ON JH.JOB_ID = J.JOB_ID
-- JOIN EMPLOYEE.DEPARTMENT_HR_DATA D
-- ON JH.DEPARTMENT_ID = D.DEPARTMENT_ID;

-- QUESTION 6
-- SELECT * FROM JOBS_HR_DATA
-- SELECT * FROM EMPLOYEE_HR_DATA
SELECT CONCAT(A.FIRST_NAME, A.LAST_NAME) AS EMPLOYEE_NAME, A.SALARY,
(B.MAX_SALARY - A.SALARY ) AS SALARY_DIFFERENCE
FROM EMPLOYEE.EMPLOYEE_HR_DATA A
JOIN JOBS_HR_DATA B
ON TRIM(A.JOB_ID) = TRIM(B.JOB_ID)

-- QUESTION 7

-- SELECT * FROM EMPLOYEE_HR_DATA
-- SELECT * FROM DEPARTMENT_HR_DATA
USE EMPLOYEE;
SELECT A.DEPARTMENT_NAME, CONCAT(B.FIRST_NAME, B.LAST_NAME) AS MANAGER_NAME
FROM employee.department_hr_data A
JOIN employee.employee_hr_data B
ON A.MANAGER_ID = B.EMPLOYEE_ID

-- QUESTION 8

SELECT A.DEPARTMENT_NAME, B.FIRST_NAME, B.LAST_NAME, C.CITY
FROM DEPARTMENT_HR_DATA A
JOIN EMPLOYEE_HR_DATA B
ON A.MANAGER_ID = B.EMPLOYEE_ID
JOIN LOCATION_HR_DATA C
ON A.LOCATION_ID = C.LOCATION_ID

-- QUESTION 9

SELECT A.EMPLOYEE_ID, A.FIRST_NAME, A.LAST_NAME, D.COUNTRY_NAME
FROM EMPLOYEE_HR_DATA A
JOIN DEPARTMENT_HR_DATA B
ON A.DEPARTMENT_ID = B.DEPARTMENT_ID
JOIN LOCATION_HR_DATA C
ON B.LOCATION_ID = C.LOCATION_ID
JOIN COUNTRIES_HR_DATA D
ON C.COUNTRY_ID = D.COUNTRY_ID
