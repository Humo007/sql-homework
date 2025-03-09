 --Creating sample tables for demonstration
 CREATE TABLE Employeess 
                      ( EmployeeID INT PRIMARY KEY, 
					  EmployeeName VARCHAR(100), 
					  ManagerID INT NULL );

--Inserting 20 rows into Employees table 
INSERT INTO Employeess (EmployeeID, EmployeeName, ManagerID) 
VALUES (1, 'John Doe', NULL), 
(2, 'Jane Smith', 1), 
(3, 'Michael Brown', 1), 
(4, 'Emily Davis', 2), 
(5, 'Daniel Wilson', 2), 
(6, 'Olivia Taylor', 3), 
(7, 'Matthew Anderson', 3), 
(8, 'Sophia Thomas', 4), 
(9, 'David Jackson', 4), 
(10, 'Emma White', 5),
(11, 'James Harris', 5),
(12, 'Lucas Martin', 6),
(13, 'Ava Thompson', 6), 
(14, 'Alexander Garcia', 7),
(15, 'Mia Martinez', 7),
(16, 'Elijah Robinson', 8),
(17, 'Charlotte Clark', 8),
(18, 'Benjamin Lewis', 9), 
(19, 'Amelia Hall', 9), 
(20, 'William Allen', 10);

--Task 1: Use a Derived Table to Find Employees with Managers
--Write a query using a derived table to find employees along with their managers.
SELECT E.EmployeeID, E.EmployeeName, 
       ISNULL(M.ManagerName, 'NO MANAGER') AS ManagerName 
FROM Employeess AS E
LEFT JOIN (SELECT EmployeeID, EmployeeName AS ManagerName 
           FROM Employeess )AS M 
		   ON E.ManagerID = M.EmployeeID




--Task 2: Use a CTE to Find Employees with Managers
--Write a query using a CTE to find employees along with their managers.
;WITH ManagerCTE AS (
      SELECT EmployeeID, EmployeeName AS ManagerName, ManagerID 
	  FROM Employeess)
SELECT E.EmployeeID, E.EmployeeName, ISNULL(M.ManagerName, 'NO MANAGER') AS ManagerName
FROM Employeess AS E 
LEFT JOIN ManagerCTE AS M ON E.ManagerID = M.EmployeeID


--Task 3: Compare Results of Derived Table and CTE
--Compare and analyze the output of the above two queries.

--Both Derived Table and CTE (Common Table Expression) are used to create temporary datasets within SQL queries. 
--The key difference lies in how they are structured and executed:
--Derived Table - A subquery is used inside the FROM clause and is executed only once within the query.
--CTE - A temporary result set is defined first and can be referenced multiple times in the main query.

--Task 4: Find Direct Reports for a Given Manager Using CTE
--Write a CTE to find all direct reports of a given manager.
DECLARE @ManagerID int = 3
;WITH DirectReportsCte AS (
      SELECT EmployeeID, EmployeeName, ManagerID
	  FROM Employeess
	  WHERE ManagerID = @ManagerID)
SELECT E.EmployeeID, E.EmployeeName, D.EmployeeName AS Drector
FROM Employeess AS E
RIGHT JOIN DirectReportsCte AS D ON D.ManagerID = E.EmployeeID

--Task 5: Create a Recursive CTE to Find All Levels of Employees
--Write a recursive CTE to display all levels of employees in the hierarchy.
;WITH LevelEmpCTE AS (
      SELECT EmployeeID, EmployeeName, ManagerID, 1 AS Level
	  FROM Employeess 
	  WHERE ManagerID IS NULL
	  UNION ALL
	  SELECT E.EmployeeID, E.EmployeeName, E.ManagerID, LE.Level + 1
	  FROM Employeess AS E
	  JOIN LevelEmpCTE AS LE ON E.ManagerID = LE.EmployeeID
	  )
SELECT * FROM LevelEmpCTE


--Task 6: Count Number of Employees at Each Level Using Recursive CTE
--Write a recursive CTE to count the number of employees at each level.
;WITH LevelEmpCTE AS (
      SELECT EmployeeID, EmployeeName, ManagerID, 1 AS Level
	  FROM Employeess 
	  WHERE ManagerID IS NULL
	  UNION ALL
	  SELECT E.EmployeeID, E.EmployeeName, E.ManagerID, LE.Level + 1
	  FROM Employeess AS E
	  JOIN LevelEmpCTE AS LE ON E.ManagerID = LE.EmployeeID
	  )
SELECT  Level, COUNT(Level) AS CountLevel FROM LevelEmpCTE
GROUP BY Level
ORDER BY Level

--Task 7: Retrieve Employees Without Managers Using Derived Table
--Write a query using a derived table to find employees who do not have a manager.
SELECT E.EmployeeID, E.EmployeeName, E.ManagerID
FROM Employeess AS E
LEFT JOIN (SELECT DISTINCT ManagerID 
           FROM Employeess 
		   WHERE ManagerID IS NOT NULL) AS M 
		   ON E.ManagerID = M.ManagerID
WHERE E.ManagerID IS NULL


--Task 8: Retrieve Employees Without Managers Using CTE
--Write a query using a CTE to find employees who do not have a manager.
;WITH WithoutManager AS(
      SELECT *
	  FROM Employeess
	  WHERE ManagerID IS NULL)
SELECT * FROM WithoutManager

--Task 9: Find Employees Reporting to a Specific Manager Using Recursive CTE
--Write a recursive CTE to find all employees reporting to a specific manager.
DECLARE @ManID INT = 3
;WITH EmployeeHierarchy AS (
      SELECT EmployeeID, EmployeeName, ManagerID, 1 AS Level
	  FROM Employeess 
	  WHERE ManagerID = @ManID
	  UNION ALL
	  SELECT E.EmployeeID, E.EmployeeName, E.ManagerID, LE.Level + 1
	  FROM Employeess AS E
	  JOIN EmployeeHierarchy AS LE ON E.ManagerID = LE.EmployeeID
	  )
SELECT * FROM EmployeeHierarchy
ORDER BY LEVEL, EmployeeID

--Task 10: Find the Maximum Depth of Management Hierarchy
--Write a recursive CTE to determine the maximum depth of the management hierarchy.
;WITH LevelEmpCTE AS (
      SELECT EmployeeID, EmployeeName, ManagerID, 1 AS Level
	  FROM Employeess 
	  WHERE ManagerID IS NULL
	  UNION ALL
	  SELECT E.EmployeeID, E.EmployeeName, E.ManagerID, LE.Level + 1
	  FROM Employeess AS E
	  JOIN LevelEmpCTE AS LE ON E.ManagerID = LE.EmployeeID
	  )
SELECT  MAX(Level) as MaxDepth FROM LevelEmpCTE


