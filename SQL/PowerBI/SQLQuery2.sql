-- =========================================================
-- 2. Vista de clientes con ubicación
SELECT 
    c.CustomerID,
    p.BusinessEntityID,
    p.FirstName + ' ' + p.LastName AS CustomerName,
    a.AddressID,
    a.AddressLine1,
    a.City,
    sp.StateProvinceCode,
    cr.CountryRegionCode,
    st.Name AS TerritoryName
FROM Sales.Customer c
INNER JOIN Person.Person p
    ON c.PersonID = p.BusinessEntityID
LEFT JOIN Sales.CustomerAddress ca
    ON c.CustomerID = ca.CustomerID
LEFT JOIN Person.Address a
    ON ca.AddressID = a.AddressID
LEFT JOIN Person.StateProvince sp
    ON a.StateProvinceID = sp.StateProvinceID
LEFT JOIN Person.CountryRegion cr
    ON sp.CountryRegionCode = cr.CountryRegionCode
LEFT JOIN Sales.SalesTerritory st
    ON c.TerritoryID = st.TerritoryID;