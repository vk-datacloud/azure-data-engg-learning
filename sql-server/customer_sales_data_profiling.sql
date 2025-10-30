-- Project: Customer Sales Data Profiling (SQL Server)
-- Author: Venkat JK (vk-datacloud)
-- Objective:
--   Sample SQL script typically used before migrating data
--   from on-prem SQL Server to Azure Data Lake / Synapse.
 
Use AdventureWorks2022

-- Row count check
SELECT COUNT(*) AS TotalRecords 
FROM Sales.CustomerSales;

-- Duplicate check for CustomerID
SELECT CustomerID, COUNT(*) AS DuplicateCount
FROM dbo.CustomerSales
GROUP BY CustomerID
HAVING COUNT(*) > 1;

-- Null Email check
SELECT COUNT(*) AS NullEmailCount
FROM dbo.CustomerSales
WHERE Email IS NULL OR Email = '';

-- Check abnormal order amounts
SELECT TOP 10 *
FROM dbo.CustomerSales
WHERE TotalAmount < 0
ORDER BY TotalAmount ASC;

-------------------------------------
-- End of Script
-------------------------------------
