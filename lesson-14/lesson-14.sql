CREATE TABLE Employees14 (
    EmployeeID INT PRIMARY KEY,
    DepartmentID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Salary DECIMAL(10, 2)
);

INSERT INTO Employees14 (EmployeeID, DepartmentID, FirstName, LastName, Salary) VALUES
(1, 1, 'John', 'Doe', 60000.00),
(2, 1, 'Jane', 'Smith', 65000.00),
(3, 2, 'James', 'Brown', 70000.00),
(4, 3, 'Mary', 'Johnson', 75000.00),
(5, 4, 'Linda', 'Williams', 80000.00),
(6, 2, 'Michael', 'Jones', 85000.00),
(7, 1, 'Robert', 'Miller', 55000.00),
(8, 3, 'Patricia', 'Davis', 72000.00),
(9, 4, 'Jennifer', 'García', 77000.00),
(10, 1, 'William', 'Martínez', 69000.00),
(11, 5, 'Elizabeth', 'Hernández', 95000.00),
(12, 2, 'David', 'Lopez', 88000.00),
(13, 3, 'Joseph', 'Martinez', 74000.00),
(14, 4, 'Susan', 'Rodriguez', 80000.00),
(15, 5, 'Daniel', 'Wilson', 89000.00),
(16, 1, 'Karen', 'Moore', 67000.00),
(17, 2, 'Charles', 'Taylor', 71000.00),
(18, 3, 'Christopher', 'Anderson', 76000.00),
(19, 4, 'Sarah', 'Thomas', 83000.00),
(20, 5, 'Jessica', 'Jackson', 92000.00),
(21, 1, 'Kevin', 'White', 64000.00),
(22, 2, 'Nancy', 'Harris', 78000.00),
(23, 3, 'Steven', 'Clark', 78000.00),
(24, 4, 'Betty', 'Lewis', 79000.00),
(25, 5, 'Ryan', 'Young', 94000.00),
(26, 1, 'Daniel', 'King', 68000.00),
(27, 2, 'Dorothy', 'Scott', 73000.00),
(28, 3, 'Ethan', 'Adams', 77000.00),
(29, 4, 'Megan', 'Baker', 82000.00),
(30, 5, 'Anthony', 'Green', 88000.00),
(31, 1, 'Laura', 'Nelson', 66000.00),
(32, 2, 'Ryan', 'Carter', 71000.00),
(33, 3, 'George', 'Mitchell', 76000.00),
(34, 4, 'Deborah', 'Perez', 79000.00),
(35, 5, 'Brian', 'Roberts', 90000.00),
(36, 1, 'Alice', 'Garcia', 60000.00),
(37, 2, 'Jack', 'Evans', 72000.00),
(38, 3, 'Ashley', 'Gonzalez', 77000.00),
(39, 4, 'Evan', 'Stewart', 80000.00),
(40, 5, 'Sophia', 'King', 93000.00);


CREATE TABLE Departments14 (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

INSERT INTO Departments14 (DepartmentID, DepartmentName) VALUES
(1, 'HR'),
(2, 'Sales'),
(3, 'Marketing'),
(4, 'Finance'),
(5, 'IT'),
(6, 'Operations'),
(7, 'Customer Service'),
(8, 'R&D'),
(9, 'Legal'),
(10, 'Logistics');



CREATE TABLE Sales14 (
    SalesID INT PRIMARY KEY,
    ProductID INT,
    SalesAmount DECIMAL(10, 2),
    SaleDate DATE
);

INSERT INTO Sales14 (SalesID, ProductID, SalesAmount, SaleDate) VALUES
(1, 1, 1500.00, '2025-01-01'),
(2, 2, 2000.00, '2025-01-02'),
(3, 3, 1200.00, '2025-01-03'),
(4, 4, 1800.00, '2025-01-04'),
(5, 5, 2200.00, '2025-01-05'),
(6, 6, 1400.00, '2025-01-06'),
(7, 1, 2500.00, '2025-01-07'),
(8, 2, 1700.00, '2025-01-08'),
(9, 3, 1600.00, '2025-01-09'),
(10, 4, 1900.00, '2025-01-10'),
(11, 5, 2100.00, '2025-01-11'),
(12, 6, 1300.00, '2025-01-12'),
(13, 1, 2000.00, '2025-01-13'),
(14, 2, 1800.00, '2025-01-14'),
(15, 3, 1500.00, '2025-01-15'),
(16, 4, 2200.00, '2025-01-16'),
(17, 5, 1700.00, '2025-01-17'),
(18, 6, 1600.00, '2025-01-18'),
(19, 1, 2500.00, '2025-01-19'),
(20, 2, 1800.00, '2025-01-20'),
(21, 3, 1400.00, '2025-01-21'),
(22, 4, 1900.00, '2025-01-22'),
(23, 5, 2100.00, '2025-01-23'),
(24, 6, 1600.00, '2025-01-24'),
(25, 1, 1500.00, '2025-01-25'),
(26, 2, 2000.00, '2025-01-26'),
(27, 3, 2200.00, '2025-01-27'),
(28, 4, 1300.00, '2025-01-28'),
(29, 5, 2500.00, '2025-01-29'),
(30, 6, 1800.00, '2025-01-30'),
(31, 1, 2100.00, '2025-02-01'),
(32, 2, 1700.00, '2025-02-02'),
(33, 3, 1600.00, '2025-02-03'),
(34, 4, 1900.00, '2025-02-04'),
(35, 5, 2000.00, '2025-02-05'),
(36, 6, 2200.00, '2025-02-06'),
(37, 1, 1300.00, '2025-02-07'),
(38, 2, 2500.00, '2025-02-08'),
(39, 3, 1400.00, '2025-02-09'),
(40, 4, 1800.00, '2025-02-10');



CREATE TABLE Products14 (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2)
);

INSERT INTO Products14 (ProductID, ProductName, Price) VALUES
(1, 'Laptop', 1000.00),
(2, 'Smartphone', 800.00),
(3, 'Tablet', 500.00),
(4, 'Monitor', 300.00),
(5, 'Headphones', 150.00),
(6, 'Mouse', 25.00),
(7, 'Keyboard', 50.00),
(8, 'Camera', 400.00),
(9, 'Printer', 150.00),
(10, 'Smartwatch', 200.00),
(11, 'Speakers', 80.00),
(12, 'Flash Drive', 20.00),
(13, 'Hard Drive', 120.00),
(14, 'External Battery', 30.00),
(15, 'Charger', 15.00),
(16, 'Router', 70.00),
(17, 'Graphics Card', 500.00),
(18, 'Processor', 300.00),
(19, 'RAM', 120.00),
(20, 'Motherboard', 150.00),
(21, 'Power Supply', 80.00),
(22, 'Webcam', 40.00),
(23, 'Microphone', 60.00),
(24, 'Projector', 400.00),
(25, 'Electric Fan', 25.00),
(26, 'Air Conditioner', 250.00),
(27, 'Refrigerator', 500.00),
(28, 'Washing Machine', 350.00),
(29, 'Microwave', 100.00),
(30, 'Blender', 80.00),
(31, 'Vacuum Cleaner', 150.00),
(32, 'Coffee Maker', 90.00),
(33, 'Toaster', 40.00),
(34, 'Water Heater', 120.00),
(35, 'Iron', 30.00),
(36, 'Hair Dryer', 40.00),
(37, 'Electric Toothbrush', 50.00),
(38, 'Shaver', 60.00),
(39, 'Electric Kettle', 30.00),
(40, 'Rice Cooker', 60.00);


ALTER TABLE Sales14 ADD EmployeeID INT;
UPDATE Sales14 SET EmployeeID = 
    CASE 
        WHEN ProductID = 1 THEN 1
        WHEN ProductID = 2 THEN 2
        WHEN ProductID = 3 THEN 3
        WHEN ProductID = 4 THEN 4
        WHEN ProductID = 5 THEN 5
        WHEN ProductID = 6 THEN 6
        ELSE (ProductID % 10) + 1  
    END;
SELECT *FROM Sales14

CREATE TABLE Customers14 (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    CustomerName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(20),
    Address VARCHAR(255)
);

CREATE TABLE Orders14 (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


INSERT INTO Customers14(CustomerName, Email, Phone, Address) VALUES
('Ali Valiyev', 'ali.valiyev@example.com', '+998901234567', 'Toshkent, Uzbekistan'),
('Shoxrux Jorayev', 'shoxrux.jorayev@example.com', '+998911112233', 'Samarqand, Uzbekistan'),
('Nodira Karimova', 'nodira.karimova@example.com', '+998977778899', 'Buxoro, Uzbekistan'),
('Umid Abdullayev', 'umid.abdullayev@example.com', '+998935556677', 'Namangan, Uzbekistan'),
('Lola Yusupova', 'lola.yusupova@example.com', '+998990001122', 'Fargona, Uzbekistan');

INSERT INTO Orders14 (CustomerID, OrderDate, TotalAmount) VALUES
(1, '2025-01-01', 250.00),
(2, '2025-01-02', 300.00),
(3, '2025-01-03', 150.00),
(4, '2025-01-04', 400.00),
(5, '2025-01-05', 350.00),
(1, '2025-01-06', 500.00),
(2, '2025-01-07', 450.00),
(3, '2025-01-08', 200.00),
(4, '2025-01-09', 600.00),
(5, '2025-01-10', 550.00);

SELECT * FROM Customers14;
SELECT * FROM Orders14;


--SQL Homework Tasks: CTEs and Derived Tables
--Easy Tasks (20)
--1.Write a query to find the total sales per employee using a derived table.
SELECT E.EmployeeID, E.FirstName + ' ' + E.LastName AS EmployeeName, s.TotalSales
FROM Employees14 AS E
JOIN (
    SELECT EmployeeID, SUM(SalesAmount) AS TotalSales
    FROM Sales14
    GROUP BY EmployeeID
) s ON e.EmployeeID = s.EmployeeID;

--2.Create a CTE to find the average salary of employees.
;WITH AVGSALARYCTE AS  (
      SELECT AVG(Salary) AS AVGSALARY  FROM Employees14)
SELECT E.EmployeeID, E.FirstName, E.Salary 
FROM Employees14 AS E
JOIN AVGSALARYCTE AS A ON A.AVGSALARY < E.Salary

--3.Write a query using a derived table to find the highest sales for each product.
SELECT P.ProductID, P.ProductName, S.MaxSales 
FROM Products14 AS P
JOIN (SELECT ProductID, 
             MAX(SalesAmount) AS MaxSales  
	  FROM Sales14
	  GROUP BY ProductID) AS S ON  S.ProductID = P.ProductID



--4.Use a CTE to get the names of employees who have made more than 5 sales.
;WITH EmpSalesCte AS (
       SELECT EmployeeID, COUNT(*) AS SalesCount
	   FROM Sales14 
	   GROUP BY EmployeeID)
SELECT E.EmployeeID, E.FirstName + ' ' + E.LastName AS EmployeeName
FROM Employees14 AS E
JOIN EmpSalesCte AS ESC ON E.EmployeeID = ESC.EmployeeID

--5.Create a derived table that lists the top 5 customers by total purchase amount.
SELECT C.CustomerID, C.CustomerName, O.TotalSpent
FROM Customers14 AS C
JOIN (SELECT CustomerID, SUM(TotalAmount) AS TotalSpent
      FROM Orders14  
	  GROUP BY CustomerID
	  ORDER BY TotalSpent
	  OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY
) AS O ON C.CustomerID = O.CustomerID

--6.Write a query using a CTE to find all products with sales greater than $500.
;WITH SalesGreater500CTE AS (
       SELECT ProductID, SUM(SalesAmount) AS TotalSales  
	   FROM Sales14
	   GROUP BY ProductID
	   HAVING SUM(SalesAmount) > 500)
SELECT P.ProductID, P.ProductName, S.TotalSales 
FROM Products14 AS P
JOIN SalesGreater500CTE AS S ON P.ProductID = S.ProductID

--7.Use a derived table to get the total number of orders for each customer.
SELECT C.CustomerID, C.CustomerName, O.TotalOrsers
FROM Customers14 AS C 
JOIN (SELECT CustomerID, COUNT(*) AS TotalOrsers
      FROM Orders14
	  GROUP BY CustomerID) AS O ON C.CustomerID = O.CustomerID;

--8.Create a CTE to find employees with salaries above the average salary.
;WITH AVGSALARYCTE AS (
      SELECT AVG(Salary) AS AvgSalary FROM Employees14 )
SELECT e.DepartmentID, E.FirstName + ' ' + E.LastName AS EmployeeName, E.Salary 
FROM Employees14 AS E
JOIN AVGSALARYCTE AS A ON E.Salary > A.AvgSalary;


--9.Write a query to find the total number of products sold using a derived table.
SELECT SUM(t.TotalNumProducts) AS TotalProductsSold
FROM (SELECT ProductID, COUNT(ProductID) AS TotalNumProducts
      FROM Sales14
	  GROUP BY ProductID) AS T

--10.Use a CTE to find the names of employees who have not made any sales.
;WITH SalesCTE AS (
      SELECT distinct EmployeeID
	  FROM Sales14 )
SELECT E.EmployeeID,  E.FirstName + ' ' + E.LastName AS EmployeeName
FROM Employees14 AS E 
JOIN SalesCTE AS S ON E.EmployeeID = S.EmployeeID
WHERE S.EmployeeID IS NULL;

--11.Write a query using a derived table to calculate the total revenue for each region.
CREATE TABLE Regions14 (
    RegionID INT PRIMARY KEY,
    RegionName VARCHAR(100)
);

INSERT INTO Regions14 (RegionID, RegionName) VALUES
(1, 'North America'),
(2, 'Europe'),
(3, 'Asia'),
(4, 'South America'),
(5, 'Africa');

ALTER TABLE Sales14 ADD RegionID INT;
UPDATE Sales14 
SET RegionID = (ABS(CHECKSUM(NEWID())) % 5) + 1;
SELECT * FROM Sales14;

SELECT R.RegionID, R.RegionName, S.TotalRevenue
FROM Regions14 AS R
JOIN (SELECT RegionID, SUM(SalesAmount) AS TotalRevenue
      FROM Sales14 
	  GROUP BY  RegionID) AS S ON R.RegionID = S. RegionID

--12.Use a CTE to get the employees who worked for more than 5 years.
ALTER TABLE Employees14 ADD HireDate DATE;
UPDATE Employees14 
SET HireDate = DATEADD(DAY, - (ABS(CHECKSUM(NEWID())) % 3650), GETDATE());

;WITH ExperienceCTE AS (
      SELECT EmployeeID, DATEDIFF(YEAR, HireDate, GETDATE()) AS YearsWorked
	  FROM Employees14 
	  WHERE DATEDIFF(YEAR, HireDate, GETDATE()) > 5)
SELECT E.EmployeeID, E.FirstName + ' ' + E.LastName AS EmployeeName, EC.YearsWorked
FROM Employees14  AS E
JOIN ExperienceCTE AS EC ON E.EmployeeID = EC.EmployeeID;

--13.Create a query using a derived table to find customers who made more than 3 orders.
SELECT C.CustomerID, C.CustomerName, O.OrderCount
FROM Customers14 AS C
JOIN (SELECT CustomerID, COUNT(*) AS OrderCount
      FROM Orders14 
	  GROUP BY CustomerID
	  HAVING COUNT(*) > 3) AS O ON C.CustomerID = O.CustomerID;

--14.Write a query using a CTE to find employees with the highest sales in a specific department.
;WITH DepartmentTopSales AS (
      SELECT E.DepartmentID, S.EmployeeID, SUM(S.SalesAmount) AS TotalSales
	  FROM Sales14 AS S
	  JOIN Employees14 AS E ON S.EmployeeID = E.EmployeeID 
	  GROUP BY E.DepartmentID, S.EmployeeID)
SELECT E.EmployeeID,  E.FirstName + ' ' + E.LastName AS EmployeeName, D.TotalSales
FROM Employees14 AS E
JOIN DepartmentTopSales AS D ON E.DepartmentID = D.DepartmentID;

--15.Use a derived table to calculate the average order value for each customer.
SELECT C.CustomerID, C.CustomerName, O.AvgOrderValue
FROM Customers14 AS C 
JOIN(SELECT CustomerID, AVG(TotalAmount) AS AvgOrderValue
     FROM Orders14
	 GROUP BY CustomerID) AS O ON C.CustomerID = O.CustomerID

--16.Write a query using a CTE to find the number of employees in each department.
;WITH EmployeeCountCTE AS (
      SELECT DepartmentID, COUNT(*) AS EmployeeCount
	  FROM Employees14
	  GROUP BY DepartmentID)
SELECT D.DepartmentID, D.DepartmentName, E.EmployeeCount
FROM Departments14 AS D
JOIN EmployeeCountCTE AS E ON D.DepartmentID = E.DepartmentID;

--17.Use a derived table to find the top-selling products in the last quarter.
SELECT P.ProductID, P.ProductName, O.TotalSales
FROM Products14 AS P
JOIN (SELECT ProductID, SUM(SalesAmount) AS TotalSales
      FROM Sales14
	  WHERE SaleDate >= DATEADD(QUARTER, -1, GETDATE())
	  GROUP BY ProductID) AS O ON P.ProductID =O.ProductID
	  ORDER BY TotalSales DESC

--18.Write a query using a CTE to list employees who have sales higher than $1000.
;WITH HighSalesemployeeCTE AS (
      SELECT EmployeeID, SUM(SalesAmount) AS TotalSales
	  FROM Sales14
	  GROUP BY EmployeeID
	  HAVING SUM(SalesAmount) > 1000)
SELECT E.EmployeeID, E.FirstName + ' ' + E.LastName AS EmployeeName, HSC.TotalSales
FROM Employees14 AS E
JOIN HighSalesemployeeCTE AS HSC ON E.EmployeeID = HSC.EmployeeID;

--19.Create a derived table to find the number of orders made by each customer.
SELECT C.CustomerID, C.CustomerName, O.TotalOrders
FROM Customers14 AS C
JOIN (SELECT CustomerID, COUNT(*) AS TotalOrders
      FROM Orders14 
	  GROUP BY CustomerID) AS O ON C.CustomerID = O.CustomerID;

--20.Write a query using a CTE to find the total sales per employee for the last month.
;WITH LastMonthSales AS (
      SELECT EmployeeID, SUM(SalesAmount) AS TotalSales
	  FROM Sales14
	  WHERE SaleDate >= DATEADD(MONTH, -1, GETDATE())
	  GROUP BY EmployeeID)
SELECT E.EmployeeID, E.FirstName + ' ' + E.LastName AS EmployeeName, LMS.TotalSales
FROM Employees14 AS E
JOIN LastMonthSales AS LMS ON E.EmployeeID = LMS.EmployeeID;

--Medium Tasks (20)
--1.Write a recursive CTE to generate the Fibonacci sequence up to the 20th term.
;WITH RunningTotal AS (
      SELECT EmployeeID, SaleDate, SalesAmount,
	         (SELECT SUM(SalesAmount) 
	          FROM Sales14
			  WHERE S.EmployeeID = EmployeeID AND SaleDate <= S.SaleDate) AS RunningTotal
	  FROM Sales14 AS S)
SELECT * FROM RunningTotal

--2.Use a recursive CTE to generate a sequence of numbers from 1 to 10.
;WITH Numbers AS (
    SELECT 1 AS Num
    UNION ALL
    SELECT Num + 1 FROM Numbers WHERE Num < 10
)
SELECT * FROM Numbers;

--3.Write a query using a derived table to calculate the average sales per region.

SELECT R.RegionID, R.RegionName, S.AvgSalas
FROM Regions14  AS R
JOIN (SELECT RegionID, AVG(SalesAmount) AS AvgSalas
      FROM Sales14 
	  GROUP BY RegionID) AS S ON R.RegionID = S.RegionID;

--4.Create a CTE to rank employees based on their total sales.
;WITH EmployeeRank AS (
      SELECT EmployeeID, SUM(SalesAmount) AS TotalSales,
	  RANK() OVER (ORDER BY SUM(SalesAmount) DESC) AS Rank
	  FROM Sales14
	  GROUP BY EmployeeID)
SELECT *FROM EmployeeRank

--5.Use a derived table to find the top 5 employees by the number of orders made.
SELECT E.EmployeeID, E.FirstName, E.LastName, S.TotalOrders
FROM Employees14 AS E
JOIN (SELECT EmployeeID, COUNT(SalesID) AS TotalOrders
      FROM Sales14 
	  GROUP BY EmployeeID) AS S ON E.EmployeeID = S.EmployeeID
ORDER BY S.TotalOrders DESC
OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY;


--6.Write a query using a recursive CTE to list all employees reporting to a specific manager.
ALTER TABLE Employees14
ADD ManagerID INT NULL;
ALTER TABLE Employees14
ADD CONSTRAINT FK_Manager FOREIGN KEY (ManagerID) REFERENCES Employees14(EmployeeID);
UPDATE Employees14 SET ManagerID = 2 WHERE EmployeeID IN (3, 4, 5);
UPDATE Employees14 SET ManagerID = 1 WHERE EmployeeID IN (6, 7, 8);
UPDATE Employees14 SET ManagerID = 3 WHERE EmployeeID IN (9, 10, 11);

DECLARE @ManagerID INT = 1

;WITH EmployeeHierarchy AS (
      SELECT EmployeeID, ManagerID, FirstName, LastName
	  FROM Employees14 
	  WHERE ManagerID = @ManagerID
	  UNION ALL
	  SELECT E.EmployeeID, E.ManagerID, E.FirstName, E.LastName
	  FROM Employees14 AS E
	  JOIN EmployeeHierarchy AS EH ON E.ManagerID = EH.EmployeeID)

SELECT * FROM EmployeeHierarchy;

--7.Use a CTE to calculate the sales difference between the current month and the previous month.
;WITH MonthlySales AS (
    SELECT 
        EmployeeID, 
        DATEFROMPARTS(YEAR(SaleDate), MONTH(SaleDate), 1) AS SalesMonth,
        SUM(SalesAmount) AS TotalSales
    FROM Sales14
    GROUP BY EmployeeID, YEAR(SaleDate), MONTH(SaleDate)
)
SELECT 
    A.EmployeeID, 
    A.SalesMonth, 
    A.TotalSales, 
    A.TotalSales - COALESCE(B.TotalSales, 0) AS SalesDifference 
FROM MonthlySales AS A
LEFT JOIN MonthlySales AS B 
    ON A.EmployeeID = B.EmployeeID 
    AND A.SalesMonth = DATEADD(MONTH, 1, B.SalesMonth);


--8.Create a derived table to find the employees who have made the highest sales in each department.
SELECT E.EmployeeID, E.FirstName, E.LastName, E.DepartmentID, BestSellers.MaxSales
FROM Employees14 AS E
JOIN (
    SELECT E.DepartmentID, MAX(S.SalesAmount) AS MaxSales
    FROM Sales14 AS S
	JOIN Employees14 AS E ON S.EmployeeID = E.EmployeeID
    GROUP BY DepartmentID
) AS BestSellers ON E.DepartmentID = BestSellers.DepartmentID;


--9.Write a recursive CTE to find all the ancestors of an employee in a hierarchical organization.
DECLARE @EmployeeID INT = 6
;WITH Ancestors AS (
    SELECT EmployeeID, ManagerID, FirstName, LastName
    FROM Employees14
    WHERE EmployeeID = @EmployeeID  

    UNION ALL

    SELECT e.EmployeeID, e.ManagerID, e.FirstName, e.LastName
    FROM Employees14 e
    JOIN Ancestors a ON e.EmployeeID = a.ManagerID
)
SELECT * FROM Ancestors;

--10.Use a CTE to find employees who have not sold anything in the last year.
;WITH LastYearSales AS (
    SELECT DISTINCT EmployeeID
    FROM Sales14
    WHERE SaleDate >= DATEADD(YEAR, -1, GETDATE())
)
SELECT E.EmployeeID, E.FirstName, E.LastName
FROM Employees14 AS E
LEFT JOIN LastYearSales AS S ON E.EmployeeID = S.EmployeeID
WHERE S.EmployeeID IS NULL;

--11.Write a query using a derived table to calculate the total sales per region and year.
SELECT S.RegionID, YEAR(S.SaleDate) AS SalesYear, S.TotalSales 
FROM (SELECT RegionID, SaleDate, SUM(SalesAmount) AS TotalSales
      FROM Sales14
	  GROUP BY RegionID, SaleDate) AS S 

--12.Use a recursive CTE to calculate the factorial of a number.
;WITH FindFactorial AS (
      SELECT 1 AS NUM, 1 AS FACT
	  UNION ALL 
	  SELECT NUM +1, FACT * (NUM + 1) 
	  FROM FindFactorial
	  WHERE NUM < 10)
SELECT * FROM FindFactorial

--13.Write a query using a derived table to find customers with more than 10 orders.
SELECT C.CustomerID, C.CustomerName, O.TotalOrders
FROM Customers14 AS C
JOIN (SELECT CustomerID, COUNT(OrderID) AS TotalOrders 
      FROM Orders14 
	  GROUP BY CustomerID
	  HAVING COUNT(OrderID) > 10) AS O ON O.CustomerID = C.CustomerID

--14.Create a recursive CTE to traverse a product category hierarchy.
CREATE TABLE Categories14 (
    CategoryID INT PRIMARY KEY IDENTITY(1,1),
    CategoryName VARCHAR(100) NOT NULL,
    Description TEXT NULL
);
INSERT INTO Categories14 (CategoryName, Description) VALUES
('Electronics', 'All kinds of electronic gadgets and devices'),
('Clothing', 'Men and women fashion clothing'),
('Home Appliances', 'Appliances for home use'),
('Books', 'Various genres of books and novels'),
('Sports', 'Sports equipment and accessories');
ALTER TABLE Categories14
ADD ParentCategoryID INT NULL;
ALTER TABLE Categories14
ADD CONSTRAINT FK_Categories_Parent FOREIGN KEY (ParentCategoryID) REFERENCES Categories14(CategoryID);


;WITH CategoryHierarchyCTE AS (
      SELECT CategoryID, ParentCategoryID, CategoryName
	  FROM Categories14
	  WHERE  ParentCategoryID IS NULL 
	  UNION ALL
	  SELECT C.CategoryID, C. ParentCategoryID, C.CategoryName
	  FROM Categories14 AS C
	  JOIN CategoryHierarchyCTE AS CHC ON C. ParentCategoryID = CHC.CategoryID)
SELECT * FROM CategoryHierarchyCTE;

--15. Use a CTE to rank products based on total sales in the last year.
;WITH ProductRank AS (
      SELECT ProductID, SUM(SalesAmount) AS TotalSales,
	  RANK() OVER (ORDER BY SUM(SalesAmount) DESC) AS Rank
	  FROM Sales14 
	  WHERE SaleDate >= DATEADD(YEAR, -1, GETDATE())
	  GROUP BY ProductID)
SELECT * FROM ProductRank


--16.Write a query using a derived table to find the sales per product category.
ALTER TABLE Products14
ADD CategoryID INT;
ALTER TABLE Products14
ADD CONSTRAINT FK_Products_Categories
FOREIGN KEY (CategoryID) REFERENCES Categories14(CategoryID);

SELECT C.CategoryID, C.CategoryName, S.TotalSales
FROM Categories14 AS C
JOIN (SELECT P.CategoryID, SUM(S.SalesAmount) AS TotalSales
      FROM Sales14 AS S 
	  JOIN Products14 AS P ON P.ProductID = S.ProductID
	  GROUP BY P.CategoryID) AS S ON C.CategoryID = S.CategoryID;

--17.Use a CTE to find the employees who achieved the highest sales growth compared to last year.
;WITH SalesGrowth AS (
      SELECT EmployeeID, YEAR(SaleDate) AS SalesYear, SUM(SalesAmount) AS TotalSales
	  FROM Sales14 
	  GROUP BY EmployeeID, YEAR(SaleDate))
SELECT SG1.EmployeeID, SG1.SalesYear, SG1.TotalSales, SG1.TotalSales - COALESCE(SG2.TotalSales, 0) AS SalesGrowth
FROM SalesGrowth AS SG1
LEFT JOIN SalesGrowth SG2
ON SG1.EmployeeID = SG2.EmployeeID AND SG1.SalesYear = SG2.SalesYear + 1
ORDER BY SalesGrowth DESC;

--18.Create a derived table to find employees with sales over $5000 in each quarter.
SELECT E.EmployeeID, E.FirstName, E.LastName, SQ.Quarter, SQ.Totalsales
FROM Employees14 AS E
JOIN (SELECT EmployeeID, CONCAT(YEAR(SaleDate), '-Q', DATEPART(QUARTER, SaleDate)) AS Quarter, 
             SUM(SalesAmount) AS Totalsales
      FROM Sales14
	  GROUP BY EmployeeID, YEAR(SaleDate), DATEPART(QUARTER, SaleDate)
	  HAVING  SUM(SalesAmount) > 5000) AS SQ ON E.EmployeeID = SQ.EmployeeID;

--19.Write a recursive CTE to list all descendants of a product in a product category tree.
;WITH Categoryhierarchy as (
      SELECT CategoryID, ParentCategoryID, CategoryName
	  FROM Categories14
	  WHERE ParentCategoryID IS NULL
	  UNION ALL
	  SELECT C.CategoryID, C.ParentCategoryID, C.CategoryName
	  FROM Categories14 AS C 
	  JOIN Categoryhierarchy AS CH ON C.ParentCategoryID = CH.CategoryID)
SELECT * FROM Categoryhierarchy;

--20.Use a derived table to find the top 3 employees by total sales amount in the last month.
SELECT 
FROM Employees14 AS E 
JOIN (SELECT TOP 3 EmployeeID, SUM(SalesAmount) AS TotalSales
      FROM Sales14 
	  GROUP BY EmployeeID
	  ORDER BY TotalSales DESC) AS S ON E.EmployeeID = S.EmployeeID;

--Difficult Tasks (20)
--1.Write a recursive CTE to generate the Fibonacci sequence up to the 20th term.
;WITH Fibonacci (n, Fib1, Fib2) AS (
      SELECT 1, 0, 1
	  UNION ALL
	  SELECT n + 1, Fib2, Fib1 + Fib2
	  FROM Fibonacci 
	  WHERE n < 20)
SELECT n, Fib1 AS FibonacciNumber FROM Fibonacci;

--2.Use a CTE to calculate the cumulative sales of employees over the past year.
;WITH EmployeeSales AS (
      SELECT EmployeeID, SUM(SalesAmount) AS TotalSales
	  FROM Sales14
	  WHERE SaleDate >= DATEADD(YEAR, -1, GETDATE())
	  GROUP BY EmployeeID
	  )
SELECT * FROM EmployeeSales;

--3.Write a CTE to find all subordinates of a manager in a hierarchical company structure.
DECLARE @MANID INT = 1
;WITH EmpHierarchyCTE AS (
      SELECT EmployeeID, ManagerID, FirstName, LastName
	  FROM Employees14
	  WHERE ManagerID = @MANID
	  UNION ALL 
	  SELECT E.EmployeeID, E.ManagerID, E.FirstName, E.LastName
	  FROM Employees14 AS E
	  JOIN EmpHierarchyCTE AS EH ON E.ManagerID = EH.EmployeeID)
SELECT * FROM EmpHierarchyCTE


--4.Create a query using a derived table to find employees with sales above the company average for each region.
ALTER TABLE Employees14 
ADD RegionID INT;
ALTER TABLE Employees14 
ADD CONSTRAINT FK_Employees_Regions 
FOREIGN KEY (RegionID) REFERENCES Regions14(RegionID);

SELECT E.EmployeeID, E.FirstName, E.LastName, R.RegionName, ES.TotalSales
FROM Employees14 AS E
JOIN Regions14 AS R ON E.RegionID = R.RegionID
JOIN (SELECT EmployeeID, RegionID, SUM(SalesAmount) AS TotalSales
      FROM Sales14 
	  GROUP BY EmployeeID, RegionID) AS ES ON E.EmployeeID = ES.EmployeeID
JOIN (SELECT RegionID, AVG(SUM(SalesAmount)) OVER (PARTITION BY RegionID) AS AvgSales
      FROM Sales14
	  GROUP BY RegionID) AS AVGS ON ES.RegionID = AVGS.RegionID
WHERE ES.TotalSales > AVGS.AvgSales

--5.Write a recursive CTE to calculate the depth of a product in a multi-level product hierarchy.
;WITH CategoryDepth AS (
      SELECT CategoryID, ParentCategoryID, 1 AS Depth
	  FROM Categories14 
	  WHERE ParentCategoryID IS NULL
	  UNION ALL
	  SELECT C.CategoryID, C.ParentCategoryID, CD.Depth + 1
	  FROM Categories14 AS C 
	  JOIN CategoryDepth AS CD ON C.ParentCategoryID = CD.CategoryID )
SELECT * FROM CategoryDepth;
--6.Create a complex query that uses both a CTE and a derived table to calculate sales totals for each department and product.
ALTER TABLE Departments14 
ADD ParentDepartmentID INT;
 ALTER TABLE Departments14 
ADD CONSTRAINT FK_Departments_Parent 
FOREIGN KEY (ParentDepartmentID) REFERENCES Departments14(DepartmentID);

WITH DepartmentSales AS (
    SELECT e.DepartmentID, s.ProductID, SUM(s.SalesAmount) AS TotalSales
    FROM Sales14 as s
	JOIN Employees14 as e on s.EmployeeID = e.EmployeeID
    GROUP BY DepartmentID, ProductID
)
SELECT d.DepartmentName, ds.ProductID, ds.TotalSales
FROM DepartmentSales ds
JOIN Departments14 d ON ds.DepartmentID = d.DepartmentID;

--7.Use a recursive CTE to list all direct and indirect reports of a specific manager.
declare @Manager7ID INT = 1
;WITH Reports AS (
    SELECT EmployeeID, ManagerID FROM Employees14 WHERE ManagerID = @Manager7ID
    UNION ALL
    SELECT e.EmployeeID, e.ManagerID
    FROM Employees14 e
    INNER JOIN Reports r ON e.ManagerID = r.EmployeeID
)
SELECT * FROM Reports;

--8.Write a query using a derived table to find the employees who have made the most sales in the last 6 months.
SELECT EmployeeID, Totalsales
FROM (SELECT EmployeeID, SUM(SalesAmount) AS Totalsales
      FROM Sales14 
	  WHERE SaleDate > =  DATEADD(MONTH, -6, GETDATE())
	  GROUP BY EmployeeID) AS SalesData
ORDER BY Totalsales desc
--9.Create a recursive CTE to calculate the total cost of an order, including taxes and discounts.
CREATE TABLE OrderDetails14 (
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10,2),
    PRIMARY KEY (OrderID, ProductID)
);
INSERT INTO OrderDetails14 (OrderID, ProductID, Quantity, Price) 
VALUES 
(1, 101, 2, 15.50),
(1, 102, 1, 25.00),
(2, 103, 5, 7.75),
(3, 101, 3, 15.50),
(3, 104, 2, 18.20),
(4, 102, 4, 25.00);

CREATE TABLE Taxes14 (
    ProductID INT PRIMARY KEY,
    TaxRate DECIMAL(5,2),      
    DiscountRate DECIMAL(5,2)  
);
INSERT INTO Taxes14 (ProductID, TaxRate, DiscountRate) 
VALUES 
(101, 0.10, 0.05), -- 10% soliq, 5% chegirma
(102, 0.08, 0.02), -- 8% soliq, 2% chegirma
(103, 0.07, 0.03), -- 7% soliq, 3% chegirma
(104, 0.12, 0.04); -- 12% soliq, 4% chegirma

;WITH OrderCost AS (
    SELECT OrderID, ProductID, CAST(Quantity * Price AS DECIMAL(18, 2)) AS BaseCost, 1 AS Level FROM OrderDetails14
    UNION ALL
    SELECT oc.OrderID, oc.ProductID, CAST(oc.BaseCost * (1 + TaxRate - DiscountRate) AS DECIMAL(18, 2)), Level + 1
    FROM OrderCost oc
    JOIN Taxes14 t ON oc.ProductID = t.ProductID
	WHERE oc.Level < 10
)
SELECT * FROM OrderCost;

--10.Use a CTE to find the employees with the largest sales growth rate over the past year.
WITH SalesGrowth AS (
    SELECT EmployeeID, 
	       (SUM(SalesAmount) - LAG(SUM(SalesAmount)) OVER (PARTITION BY EmployeeID ORDER BY YEAR(SaleDate))) / 
		   NULLIF(LAG(SUM(SalesAmount)) OVER (PARTITION BY EmployeeID ORDER BY YEAR(SaleDate)), 0) AS GrowthRate
    FROM Sales14
    GROUP BY EmployeeID, YEAR(SaleDate) 
)
SELECT * FROM SalesGrowth ORDER BY GrowthRate DESC;
--11.Write a recursive CTE to calculate the total number of sales for each employee over all years.
WITH TotalSales AS (
    SELECT EmployeeID, SUM(SalesAmount) AS SalesTotal 
	FROM Sales14 
	GROUP BY EmployeeID
)
SELECT * FROM TotalSales;
--12.Create a query using both a CTE and a derived table to find the highest-selling product and the employee who sold it.
WITH ProductSales AS (
    SELECT ProductID, SUM(SalesAmount) AS TotalSales 
	FROM Sales14 
	GROUP BY ProductID
)
SELECT ps.ProductID, e.EmployeeID, e.SalesAmount
FROM ProductSales ps
JOIN Sales14 e ON ps.ProductID = e.ProductID
WHERE ps.TotalSales = (SELECT MAX(TotalSales) FROM ProductSales);
--13.Write a recursive CTE to calculate all the generations of an organization’s hierarchy.
WITH OrgHierarchy AS (
    SELECT EmployeeID, ManagerID, 1 AS Level 
	FROM Employees14 
	WHERE ManagerID IS NULL
    UNION ALL
    SELECT e.EmployeeID, e.ManagerID, oh.Level + 1
    FROM Employees14 e
    JOIN OrgHierarchy oh ON e.ManagerID = oh.EmployeeID
)
SELECT * FROM OrgHierarchy;
--14.Use a CTE to find all employees who made sales greater than the average of their department’s sales.
WITH DeptAvg AS (
    SELECT E.DepartmentID, AVG(S.SalesAmount) AS AvgSales 
	FROM Employees14 AS E
	JOIN Sales14 AS S ON E.EmployeeID = S.EmployeeID
	GROUP BY DepartmentID
)
SELECT e.* FROM Employees14 e
JOIN Sales14 AS S ON E.EmployeeID = S.EmployeeID
JOIN DeptAvg d ON e.DepartmentID = d.DepartmentID 
WHERE S.SalesAmount > d.AvgSales;


--15.Create a derived table to find the average sales per employee by region, considering only employees who made sales.
SELECT RegionID, AVG(SalesAmount) AS AvgSalesPerEmployee 
FROM (SELECT EmployeeID, RegionID, 
             SUM(SalesAmount) AS SalesAmount FROM Sales14 
	  GROUP BY EmployeeID, RegionID
) salesData GROUP BY RegionID;

--16.Write a recursive CTE to identify employees with a direct or indirect report relationship to a specific manager.
DECLARE @Manager16ID INT = 1
;WITH EmployeeTree AS (
    SELECT EmployeeID, ManagerID 
	FROM Employees14 WHERE ManagerID = @Manager16ID
    UNION ALL
    SELECT e.EmployeeID, e.ManagerID 
	FROM Employees14 e 
	JOIN EmployeeTree et ON e.ManagerID = et.EmployeeID
)
SELECT * FROM EmployeeTree;
--17.Use a CTE to calculate the average number of products sold by each employee in the last year.
WITH AvgProductsSold AS (
    SELECT EmployeeID, AVG(Quantity) AS AvgProducts 
	FROM Sales14 
	WHERE SaleDate >= DATEADD(YEAR, -1, GETDATE()) 
	GROUP BY EmployeeID
)
SELECT * FROM AvgProductsSold;

--18.Write a query using both a derived table and a CTE to analyze sales performance by employee and product category.

;WITH SalesData AS (
    SELECT S.EmployeeID, P.ProductName, SUM(S.SalesAmount) AS TotalSales 
	FROM Sales14 AS S
	JOIN Products14 AS P ON S.ProductID = P.ProductID
	GROUP BY S.EmployeeID, P.ProductName
)
SELECT * FROM SalesData;
--19.Use a recursive CTE to list all departments reporting to a specific parent department in a multi-level organizational structure.
DECLARE  @ParentDepartmentID INT = NULL
WITH DeptHierarchy AS (
    SELECT DepartmentID, ParentDepartmentID 
	FROM Departments14 
	WHERE ParentDepartmentID = @ParentDepartmentID
    UNION ALL
    SELECT d.DepartmentID, d.ParentDepartmentID 
	FROM Departments14 d 
	JOIN DeptHierarchy dh ON d.ParentDepartmentID = dh.DepartmentID
)
SELECT * FROM  DeptHierarchy;
--20.Write a recursive CTE to calculate the number of levels in a product category hierarchy, where each category can have subcategories.
WITH CategoryLevels AS (
    SELECT CategoryID, ParentCategoryID, 1 AS Level 
	FROM Categories14 
	WHERE ParentCategoryID IS NULL
    UNION ALL
    SELECT c.CategoryID, c.ParentCategoryID, cl.Level + 1 
	FROM Categories14 c 
	JOIN CategoryLevels cl ON c.ParentCategoryID = cl.CategoryID
)
SELECT MAX(Level) AS MaxHierarchyDepth FROM CategoryLevels;