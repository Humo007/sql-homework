--33 exercices-> Retrieve data from tables
--Task 1
SELECT * FROM Inventory.Salesman;

--Task 2

PRINT 'This is SQL Exercise, Practice and Solution';

--Task 3
SELECT 1, 2, 3

--Task 4
SELECT 10 + 15;

--Task 5
SELECT ((100 * 31) - ((21 * 31)*4))*5 - 480
 
--Task 6
SELECT name, commission 
FROM Inventory.Salesman;

--Task 7
SELECT ord_date, salesman_id, ord_no, purch_amt 
FROM Inventory.Orders;

--Task 8
SELECT DISTINCT salesman_id 
FROM Inventory.Orders;

--Task
SELECT name, city 
FROM Inventory.Salesman
WHERE city = 'Paris';

--Task 10
SELECT customer_id, cust_name, city, grade, salesman_id 
FROM Inventory.Customer 
WHERE grade = 200;

--Task 11
SELECT ord_no, ord_date, purch_amt 
FROM Inventory.Orders
WHERE salesman_id = 5001;
--Task 12
SELECT year, subject, winner 
FROM dbo.nobel_win
WHERE year = 1970;

--Task 13
SELECT winner 
FROM dbo.nobel_win
WHERE year = 1971 and subject = 'Literature';

--Task 14
SELECT year, subject 
FROM dbo.nobel_win
WHERE winner = 'Dennis Gabor'; 

--Task 15
SELECT winner 
FROM dbo.nobel_win
WHERE subject = 'Physics' and year > 1950;

--Task 16
SELECT year, subject, winner, country
FROM dbo.nobel_win
WHERE subject = 'Chemistry' and year BETWEEN 1965 and 1975;

--Task 17
SELECT * FROM dbo.nobel_win
WHERE year > 1972 and  winner = 'Menachem Begin' or winner = 'Yitzhak Rabin';

--Task 18
SELECT year, subject, winner, country, category
FROM dbo.nobel_win
WHERE winner LIKE 'Louis%';

--Task 19
SELECT year, subject, winner, country, category
FROM dbo.nobel_win
WHERE subject = 'Physics' and year = 1970
UNION
SELECT year, subject, winner, country, category
FROM dbo.nobel_win
WHERE subject = 'Economics' and year = 1971;

--Task 20
SELECT year, subject, winner, country, category
FROM dbo.nobel_win
WHERE subject != 'Physiology' and subject != 'Economics' and year = 1970;

--Task 21
SELECT * FROM dbo.nobel_win
WHERE subject = 'Physiology' and year < 1971
UNION
SELECT * FROM dbo.nobel_win
WHERE subject = 'Peace' and year >= 1974;

--Task 22
SELECT * FROM dbo.nobel_win
WHERE winner = 'Johannes Georg Bednorz';

--Task 23
SELECT *FROM dbo.nobel_win
WHERE subject not LIKE 'P%'
ORDER BY year DESC, winner;

--Task 24
SELECT * FROM dbo.nobel_win
WHERE year = 1970 
ORDER BY 
  CASE
    WHEN subject IN ('Economics', 'Chemistry') THEN 1 ELSE 0
  END ASC, subject;

--Task 25
SELECT * FROM dbo.item_mast
WHERE pro_price BETWEEN 200 and 600;

--Task 26
SELECT AVG(pro_price) AS AVG 
FROM dbo.item_mast
WHERE pro_com = 16;

--Task 27
SELECT pro_name AS 'Item Name', pro_price AS 'Price in Rs' 
FROM dbo.item_mast;

--Task 28
SELECT pro_name, pro_price 
FROM dbo.item_mast 
WHERE pro_price >= 250
ORDER BY pro_price DESC, pro_name;

--Task 29
SELECT AVG(pro_price) AS Average, pro_com 
FROM dbo.item_mast
GROUP BY pro_com;

--Task 30
SELECT pro_name, pro_price 
FROM dbo.item_mast
WHERE pro_price = (SELECT MIN(pro_price) FROM dbo.item_mast);

--Task 31
SELECT DISTINCT emp_lname   
FROM emp_details;

--Task 32
SELECT * FROM emp_details
WHERE emp_lname = 'Snares';

--Task 33
SELECT * FROM emp_details
WHERE emp_dept = 57;