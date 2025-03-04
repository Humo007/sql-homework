--Level 1: Basic Subqueries
--1. Find Employees with Minimum Salary

--Task: Retrieve employees who earn the minimum salary in the company.

--Tables: employees (columns: id, name, salary)

--DDL and DML:

CREATE TABLE employees18 (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2)
);

INSERT INTO employees18 (id, name, salary) VALUES
(1, 'Alice', 50000),
(2, 'Bob', 60000),
(3, 'Charlie', 50000);

SELECT *
FROM employees18 AS E1
WHERE E1.salary = (SELECT MIN(salary) FROM employees18)
-------------------------------------------------------------------------------------------------

--2. Find Products Above Average Price

--Task: Retrieve products priced above the average price.

--Tables: products (columns: id, product_name, price)

--DDL and DML:

CREATE TABLE products18 (
    id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2)
);

INSERT INTO products18 (id, product_name, price) VALUES
(1, 'Laptop', 1200),
(2, 'Tablet', 400),
(3, 'Smartphone', 800),
(4, 'Monitor', 300);

SELECT *
FROM products18
WHERE price > (SELECT AVG(price) FROM products18)
-----------------------------------------------------------------------------------

--Level 2: Nested Subqueries with Conditions

--3. Find Employees in Sales Department

--Task: Retrieve employees who work in the "Sales" department.

--Tables: employees (columns: id, name, department_id), departments (columns: id, department_name)

--DDL and DML:

CREATE TABLE departments183 (
    id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

DROP TABLE IF EXISTS employees183;
CREATE TABLE employees183 (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments183(id)
);

INSERT INTO departments183 (id, department_name) VALUES
(1, 'Sales'),
(2, 'HR');

INSERT INTO employees183 (id, name, department_id) VALUES
(1, 'David', 1),
(2, 'Eve', 2),
(3, 'Frank', 1);

SELECT * FROM  departments183
SELECT * FROM employees183

SELECT *
FROM employees183 AS E
WHERE E.department_id = (SELECT ID 
                         FROM departments183 
						 WHERE department_name = 'Sales')
-------------------------------------------------------------------------------------

--Find Customers with No Orders

--Task: Retrieve customers who have not placed any orders.

--Tables: customers (columns: customer_id, name), orders (columns: order_id, customer_id)

--DDL and DML:

CREATE TABLE customers18 (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE orders18 (
    order_id INT PRIMARY KEY,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers18(customer_id)
);

INSERT INTO customers18 (customer_id, name) VALUES
(1, 'Grace'),
(2, 'Heidi'),
(3, 'Ivan');

INSERT INTO orders18 (order_id, customer_id) VALUES
(1, 1),
(2, 1);

SELECT * FROM customers18
SELECT * FROM orders18

SELECT * 
FROM customers18
WHERE customer_id NOT IN (SELECT customer_id FROM orders18 )
---------------------------------------------------------------------

--Level 3: Aggregation and Grouping in Subqueries

--5. Find Products with Max Price in Each Category

--Task: Retrieve products with the highest price in each category.

--Tables: products (columns: id, product_name, price, category_id)

--DDL and DML:

CREATE TABLE products185 (
    id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    category_id INT
);

INSERT INTO products185 (id, product_name, price, category_id) VALUES
(1, 'Tablet', 400, 1),
(2, 'Laptop', 1500, 1),
(3, 'Headphones', 200, 2),
(4, 'Speakers', 300, 2);

SELECT  *
FROM products185 AS P1
WHERE price = (SELECT MAX(price) 
                     FROM  products185 AS P2 
					 WHERE P1.category_id = P2.category_id) 
--------------------------------------------------------------------------------------

---6. Find Employees in Department with Highest Average Salary

--Task: Retrieve employees working in the department with the highest average salary.

--Tables: employees (columns: id, name, salary, department_id), departments (columns: id, department_name)

--DDL and DML:

CREATE TABLE departments186 (
    id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

CREATE TABLE employees186 (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments186(id)
);

INSERT INTO departments186 (id, department_name) VALUES
(1, 'IT'),
(2, 'Sales');

INSERT INTO employees186 (id, name, salary, department_id) VALUES
(1, 'Jack', 80000, 1),
(2, 'Karen', 70000, 1),
(3, 'Leo', 60000, 2);

SELECT E1.*, D.department_name
FROM employees186 AS E1
JOIN departments186 AS D ON E1.department_id = D.id
WHERE E1.department_id = (SELECT TOP 1 E2.department_id 
                          FROM employees186 AS E2 
						  GROUP BY department_id
						  ORDER BY AVG(salary) DESC)

WITH dept_avg AS (
                  SELECT E.*, D.department_name, AVG(salary) OVER(PARTITION BY department_id) as avg_salary
				  FROM employees186 AS E
				  JOIN departments186 AS D ON E.department_id = D.id)
SELECT D.id, D.name, D.salary, D.department_id, D.department_name
FROM dept_avg AS D
WHERE avg_salary = (SELECT MAX(avg_salary) FROM dept_avg);
--------------------------------------------------------------------------------------

--Level 4: Correlated Subqueries

--7. Find Employees Earning Above Department Average

--Task: Retrieve employees earning more than the average salary in their department.

--Tables: employees (columns: id, name, salary, department_id)

--DDL and DML:

CREATE TABLE employees187 (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2),
    department_id INT
);

INSERT INTO employees187 (id, name, salary, department_id) VALUES
(1, 'Mike', 50000, 1),
(2, 'Nina', 75000, 1),
(3, 'Olivia', 40000, 2),
(4, 'Paul', 55000, 2);

SELECT *  
FROM employees187 AS E1
WHERE E1.salary > (SELECT AVG(salary)
                FROM employees187 AS E2 WHERE E1.department_id = E2.department_id )

------------------------------------------------------------------------------------

--8. Find Students with Highest Grade per Course

--Task: Retrieve students who received the highest grade in each course.

--Tables: students (columns: student_id, name), grades (columns: student_id, course_id, grade)

--DDL and DML:

CREATE TABLE students188 (
    student_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE grades188 (
    student_id INT,
    course_id INT,
    grade DECIMAL(4, 2),
    FOREIGN KEY (student_id) REFERENCES students188(student_id)
);

INSERT INTO students188 (student_id, name) VALUES
(1, 'Sarah'),
(2, 'Tom'),
(3, 'Uma');

INSERT INTO grades188 (student_id, course_id, grade) VALUES
(1, 101, 95),
(2, 101, 85),
(3, 102, 90),
(1, 102, 80);

SELECT *FROM students188
SELECT *FROM grades188


SELECT G1.student_id, G1.grade, G1.course_id, S.name
FROM grades188 AS G1
JOIN students188 AS S ON G1.student_id = S.student_id
WHERE G1.grade = (SELECT MAX(grade) 
                  FROM grades188 AS G2 
				  WHERE G1.course_id =G2.course_id  )
-----------------------------------------------------------------------------------

--Level 5: Subqueries with Ranking and Complex Conditions

--9. Find Third-Highest Price per Category

--Task: Retrieve products with the third-highest price in each category.

--Tables: products (columns: id, product_name, price, category_id)

--DDL and DML:

CREATE TABLE products189 (
    id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    category_id INT
);

INSERT INTO products189 (id, product_name, price, category_id) VALUES
(1, 'Phone', 800, 1),
(2, 'Laptop', 1500, 1),
(3, 'Tablet', 600, 1),
(4, 'Smartwatch', 300, 1),
(5, 'Headphones', 200, 2),
(6, 'Speakers', 300, 2),
(7, 'Earbuds', 100, 2);

SELECT * FROM products189

SELECT * 
FROM products189 AS P1
WHERE 2 = (SELECT COUNT(DISTINCT price) 
               FROM products189 AS P2 
			   WHERE P1.category_id = P2.category_id
			   AND P1.price < P2.price)

;WITH Rankedproducts AS (
      SELECT *, RANK() OVER(PARTITION BY category_id ORDER BY price desc) AS Rnk
	  FROM products189
	  )
SELECT R.id, R.product_name, R.price, R.category_id
FROM Rankedproducts AS R
WHERE R.Rnk = 3
--------------------------------------------------------------------------------

--10. Find Employees Between Company Average and Department Max Salary

--Task: Retrieve employees with salaries above the company average but below the maximum in their department.

--Tables: employees (columns: id, name, salary, department_id)

--DDL and DML:

CREATE TABLE employees1810 (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2),
    department_id INT
);

INSERT INTO employees1810 (id, name, salary, department_id) VALUES
(1, 'Alex', 70000, 1),
(2, 'Blake', 90000, 1),
(3, 'Casey', 50000, 2),
(4, 'Dana', 60000, 2),
(5, 'Evan', 75000, 1);

SELECT * FROM employees1810

SELECT * 
FROM employees1810
WHERE salary 
BETWEEN (SELECT AVG(salary) FROM employees1810) -1 
AND (SELECT MAX(salary) FROM employees1810)-1

;WITH SalaryStats AS (
      SELECT department_id, MAX(salary) AS MAX_DEP_SALARY
	  FROM employees1810
	  GROUP BY department_id), 
	  CompanyAvg AS (SELECT AVG(salary) Avg_salary FROM employees1810)

SELECT E.*
FROM employees1810 AS E
JOIN SalaryStats AS SS ON E.department_id = SS.department_id
JOIN CompanyAvg AS CA ON 1=1
WHERE E.salary > CA.Avg_salary
AND E.salary < SS.MAX_DEP_SALARY
