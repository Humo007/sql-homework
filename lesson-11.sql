-- TASK 1

SELECT *FROM Production.Product
SELECT *FROM Sales.SalesOrderDetail

CREATE FUNCTION dbo.Total_Sales(@ProductCategoryID int)
RETURNS DECIMAL(10,2)
BEGIN
     DECLARE @TotalSales DECIMAL(10,2)
     SELECT @TotalSales = SUM(S.OrderQty * S.UnitPrice)
	 FROM Sales.SalesOrderDetail AS S
	 JOIN Production.Product AS P 
	 ON S.ProductID = P.ProductID
	 WHERE P.ProductSubcategoryID = @ProductCategoryID
RETURN @TotalSales 
END 
SELECT dbo.Total_Sales(1) AS TOTAL_SALES
-- TASK 1.1
SELECT PC.ProductCategoryID, PC.Name, 
       dbo.Total_Sales(PC.ProductCategoryID) AS TOTAL_SALES
FROM Production.ProductCategory AS PC


--TASK 2
CREATE FUNCTION dbo.Top_Selling_Product(@Cat_ID INT)
RETURNS VARCHAR(100)
as
BEGIN
DECLARE @TopProductName VARCHAR(100)
           SELECT TOP 1 @TopProductName = P.Name 
		   FROM Sales.SalesOrderDetail AS SO
           JOIN Production.Product AS P
		   ON SO.ProductID = P.ProductID
		   WHERE P.ProductSubcategoryID = @Cat_ID
		   GROUP BY P.Name
		   ORDER BY SUM(SO.OrderQty) DESC
RETURN @TopProductName
END 
SELECT  PC.ProductCategoryID, pc.Name, dbo.Top_Selling_Product(PC.ProductCategoryID) AS TopProductName
FROM Production.ProductCategory AS PC

-- TASK 3
CREATE FUNCTION TVF_TopProductNameAndPrice(@ProductCategoryID INT)
RETURNS TABLE 
RETURN (SELECT TOP 1 P.Name, P.ListPrice
        FROM Sales.SalesOrderDetail AS SO
        JOIN Production.Product AS P
        ON SO.ProductID = P.ProductID
		WHERE P.ProductSubcategoryID = @ProductCategoryID
		GROUP BY P.Name, P.ListPrice
		ORDER BY SUM(SO.OrderQty) DESC)


SELECT PC.ProductCategoryID, PC.Name, FT.*
FROM Production.ProductCategory AS PC
CROSS APPLY TVF_TopProductNameAndPrice(PC.ProductCategoryID) AS FT

-- TASK 5
SELECT *FROM Sales.SalesOrderHeader
CREATE FUNCTION dbo.TopSellingProductByState(@Country NVARCHAR(100), @State NVARCHAR(100))
RETURNS NVARCHAR(100)
AS
BEGIN
      DECLARE @TopProduct NVARCHAR(100)

      SELECT TOP 1 @TopProduct = P.Name
      FROM Sales.SalesOrderDetail AS SO
      JOIN Production.Product AS P ON SO.ProductID = P.ProductID
	  JOIN Sales.SalesOrderHeader AS SOH ON SO.SalesOrderID = SOH.SalesOrderID
	  JOIN Sales.SalesTerritory AS ST ON ST.TerritoryID = SOH.TerritoryID
	  JOIN Person.StateProvince AS SP ON SP.TerritoryID = ST.TerritoryID
	  JOIN Person.CountryRegion AS CR ON CR.CountryRegionCode = SP.CountryRegionCode
	  WHERE CR.Name = @Country AND SP.Name = @State
	  GROUP BY P.Name
	  ORDER BY SUM(SO.OrderQty) DESC
RETURN @TopProduct
END

SELECT
	CR.Name AS Country,
	SP.Name AS [State/Province],
	dbo.TopSellingProductByState(CR.Name, SP.Name) AS TopSellingProduct
FROM Person.StateProvince as SP 
left join Sales.SalesTerritory AS ST ON SP.TerritoryID=ST.TerritoryID
left join Person.CountryRegion AS CR ON CR.CountryRegionCode=SP.CountryRegionCode