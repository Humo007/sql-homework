---27 exercises -JOINS on HR Database

--Task 1 
SELECT E.first_name, E.last_name,
       D.department_id 'Department number', 
	   D.department_name 'Department name'
FROM HR.Departments AS D
INNER JOIN HR.Employees AS E
ON D.department_id = E.department_id;

--Task 2
SELECT E.first_name, E.last_name, 
	   D.department_name 'Department name',
	   L.city, L.state_province 'State province'
FROM HR.Departments AS D
INNER JOIN HR.Employees AS E
ON D.department_id = E.department_id
JOIN HR.Locations AS L
ON L.location_id = D.location_id;

--Task 3 
SELECT E.first_name, E.last_name, E.salary,
       JG.grade_level
FROM  HR.Employees AS E
LEFT JOIN HR.Job_Grades AS JG
ON E.salary BETWEEN JG.lowest_sal AND JG.highest_sal;

--Task 4
SELECT E.first_name, E.last_name,
       D.department_id 'Department number', 
	   D.department_name 'Department name'
FROM HR.Departments AS D
JOIN HR.Employees AS E
ON D.department_id = E.department_id
WHERE E.department_id  IN(80, 40)
ORDER BY E.last_name;

--Task 5
SELECT E.first_name, E.last_name, 
	   D.department_name 'Department name',
	   L.city, L.state_province 'State province'
FROM HR.Departments AS D
INNER JOIN HR.Employees AS E
ON D.department_id = E.department_id
JOIN HR.Locations AS L
ON L.location_id = D.location_id
WHERE E.first_name LIKE '%Z%';

--Task 6
SELECT E.first_name, E.last_name,
       D.department_id 'Department number', 
	   D.department_name 'Department name'
FROM HR.Departments AS D
RIGHT JOIN HR.Employees AS E
ON D.department_id = E.department_id;

--Task 7
SELECT E.first_name, E.last_name, E.salary
FROM HR.Employees AS E
JOIN HR.Employees AS S
ON E.salary < S.salary
WHERE S.employee_id = 182;

--Task 8
SELECT E.first_name 'Employee name', M.first_name 'Meneger name'
FROM HR.Employees AS E
JOIN HR.Employees AS M
ON E.manager_id = M.employee_id;

--Task 9
SELECT D.department_name 'Department name',
       L.city, L.state_province 'State province'
FROM HR.Departments AS D
JOIN HR.Locations AS L
ON D.location_id = L.location_id;

--Task 10
SELECT E.first_name, E.last_name,
       D.department_id 'Department number', 
	   D.department_name 'Department name'
FROM HR.Departments AS D
RIGHT JOIN HR.Employees AS E
ON D.department_id = E.department_id; 

--Task 11
SELECT E.first_name 'Employee name', 
       M.first_name 'Meneger name'
FROM HR.Employees E
LEFT JOIN HR.Employees M
ON E.manager_id = M.employee_id;

--Task 12
SELECT E.first_name, E.last_name, D.department_id
FROM HR.Employees E
RIGHT JOIN HR.Employees D
ON E.department_id = D.department_id
WHERE D.last_name = 'Taylor';

--Task 13
SELECT J.job_title, 
       D.department_name, 
	   E.first_name +' '+ E.last_name AS 'Employee name', 
	   H.start_date
FROM HR.Job_History AS H
JOIN jobs AS J
ON H.job_id = J.job_id
JOIN departments AS D
ON H.department_id = D.department_id
JOIN employees AS E
ON E.employee_id = H.employee_id
WHERE H.start_date >= '1993-01-01' AND H.start_date <= '1997-08-31';

--Task 14
SELECT J.job_title, 
       E.first_name +' '+ E.last_name AS 'Employee name',
	   J.max_salary - E.salary  AS 'Salary difference'
FROM HR.Employees AS E
JOIN HR.Jobs AS J
ON E.job_id = J.job_id;

--Task 15
SELECT D.department_name, AVG(E.salary) AS Avg_salary, COUNT(E.commission_pct) AS COUNT
FROM HR.Employees AS E
JOIN HR.Departments D
ON E.department_id = D.department_id
GROUP BY D.department_name;

-- Task 16
SELECT J.job_title, 
       E.first_name +' '+ E.last_name AS 'Employee name',
	   J.max_salary - E.salary  AS 'Salary difference'
FROM HR.Employees AS E
JOIN HR.Jobs AS J
ON E.job_id = J.job_id
WHERE E.department_id = 80;

--Task 17
SELECT C.country_name, L.city, D.department_name
FROM HR.Countries AS C
JOIN HR.Locations AS L
ON C.country_id = L.country_id
JOIN HR.Departments AS D
ON L.location_id = D.location_id;

--Task 18
SELECT D.department_name, E.first_name +' '+ E.last_name AS 'name_of_managar'
FROM HR.Departments AS D
JOIN HR.Employees AS E
ON D.manager_id  = E.employee_id;

--Task 19
SELECT J.job_title, AVG(E.salary) AS  AVG_SALARY
FROM HR.Employees AS E
JOIN HR.Jobs AS J
ON E.job_id = J.job_id
GROUP BY J.job_title;

--Task 20
SELECT H.*
FROM HR.Employees AS E
JOIN HR.Job_History AS H
ON E.employee_id = H.employee_id
WHERE E.salary >= 12000;

--Task 21
SELECT C.country_name, L.city, COUNT(D.department_id) AS COUNT
FROM HR.Countries AS C
JOIN HR.Locations AS L
ON C.country_id = L.country_id
JOIN HR.Departments AS D
ON L.location_id = D.location_id
WHERE D.department_id IN 
                      (SELECT department_id 
					  FROM HR.Employees 
					  GROUP BY department_id 
					  HAVING COUNT(department_id) >= 2)
GROUP BY C.country_name, L.city;

--Task 22
SELECT D.department_name, E.first_name +' '+ E.last_name AS 'name_of_managar', L.city
FROM HR.Employees AS E
JOIN HR.Departments AS D
ON D.manager_id  = E.employee_id
JOIN HR.Locations AS L
ON D.location_id = L.location_id;

--Taask 23
SELECT H.employee_id, J.job_title, DATEDIFF(DAY,H.start_date, H.end_date) AS DAYS
FROM HR.Jobs AS J
JOIN HR.Job_History AS H
ON J.job_id = H.job_id
WHERE H.department_id = 80;

--Task 24
SELECT E.first_name +' '+ E.last_name AS 'employee_name', E.salary, 
FROM  employees AS E
JOIN departments AS D
ON D.department_id  = E.department_id
JOIN locations AS L
ON D.location_id = L.location_id
WHERE L.city = 'London';

--Task 25
SELECT E.first_name +' '+ E.last_name AS 'employee_name', 
       J.job_title, 
	   H.start_date, h.end_date, h.employee_id
FROM HR.Employees AS E
JOIN HR.Job_History AS H
ON E.employee_id = H.employee_id
JOIN HR.Jobs AS J 
ON H.job_id = J.job_id
WHERE EXISTS 
     (SELECT 1
	 FROM HR.Job_History AS H2
	 GROUP BY H2.employee_id
	 HAVING MAX(H2.start_date) = H.start_date
	 AND MAX(H2.end_date) = H.end_date)
AND E.commission_pct = 0;

--Task 26
SELECT D.department_name, E.*
FROM HR.Departments AS D
JOIN (SELECT COUNT(employee_id) AS no_of_employees, department_id 
      FROM HR.Employees
	  GROUP BY department_id) AS E
ON D.department_id = E.department_id;

--Task 27
SELECT E.first_name +' '+ E.last_name AS 'employee_name', E.employee_id, C.country_name
FROM HR.Employees AS E
JOIN HR.Departments AS D
ON E.department_id = D.department_id
JOIN HR.Locations AS L
ON D.location_id = L.location_id
JOIN HR.Countries AS C
ON L.country_id = C.country_id;

