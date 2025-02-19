--12 exercises -> Using Boolean and Relational operators

--Task 1
SELECT customer_id, cust_name, city, grade, salesman_id 
FROM Inventory.Customer
WHERE grade > 100;

--Task 2
SELECT customer_id, cust_name, city, grade, salesman_id 
FROM Inventory.Customer
WHERE grade > 100 and city = 'New York';

--Task 3
SELECT customer_id, cust_name, city, grade, salesman_id 
FROM Inventory.Customer
WHERE grade > 100 or city = 'New York' ;

--Task 4
SELECT customer_id, cust_name, city, grade, salesman_id 
FROM Inventory.Customer
WHERE city = 'New York' OR NOT grade > 100;

--Task 5
SELECT customer_id, cust_name, city, grade, salesman_id 
FROM Inventory.Customer
WHERE NOT city = 'New York' AND NOT grade > 100;

--Task 6
SELECT ord_no, purch_amt, ord_date, customer_id, salesman_id 
FROM Inventory.Orders
WHERE ((ord_date = '2012-09-10' AND salesman_id > 5005) OR purch_amt > 1000);

--Task 7
SELECT salesman_id, name, city, commission
FROM Inventory.Salesman
WHERE commission > 0.10 AND commission < 0.12;

--Task 8 
SELECT ord_no, purch_amt, ord_date, customer_id, salesman_id
FROM Inventory.Orders
WHERE (purch_amt < 200 OR NOT(ord_date >= '2012-02-10' AND customer_id < 3009)); 

--Task 9
SELECT * FROM Inventory.Orders
WHERE NOT ((ord_date = '2012-08-17' OR customer_id > 3005) AND purch_amt < 1000); 

--Task 10
SELECT ord_no, purch_amt, (100 * purch_amt) / 6000 AS 'Achieved %', (100 * (6000 - purch_amt) / 6000) AS 'Unachieved %'  
FROM Inventory.Orders
WHERE (100 * purch_amt) / 6000 > 50;

--Task 11
SELECT emp_idno, emp_fname, emp_lname, emp_dept
FROM dbo.emp_details
WHERE emp_lname IN ('Dosni','Mardy');

--Task 12
SELECT emp_idno, emp_fname, emp_lname, emp_dept
FROM dbo.emp_details
WHERE emp_dept IN (47, 63);
