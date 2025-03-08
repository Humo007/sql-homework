--Lesson 19: Window Functions

--1. Employees Table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    DepartmentID INT,
    Salary DECIMAL(10, 2),
    EmployeeName VARCHAR(100)
);

INSERT INTO Employees (EmployeeID, DepartmentID, Salary, EmployeeName) VALUES
(1, 1, 55000.00, 'John Doe'),
(2, 2, 60000.00, 'Jane Smith'),
(3, 1, 45000.00, 'James Brown'),
(4, 3, 70000.00, 'Mary Johnson'),
(5, 2, 75000.00, 'Linda Williams'),
(6, 3, 80000.00, 'Michael Jones'),
(7, 1, 65000.00, 'Robert Miller'),
(8, 4, 58000.00, 'Patricia Davis'),
(9, 5, 68000.00, 'William Martínez'),
(10, 4, 52000.00, 'Jennifer García'),
(11, 3, 54000.00, 'David Lopez'),
(12, 2, 63000.00, 'Helen Harris'),
(13, 1, 46000.00, 'Charles Taylor'),
(14, 5, 55000.00, 'Nancy Allen'),
(15, 4, 60000.00, 'Edward Clark'),
(16, 1, 50000.00, 'Sarah Lewis'),
(17, 2, 70000.00, 'Jessica Young'),
(18, 3, 76000.00, 'Kevin White'),
(19, 4, 67000.00, 'Laura King'),
(20, 5, 59000.00, 'Joseph Scott'),
(21, 1, 61000.00, 'Karen Adams'),
(22, 3, 54000.00, 'James Nelson'),
(23, 2, 58000.00, 'Christopher Perez'),
(24, 1, 65000.00, 'Matthew Hill'),
(25, 3, 49000.00, 'Rachel Jackson'),
(26, 5, 64000.00, 'Daniel Walker'),
(27, 4, 57000.00, 'Ashley Young'),
(28, 1, 60000.00, 'Helen Anderson'),
(29, 2, 63000.00, 'Brian Wright'),
(30, 5, 52000.00, 'Michael Green'),
(31, 1, 67000.00, 'Jessica Hall'),
(32, 4, 55000.00, 'Joshua Carter'),
(33, 2, 72000.00, 'Sarah Mitchell'),
(34, 3, 46000.00, 'George Perez'),
(35, 5, 50000.00, 'Rachel Collins'),
(36, 1, 54000.00, 'John Rivera'),
(37, 4, 56000.00, 'Orlando Robinson'),
(38, 3, 65000.00, 'Luis Davis'),
(39, 2, 68000.00, 'Barbara Moore'),
(40, 1, 71000.00, 'David Harris');
--2. Departments Table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'Sales'),
(2, 'Marketing'),
(3, 'Operations'),
(4, 'Finance'),
(5, 'HR');
--3. Sales Table
CREATE TABLE Sales (
    SalesID INT PRIMARY KEY,
    EmployeeID INT,
    ProductID INT,
    SalesAmount DECIMAL(10, 2),
    SalesDate DATE
);

INSERT INTO Sales (SalesID, EmployeeID, ProductID, SalesAmount, SalesDate) VALUES
(1, 1, 1, 500.00, '2025-01-01'),
(2, 2, 2, 1200.00, '2025-01-02'),
(3, 3, 3, 800.00, '2025-01-03'),
(4, 4, 4, 1500.00, '2025-01-04'),
(5, 5, 5, 300.00, '2025-01-05'),
(6, 6, 6, 1000.00, '2025-01-06'),
(7, 7, 7, 850.00, '2025-01-07'),
(8, 8, 8, 500.00, '2025-01-08'),
(9, 9, 9, 600.00, '2025-01-09'),
(10, 10, 10, 450.00, '2025-01-10'),
(11, 11, 11, 700.00, '2025-01-11'),
(12, 12, 12, 800.00, '2025-01-12'),
(13, 13, 13, 1200.00, '2025-01-13'),
(14, 14, 14, 1500.00, '2025-01-14'),
(15, 15, 15, 950.00, '2025-01-15'),
(16, 16, 16, 600.00, '2025-01-16'),
(17, 17, 17, 700.00, '2025-01-17'),
(18, 18, 18, 1100.00, '2025-01-18'),
(19, 19, 19, 500.00, '2025-01-19'),
(20, 20, 20, 400.00, '2025-01-20'),
(21, 21, 21, 800.00, '2025-01-21'),
(22, 22, 22, 650.00, '2025-01-22'),
(23, 23, 23, 700.00, '2025-01-23'),
(24, 24, 24, 1200.00, '2025-01-24'),
(25, 25, 25, 500.00, '2025-01-25'),
(26, 26, 26, 850.00, '2025-01-26'),
(27, 27, 27, 600.00, '2025-01-27'),
(28, 28, 28, 1200.00, '2025-01-28'),
(29, 29, 29, 700.00, '2025-01-29'),
(30, 30, 30, 450.00, '2025-01-30'),
(31, 31, 31, 800.00, '2025-02-01'),
(32, 32, 32, 1200.00, '2025-02-02'),
(33, 33, 33, 900.00, '2025-02-03'),
(34, 34, 34, 600.00, '2025-02-04'),
(35, 35, 35, 950.00, '2025-02-05'),
(36, 36, 36, 1000.00, '2025-02-06'),
(37, 37, 37, 700.00, '2025-02-07'),
(38, 38, 38, 850.00, '2025-02-08'),
(39, 39, 39, 600.00, '2025-02-09'),
(40, 40, 40, 500.00, '2025-02-10');
--4. Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2)
);

INSERT INTO Products (ProductID, ProductName, Price) VALUES
(1, 'Laptop', 800.00),
(2, 'Smartphone', 600.00),
(3, 'Headphones', 100.00),
(4, 'Keyboard', 30.00),
(5, 'Mouse', 20.00),
(6, 'Monitor', 250.00),
(7, 'Printer', 150.00),
(8, 'Tablet', 350.00),
(9, 'Smartwatch', 120.00),
(10, 'Speaker', 50.00),
(11, 'Refrigerator', 500.00),
(12, 'Washing Machine', 400.00),
(13, 'Microwave', 120.00),
(14, 'Blender', 60.00),
(15, 'Air Conditioner', 250.00),
(16, 'Hair Dryer', 30.00),
(17, 'Vacuum Cleaner', 150.00),
(18, 'Coffee Maker', 90.00),
(19, 'Toaster', 40.00),
(20, 'Iron', 25.00),
(21, 'Shirt', 30.00),
(22, 'Jeans', 40.00), 
(23, 'Shoes', 70.00), 
(24, 'Socks', 5.00), 
(25, 'Jacket', 100.00), 
(26, 'T-shirt', 20.00), 
(27, 'Sweater', 50.00), 
(28, 'Shorts', 30.00), 
(29, 'Hat', 15.00), 
(30, 'Gloves', 20.00), 
(31, 'Backpack', 60.00), 
(32, 'Wallet', 25.00), 
(33, 'Sunglasses', 40.00), 
(34, 'Scarf', 15.00), 
(35, 'Belt', 25.00), 
(36, 'Watch', 120.00),
(37, 'Ring', 50.00), (
38, 'Necklace', 80.00), 
(39, 'Earrings', 30.00), 
(40, 'Bracelet', 20.00);


SELECT *FROM Employees
--Write a query to assign a row number to each employee in the Employees table ordered by their Salary.
SELECT *, 
       ROW_NUMBER() OVER(ORDER BY Salary ) as Row_number
FROM Employees 

--Use the DENSE_RANK() function to rank employees by Salary in the Employees table.
SELECT *, DENSE_RANK() OVER(ORDER BY Salary) as Rnk FROM Employees 

--Write a query to display the next (lead) salary for each employee in the same department using the LEAD() function.
SELECT *, LEAD(Salary) OVER(PARTITION BY DepartmentID ORDER BY (SELECT 1)) AS NEXT_SALARY FROM Employees

--Write a query to show the previous (lagged) salary for each employee in the Employees table using the LAG() function.
SELECT *, LAG(Salary) OVER(PARTITION BY DepartmentID ORDER BY (SELECT 1)) AS PREVIOUS_SALARY FROM Employees

--Use NTILE(4) to divide employees into 4 groups based on their Salary.
SELECT *, NTILE(4) OVER(ORDER BY Salary) AS Salary_group FROM Employees

--Write a query to compute the percentage contribution of SalesAmount by ProductCategory in the Sales table.
ALTER TABLE Products ADD ProductCategory VARCHAR(50);
UPDATE Products
SET ProductCategory = 
    CASE 
        WHEN ProductID BETWEEN 1 AND 10 THEN 'Electronics'
        WHEN ProductID BETWEEN 11 AND 20 THEN 'Home Appliances'
        WHEN ProductID BETWEEN 21 AND 30 THEN 'Clothing'
        WHEN ProductID BETWEEN 31 AND 40 THEN 'Accessories'
        ELSE 'Other'
    END;

SELECT P.ProductCategory, CAST((SUM(SalesAmount)*100)/ 
       SUM(SUM(SalesAmount))  OVER() AS decimal(10,2)) AS PercentageContribution       
FROM Sales AS S
JOIN Products AS P ON S.ProductID = P.ProductID
GROUP BY P.ProductCategory
ORDER BY PercentageContribution DESC

--Write a query to partition the Sales table by ProductID and calculate the total SalesAmount per product.
SELECT *, SUM(SalesAmount) OVER(PARTITION BY ProductID ) AS Sales_PerProduct
FROM Sales


--Write a query to calculate the running total of sales for each product in the Sales table.
SELECT SalesID, ProductID,  EmployeeID, SalesAmount, SalesDate, 
       SUM(SalesAmount) OVER(ORDER BY SalesDate) AS RUNNING_total 
FROM Sales
ORDER BY SalesDate

--Use RANK() to determine the highest earners within each department.

;WITH RnkHighestSalary AS (SELECT E.EmployeeName, E.Salary, 
        RANK() OVER(PARTITION BY E.DepartmentID ORDER BY E.Salary DESC ) AS RNK,
		d.DepartmentName, D.DepartmentID
FROM Employees AS E
JOIN Departments AS D ON E.DepartmentID = D.DepartmentID)
SELECT EmployeeName, Salary, DepartmentID, DepartmentName
FROM RnkHighestSalary
WHERE RNK = 1

--Use NTILE(5) to divide products into five groups based on their Price.
SELECT *, NTILE(5) OVER(ORDER BY PRICE desc) AS DivideProPrice
FROM Products

--Use DENSE_RANK() to find the 3rd highest Salary in each department from the Employees table.
;WITH RnkHighestSalary AS (SELECT E.EmployeeID,E.EmployeeName, E.Salary, 
        DENSE_RANK() OVER(PARTITION BY E.DepartmentID ORDER BY E.Salary DESC ) AS RNK,
		d.DepartmentName, D.DepartmentID
FROM Employees AS E
JOIN Departments AS D ON E.DepartmentID = D.DepartmentID)
SELECT EmployeeID,EmployeeName, Salary, DepartmentID, DepartmentName
FROM RnkHighestSalary
WHERE RNK = 3

--Write a query using RANK() to rank products by their sales (handling ties) but exclude the top 10% of products by sales.
WITH ProductSales AS (SELECT P.ProductID, P.ProductName,
        SUM(S.SalesAmount) AS TotalSales,
        RANK() OVER(ORDER BY SUM(S.SalesAmount) DESC) AS SalesRank,
		COUNT(*) OVER() AS TotalProducts
FROM Sales AS S
JOIN Products AS P ON S.ProductID = P.ProductID
GROUP BY P.ProductID, P.ProductName)
SELECT ProductID, ProductName, TotalSales, SalesRank
FROM ProductSales 
WHERE SalesRank > (TotalProducts*0.1)

--Write a query to partition products by CategoryID and compute the average Price for each category.
SELECT *, AVG(Price) OVER(PARTITION BY ProductCategory ) AS AvgEachCategory
FROM Products 

--Write a query to compute the moving average of sales over a 5-day window using both LEAD() and LAG() functions.
SELECT *, AVG(SalesAmount) OVER(ORDER BY SalesDate rows between 2 preceding and 2 following) as MovingAvg
FROM Sales

SELECT *, (SalesAmount + 
          COALESCE(LAG(SalesAmount, 1) OVER(ORDER BY SalesDate), 0) + 
		  COALESCE(LAG(SalesAmount, 2) OVER(ORDER BY SalesDate), 0) + 
		  COALESCE(LEAD(SalesAmount, 1) OVER(ORDER BY SalesDate), 0) + 
		  COALESCE(LEAD(SalesAmount, 2) OVER(ORDER BY SalesDate), 0) ) / 5 AS MovAvg
FROM Sales

--Write a query using ROW_NUMBER() to identify the top 10 employees with the highest sales, sorted by SalesAmount.
SELECT * 
FROM (SELECT *, ROW_NUMBER() OVER(ORDER BY SalesAmount DESC ) RowNum
FROM Sales) AS RNK
WHERE RowNum <=10

--Create a query using LAG() to calculate the percentage change in SalesAmount from the previous sale for each employee.
SELECT E.EmployeeID, E.EmployeeName, E.Salary, S.SalesAmount,
       ISNULL(LAG(S.SalesAmount) OVER(ORDER BY S.SalesDate), 0) AS LagSales,
	 CAST((S.SalesAmount - ISNULL(LAG(S.SalesAmount) OVER( ORDER BY S.SalesDate), 0)) * 100 / 
	 (LAG(S.SalesAmount) OVER(ORDER BY S.SalesDate)) AS decimal(10,2)) AS Precentage
FROM Employees AS E
JOIN Sales AS S ON S.EmployeeID = E.EmployeeID



