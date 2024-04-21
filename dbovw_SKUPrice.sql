CREATE VIEW dbo.vw_SKUPrice
AS
SELECT ID_SKU.*, dbo.udf_GetSKUPrice(ID_SKU INT) AS PricePerUnit
FROM dbo.SKU;
