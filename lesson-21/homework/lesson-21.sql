--Lesson 21 Homework

--MERGE Practice
-- Employees (target)
--Task 1: Basic MERGE Operation
CREATE TABLE Employees21 (
    EmployeeID INT PRIMARY KEY,
    Name NVARCHAR(100),
    Position NVARCHAR(100),
    Salary DECIMAL(10,2)
);

-- NewEmployees (source)
CREATE TABLE NewEmployees21 (
    EmployeeID INT PRIMARY KEY,
    Name NVARCHAR(100),
    Position NVARCHAR(100),
    Salary DECIMAL(10,2)
);

-- Employees jadvaliga ma'lumotlar kiritish
INSERT INTO Employees21 (EmployeeID, Name, Position, Salary) VALUES
(1, 'Alice Johnson', 'Manager', 60000),
(2, 'Bob Smith', 'Developer', 50000),
(3, 'Charlie Brown', 'Analyst', 45000);

-- NewEmployees jadvaliga ma'lumotlar kiritish
INSERT INTO NewEmployees21 (EmployeeID, Name, Position, Salary) VALUES
(2, 'Bob Smith', 'Senior Developer', 55000),  
(3, 'Charlie Brown', 'Analyst', 50000),      
(4, 'David Wilson', 'Designer', 48000);       
UPDATE NewEmployees21
SET Position = 'Lead Developer', Salary = 60000
WHERE EmployeeID = 2;

UPDATE NewEmployees21
SET Position = 'Senior Analyst', Salary = 55000
WHERE EmployeeID = 3;

--Scenario: You have two tables, Employees (target) and NewEmployees (source). You need to:

--Use the MERGE statement to update Employees where EmployeeID matches.

--Insert new records from NewEmployees into Employees where no match is found.
SELECT * FROM Employees21
SELECT * FROM NewEmployees21

MERGE INTO Employees21 AS E
USING NewEmployees21 AS NE
ON E.EmployeeID = NE.EmployeeID
WHEN MATCHED THEN 
     UPDATE SET E.Name = NE.Name,
	            E.Position = NE.Position,
				E.Salary = NE.Salary
WHEN NOT MATCHED THEN 
     INSERT (EmployeeID, Name, Position, Salary)
	 VALUES (NE.EmployeeID, NE.Name, NE.Position, NE.Salary);


--Task 2: Delete Records with MERGE

CREATE TABLE OldProducts (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(100),
    Price DECIMAL(10,2)
);


CREATE TABLE CurrentProducts (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(100),
    Price DECIMAL(10,2)
);

INSERT INTO OldProducts (ProductID, ProductName, Price) VALUES
(1, 'Laptop', 1200),
(2, 'Phone', 800),
(3, 'Tablet', 500),
(4, 'Smartwatch', 300);

INSERT INTO CurrentProducts (ProductID, ProductName, Price) VALUES
(1, 'Laptop', 1100), 
(2, 'Phone', 850),
(3, 'Tablet', 500);

--Scenario: You have two tables, OldProducts (target) and CurrentProducts (source). You need to:

--Use the MERGE statement to delete records from OldProducts where the ProductID does not exist in CurrentProducts.
SELECT * FROM OldProducts
SELECT * FROM CurrentProducts
 MERGE INTO OldProducts AS OP
 USING CurrentProducts AS CP
 ON OP.ProductID = CP.ProductID
 WHEN MATCHED THEN
      UPDATE SET OP.ProductName = CP.ProductName, 
	             OP.Price = CP.Price
WHEN NOT MATCHED THEN 
      INSERT (ProductID, ProductName, Price)
	  VALUES (CP.ProductID, CP.ProductName, CP.Price)
WHEN NOT MATCHED BY SOURCE THEN DELETE;
     

--Task 3: MERGE with Conditional Updates
CREATE TABLE NewSalaryDetails (
    EmployeeID INT PRIMARY KEY,
    NewSalary DECIMAL(10,2)
);

INSERT INTO NewSalaryDetails (EmployeeID, NewSalary) VALUES
(1, 65000),  
(2, 52000),  
(3, 44000);  
--Scenario: You have two tables, Employees (target) and NewSalaryDetails (source). You need to:

--Use the MERGE statement to update the salary of employees only if the new salary is greater than the existing salary.

SELECT * FROM Employees21
SELECT * FROM NewSalaryDetails

 MERGE INTO Employees21 AS E
 USING NewSalaryDetails AS NSD
 ON E.EmployeeID = NSD.EmployeeID
 WHEN MATCHED AND E.Salary < NSD.NewSalary THEN
      UPDATE SET E.Salary = NSD.NewSalary;

--Task 4: MERGE with Multiple Conditions

--Scenario: You have two tables, Orders (target) and NewOrders (source). You need to:

--Use the MERGE statement to update OrderAmount for existing orders.

--Insert new orders where the OrderID does not exist in the target.

--Ensure the update happens only if the CustomerID is the same and the new OrderAmount is greater than the existing one.

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderAmount DECIMAL(10,2)
);


CREATE TABLE NewOrders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderAmount DECIMAL(10,2)
);


INSERT INTO Orders (OrderID, CustomerID, OrderAmount) VALUES
(1, 101, 150),
(2, 102, 200),
(3, 103, 250);


INSERT INTO NewOrders (OrderID, CustomerID, OrderAmount) VALUES
(2, 102, 220), 
(3, 104, 260),  
(4, 105, 180);  

SELECT * FROM Orders 
SELECT * FROM NewOrders

MERGE INTO Orders AS O
USING NewOrders AS NWO
ON O.OrderID = NWO.OrderID
WHEN MATCHED AND O.CustomerID = NWO.CustomerID 
     AND O.OrderAmount < NWO.OrderAmount THEN 
     UPDATE SET O.OrderAmount = NWO.OrderAmount
WHEN NOT MATCHED THEN
     INSERT (OrderID, CustomerID, OrderAmount)
	 VALUES (NWO.OrderID, NWO.CustomerID, NWO.OrderAmount);


--Task 5: MERGE with Data Validation and Logging

--Scenario: You have three tables: StudentRecords (target), NewStudentRecords (source), and MergeLog (logging table). You need to:

--Insert new student records into StudentRecords if Age > 18.

--Log the insertion or update action in the MergeLog table.

CREATE TABLE StudentRecords (
    StudentID INT PRIMARY KEY,
    Name NVARCHAR(100),
    Age INT,
    Grade NVARCHAR(10)
);


CREATE TABLE NewStudentRecords (
    StudentID INT PRIMARY KEY,
    Name NVARCHAR(100),
    Age INT,
    Grade NVARCHAR(10)
);

CREATE TABLE MergeLog (
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    StudentID INT,
    ActionType NVARCHAR(50),
    ActionDate DATETIME DEFAULT GETDATE()
);

INSERT INTO StudentRecords (StudentID, Name, Age, Grade) VALUES
(1, 'John Doe', 20, 'A'),
(2, 'Jane Smith', 17, 'B'),
(3, 'Mike Johnson', 19, 'C');


INSERT INTO NewStudentRecords (StudentID, Name, Age, Grade) VALUES
(2, 'Jane Smith', 18, 'A'), 
(3, 'Mike Johnson', 19, 'B'),
(4, 'Sarah Brown', 22, 'A'); 

SELECT * FROM StudentRecords
SELECT * FROM NewStudentRecords
SELECT * FROM MergeLog

MERGE INTO StudentRecords AS SR
USING NewStudentRecords AS NSR
ON SR.StudentID = NSR.StudentID
WHEN MATCHED THEN 
     UPDATE SET SR.Name = NSR.Name,
	            SR.Age = NSR.Age,
				SR.Grade = NSR.Grade
WHEN NOT MATCHED AND NSR.Age > 18 THEN 
INSERT (StudentID, Name, Age, Grade) 
VALUES (NSR.StudentID, NSR.Name, NSR.Age, NSR.Grade) 
OUTPUT COALESCE(inserted.StudentID, deleted.StudentID) as StudentID,
     CASE 
	   WHEN inserted.StudentID IS NOT NULL AND deleted.StudentID IS NOT NULL THEN 'UPDATE'
	   WHEN inserted.StudentID IS NOT NULL AND deleted.StudentID IS  NULL THEN 'INSERT'
     END AS ActionType, GETDATE()AS ActionDate
INTO MergeLog (StudentID, ActionType, ActionDate);
  


-----

--View and Function Practice
-- Customers jadvali
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Orders jadvali
CREATE TABLE OrdersV (
    OrderID INT PRIMARY KEY,
    CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID),
    OrderAmount DECIMAL(10,2)
);

-- Employees jadvali
CREATE TABLE EmployeesV (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT FOREIGN KEY REFERENCES Departments(DepartmentID)
);

-- Departments jadvali
CREATE TABLE DepartmentsV (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);

-- Products jadvali
CREATE TABLE ProductsV (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Stock INT
);

-- Sales jadvali
CREATE TABLE SalesV (
    SaleID INT PRIMARY KEY,
    CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID),
    SaleAmount DECIMAL(10,2)
);



-- Customers jadvali uchun ma'lumotlar
INSERT INTO Customers (CustomerID, CustomerName)
VALUES 
    (1, 'Ali Valiyev'),
    (2, 'Hasan Karimov'),
    (3, 'Olim Bobomurodov');

-- Orders jadvali uchun ma'lumotlar
INSERT INTO OrdersV (OrderID, CustomerID, OrderAmount)
VALUES 
    (101, 1, 150.00),
    (102, 2, 300.50),
    (103, 3, 450.75),
    (104, 1, 200.00);

-- Departments jadvali uchun ma'lumotlar
INSERT INTO DepartmentsV (DepartmentID, DepartmentName)
VALUES 
    (1, 'HR'),
    (2, 'IT'),
    (3, 'Sales');

-- Employees jadvali uchun ma'lumotlar
INSERT INTO EmployeesV (EmployeeID, FirstName, LastName, DepartmentID)
VALUES 
    (1, 'Jamshid', 'Shukurov', 2),
    (2, 'Aziza', 'Karimova', 1),
    (3, 'Murod', 'Olimov', 3);

-- Products jadvali uchun ma'lumotlar
INSERT INTO ProductsV (ProductID, ProductName, Stock)
VALUES 
    (1, 'Laptop', 10),
    (2, 'Smartphone', 5),
    (3, 'Mouse', 20);

-- Sales jadvali uchun ma'lumotlar
INSERT INTO SalesV (SaleID, CustomerID, SaleAmount)
VALUES 
    (201, 1, 500.00),
    (202, 2, 750.00),
    (203, 3, 1200.00);

SELECT * FROM Customers
SELECT * FROM OrdersV
SELECT * FROM DepartmentsV
SELECT * FROM EmployeesV
SELECT * FROM ProductsV
SELECT * FROM SalesV

--Task 1: Aggregated Sales Summary

--Create a view named SalesSummary that shows the total sales amount and the number of orders for each customer.

;CREATE VIEW SalesSummary AS 
SELECT C.CustomerID, C.CustomerName, SUM(O.OrderAmount) AS TotalSales, COUNT(O.OrderID) AS NumberOfOrders 
FROM Customers AS C
LEFT JOIN OrdersV AS O ON C.CustomerID = O.CustomerID 
GROUP BY C.CustomerID, C.CustomerName

SELECT * FROM SalesSummary 
--Task 2: Employee Department Details

--Create a view named EmployeeDepartmentDetails that combines employee and department information.
;CREATE VIEW EmployeedepartDetails AS 
SELECT E.EmployeeID, E.FirstName, E.LastName, D.DepartmentName
FROM EmployeesV AS E
JOIN DepartmentsV AS D ON E.DepartmentID = D.DepartmentID
 SELECT * FROM EmployeedepartDetails
--Task 3: Product Inventory Status

--Create a view named InventoryStatus that shows product availability information.
CREATE VIEW InventoryStatus AS 
SELECT *, CASE 
              WHEN Stock = 0 THEN 'OUT OFF STOCK'
			  WHEN Stock < 7 THEN 'LOW STOCK'
              ELSE 'IN STOCK'
		  END AS StockStutus	  
FROM ProductsV
SELECT * FROM InventoryStatus
--Task 4: Simple Scalar Function

--Write a scalar function fn_GetFullName that concatenates a person's first and last name into a single string.
CREATE FUNCTION fn_GetFullName (
             @FirstName VARCHAR(50),
			 @LastName VARCHAR(50))
RETURNS VARCHAR(100)
AS 
BEGIN
    RETURN CONCAT(@FirstName, @LastName)
END;
SELECT DBO.fn_GetFullName('JHON' + ' ', 'DUE') AS FULLNAME

--Task 5: Inline Table-Valued Function

--Create an inline table-valued function fn_GetHighSales that returns sales above a given threshold.
CREATE FUNCTION fn_GetHighSales(@Threshold DECIMAL(10,2))
RETURNS TABLE
AS
RETURN (
       SELECT CustomerID, SaleAmount 
	   FROM SalesV
	   WHERE SaleAmount > @Threshold
);
SELECT * FROM dbo.fn_GetHighSales(700)

--Task 6: Multi-Statement Table-Valued Function

--Create a function fn_GetCustomerStats that calculates statistics for customers based on their transactions.
CREATE FUNCTION fn_GetCustomerStats()
RETURNS @CustomerStats TABLE(
        CustomerID int,
		TotalOrder int,
		TotalAmount DECIMAL(10,2)
)
AS 
BEGIN 
   INSERT INTO @CustomerStats 
   SELECT CustomerID, COUNT(OrderID) AS TotalOrder, SUM(OrderAmount) AS TotalAmount
   FROM OrdersV
   GROUP BY CustomerID
   RETURN
END;
SELECT * FROM dbo.fn_GetCustomerStats() 
-----

--Window Functions in SQL

--Task 1: Explaining the Importance of Window Functions

--Explain why window functions might be more efficient than using subqueries or temporary tables when calculating cumulative sales.

--Window functions can be more efficient than subqueries or temporary tables because they allow for better 
--optimization of calculations and data processing. Let's look at the reasons why:


--Task 2: Syntax of Window Functions

--Write an SQL query to calculate cumulative sales using the SUM window function.
SELECT E.EmployeeID, E.EmployeeName, E.Salary, D.DepartmentName,
       SUM(Salary) OVER(PARTITION BY D.DepartmentID) AS TOTALSALES
FROM Employees AS E
JOIN Departments AS D ON E.DepartmentID = D.DepartmentID


--Calculate the average salary for each department using window functions and compare with GROUP BY.
SELECT E.EmployeeID, E.EmployeeName, E.Salary, D.DepartmentName,
       AVG(Salary) OVER(PARTITION BY D.DepartmentID) AS AVGSALES
FROM Employees AS E
JOIN Departments AS D ON E.DepartmentID = D.DepartmentID

SELECT E.EmployeeID, E.EmployeeName, D.DepartmentName, AVG(Salary) AS AVGSALES
FROM Employees AS E
JOIN Departments AS D ON E.DepartmentID = D.DepartmentID
GROUP BY  E.EmployeeID, E.EmployeeName, D.DepartmentName


--Task 3: Partition By vs Group By

--Create a query using PARTITION BY to calculate cumulative revenue for each product category.

--Compare it with a query using GROUP BY.
SELECT *,
       SUM(Price) OVER(PARTITION BY ProductCategory ORDER BY Price ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS CumulativeRevenue
FROM Products

SELECT  ProductCategory, SUM(Price) AS CumulativeRevenue
FROM Products 
GROUP BY ProductCategory
ORDER BY ProductCategory
--Use PARTITION BY + ORDER BY if you need cumulative revenue tracking for each product within its category.
--Use GROUP BY if you only need total revenue per category and want a more efficient query.

--Task 4: ROW_NUMBER, RANK, and DENSE_RANK
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    TestScore INT
);
INSERT INTO Students (StudentID, StudentName, TestScore) VALUES
(1, 'Alice', 95),
(2, 'Bob', 87),
(3, 'Charlie', 95),
(4, 'David', 80),
(5, 'Eve', 87),
(6, 'Frank', 75);

--Use ROW_NUMBER to assign a unique rank to students based on test scores.

--Modify the query to use RANK and DENSE_RANK, then compare results.
SELECT *,
       ROW_NUMBER() OVER(ORDER BY TestScore desc) RowNum,
	   RANK() OVER(ORDER BY TestScore DESC) RNK,
	   DENSE_RANK() OVER(ORDER BY TestScore DESC) DenseRnk
FROM Students

--Task 5: LEAD and LAG Functions
CREATE TABLE StockPrices (
    StockID INT PRIMARY KEY,
    StockDate DATE,
    ClosingPrice DECIMAL(10,2)
);
INSERT INTO StockPrices (StockID, StockDate, ClosingPrice) VALUES
(1, '2024-03-10', 150.00),
(2, '2024-03-11', 152.50),
(3, '2024-03-12', 148.75),
(4, '2024-03-13', 155.00),
(5, '2024-03-14', 157.25);

--Use LAG to calculate the price change compared to the previous day in a stock prices table.

--Use LEAD to calculate the price change compared to the next day.
SELECT *,
       LAG(ClosingPrice) OVER(ORDER BY StockDate ) AS PreveviousPrice,
	   ISNULL(ClosingPrice - LAG(ClosingPrice) OVER(ORDER BY StockDate DESC), 0) AS ChangePreveviousPrice,
	   LEAD(ClosingPrice) OVER(ORDER BY StockDate) AS NextPrice,
	   ISNULL(ClosingPrice - LEAD(ClosingPrice) OVER(ORDER BY StockDate DESC), 0) AS ChangeNextPrice
FROM StockPrices

--Task 6: NTILE Function

CREATE TABLE Customers6 (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    TotalSpending DECIMAL(10,2)
);
INSERT INTO Customers6 (CustomerID, CustomerName, TotalSpending) VALUES
(1, 'Alice', 500.00),
(2, 'Bob', 1200.50),
(3, 'Charlie', 750.25),
(4, 'David', 1800.75),
(5, 'Eve', 950.00),
(6, 'Frank', 400.00),
(7, 'Grace', 2000.00),
(8, 'Hank', 850.00),
(9, 'Ivy', 650.00),
(10, 'Jack', 1100.00);

--Divide customers into 4 quartiles based on total spending using NTILE(4).

--Compare the distribution using NTILE(5) for quintiles.
SELECT * ,
       NTILE(4) OVER(ORDER BY TotalSpending desc) AS SpendingQuartile
FROM Customers6