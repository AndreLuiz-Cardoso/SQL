CREATE OR ALTER VIEW RESULTADOS_ADW AS 
SELECT
	fis.SalesOrderNumber AS 'ORDER NUMBER',
	fis.OrderDate AS 'ORDER DATE',
	dpc.EnglishProductCategoryName AS 'PRODUCT CATEGORY',
	fis.CustomerKey AS 'CLIENT IN',
	dc.FirstName + ' ' + dc.LastName AS 'CLIENT NAME',
	REPLACE(REPLACE(dc.Gender, 'M', 'Male'), 'F', 'Female') AS 'GENDER',
	dg.EnglishCountryRegionName AS 'COUNTRY',
	fis.OrderQuantity AS 'SALES QTD',
	fis.SalesAmount AS 'SALES REVENUE',
	fis.TotalProductCost AS 'SALES COST',
	fis.SalesAmount - fis.TotalProductCost AS 'SALES PROFIT'
FROM FactInternetSales fis
INNER JOIN DimProduct dp ON fis.ProductKey = dp.ProductKey
	INNER JOIN DimProductSubcategory dps ON dp.ProductSubcategoryKey = dps.ProductSubcategoryKey
		INNER JOIN DimProductCategory dpc ON dps.ProductCategoryKey = dpc.ProductCategoryKey
INNER JOIN DimCustomer dc ON fis.CustomerKey = dc.CustomerKey
	INNER JOIN DimGeography dg ON dc. GeographyKey = dg.GeographyKey

SELECT TOP (100) *

FROM 
	RESULTADOS_ADW
