--Lesson 13 Homework Questions

--String Functions in SQL Server
--1.LEN() -> Returns the length of a string (excluding trailing spaces).
--DATALENGTH() -> Returns the number of bytes used by a string (including spaces).
--2.CHARINDEX() -> Finds the starting position of a substring in a string.
--3.CONCAT() -> Joins multiple strings together.
--4.REPLACE() -> Replaces a substring with another substring.
--5.SUBSTRING() -> Extracts a specific part of a string.

--Mathematical Functions in SQL Server
--1.The ROUND() function rounds a number to a specified number of decimal places.
--2.The ABS() function returns the absolute (positive) value of a number.
--3.POWER() -> Raises a number to a given power.
--EXP() -> Returns e^x, where e is Euler’s number (= 2.718)
--4.CEILING() -> Rounds up to the nearest whole number.
--FLOOR() -> Rounds down to the nearest whole number.

--Date and Time Functions in SQL Server
--The GETDATE() function returns the current system date and time in SQL Server.
--The DATEDIFF() function calculates the difference between two dates in a specified unit.
--The DATEADD() function adds or subtracts a specified time interval to/from a date.
--The FORMAT() function formats a date into a specific string representation.
--Displaying dates in user-friendly formats in reports or applications.
--Formatting dates according to regional settings (en-US, uz-UZ, etc.).

--1
DECLARE @FULLNAME VARCHAR(100)
SET @FULLNAME = 'JOHN ALAN'
SELECT @FULLNAME AS FULLNAME, LEFT(@FULLNAME, CHARINDEX(' ', @FULLNAME)-1) AS LASTNAME;

--2
SELECT department_id, ROUND(AVG(salary), 2) AS AVGSALARY  FROM employees GROUP BY department_id

--3
SELECT first_name + ' ' + last_name AS FULLNAME, hire_date, DATEDIFF(YEAR, hire_date, GETDATE()) AS HIRE_YEAR FROM employees;

--Use Cases and Performance in SQL Server
--1.1. Problem: String functions (LEN(), CHARINDEX(), LEFT(), REPLACE()) can prevent indexes from being used efficiently.
--1.2. Problem: Mathematical functions (ROUND(), POWER(), ABS(), CEILING()) can cause high CPU usage when applied to large datasets.
--1.3. Problem: Date functions (DATEDIFF(), DATEADD(), FORMAT()) can be computationally expensive.

--2.1. String Functions – Text Processing
--CHARINDEX() – Searching within text
--REPLACE() – Replacing words dynamically
--LEN() – Finding empty or short data
--2.2.  Mathematical Functions – Financial and Statistical Analysis
--AVG(), SUM(), CEILING() – Financial calculations
--POWER(), EXP() – Scientific and engineering computations
--2.3.  Date/Time Functions – Managing Time-Based Data
--DATEDIFF() – Calculating age or time differences
--DATEADD() – Adding/subtracting time
--FORMAT() – Formatting dates for reports
--3.1. String functions can make index usage inefficient, so prefer LIKE for filtering.
--3.2. Mathematical functions should be used carefully in large datasets to avoid performance slowdowns.
--3.3. Date functions should be written to allow index optimization.

--Homework Puzzles
--Puzzle 1
CREATE TABLE CountSpaces ( texts VARCHAR(100) ); 
INSERT INTO CountSpaces(texts) 
VALUES ('P Q R S '), 
       (' L M N O 0 0 '), 
	   ('I am here only '), 
	   (' Welcome to the new world '), 
	   (' Hello world program'), 
	   (' Are u nuts ');

SELECT texts, DATALENGTH(texts) - DATALENGTH(REPLACE(texts, ' ', '')) COUNT_SPACES
FROM CountSpaces
GROUP BY texts

--Puzzle 2
DECLARE @TEXT AS NVARCHAR(1000) = 'AddsfsdfWUES 12*&';
DECLARE @i int =1,
        @len int = LEN(@TEXT),
		@UpperCount int = 0,
		@LowerCount int = 0,
		@OtherCount int = 0,
		@char NCHAR(1) ;

WHILE @i <= @len
BEGIN 
    SET @char = SUBSTRING(@TEXT, @i, 1);
	IF @char COLLATE LATIN1_GENERAL_BIN LIKE '[A-Z]'
	   SET @UpperCount += 1
	ELSE IF @char COLLATE LATIN1_GENERAL_BIN LIKE '[a-z]'
	   SET @LowerCount += 1
    ELSE 
	   SET @OtherCount += 1
  SET @i += 1
END

SELECT @UpperCount AS 'Uppercase letter count',
       @LowerCount AS 'Lowercase letter count',
	   @OtherCount AS 'Other character count';

--Puzzle 3
DECLARE @todate datetime, 
        @fromdate datetime; 
		SET @fromdate = '2009-01-01'; 
		SET @todate = '2009-12-31';

;WITH CTE AS (
      SELECT @fromdate AS FIRST_DATE
	  UNION ALL
	  SELECT DATEADD(DAY, 1, FIRST_DATE)
	  FROM CTE
	  WHERE DATEADD(DAY, 1, FIRST_DATE) < @todate)
SELECT FIRST_DATE AS [DATE],
YEAR(FIRST_DATE) AS [YEAR],
MONTH(FIRST_DATE) AS [MONTH],
DAY(FIRST_DATE) AS [DAY],
DATENAME(WEEKDAY, FIRST_DATE) AS [WEEKDAY]
FROM CTE
OPTION (MAXRECURSION 366);

--Puzzle 4
CREATE TABLE TestMultipleColumns ( Id INT NULL, Name VARCHAR(20) NULL ); 
INSERT INTO TestMultipleColumns 
VALUES (1, 'Pawan,Kumar'), 
       (2, 'Sandeep,Goyal'), 
	   (3, 'Isha,Mattoo'), 
	   (4, 'Gopal,Ranjan'), 
	   (5, 'Neeraj,Garg'), 
	   (6, 'Deepak,Sharma'), 
	   (7, 'Mayank,Tripathi');

SELECT Id, 
       LEFT(NAME, CHARINDEX(',', NAME)-1) AS FIRST_NAME, 
	   SUBSTRING(NAME, CHARINDEX(',', NAME) + 1, LEN(NAME)) AS LAST_NAME 
FROM TestMultipleColumns
