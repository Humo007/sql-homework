--lesson-17
--SQL Homework Tasks: Subqueries Challenge
--1. Customers Table
CREATE TABLE Customers17 (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    City VARCHAR(100)
);

INSERT INTO Customers17 (CustomerID, CustomerName, City) VALUES
(1, 'John Doe', 'New York'),
(2, 'Jane Smith', 'Los Angeles'),
(3, 'James Brown', 'Chicago'),
(4, 'Mary Johnson', 'Houston'),
(5, 'Linda Williams', 'Phoenix'),
(6, 'Michael Jones', 'Philadelphia'),
(7, 'Robert Miller', 'San Antonio'),
(8, 'Patricia Davis', 'San Diego'),
(9, 'William Martínez', 'Dallas'),
(10, 'Jennifer García', 'San Jose'),
(11, 'David Lopez', 'Austin'),
(12, 'Helen Harris', 'Jacksonville'),
(13, 'Charles Taylor', 'Fort Worth'),
(14, 'Nancy Allen', 'Columbus'),
(15, 'Edward Clark', 'Indianapolis'),
(16, 'Sarah Lewis', 'Charlotte'),
(17, 'Jessica Young', 'San Francisco'),
(18, 'Kevin White', 'Seattle'),
(19, 'Laura King', 'Denver'),
(20, 'Joseph Scott', 'Washington'),
(21, 'Karen Adams', 'Boston'),
(22, 'James Nelson', 'El Paso'),
(23, 'Christopher Perez', 'Detroit'),
(24, 'Matthew Hill', 'Memphis'),
(25, 'Rachel Jackson', 'Baltimore'),
(26, 'Daniel Walker', 'Las Vegas'),
(27, 'Ashley Young', 'Louisville'),
(28, 'Helen Anderson', 'Milwaukee'),
(29, 'Brian Wright', 'Portland'),
(30, 'Michael Green', 'Oklahoma City'),
(31, 'Jessica Hall', 'Tucson'),
(32, 'Joshua Carter', 'New Orleans'),
(33, 'Sarah Mitchell', 'Bakersfield'),
(34, 'George Perez', 'Tampa'),
(35, 'Rachel Collins', 'Honolulu'),
(36, 'John Rivera', 'Orlando'),
(37, 'Susan Wood', 'St. Louis'),
(38, 'David Harris', 'Minneapolis'),
(39, 'Kevin Walker', 'Cleveland'),
(40, 'Laura Green', 'Birmingham');
--2. Orders Table
CREATE TABLE Orders17 (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderAmount DECIMAL(10, 2),
    OrderDate DATE
);

INSERT INTO Orders17 (OrderID, CustomerID, OrderAmount, OrderDate) VALUES
(1, 1, 250.00, '2025-01-01'),
(2, 2, 450.00, '2025-01-02'),
(3, 3, 120.00, '2025-01-03'),
(4, 4, 340.00, '2025-01-04'),
(5, 5, 500.00, '2025-01-05'),
(6, 6, 200.00, '2025-01-06'),
(7, 7, 750.00, '2025-01-07'),
(8, 8, 300.00, '2025-01-08'),
(9, 9, 600.00, '2025-01-09'),
(10, 10, 400.00, '2025-01-10'),
(11, 11, 250.00, '2025-01-11'),
(12, 12, 550.00, '2025-01-12'),
(13, 13, 350.00, '2025-01-13'),
(14, 14, 600.00, '2025-01-14'),
(15, 15, 200.00, '2025-01-15'),
(16, 16, 700.00, '2025-01-16'),
(17, 17, 450.00, '2025-01-17'),
(18, 18, 550.00, '2025-01-18'),
(19, 19, 500.00, '2025-01-19'),
(20, 20, 400.00, '2025-01-20'),
(21, 21, 700.00, '2025-01-21'),
(22, 22, 150.00, '2025-01-22'),
(23, 23, 600.00, '2025-01-23'),
(24, 24, 250.00, '2025-01-24'),
(25, 25, 550.00, '2025-01-25'),
(26, 26, 120.00, '2025-01-26'),
(27, 27, 600.00, '2025-01-27'),
(28, 28, 500.00, '2025-01-28'),
(29, 29, 450.00, '2025-01-29'),
(30, 30, 300.00, '2025-01-30'),
(31, 31, 350.00, '2025-02-01'),
(32, 32, 400.00, '2025-02-02'),
(33, 33, 600.00, '2025-02-03'),
(34, 34, 450.00, '2025-02-04'),
(35, 35, 300.00, '2025-02-05'),
(36, 36, 500.00, '2025-02-06'),
(37, 37, 400.00, '2025-02-07'),
(38, 38, 250.00, '2025-02-08'),
(39, 39, 650.00, '2025-02-09'),
(40, 40, 200.00, '2025-02-10');
--3. Products Table
CREATE TABLE Products17 (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2)
);

INSERT INTO Products17 (ProductID, ProductName, Price) VALUES
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
(23, 'Jacket', 60.00),
(24, 'Sweater', 50.00),
(25, 'T-shirt', 20.00),
(26, 'Shoes', 80.00),
(27, 'Socks', 10.00),
(28, 'Sneakers', 100.00),
(29, 'Boots', 120.00),
(30, 'Hat', 15.00),
(31, 'Sunglasses', 25.00),
(32, 'Bag', 50.00),
(33, 'Belt', 30.00),
(34, 'Wallet', 20.00),
(35, 'Watch', 100.00),
(36, 'Ring', 150.00),
(37, 'Necklace', 120.00),
(38, 'Bracelet', 80.00),
(39, 'Earrings', 40.00),
(40, 'Perfume', 60.00);
--4. Sales Table
CREATE TABLE Sales17 (
    SalesID INT PRIMARY KEY,
    ProductID INT,
    SalesAmount DECIMAL(10, 2),
    SalesDate DATE
);

INSERT INTO Sales17 (SalesID, ProductID, SalesAmount, SalesDate) VALUES
(1, 1, 200.00, '2025-01-01'),
(2, 2, 500.00, '2025-01-02'),
(3, 3, 80.00, '2025-01-03'),
(4, 4, 20.00, '2025-01-04'),
(5, 5, 15.00, '2025-01-05'),
(6, 6, 200.00, '2025-01-06'),
(7, 7, 120.00, '2025-01-07'),
(8, 8, 350.00, '2025-01-08'), 
(9, 9, 110.00, '2025-01-09'), 
(10, 10, 50.00, '2025-01-10'), 
(11, 11, 500.00, '2025-01-11'), 
(12, 12, 350.00, '2025-01-12'), 
(13, 13, 100.00, '2025-01-13'), 
(14, 14, 60.00, '2025-01-14'), 
(15, 15, 200.00, '2025-01-15'), 
(16, 16, 30.00, '2025-01-16'), 
(17, 17, 150.00, '2025-01-17'), 
(18, 18, 90.00, '2025-01-18'), 
(19, 19, 40.00, '2025-01-19'), 
(20, 20, 20.00, '2025-01-20'), 
(21, 21, 30.00, '2025-01-21'), 
(22, 22, 40.00, '2025-01-22'), 
(23, 23, 60.00, '2025-01-23'), 
(24, 24, 50.00, '2025-01-24'), 
(25, 25, 150.00, '2025-01-25'), 
(26, 26, 100.00, '2025-01-26'), 
(27, 27, 100.00, '2025-01-27'), 
(28, 28, 90.00, '2025-01-28'), 
(29, 29, 80.00, '2025-01-29'), 
(30, 30, 70.00, '2025-01-30'), 
(31, 31, 50.00, '2025-02-01'), 
(32, 32, 60.00, '2025-02-02'), 
(33, 33, 120.00, '2025-02-03'), 
(34, 34, 150.00, '2025-02-04'), 
(35, 35, 200.00, '2025-02-05'), 
(36, 36, 40.00, '2025-02-06'), 
(37, 37, 80.00, '2025-02-07'), 
(38, 38, 60.00, '2025-02-08'), 
(39, 39, 100.00, '2025-02-09'), 
(40, 40, 120.00, '2025-02-10');

--1.Write a correlated subquery to list all staff who earn more than the average salary in their division, excluding the staff member with the highest salary in that division.
SELECT * FROM  Staff

SELECT S1.*
FROM Staff AS S1 
WHERE S1.Salary > (SELECT AVG(S2.Salary) 
                FROM Staff AS S2 
				WHERE S1.DepartmentID = S2.DepartmentID)
AND S1.Salary < (SELECT MAX(S2.Salary) 
                FROM Staff AS S2 
				WHERE S1.DepartmentID = S2.DepartmentID)


--2.Use a subquery to list items that have been purchased by clients who have placed more than 5 orders.
ALTER TABLE Products17 
ADD OrderID INT;
UPDATE Products17 
SET OrderID = ProductID;



SELECT * FROM Orders17
SELECT P.*
FROM Products17 AS P  
JOIN Orders17 AS O1 ON P.OrderID = O1.OrderID
WHERE 5 < (SELECT COUNT(O2.OrderID) FROM Orders17 AS O2 WHERE O1.CustomerID = O2.CustomerID )

--3.Create a query to list all staff who are older than the overall average age and earn more than the average company salary.
CREATE TABLE Staff17 (
    StaffID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT,
    Salary DECIMAL(10,2)
);
INSERT INTO Staff17 (StaffID, Name, Age, Salary)
VALUES 
    (1, 'Ali', 30, 5000.00),
    (2, 'Bekzod', 45, 7000.00),
    (3, 'Sarvar', 38, 6500.00),
    (4, 'Malika', 28, 4800.00),
    (5, 'Shahnoza', 50, 8000.00),
    (6, 'Jasur', 42, 7200.00),
    (7, 'Dilnoza', 35, 6200.00),
    (8, 'Rustam', 29, 5300.00),
    (9, 'Madina', 55, 9000.00),
    (10, 'Sherzod', 33, 6100.00),
    (11, 'Farrux', 40, 6900.00),
    (12, 'Nilufar', 37, 6400.00),
    (13, 'Olim', 47, 7500.00),
    (14, 'Xurshid', 31, 5800.00),
    (15, 'Nodira', 43, 7300.00);

SELECT * FROM Staff17

SELECT *
FROM Staff17
WHERE AGE > (SELECT AVG(Age) FROM Staff17) AND Salary > (SELECT AVG(Salary) FROM Staff17)

--4.Use a correlated subquery to list staff who work in a division that has more than 5 staff members earning over $100,000.
SELECT * FROM Staff
SELECT *
FROM Staff AS S1
WHERE 5 < (SELECT COUNT(*) 
           FROM Staff AS S2 
		   WHERE S1.DepartmentID = S2.DepartmentID
		   AND S2.Salary > 100000) 


--5.Write a subquery to list all items that have not been purchased by any client in the past year.
ALTER TABLE Orders17 
ADD ProductID INT;
UPDATE Orders17 
SET ProductID = OrderID;
SELECT * FROM Products17 
SELECT * FROM Orders17 

SELECT P.*
FROM Products17 AS P
WHERE P.ProductID NOT IN (SELECT DISTINCT O.ProductID 
                     FROM Orders17 AS O 
					 WHERE O.OrderDate >= DATEADD(YEAR, -1, GETDATE()))


--6.Create a query to list all clients who have made purchases that include items from at least two different categories.
ALTER TABLE Products17
ADD CategoryID INT;
UPDATE Products17 SET CategoryID = 
    CASE 
        WHEN ProductID BETWEEN 1 AND 10 THEN 1  -- Elektronika
        WHEN ProductID BETWEEN 11 AND 20 THEN 2 -- Maishiy texnika
        WHEN ProductID BETWEEN 21 AND 30 THEN 3 -- Kiyim-kechak
        WHEN ProductID BETWEEN 31 AND 40 THEN 4 -- Aksessuarlar
    END;


SELECT O.CustomerID FROM Orders17 AS O
JOIN OrderDetails AS OD ON O.OrderID = OD.OrderID
JOIN Products17 AS P ON P.ProductID = OD.ProductID
GROUP BY O.CustomerID
HAVING COUNT(DISTINCT P.CategoryID) >= 2

--7.Write a correlated subquery to list staff who earn more than the average salary of staff in the same job position.

SELECT * FROM Staff
SELECT *
FROM Staff AS S1
WHERE Salary > (SELECT AVG(S2.Salary) 
                FROM Staff AS S2 
				WHERE S1.Position = S2.Position)


--8.Use a subquery to list items that are in the top 10% by price among all items.
SELECT * 
FROM Products 
WHERE Price >= (SELECT MAX(PercentilePrice) 
                FROM (SELECT PERCENTILE_CONT(0.9) 
                WITHIN GROUP (ORDER BY Price)
				OVER() AS PercentilePrice
				FROM Products
				 ) AS T);


SELECT *
FROM (SELECT *, NTILE(10) OVER(ORDER BY Price DESC) AS PriceRnk
      FROM Products) AS RankedProducts
WHERE PriceRnk = 1

--9.Write a query that uses a correlated subquery to list staff whose salary is in the top 10% within their division.
SELECT * FROM Staff AS S1
WHERE Salary >= (SELECT TOP 1 PERCENTILE_CONT(0.9)
				 WITHIN GROUP(ORDER BY Salary) 
				 OVER(PARTITION BY DepartmentID)  AS PercentileSalary
                 FROM Staff AS S2
				 WHERE S1.DepartmentID = S2.DepartmentID)
			



--10.Create a subquery to list all staff who have not received any bonus in the last 6 months.
-- 1. Bonuses17 jadvalini yaratish
CREATE TABLE Bonuses17 (
    BonusID INT PRIMARY KEY IDENTITY(1,1), 
    StaffID INT,
    BonusAmount DECIMAL(10,2),
    BonusDate DATE,
    FOREIGN KEY (StaffID) REFERENCES Staff17(StaffID)
);

-- 2. Bonus ma’lumotlarini qo‘shish
INSERT INTO Bonuses17 (StaffID, BonusAmount, BonusDate)
VALUES 
    (1, 500.00, '2024-01-10'),
    (2, 700.00, '2023-12-20'),
    (3, 650.00, '2024-02-15'),
    (4, 480.00, '2024-03-05'),
    (5, 800.00, '2023-11-10'),
    (6, 720.00, '2024-01-25'),
    (7, 620.00, '2024-02-28'),
    (8, 530.00, '2023-10-30'),
    (9, 900.00, '2024-03-12'),
    (10, 610.00, '2023-09-15'),
    (11, 690.00, '2024-01-18'),
    (12, 640.00, '2023-12-22'),
    (13, 750.00, '2024-02-01'),
    (14, 580.00, '2023-11-28'),
    (15, 730.00, '2024-03-08');

SELECT * FROM Staff17
SELECT * FROM Bonuses17

SELECT *
FROM Staff17 AS S
WHERE S.StaffID NOT IN (
      SELECT DISTINCT StaffID 
      FROM Bonuses17 AS B 
      WHERE B.BonusDate >= DATEADD(MONTH, -6, GETDATE()))

SELECT S.*
FROM Staff17 AS S
LEFT JOIN Bonuses17 AS B ON S.StaffID = B.StaffID
AND B.BonusDate >= DATEADD(MONTH, -6, GETDATE())
WHERE B.StaffID IS NULL

--11.Use a correlated subquery to list items that have been ordered more frequently than the average number of orders per item.
SELECT P1.* FROM Products17 AS P1
WHERE (SELECT COUNT(*) FROM Orders17 AS O WHERE O.ProductID = P1.ProductID) > 
      (SELECT AVG(OrderCount) 
	   FROM (SELECT COUNT(*) AS OrderCount 
	         FROM Orders17 
			 GROUP BY ProductID) AS AvgOrders )



--12.Write a subquery to list all clients who made purchases last year for items priced above the average price.
SELECT C.* FROM Customers17 AS C
JOIN Orders17 AS O ON C.CustomerID = O.CustomerID
JOIN Products17 AS P ON O.ProductID =P.ProductID
WHERE P.Price > (SELECT AVG(Price) FROM Products17)
AND  YEAR(O.OrderDate) = YEAR(GETDATE())- 1

--13.Write a query to identify the division with the highest average salary using a correlated subquery.
SELECT DepartmentID FROM Staff
GROUP BY DepartmentID
HAVING AVG(Salary) = (SELECT MAX(AvgSalary) 
                      FROM (SELECT DepartmentID, AVG(Salary) AS AvgSalary 
					        FROM Staff 
							GROUP BY DepartmentID) AS T)



--14.Create a subquery to list items that have been purchased by clients who have placed more than 10 orders.
SELECT DISTINCT P.* FROM Products17 AS P
JOIN Orders17 AS O ON P.ProductID = O.ProductID
WHERE O.CustomerID IN (SELECT CustomerID
	         FROM Orders17 
			 GROUP BY CustomerID
			 HAVING COUNT(OrderID) > 10
			 );



--15.Use a correlated subquery to list staff who work in the division with the highest total sales.
ALTER TABLE Orders17
ADD DepartmentID INT;
UPDATE Orders17
SET DepartmentID = (ProductID % 5) + 1; 

SELECT * FROM Staff ST1
WHERE ST1.DepartmentID = (SELECT TOP 1 O.DepartmentID 
                         FROM Orders17 AS O 
						 GROUP BY O.DepartmentID 
						 ORDER BY SUM(O.OrderAmount) DESC)


