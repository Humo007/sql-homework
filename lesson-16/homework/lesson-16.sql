--Lesson 16: View, Temp Tables, Temp Variables, Functions, Stored Procedures, Merge

--1. Orders Table

CREATE TABLE Purchases (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderAmount DECIMAL(10, 2),
    OrderDate DATE
);

INSERT INTO Purchases (OrderID, CustomerID, OrderAmount, OrderDate) VALUES
(1, 101, 250.00, '2025-01-01'),
(2, 102, 450.00, '2025-01-02'),
(3, 103, 120.00, '2025-01-03'),
(4, 104, 340.00, '2025-01-04'),
(5, 105, 500.00, '2025-01-05'),
(6, 106, 200.00, '2025-01-06'),
(7, 107, 750.00, '2025-01-07'),
(8, 108, 300.00, '2025-01-08'),
(9, 109, 600.00, '2025-01-09'),
(10, 110, 400.00, '2025-01-10'),
(11, 101, 250.00, '2025-01-11'),
(12, 102, 550.00, '2025-01-12'),
(13, 103, 350.00, '2025-01-13'),
(14, 104, 600.00, '2025-01-14'),
(15, 105, 200.00, '2025-01-15'),
(16, 106, 700.00, '2025-01-16'),
(17, 107, 450.00, '2025-01-17'),
(18, 108, 550.00, '2025-01-18'),
(19, 109, 500.00, '2025-01-19'),
(20, 110, 400.00, '2025-01-20'),
(21, 101, 700.00, '2025-01-21'),
(22, 102, 150.00, '2025-01-22'),
(23, 103, 600.00, '2025-01-23'),
(24, 104, 250.00, '2025-01-24'),
(25, 105, 550.00, '2025-01-25'),
(26, 106, 120.00, '2025-01-26'),
(27, 107, 600.00, '2025-01-27'),
(28, 108, 500.00, '2025-01-28'),
(29, 109, 450.00, '2025-01-29'),
(30, 110, 300.00, '2025-01-30'),
(31, 101, 350.00, '2025-02-01'),
(32, 102, 400.00, '2025-02-02'),
(33, 103, 600.00, '2025-02-03'),
(34, 104, 450.00, '2025-02-04'),
(35, 105, 300.00, '2025-02-05'),
(36, 106, 500.00, '2025-02-06'),
(37, 107, 400.00, '2025-02-07'),
(38, 108, 250.00, '2025-02-08'),
(39, 109, 650.00, '2025-02-09'),
(40, 110, 200.00, '2025-02-10');

--2. OrderDetails Table
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    UnitPrice DECIMAL(10, 2)
);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity, UnitPrice) VALUES
(1, 1, 101, 2, 50.00),
(2, 1, 102, 1, 100.00),
(3, 2, 103, 3, 150.00),
(4, 2, 104, 2, 150.00),
(5, 3, 105, 1, 120.00),
(6, 3, 106, 1, 100.00),
(7, 4, 107, 5, 50.00),
(8, 4, 108, 3, 60.00),
(9, 5, 109, 6, 75.00),
(10, 5, 110, 4, 125.00),
(11, 6, 101, 1, 50.00),
(12, 6, 102, 2, 100.00),
(13, 7, 103, 4, 75.00),
(14, 7, 104, 2, 150.00),
(15, 8, 105, 3, 80.00),
(16, 8, 106, 1, 100.00),
(17, 9, 107, 1, 200.00),
(18, 9, 108, 2, 50.00),
(19, 10, 109, 4, 150.00),
(20, 10, 110, 2, 125.00),
(21, 11, 101, 3, 50.00),
(22, 11, 102, 2, 100.00),
(23, 12, 103, 1, 150.00),
(24, 12, 104, 3, 150.00),
(25, 13, 105, 2, 120.00),
(26, 13, 106, 1, 100.00),
(27, 14, 107, 5, 50.00),
(28, 14, 108, 2, 60.00),
(29, 15, 109, 6, 75.00),
(30, 15, 110, 3, 125.00),
(31, 16, 101, 4, 50.00),
(32, 16, 102, 2, 100.00),
(33, 17, 103, 3, 150.00),
(34, 17, 104, 1, 150.00),
(35, 18, 105, 2, 120.00),
(36, 18, 106, 1, 100.00),
(37, 19, 107, 2, 200.00),
(38, 19, 108, 3, 50.00),
(39, 20, 109, 5, 75.00),
(40, 20, 110, 2, 125.00);

--3. Employees Table
CREATE TABLE Staff  (
    EmployeeID INT PRIMARY KEY,
    DepartmentID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Salary DECIMAL(10, 2)
);

INSERT INTO Staff (EmployeeID, DepartmentID, FirstName, LastName, Salary) VALUES
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
(23, 3,'Edward', 'Clark', 72000.00), (24, 4, 'Helen', 'Lewis', 79000.00), (25, 5, 'Brian', 'Young', 95000.00), (26, 1, 'Laura', 'Allen', 67000.00), (27, 2, 'James', 'King', 72000.00), (28, 3, 'Patricia', 'Scott', 78000.00), (29, 4, 'Michael', 'Adams', 80000.00), (30, 5, 'Mary', 'Baker', 85000.00), (31, 1, 'Steven', 'Gonzalez', 61000.00), (32, 2, 'Jessica', 'Nelson', 75000.00), (33, 3, 'Matthew', 'Carter', 71000.00), (34, 4, 'George', 'Mitchell', 80000.00), (35, 5, 'Ashley', 'Perez', 90000.00), (36, 1, 'Sarah', 'Roberts', 66000.00), (37, 2, 'Joshua', 'Evans', 77000.00), (38, 3, 'Nicholas', 'Gonzalez', 78000.00), (39, 4, 'Rachel', 'Kim', 85000.00), (40, 5, 'Alexander', 'Russell', 92000.00);


--4. Products Table
CREATE TABLE Items (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Category VARCHAR(50),
    Price DECIMAL(10, 2)
);

INSERT INTO Items (ProductID, ProductName, Category, Price) VALUES
(1, 'Laptop', 'Electronics', 800.00),
(2, 'Smartphone', 'Electronics', 600.00),
(3, 'Headphones', 'Electronics', 100.00),
(4, 'Keyboard', 'Electronics', 30.00),
(5, 'Mouse', 'Electronics', 20.00),
(6, 'Monitor', 'Electronics', 250.00),
(7, 'Printer', 'Electronics', 150.00),
(8, 'Tablet', 'Electronics', 350.00),
(9, 'Smartwatch', 'Electronics', 120.00),
(10, 'Speaker', 'Electronics', 50.00),
(11, 'Refrigerator', 'Appliances', 500.00),
(12, 'Washing Machine', 'Appliances', 400.00),
(13, 'Microwave', 'Appliances', 120.00),
(14, 'Blender', 'Appliances', 60.00),
(15, 'Air Conditioner', 'Appliances', 250.00),
(16, 'Hair Dryer', 'Appliances', 30.00),
(17, 'Vacuum Cleaner', 'Appliances', 150.00),
(18, 'Coffee Maker', 'Appliances', 90.00),
(19, 'Toaster', 'Appliances', 40.00),
(20, 'Iron', 'Appliances', 25.00),
(21, 'Shirt', 'Clothing', 30.00),
(22, 'Jeans', 'Clothing', 40.00),
(23, 'Jacket', 'Clothing', 60.00),
(24, 'Sweater', 'Clothing', 50.00),
(25, 'T-shirt', 'Clothing', 20.00),
(26, 'Shoes', 'Footwear', 80.00),
(27, 'Socks', 'Footwear', 10.00),
(28, 'Sneakers', 'Footwear', 100.00),
(29, 'Boots', 'Footwear', 120.00),
(30, 'Hat', 'Accessories', 15.00),
(31, 'Sunglasses', 'Accessories', 25.00),
(32, 'Bag', 'Accessories', 50.00),
(33, 'Belt', 'Accessories', 30.00),
(34, 'Wallet', 'Accessories', 20.00),
(35, 'Watch', 'Accessories', 100.00),
(36, 'Ring', 'Accessories', 150.00),
(37, 'Necklace', 'Accessories', 120.00),
(38, 'Bracelet', 'Accessories', 80.00),
(39, 'Earrings', 'Accessories', 40.00),
(40, 'Perfume', 'Beauty', 60.00);
ALTER TABLE Items
ADD Stock INT DEFAULT 10; -- Dastlabki qiymat 10
UPDATE Items
SET Stock = 10;

--5. Sales table
CREATE TABLE SALESS (
    sale_id INT IDENTITY(1,1) PRIMARY KEY,
    staff_id INT,
    sale_amount DECIMAL(10,2),
    sale_date DATE
);
INSERT INTO SALESS (staff_id, sale_amount, sale_date)
VALUES 
    (1, 500.00, '2024-01-05'),
    (2, 1200.50, '2024-02-10'),
    (3, 700.30, '2024-03-15'),
    (1, 300.00, '2024-04-20'),
    (2, 450.75, '2024-05-25'),
    (3, 850.60, '2024-06-30'),
    (4, 950.40, '2024-07-05'),
    (5, 1000.00, '2024-08-10'),
    (1, 400.50, '2024-09-15'),
    (2, 750.00, '2024-10-20'),
    (3, 650.75, '2024-11-25'),
    (4, 1100.20, '2024-12-30'),
    (5, 500.90, '2023-01-10'),
    (1, 1200.30, '2023-02-15'),
    (2, 850.00, '2023-03-20'),
    (3, 950.25, '2023-04-25'),
    (4, 700.40, '2023-05-30'),
    (5, 600.50, '2023-06-05'),
    (1, 1300.00, '2023-07-10'),
    (2, 400.75, '2023-08-15'),
    (3, 550.60, '2023-09-20'),
    (4, 650.40, '2023-10-25'),
    (5, 750.90, '2023-11-30'),
    (1, 900.30, '2023-12-10'),
    (2, 1150.00, '2022-01-15'),
    (3, 990.25, '2022-02-20'),
    (4, 700.40, '2022-03-25'),
    (5, 650.50, '2022-04-30'),
    (1, 1200.00, '2022-05-05'),
    (2, 300.75, '2022-06-10'),
    (3, 450.60, '2022-07-15'),
    (4, 550.40, '2022-08-20'),
    (5, 700.90, '2022-09-25'),
    (1, 800.30, '2022-10-30'),
    (2, 1000.00, '2022-11-10'),
    (3, 850.25, '2022-12-15'),
    (4, 650.40, '2021-01-20'),
    (5, 600.50, '2021-02-25'),
    (1, 1100.00, '2021-03-30'),
    (2, 400.75, '2021-04-05');

--6. CLIENTS TABLE
CREATE TABLE Clients (
    client_id INT,
    client_name VARCHAR(100) NOT NULL
);
INSERT INTO Clients (client_id, client_name) VALUES
(101, 'Ali Valiyev'),
(102, 'Bekzod Karimov'),
(103, 'Shoxrux Yoqubov'),
(104, 'Olimjon Saidov'),
(105, 'Jasur Xolmurodov'),
(106, 'Madina O‘rinova'),
(107, 'Nilufar Islomova'),
(108, 'Sardor Hamidov'),
(109, 'Iroda Qosimova'),
(110, 'Umid Rashidov');

--Difficult Tasks (20)
--1.Write a stored procedure spTopSalesStaff to determine the staff member with the highest total revenue in a given year.
SELECT * FROM Staff
SELECT* FROM SALESS
CREATE PROCEDURE spTopSalesStaff
  @YEAR INT
AS
BEGIN
 SET NOCOUNT ON
 SELECT S.staff_id, CONCAT(ST.FirstName + ' ', ST.LastName) AS StaffName, SUM(S.sale_amount) AS TotalRevenue
 FROM SALESS AS S
 JOIN Staff AS ST ON S.staff_id = ST.EmployeeID
 WHERE YEAR(S.sale_date) = @YEAR
 GROUP BY S.staff_id, ST.FirstName, ST.LastName
 ORDER BY TotalRevenue DESC
END;
EXEC spTopSalesStaff @YEAR = 2021


--2.Create a view vwClientOrderStats that shows the number of purchases per client and the total purchase value.
SELECT * FROM Purchases
CREATE VIEW vwClientOrderStats AS
SELECT P.CustomerID, C.client_name, COUNT(P.OrderID) NumberOfClient, SUM(P.OrderAmount) TotalPurchase
FROM Purchases AS P
JOIN Clients AS C ON P.CustomerID = C.client_id
GROUP BY  C.client_name, P.CustomerID
SELECT * FROM vwClientOrderStats
--3.Write a MERGE statement to synchronize two tables, Purchases and Items, with both updates and inserts based on the latest sales data.
SELECT * FROM Purchases
SELECT *FROM Items
MERGE INTO  Items AS I
USING Purchases AS P
ON  I.ProductID =P.OrderID 
WHEN MATCHED THEN 
     UPDATE SET I.Price = P.OrderAmount ,
	            I.Stock = I.Stock - 1
WHEN NOT MATCHED THEN
     INSERT (ProductID, ProductName, Category, Price, Stock) VALUES
	         (P.OrderID, 'Unknown Product', 'Misc', P.OrderAmount, 10);
        
--4.Create a function fnMonthlyRevenue that returns the total revenue for a specific year and month.
CREATE FUNCTION fn_MonthlyRevenue(@YEAR INT, @MONTH INT)
RETURNS DECIMAL(10,2)
AS 
BEGIN
DECLARE @TotalRevenue DECIMAL(10, 2)
(SELECT  @TotalRevenue = SUM(sale_amount) FROM SALESS
WHERE YEAR(sale_date) = @YEAR AND MONTH(sale_date) = @MONTH)
RETURN  @TotalRevenue
END;

SELECT dbo.fn_MonthlyRevenue(2021, 03) as TotalRevenue

--5.Write a complex stored procedure spProcessOrderTotals that accepts multiple parameters, calculates order totals, and then updates the order status accordingly.
CREATE PROCEDURE  spProcessOrderTotals
@ORDERID INT,
@DISCOUNTPERCENTAGE DECIMAL(5,2) = 0
AS 
BEGIN
     SET NOCOUNT ON;
     DECLARE @TotalAmount decimal(10, 2);
	 DECLARE @DiscountAmount DECIMAL(10,2);
	 DECLARE @FinalAmount DECIMAL(10,2);
	 DECLARE @OrderStatus VARCHAR(20);

     SELECT @TotalAmount = OrderAmount
	 FROM Purchases 
	 WHERE @ORDERID = OrderID 

	 IF @TotalAmount IS NULL
	 BEGIN 
	 PRINT 'ERROR: ORDER NOT FOUND!'
	 RETURN;
	 END

	 SET @DiscountAmount = (@TotalAmount * @DiscountAmount) / 100;
	 SET @FinalAmount = @TotalAmount - @DiscountAmount;

	 IF @FinalAmount >= 500
	    SET @OrderStatus = 'Completed';
     else if @FinalAmount < 200
	    SET @OrderStatus = 'Cenceled'
     ELSE 
	    SET @OrderStatus = 'Pending'

     UPDATE Purchases
	 SET OrderAmount = @FinalAmount
	 WHERE OrderID = @ORDERID

	 PRINT 'Order update successfully!';
	 print 'New Total Amount: ' + cast(@FinalAmount as VARCHAR);
	 PRINT 'Order Status: '+ @Orderstatus;
END;
exec spProcessOrderTotals @orderid = 2, @DiscountPercentage = 10
SELECT * FROM Purchases
--6.Create a temporary table #StaffSalesData that joins staff records with their respective sales figures and use it in a subsequent calculation.
SELECT ST.EmployeeID, ST.FirstName, ST.LastName, ST.Salary, SUM(SA.sale_amount) AS TotalSales INTO  #StaffSalesData
FROM Staff AS ST
JOIN SALESS AS SA ON ST.EmployeeID = SA.staff_id
group by  ST.EmployeeID, ST.FirstName, ST.LastName, ST.Salary
select * from #StaffSalesData

--7.Write a MERGE statement to manage updates and deletions from a temporary table #SalesTemp into the main Sales table.
SELECT * FROM SALESS
SELECT * INTO  #SalesTemp FROM SALESS
MERGE INTO SALESS AS T
USING #SalesTemp AS S
ON T.sale_id = S.sale_id
WHEN MATCHED THEN
     UPDATE
	 set    T.staff_id = S.staff_id,
	        T.sale_amount = S.sale_amount,
			T.sale_date = S.sale_date
WHEN NOT MATCHED BY TARGET THEN 
    INSERT (staff_id, sale_amount, sale_date)
	VALUES (S.staff_id, S.sale_amount, S.sale_date)
WHEN NOT MATCHED BY SOURCE THEN 
DELETE;
 

--8.Create a stored procedure spOrdersByDateRange that accepts a start and end date, returning all purchases made within that period.
CREATE PROCEDURE spOrdersByDateRange @START DATE, @END DATE
AS 
BEGIN
SELECT *
FROM Purchases
WHERE OrderDate >= @START AND OrderDate <= @END
END;
EXEC spOrdersByDateRange '2025-01-05', '2025-01-15'

--9.Write a function fnCompoundInterest to calculate compound interest for an investment given a rate, principal, and time period.
CREATE FUNCTION fnCompoundInterest(
       @Principal DECIMAL(10,2),
	   @Rate DECIMAL(5,4),
	   @Time int,
	   @CompoundsPerYear int)
RETURNS DECIMAL(10,2)
AS
BEGIN
     DECLARE @Amount DECIMAL(16, 2)
	 SET @Amount = @Principal * POWER(1 + (@Rate/@CompoundsPerYear), @CompoundsPerYear * @Time)
	 RETURN @Amount
END;
SELECT DBO.fnCompoundInterest(1020, 0.05, 15,20) AS CompoundInterest

--10.Create a view vwQuotaExceeders that lists all staff members who have exceeded their sales quotas, along with their total sales.
ALTER TABLE Staff
ADD Position NVARCHAR(50),  -- Xodim lavozimi
    Quota DECIMAL(10,2) DEFAULT 5000;  -- Kvota (standart qiymat 5000)
UPDATE Staff
SET Position = CASE 
    WHEN EmployeeID % 3 = 0 THEN 'Manager'
    WHEN EmployeeID % 3 = 1 THEN 'Senior Sales'
    ELSE 'Sales Associate'
END;
ALTER TABLE Staff
ADD Quota DECIMAL(10,2) DEFAULT 5000;
UPDATE Staff
SET Quota = CASE 
    WHEN Position = 'Manager' THEN 10000
    WHEN Position = 'Senior Sales' THEN 8000
    WHEN Position = 'Sales Associate' THEN 5000
    ELSE 4000
END;

SELECT * FROM Staff

CREATE VIEW vwQuotaExceeders AS
SELECT ST.EmployeeID, ST.FirstName, ST.LastName, SUM(SA.sale_amount) AS TotalSales, ST.Quota
FROM Staff AS ST
JOIN SALESS AS SA ON ST.EmployeeID = SA.staff_id
GROUP BY ST.EmployeeID, ST.FirstName, ST.LastName, ST.Position, ST.Quota
having SUM(SA.sale_amount) > ST.Quota;
SELECT * FROM vwQuotaExceeders

