-- 29 Exercises -> JOINS

--Task 1

SELECT S.name, C.cust_name, C.city
FROM Inventory.Customer AS C
INNER JOIN Inventory.Salesman AS S
ON C.city = S.city;

--Task 2
SELECT O.ord_no, O.purch_amt, C.cust_name, C.city
FROM Inventory.Customer C
INNER JOIN Inventory.Orders O
ON O.customer_id = C.customer_id
WHERE O.purch_amt BETWEEN 500 AND 2000

--Task 3
SELECT C.cust_name 'Customer Name', C.city, S.name 'Salesman', S.commission
FROM Inventory.Customer AS C
INNER JOIN Inventory.Salesman AS S
ON C.salesman_id = S.salesman_id;

--Task 4
SELECT C.cust_name 'Customer Name', C.city, S.name 'Salesman', S.commission
FROM Inventory.Customer AS C
INNER JOIN Inventory.Salesman AS S
ON C.salesman_id = S.salesman_id
WHERE S.commission >  0.12;

--Task 5
SELECT C.cust_name 'Customer Name', C.city 'Customer city', S.name 'Salesman', S.city 'Salesman city', S.commission
FROM Inventory.Customer AS C
INNER JOIN Inventory.Salesman AS S
ON C.salesman_id = S.salesman_id
WHERE S.commission >  0.12 AND C.city != S.city;

--Task 6
SELECT O.ord_no, O.ord_date, O.purch_amt, C.cust_name 'Customer Name', C.grade, S.name 'Salesman', S.commission
FROM Inventory.Orders AS O
INNER JOIN Inventory.Customer AS C 
ON O.customer_id = C.customer_id
INNER JOIN Inventory.Salesman AS S
ON O.salesman_id = S.salesman_id;

--Task 7
SELECT *
FROM Inventory.Orders AS O
INNER JOIN Inventory.Customer AS C 
ON O.customer_id = C.customer_id
INNER JOIN Inventory.Salesman AS S
ON O.salesman_id = S.salesman_id;

--Task 8
SELECT C.cust_name 'Customer name', C.city 'Customer city', C.grade, S.name 'Salesman', S.city 'Salesman city'
FROM Inventory.Customer AS C
INNER JOIN Inventory.Salesman AS S
ON C.salesman_id = S.salesman_id
ORDER BY C.customer_id;

--Task 9
SELECT C.cust_name 'Customer name', C.city 'Customer city', C.grade, S.name 'Salesman', S.city 'Salesman city'
FROM Inventory.Customer AS C
LEFT JOIN Inventory.Salesman AS S
ON C.salesman_id = S.salesman_id
WHERE C.grade < 300
ORDER BY C.customer_id;

--Task 10
SELECT C.cust_name 'Customer name', C.city, O.ord_no 'Order number', O.ord_date 'Order data', O.purch_amt 'Order amount'  
FROM Inventory.Orders AS O
RIGHT JOIN Inventory.Customer AS C
ON O.customer_id = C.customer_id
ORDER BY O.ord_date;

--Task 11
SELECT C.cust_name 'Customer name', C.city, O.ord_no 'Order number', O.ord_date 'Order data', O.purch_amt 'Order amount', S.name 'Salesperson name', S.commission 
FROM Inventory.Customer AS C
LEFT JOIN Inventory.Orders AS O
ON O.customer_id = C.customer_id
LEFT JOIN Inventory.Salesman AS S
ON O.salesman_id = S.salesman_id;

--Task 12
SELECT C.cust_name, C.city, C.grade, S.name 'Salesman name', S.city
FROM Inventory.Customer C
RIGHT JOIN Inventory.Salesman S
ON C.salesman_id = S.salesman_id;

--Task 13
SELECT C.cust_name 'Customer name', C.city, C.grade, S.name 'Salesman', O.ord_no 'Order number', O.ord_date 'Order data', O.purch_amt 'Order amount'
FROM Inventory.Customer AS C
RIGHT JOIN Inventory.Salesman AS S
ON C.salesman_id = S.salesman_id
RIGHT JOIN Inventory.Orders AS O
ON O.customer_id = C.customer_id;

--Task 14
SELECT C.cust_name 'Customer name', C.city, C.grade, S.name 'Salesman', O.ord_no 'Order number', O.ord_date 'Order data', O.purch_amt 'Order amount'
FROM Inventory.Customer AS C
RIGHT JOIN Inventory.Salesman AS S
ON C.salesman_id = S.salesman_id
LEFT JOIN Inventory.Orders AS O
ON O.customer_id = C.customer_id
WHERE O.purch_amt >= 2000 AND C.grade IS NOT NULL;

--Task 15
SELECT C.cust_name 'Customer name', C.city, O.ord_no 'Order number', O.ord_date 'Order data', O.purch_amt 'Order amount'
FROM Inventory.Customer C
LEFT JOIN Inventory.Orders O
ON C.customer_id = O.customer_id;

--Task 16
SELECT C.cust_name 'Customer name', C.city, O.ord_no 'Order number', O.ord_date 'Order data', O.purch_amt 'Order amount'
FROM Inventory.Customer C
FULL JOIN Inventory.Orders O
ON C.customer_id = O.customer_id
WHERE C.grade IS NOT NULL;

--Task 17
SELECT *
FROM Inventory.Salesman S
CROSS JOIN Inventory.Customer C;

--Task 18
SELECT *
FROM Inventory.Salesman S
CROSS JOIN Inventory.Customer C
WHERE S.city IS NOT NULL;

--Task 19
SELECT *
FROM Inventory.Salesman S
CROSS JOIN Inventory.Customer C
WHERE S.city IS NOT NULL AND C.grade IS NOT NULL;

--Task 20
SELECT *
FROM Inventory.Salesman S
CROSS JOIN Inventory.Customer C
WHERE S.city IS NOT NULL AND C.grade IS NOT NULL AND S.city != C.city;


--Tsak 21

CREATE TABLE company_mast (
  COM_ID integer,
  COM_NAME varchar
  
)
ALTER TABLE company_mast ALTER COLUMN COM_NAME VARCHAR(100);


INSERT INTO company_mast VALUES (11, 'Samsung')
INSERT INTO company_mast VALUES (12, 'iBall')
INSERT INTO company_mast VALUES (13, 'Epison')
INSERT INTO company_mast VALUES (14, 'Zebronics')
INSERT INTO company_mast VALUES (15, 'Asus')
INSERT INTO company_mast VALUES (16, 'Frontech')


SELECT *
FROM item_mast I
INNER JOIN company_mast C
ON I.pro_com = C.com_id;

--Task 22
SELECT I.pro_name 'item name', I.pro_price 'price', C.COM_NAME 'Company name'
FROM item_mast I
INNER JOIN company_mast C
ON I.pro_com = C.com_id;

--Task 23
SELECT AVG(I.PRO_PRICE) AVG, C.COM_NAME 'Company name'
FROM item_mast I
INNER JOIN company_mast C
ON I.pro_com = C.com_id
GROUP BY C.COM_NAME;

--Task 24
SELECT AVG(I.PRO_PRICE) AVG, C.COM_NAME 'Company name'
FROM item_mast I
INNER JOIN company_mast C
ON I.pro_com = C.com_id
GROUP BY C.COM_NAME
HAVING AVG(I.PRO_PRICE) >= 350;

--Task 25
SELECT I.pro_name 'item name', I.pro_price 'price', C.COM_NAME 'Company name'
FROM item_mast I
INNER JOIN company_mast C
ON I.pro_com = C.com_id
AND I.pro_price = (SELECT MAX(I.pro_price) FROM item_mast I WHERE I.pro_com = C.COM_ID);

--Task 26

CREATE TABLE EMP_DEPARTMENT (
    DPT_CODE INT PRIMARY KEY,
    DPT_NAME VARCHAR(50) NOT NULL,
    DPT_ALLOTMENT INT NOT NULL
);

INSERT INTO EMP_DEPARTMENT (DPT_CODE, DPT_NAME, DPT_ALLOTMENT)  
VALUES  
    (57, 'IT', 65000),  
    (63, 'Finance', 15000),  
    (47, 'HR', 240000),  
    (27, 'RD', 55000),  
    (89, 'QC', 75000);


SELECT *
FROM EMP_DEPARTMENT D
INNER JOIN emp_details E
ON D.DPT_CODE = E.emp_dept;

--Task 27
SELECT E.emp_fname 'First name', E.emp_lname 'Last name', d.DPT_NAME 'Departmant name', D.DPT_ALLOTMENT 'Sanction amount'
FROM EMP_DEPARTMENT D
INNER JOIN emp_details E
ON D.DPT_CODE = E.emp_dept;

--Task 28
SELECT E.emp_fname 'First name', E.emp_lname 'Last name'
FROM EMP_DEPARTMENT D
INNER JOIN emp_details E
ON D.DPT_CODE = E.emp_dept
WHERE D.DPT_ALLOTMENT > 50000;

--Task 29
SELECT D.DPT_NAME
FROM EMP_DEPARTMENT D
INNER JOIN emp_details E
ON D.DPT_CODE = E.emp_dept
GROUP BY D.DPT_NAME
HAVING COUNT(*) > 2;
