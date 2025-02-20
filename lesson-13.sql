--Task 1
CREATE TABLE TestMax
(
Year1 INT
,Max1 INT
,Max2 INT
,Max3 INT
)

INSERT INTO TestMax 
VALUES
 (2001,10,101,87)
,(2002,103,19,88)
,(2003,21,23,89)
,(2004,27,28,91)


SELECT Year1,
       (CASE
       WHEN Max1 >= Max2 AND Max1 >= Max3 THEN Max1
	   WHEN Max2 >= Max1 AND Max2 >= Max3 THEN Max2
	   ELSE Max3
	   END) AS MaxValue
FROM TestMax

--Task 2
;CREATE TABLE Employeess
(EmpID INT, EmpName VARCHAR(20), ReportsTo INT)
 
--Insert Data
INSERT INTO Employeess(EmpID, EmpName, ReportsTo)
SELECT 1, 'Jacob', NULL UNION ALL
SELECT 2, 'Rui', NULL UNION ALL
SELECT 3, 'Jacobson', NULL UNION ALL
SELECT 4, 'Jess', 1 UNION ALL
SELECT 5, 'Steve', 1 UNION ALL
SELECT 6, 'Bob', 1 UNION ALL
SELECT 7, 'Smith', 2 UNION ALL
SELECT 8, 'Bobbey', 2 UNION ALL
SELECT 9, 'Steffi', 3 UNION ALL
SELECT 10, 'Bracha', 3 UNION ALL
SELECT 11, 'John', 5 UNION ALL
SELECT 12, 'Michael', 6 UNION ALL
SELECT 13, 'Paul', 6 UNION ALL
SELECT 14, 'Lana', 7 UNION ALL
SELECT 15, 'Johnson', 7 UNION ALL
SELECT 16, 'Mic', 8 UNION ALL
SELECT 17, 'Stev', 8 UNION ALL
SELECT 18, 'Paulson', 9 UNION ALL
SELECT 19, 'Jessica', 10

SELECT *FROM Employeess

;WITH CTE AS (
            SELECT EmpName, EmpID, ReportsTo, 0  AS Level,
			CAST('.' + EmpName + '.' AS VARCHAR(MAX)) AS FullyQualifiedName
			FROM Employeess 
			WHERE ReportsTo IS NULL
         UNION ALL
		    SELECT E.EmpName, E.EmpID, E.ReportsTo,CTE.Level+1,
			CAST(CTE.FullyQualifiedName + E.EmpName AS VARCHAR(MAX)) 
			FROM Employeess AS E
			INNER JOIN CTE ON E.ReportsTo = CTE.EmpID)

SELECT SPACE(Level*4) + EmpName AS Hierarchy,SPACE(level *4) + CAST(cte.EmpID as varchar(max)) as Hierarchy, EmpName, EmpID, Level, FullyQualifiedName  FROM CTE
