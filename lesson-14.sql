CREATE TABLE Employeesss (
    employee_id int,
    first_name varchar(50),
    last_name varchar(50),
    department_id int,
    salary decimal(10, 2),
    hire_date date
)

INSERT INTO employeesss (employee_id, first_name, last_name, department_id, salary, hire_date)
VALUES
    (1, 'Alice', 'Johnson', 101, 75000.00, '2020-02-15'),
    (2, 'Bob', 'Smith', 102, 64000.00, '2019-07-22'),
    (3, 'Charlie', 'Brown', 103, 82000.00, '2021-03-18'),
    (4, 'Diana', 'Evans', 101, 92000.00, '2018-11-05'),
    (5, 'Eve', 'Campbell', 104, 56000.00, '2022-01-10'),
    (6, 'Frank', 'Harris', 102, 72000.00, '2020-05-29'),
    (7, 'Grace', 'Lee', 103, 81000.00, '2019-09-17'),
    (8, 'Henry', 'Green', 104, 59000.00, '2021-06-01'),
    (9, 'Isabella', 'Garcia', 101, 66000.00, '2020-12-08'),
    (10, 'Jack', 'White', 102, 87000.00, '2017-08-25'),
  (11, 'Joe', 'Smith', 101, 75000.00, '2017-08-25'),
  (12, 'Lily', 'Pete', 102, 72000.00, '2017-08-25')



SELECT E1.department_id,MAX(E1.salary) AS max_date_salary 
FROM Employeesss AS E1
GROUP BY E1.department_id

SELECT E2.department_id ,MIN(E2.salary) AS min_date_salary 
FROM Employeesss AS E2
GROUP BY E2.department_id

SELECT E1.department_id, 
       MAX(E1.hire_date) AS max_date, 
	   MIN(E2.hire_date) as min_date,
	   MAX(E1.salary) AS max_date_salary, 
       MIN(E2.salary) AS min_date_salary,
	   MAX(E1.salary) - MIN(E2.salary) AS differencew
FROM Employeesss AS E1
JOIN  Employeesss AS E2 ON E1.department_id =E2.department_id
GROUP BY E1.department_id



select 
    A.department_id,
    A.max_hire_date,
    A.min_hire_date,
     E1.salary as Max_hire_date_salary,
   E2.salary as Min_hire_date_salary,
   E2.salary - E1.salary as diffrence
   from (
select department_id,max(hire_date) as max_hire_date, min(hire_date) as min_hire_date from   Employeesss
group by department_id) as A
inner join Employeesss as E1 on E1.department_id = A.department_id and E1.hire_date = A.max_hire_date
inner join Employeesss as E2 on E2.department_id = A.department_id and E2.hire_date = A.min_hire_date




Create Table Match_Result (
Team_1 Varchar(20),
Team_2 Varchar(20),
Result Varchar(20)
)

Insert into Match_Result Values('India', 'Australia','India');
Insert into Match_Result Values('India', 'England','England');
Insert into Match_Result Values('SouthAfrica', 'India','India');
Insert into Match_Result Values('Australia', 'England',NULL);
Insert into Match_Result Values('England', 'SouthAfrica','SouthAfrica');
Insert into Match_Result Values('Australia', 'India','Australia');


SELECT * FROM Match_Result

;WITH CTE_matches AS (
         SELECT Team_1 FROM Match_Result
		 UNION ALL 
		 SELECT Team_2 FROM Match_Result),
CTE_wins AS (
         SELECT Team_1, COUNT(Result) AS TOTAL_WINS 
		 FROM Match_Result 
		 GROUP BY Team_1),
CTE_TIES AS (
         SELECT A.Team_1, COUNT(*) AS TOTAL_TIES 
		 FROM (
		       SELECT Team_1, Result 
			   FROM Match_Result
           UNION ALL
		       SELECT Team_2, Result
			   FROM Match_Result ) AS A
			   WHERE Result IS NULL
			   GROUP BY Team_1)
	     SELECT CTE_matches.Team_1,
		        COUNT(*) AS TOTAL_MACHES,
				CTE_wins.TOTAL_WINS,
				ISNULL(CTE_TIES.TOTAL_TIES, 0) AS TOTAL_TIES,
				COUNT(*) - CTE_wins.TOTAL_WINS - ISNULL(CTE_TIES.TOTAL_TIES, 0) AS TOTAL_LOST
				FROM CTE_matches
		 JOIN CTE_wins ON CTE_matches.Team_1 = CTE_wins.Team_1
		 LEFT JOIN CTE_TIES ON CTE_matches.Team_1 = CTE_TIES.Team_1
		 GROUP BY CTE_matches.Team_1, CTE_wins.TOTAL_WINS, CTE_TIES.TOTAL_TIES
-------------------------------------------------------------------------------------------------------------
		 --homework
		 DROP TABLE IF EXISTS patient_info;
CREATE TABLE patient_info (
  pat_fguid varchar(100) NOT NULL,
  pat_fname varchar(50) NOT NULL,
  pat_lname varchar(50) NOT NULL,
  pat_mname varchar(10) NOT NULL
);

INSERT INTO patient_info 
VALUES 
  ('1-1','Thomas','Cruise','Mapother'),
  ('1-2','Michael','Tyson','Gerard'),
  ('2-1','John','Cena','Felix');

DROP TABLE IF EXISTS virtual_folder;
CREATE TABLE virtual_folder (
  fld_guid varchar(100) NOT NULL,
  fld_owner varchar(100) NOT NULL,
  fld_parent_guid varchar(100) NOT NULL,
  fld_name varchar(255) NOT NULL
);

INSERT INTO virtual_folder 
VALUES 
  ('1-1','1','','Pat1(Tom Cruise)'),
  ('1-1-1','1','1-1','holiday'),
  ('1-1-2','1','1-1','movie_photos'),
  ('1-1-2-1','1','1-1-2','Jack Reacher'),
  ('1-1-2-2','1','1-1-2','Mission Impossible'),
  ('1-1-2-2-1','1','1-1-2-2','MI2'),
  ('1-1-2-2-2','1','1-1-2-2','Mission Impossible 1'),
  ('1-2','1','','Pat2(Mike Tyson)'),
  ('1-2-1','1','1-2','Boxing'),
  ('1-2-2','1','1-2','Daily'),
  ('1-2-2-1','1','1-2-2','Family'),
  ('1-2-2-2','1','1-2-2','Friends'),
  ('2-1','2','','Pat3(John Cena)');

SELECT * FROM patient_info 
SELECT * FROM virtual_folder


;WITH CTE AS( 
            SELECT V.fld_guid, V.fld_name, 
			CAST('/' + P.pat_fname + ','+ P.pat_lname + ','+ P.pat_mname+ '(' + P.pat_fguid + ')'  AS VARCHAR(MAX) ) AS FULL_PATH,
			V.fld_parent_guid
			FROM patient_info AS P
            JOIN virtual_folder AS V ON P.pat_fguid = V.fld_guid 
			
UNION ALL
            SELECT VF.fld_guid, VF.fld_name,
			CAST(CTE.FULL_PATH + '/' + VF.fld_name + '(' + VF.fld_guid + ')' AS VARCHAR(MAX)),
			VF.fld_parent_guid
            FROM  virtual_folder AS VF
            JOIN CTE  ON CTE.fld_guid = VF.fld_parent_guid)

SELECT fld_guid, fld_name, FULL_PATH FROM CTE 
ORDER BY fld_guid


