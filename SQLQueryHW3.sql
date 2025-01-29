--22 Exercises -> Wildcard and Special operators

--Task 1
SELECT salesman_id, name, city, commission
FROM Inventory.Salesman
WHERE city = 'Paris' OR city = 'Rome';

--Task 2
SELECT salesman_id, name, city, commission
FROM Inventory.Salesman
WHERE city IN ('Paris', 'Rome');

--Task 3
SELECT salesman_id, name, city, commission
FROM Inventory.Salesman
WHERE city NOT IN ('Paris', 'Rome');

--Task 4
SELECT customer_id, cust_name, city, grade, salesman_id
FROM Inventory.Customer
WHERE customer_id IN (3007, 3008, 3009);

--Task 5 
SELECT salesman_id, name, city, commission
FROM Inventory.Salesman
WHERE commission BETWEEN 0.12 AND 0.14;

--Task 6
SELECT ord_no, purch_amt, ord_date, customer_id, salesman_id
FROM Inventory.Orders
WHERE (purch_amt BETWEEN 500 AND 4000) AND NOT purch_amt IN (948.50, 1983.43);

--Task 7
SELECT salesman_id, name, city, commission
FROM Inventory.Salesman
WHERE name BETWEEN 'A' AND 'L';

--Task 8
SELECT salesman_id, name, city, commission
FROM Inventory.Salesman
WHERE name NOT BETWEEN 'A' AND 'M';

--Task 9 
SELECT customer_id, cust_name, city, grade, salesman_id
FROM Inventory.Customer
WHERE cust_name LIKE 'B%';

--Task 10
SELECT customer_id, cust_name, city, grade, salesman_id
FROM Inventory.Customer
WHERE cust_name LIKE '%n';

--Task 11
SELECT salesman_id, name, city, commission
FROM Inventory.Salesman
WHERE name LIKE 'N__l%';

--Task 12
CREATE DATABASE TestDatabase;
USE TestDatabase;
CREATE TABLE testtable(col1 NVARCHAR(1000));
INSERT INTO testtable (col1)
VALUES
    ('A001/DJ-402\44_/100/2015'),
    ('A001_\DJ-402\44_/100/2015'),
    ('A001_DJ-402-2014-2015'),
    ('A002_DJ-401-2014-2015'),
    ('A001/DJ_401'),
    ('A001/DJ_402\44'),
    ('A001/DJ_402\44\2015'),
    ('A001/DJ-402%45\2015/200'),
    ('A001/DJ_402\45\2015%100'),
    ('A001/DJ_402%45\2015/300');

SELECT * FROM testtable
WHERE col1 LIKE '%/_%' ESCAPE '/';

--Task 13
SELECT * FROM testtable
WHERE col1 NOT LIKE '%/_%' ESCAPE '/';

--Task 14
SELECT * FROM testtable
WHERE col1 LIKE '%//%' ESCAPE '/';

--Task 15
SELECT * FROM testtable
WHERE col1 NOT LIKE '%//%' ESCAPE '/'; 

--Task 16
SELECT * FROM testtable
WHERE col1 LIKE '%/_/%' ESCAPE '/';

--Task 17
SELECT * FROM testtable
WHERE col1 NOT LIKE '%/_/%' ESCAPE '/';

--Task 18
SELECT * FROM testtable
WHERE col1  LIKE '%/%%' ESCAPE '/';

--Task 19
SELECT * FROM testtable
WHERE col1 NOT LIKE '%/%%' ESCAPE '/';

--Task 20
SELECT customer_id, cust_name, city, grade, salesman_id
FROM Inventory.Customer
WHERE grade IS NULL;

--Task 21
SELECT customer_id, cust_name, city, grade, salesman_id
FROM Inventory.Customer
WHERE grade IS NOT NULL;

--Task 22
SELECT emp_idno, emp_fname, emp_lname, emp_dept
FROM emp_details
WHERE emp_lname LIKE 'D%';