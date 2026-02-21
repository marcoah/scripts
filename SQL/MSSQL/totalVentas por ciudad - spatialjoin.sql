-- Consulta Directa
SELECT
    ci.CityName,
    ci.Province,
    SUM(fs.GrossSalesAmount) AS TotalSales
FROM FactSales fs
JOIN Customers c
    ON fs.CustomerID = c.CustomerID
JOIN Cities ci
    ON ci.geom.STContains(c.Location) = 1
GROUP BY
    ci.CityName,
    ci.Province
ORDER BY TotalSales DESC;

-- Vista
CREATE OR ALTER VIEW vw_sales_by_city
AS
SELECT
    ci.CityID,
    ci.CityName,
    ci.Province,
    SUM(fs.GrossSalesAmount) AS TotalSales
FROM FactSales fs
JOIN Customers c
    ON fs.CustomerID = c.CustomerID
JOIN Cities ci
    ON ci.geom.STContains(c.Location) = 1
GROUP BY
    ci.CityID,
    ci.CityName,
    ci.Province;
GO

-- clientes fuera de polígonos
SELECT COUNT(*) AS CustomersWithoutCity
FROM Customers c
WHERE NOT EXISTS (
    SELECT 1
    FROM Cities ci
    WHERE ci.geom.STContains(c.Location) = 1
);
