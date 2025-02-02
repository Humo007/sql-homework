-- 25 EXERCISES Functions and Group by 
--Task 1
SELECT SUM(purch_amt) SUM 
FROM Inventory.Orders

--Task 2
SELECT AVG(purch_amt) AVG 
FROM Inventory.Orders

--Task 3
SELECT COUNT(DISTINCT salesman_id) Count
FROM Inventory.Orders

--Task 4 
SELECT COUNT(*) Count
FROM Inventory.Customer

--Task 5 
SELECT COUNT(grade) AS Count 
FROM Inventory.Customer

--Task 6
SELECT MAX(purch_amt) AS Max
FROM Inventory.Orders

--Task 7
SELECT MIN(purch_amt) Min
FROM Inventory.Orders

--Task 8
SELECT city, MAX(grade) AS Max
FROM Inventory.Customer
GROUP BY city

--Task 9
SELECT customer_id, MAX(purch_amt) Max
FROM Inventory.Orders
GROUP BY customer_id

--Task 10
SELECT customer_id, ord_date, MAX(purch_amt) Max
FROM Inventory.Orders
GROUP BY customer_id, ord_date;

--Task 11
SELECT salesman_id, MAX(purch_amt) max
FROM Inventory.Orders
WHERE ord_date = '2012-08-17'
GROUP BY salesman_id

--Task 12
SELECT customer_id, ord_date, MAX(purch_amt) Max
FROM Inventory.Orders
GROUP BY customer_id, ord_date
HAVING MAX(purch_amt) > 2000

--Task 13
SELECT customer_id, ord_date, MAX(purch_amt) Max
FROM Inventory.Orders
GROUP BY customer_id, ord_date
HAVING MAX(purch_amt) BETWEEN 2000 AND 6000;

--Task 14
SELECT customer_id, ord_date, MAX(purch_amt) Max
FROM Inventory.Orders
GROUP BY customer_id, ord_date
HAVING MAX(purch_amt) IN (2000, 3000, 5760, 6000);

--Task 15
SELECT customer_id, MAX(purch_amt) AS max
FROM Inventory.Orders
GROUP BY customer_id
HAVING customer_id BETWEEN 3002 AND 3007;

--Task 16 
SELECT customer_id, MAX(purch_amt) AS max
FROM Inventory.Orders
GROUP BY customer_id
HAVING (customer_id BETWEEN 3002 AND 3007) AND (MAX(purch_amt) > 1000);

--Task 17
SELECT salesman_id, MAX(purch_amt)
FROM Inventory.Orders
GROUP BY salesman_id
HAVING salesman_id BETWEEN 5003 AND 5008;

--Task 18 
SELECT COUNT(*)
FROM Inventory.Orders
WHERE ord_date = '2012-08-17';

--Task 19
SELECT COUNT(*) Count
FROM Inventory.Salesman
WHERE city IS NOT NULL;


--Task 20
SELECT ord_date, salesman_id, COUNT(*) Count
FROM Inventory.Orders
GROUP BY ord_date, salesman_id;

--Task 21
SELECT AVG(PRO_PRICE)
FROM item_mast

--Task 22
SELECT COUNT(*) 'Number of Products'
FROM item_mast
WHERE PRO_PRICE >= 350;

--Task 23
SELECT AVG(DISTINCT pro_price) 'Average Price', pro_com 'Company ID'
FROM item_mast
GROUP BY pro_com;

--Task 24
SELECT SUM(dpt_allotment) AS SUM
FROM [Employee].[department];

--Task 25
SELECT emp_dept, COUNT(*) Count
FROM emp_details
GROUP BY emp_dept;

