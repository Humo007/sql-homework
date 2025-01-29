USE TestDatabase;
--Task N1
CREATE TABLE [dbo].[TestMultipleZero]
(
    [A] [int] NULL,
    [B] [int] NULL,
    [C] [int] NULL,
    [D] [int] NULL
)

INSERT INTO [dbo].[TestMultipleZero](A,B,C,D)
VALUES 
    (0,0,0,1),
    (0,0,1,0),
    (0,1,0,0),
    (1,0,0,0),
    (0,0,0,0),
    (1,1,1,0)

SELECT * FROM [dbo].[TestMultipleZero]
WHERE (A + B + C + D) > 0


--Task N2
CREATE TABLE TESTDuplicateCount ( 
    ID INT,
    EmpName VARCHAR(100),
    EmpDate DATETIME
) 

INSERT INTO TESTDuplicateCount(ID,EmpName,EmpDate) 
VALUES
(1,'Pawan','2014-01-05'),
(2,'Pawan','2014-03-05'), 
(3,'Pawan','2014-02-05'), 
(4,'Manisha','2014-07-05'), 
(5,'Sharlee','2014-09-05'), 
(6,'Barry','2014-02-05'), 
(7,'Jyoti','2014-04-05'), 
(8,'Jyoti','2014-05-05');


SELECT EmpName, COUNT(EmpName) 'DuplicateCount'
FROM TESTDuplicateCount
GROUP BY EmpName
HAVING COUNT(EmpName) > 1


-- Task N3


DECLARE @number int 
SET @number = 28
DECLARE @inum int 
SET @inum = 1
DECLARE @sum int = 0

WHILE @inum < @number
BEGIN
     IF @number % @inum = 0
	    SET @sum += @inum
     SET @inum += 1
END;

SELECT CASE 
           WHEN @number = @sum THEN CAST(@number AS VARCHAR) + ' -> PERFECT NUMBER' 
		   ELSE CAST(@number AS VARCHAR) + ' -> NOT A PERFECT NUMBER!'
       END ;


