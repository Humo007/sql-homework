--10 Exercises 

--Task 1
SELECT salesman_id, name, city, '%', commission * 100
FROM Inventory.Salesman;

--Task 2
SELECT 'For', ord_date, 'there are', COUNT(ord_no), 'orders.' 
FROM Inventory.Orders
GROUP BY ord_date;

--Task 3
SELECT * FROM Inventory.Orders
ORDER BY ord_no;

--Task 4
SELECT * FROM Inventory.Orders
ORDER BY ord_date DESC;

--Task 5
SELECT * FROM Inventory.Orders
ORDER BY ord_date, purch_amt;

--Task 6
SELECT cust_name, city, grade
FROM Inventory.Customer
ORDER BY customer_id;

--Task 7
SELECT salesman_id, ord_date, MAX(purch_amt) AS 'max'
FROM Inventory.Orders
GROUP BY salesman_id, ord_date
ORDER BY salesman_id, ord_date;

--Task 8
SELECT cust_name, city, grade
FROM Inventory.Customer
ORDER BY 3 DESC;

--Task 9
SELECT customer_id, COUNT(DISTINCT ord_no), MAX(purch_amt) AS 'max'
FROM Inventory.Orders
GROUP BY customer_id
ORDER BY 2 DESC;

--Task 10
SELECT ord_date, SUM(purch_amt), SUM(purch_amt)*15/100
FROM Inventory.Orders
GROUP BY ord_date
ORDER BY ord_date;