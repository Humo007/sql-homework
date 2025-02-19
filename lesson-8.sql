--HomeworkSQL N8

--Task 1
CREATE TABLE Item
(
ITEM_NO CHAR(12) NOT NULL,
ITEM_DESC CHAR(30) NULL
)

CREATE TABLE ORDERED
(
CUST_NO CHAR(15) NOT NULL,
ITEM_NO CHAR(12) NOT NULL,
QTY_ORDERED INT NULL
)
 
INSERT INTO Item(Item_NO,Item_Desc)
VALUES
(1, 'Large Bags'),
(2, 'Medium Bags'),
(3, 'Large Boxes'),
(4, 'Medium Boxes')
 
INSERT INTO ORDERED(CUST_NO,Item_NO,Qty_Ordered) 
VALUES
(1, 1, 10),
(1, 2, 15),
(1, 4, 20),
(2, 3, 30),
(2, 4, 40),
(3, 1, 20),
(3, 2, 50),
(3, 3, 10);

SELECT C.CUST_NO, I.ITEM_NO, ISNULL(O.QTY_ORDERED, 0) AS QTY
FROM (SELECT DISTINCT CUST_NO FROM ORDERED) AS C
CROSS JOIN Item AS I
LEFT JOIN ORDERED AS O
ON I.ITEM_NO = O.ITEM_NO AND C.CUST_NO = O.CUST_NO
ORDER BY I.ITEM_NO;


--Task 2
CREATE TABLE Approver 
(
ID INT
,Name VARCHAR(10)
)
GO
 
INSERT INTO Approver(ID,Name)
VALUES (1001,'Ram'), (1002,'Ramesh'), (1003,'Supriya'), (1004,'Sharlee')

CREATE TABLE TicketDetails
(
TicketID INT
,CreatedBy INT
,ApprovedBy INT
)
GO
 
INSERT INTO TicketDetails(TicketID,CreatedBy,ApprovedBy)
VALUES
(1,1001,1004),
(2,1001,1004),
(3,1002,1004),
(4,1001,1003);

SELECT T.TicketID, A2.Name AS CreatedBy, A1.Name AS ApprovedBy
FROM TicketDetails AS T
LEFT JOIN Approver AS A1
ON A1.ID = T.ApprovedBy 
LEFT JOIN Approver AS A2 
ON A2.ID = T.CreatedBy
