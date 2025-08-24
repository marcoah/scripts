-- =========================================================
-- Script: Datos para Dashboard de Ventas AdventureWorks 2019
-- =========================================================

-- 1. Vista de ventas con detalle de productos y clientes
SELECT 
    soh.SalesOrderID,
    soh.OrderDate,
    soh.DueDate,
    soh.ShipDate,
    soh.CustomerID,
    c.PersonID,
    p.FirstName + ' ' + p.LastName AS CustomerName,
    soh.TerritoryID,
    st.Name AS TerritoryName,
    sod.ProductID,
    prod.Name AS ProductName,
    prod.ProductSubcategoryID,
    psub.Name AS SubcategoryName,
    pc.ProductCategoryID,
    pc.Name AS CategoryName,
    sod.OrderQty,
    sod.UnitPrice,
    sod.UnitPriceDiscount,
    sod.LineTotal
FROM Sales.SalesOrderHeader soh
INNER JOIN Sales.SalesOrderDetail sod
    ON soh.SalesOrderID = sod.SalesOrderID
INNER JOIN Sales.Customer c
    ON soh.CustomerID = c.CustomerID
INNER JOIN Person.Person p
    ON c.PersonID = p.BusinessEntityID
INNER JOIN Sales.SalesTerritory st
    ON soh.TerritoryID = st.TerritoryID
INNER JOIN Production.Product prod
    ON sod.ProductID = prod.ProductID
INNER JOIN Production.ProductSubcategory psub
    ON prod.ProductSubcategoryID = psub.ProductSubcategoryID
INNER JOIN Production.ProductCategory pc
    ON psub.ProductCategoryID = pc.ProductCategoryID
ORDER BY soh.SalesOrderID;
