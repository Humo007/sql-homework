--SQL Homework Tasks: Window Functions & Cumulative Calculations
--Lesson 20: Aggregated Window Functions
--1. Sales Table
CREATE TABLE Sales20 (
    SalesID INT PRIMARY KEY,
    EmployeeID INT,
    ProductID INT,
    SalesAmount DECIMAL(10, 2),
    SaleDate DATE
);

INSERT INTO Sales20 (SalesID, EmployeeID, ProductID, SalesAmount, SaleDate) VALUES
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
--2. Employees Table
CREATE TABLE Employees20 (
    EmployeeID INT PRIMARY KEY,
    DepartmentID INT,
    Salary DECIMAL(10, 2),
    EmployeeName VARCHAR(100)
);

INSERT INTO Employees20 (EmployeeID, DepartmentID, Salary, EmployeeName) VALUES
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
--3. Products Table
CREATE TABLE Products20 (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2)
);

INSERT INTO Products20 (ProductID, ProductName, Price) VALUES
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
(37, 'Ring', 50.00), 
(38, 'Necklace', 80.00),
(39, 'Earrings', 30.00), 
(40, 'Bracelet', 20.00);

--4. Orders Table

CREATE TABLE Orders20 (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderAmount DECIMAL(10, 2),
    OrderDate DATE
);

INSERT INTO Orders20 (OrderID, CustomerID, OrderAmount, OrderDate) VALUES
(1, 1, 550.00, '2025-01-01'),
(2, 2, 700.00, '2025-01-02'),
(3, 3, 450.00, '2025-01-03'),
(4, 4, 800.00, '2025-01-04'),
(5, 5, 1200.00, '2025-01-05'),
(6, 6, 950.00, '2025-01-06'),
(7, 7, 700.00, '2025-01-07'),
(8, 8, 600.00, '2025-01-08'),
(9, 9, 800.00, '2025-01-09'),
(10, 10, 700.00, '2025-01-10'),
(11, 11, 650.00, '2025-01-11'),
(12, 12, 550.00, '2025-01-12'),
(13, 13, 450.00, '2025-01-13'),
(14, 14, 600.00, '2025-01-14'),
(15, 15, 550.00, '2025-01-15'),
(16, 16, 600.00, '2025-01-16'),
(17, 17, 800.00, '2025-01-17'),
(18, 18, 1000.00, '2025-01-18'),
(19, 19, 700.00, '2025-01-19'),
(20, 20, 600.00, '2025-01-20'),
(21, 21, 500.00, '2025-01-21'),
(22, 22, 450.00, '2025-01-22'),
(23, 23, 700.00, '2025-01-23'),
(24, 24, 650.00, '2025-01-24'),
(25, 25, 600.00, '2025-01-25'),
(26, 26, 700.00, '2025-01-26'),
(27, 27, 800.00, '2025-01-27'),
(28, 28, 950.00, '2025-01-28'),
(29, 29, 1000.00, '2025-01-29'),
(30, 30, 700.00, '2025-01-30'),
(31, 31, 600.00, '2025-02-01'),
(32, 32, 550.00, '2025-02-02'),
(33, 33, 450.00, '2025-02-03'),
(34, 34, 600.00, '2025-02-04'),
(35, 35, 650.00, '2025-02-05'),
(36, 36, 700.00, '2025-02-06'),
(37, 37, 800.00, '2025-02-07'),
(38, 38, 750.00, '2025-02-08'),
(39, 39, 900.00, '2025-02-09'),
(40, 40, 950.00, '2025-02-10');

--1.Write a query to calculate the running total of SalesAmount for each product in the Sales table, ordered by SaleDate.

SELECT *, SUM(SalesAmount) OVER(PARTITION BY ProductID ORDER BY SaleDate) AS RunningSalas
FROM Sales20

--2.Write a query to find the running total of OrderAmount in the Orders table, partitioned by CustomerID.
SELECT *, SUM(OrderAmount) OVER(PARTITION BY CustomerID ORDER BY OrderDate) AS RunningOrderAmount
FROM Orders20

--3.Use the LEAD() function to retrieve the next row's Amount for each product in the Sales table.
SELECT *, LEAD(SalesAmount) OVER(PARTITION BY ProductID ORDER BY SaleDate) AS NextSalesAmount
FROM Sales20

--4.Use ROW_NUMBER() to assign a unique row number to each employee in the Employees table, ordered by Salary.
SELECT *, ROW_NUMBER() OVER(ORDER BY Salary) AS RowNum
FROM Employees20 

--5.Write a query using SUM() to calculate the cumulative sum of SalesAmount for each employee in the Sales table.
SELECT *, SUM(SalesAmount) OVER(PARTITION BY EmployeeID ORDER BY SaleDate) AS RunningSales
FROM Sales20

--6.Write a query to find the top 10% of orders in the Orders table based on OrderAmount using the NTILE() function.
SELECT *FROM (SELECT * , NTILE(10) OVER(ORDER BY OrderAmount DESC) AS ORDERGROUP
FROM Orders20) AS A
WHERE ORDERGROUP = 1

--7.Use DENSE_RANK() to identify the products with the top 5 highest SalesAmount in the Products table, ignoring ties.
SELECT TOP 5* FROM (SELECT * , DENSE_RANK() OVER(ORDER BY SalesAmount DESC) AS RNK 
FROM Sales20) AS A

--8.Write a query using COUNT() to calculate the number of orders per customer in the Orders table.
SELECT *, COUNT(OrderID) OVER(PARTITION BY CustomerID) OrderCount
FROM Orders20

--9.Write a query to compute the cumulative sales total for each employee and product in the Sales table.
SELECT *, SUM(SalesAmount) OVER(PARTITION BY EmployeeID ORDER BY SaleDate) AS RUNNINGSALES
FROM Sales20


--10.Write a query to partition the Sales table by StoreID and calculate the cumulative total of SalesAmount for each store.
SELECT * , SUM(SalesAmount) OVER(ORDER BY SaleDate) AS RUNNINGSALES
FROM Sales20