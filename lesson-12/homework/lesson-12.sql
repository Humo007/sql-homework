--Lesson 12: String Functions, Mathematical Functions, Date and Time Functions


--1.Write a query to reverse the string 'SQL Server' and then remove the spaces.
SELECT REVERSE(REPLACE('SQL SERVER', ' ', ''))

--2.Write a query that uses String_agg() to concatenate all the values in the 'City' column of a table into a single string, separated by commas.
SELECT *FROM Customers
SELECT STRING_AGG(City, ',') AS ALL_CITIES FROM Customers

--3.Write a SQL query that checks if a string contains both 'SQL' and 'Server' using Charindex().
SELECT CHARINDEX('SQL', ' SQL SERVER')
SELECT CHARINDEX('SERVER', 'HELLO SQL SERVER')

--4.How would you use Power() to calculate the cube of 5?
SELECT POWER(5, 3) AS CUBEOFFIVE

--5.Write a query that splits a string 'apple;orange;banana' by the semicolon and returns each word as a separate row.
SELECT VALUE FROM STRING_SPLIT('apple;orange;banana', ';') 

--6.Use Trim() to remove both leading and trailing spaces from the string ' SQL '.
SELECT TRIM(' SQL ')

--7.Write a SQL query to calculate the difference in hours between two timestamps using Datediff().
SELECT DATEDIFF(HOUR, '12:00:00', '15:03:01')
SELECT GETDATE()

--8.How would you calculate the number of months between '2023-05-01' and '2025-02-03' using Datepart()?
SELECT (DATEPART(YEAR, '2025-02-03') - DATEPART(YEAR, '2023-05-01' ))*12 + ( DATEPART(MONTH, '2025-02-03') - DATEPART(MONTH, '2023-05-01' )) 

--9.Write a query to find the position of the substring 'SQL' from the end of the string 'Learn SQL Server' using Reverse() and Charindex().
SELECT LEN('Learn SQL Server') - CHARINDEX(REVERSE('SQL'), REVERSE('Learn SQL Server')) - LEN('SQL') +1

--10.Use String_split() to split a comma-separated string 'apple,orange,banana' and return each word in a separate row.
SELECT VALUE FROM string_split('apple,orange,banana', ',')

--11.How would you find the number of days from '2025-01-01' to the current date using Datediff()?
SELECT DATEDIFF(DAY, '2025-01-01', GETDATE())

--12.Write a SQL query that returns the first 4 characters of the string 'Data Science' using Left().
SELECT LEFT('Data Science', 4)
--13.How can you calculate the square root of 225 and round it to the nearest whole number using Sqrt() and Ceiling()?
SELECT CEILING(SQRT(225))

--14.Write a query that concatenates two strings with a pipe ('|') separator using Concat_ws().
SELECT CONCAT_WS('|', 'HELLO', 'WORLD')

--15.Use Patindex() to find the position of the first occurrence of any digit in the string 'abc123xyz'.
SELECT PATINDEX('%[0-9]%', 'abc123xyz')

--16.How would you find the second occurrence of the substring 'SQL' in the string 'SQL Server SQL' using Charindex()?
SELECT CHARINDEX('SQL', 'SQL Server SQL',  CHARINDEX('SQL', 'SQL Server SQL') + 1)

--17.Write a SQL query to get the year from the current date using DatePart().
SELECT DATEPART(YEAR, GETDATE())

--18.How do you subtract 100 days from the current date using Dateadd()?
SELECT DATEADD(DAY, -100, GETDATE())

--19.Use DateName() to extract the day of the week from the date '2025-02-03'.
SELECT DATENAME(WEEKDAY, '2025-02-03')

--20.Write a query to get the square of a number using the Power() function and return it in the result set.
CREATE FUNCTION FN_SQUARE(@NUMBER INT)
RETURNS INT
AS 
BEGIN
  RETURN POWER(@NUMBER, 2)
END;
SELECT DBO.FN_SQUARE(7) AS SQUARE_NUMBERS