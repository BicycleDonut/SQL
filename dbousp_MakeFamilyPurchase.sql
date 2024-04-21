CREATE PROCEDURE dbo.usp_MakeFamilyPurchase
@FamilySurName varchar(255)
AS
BEGIN
IF NOT EXISTS (SELECT 1 FROM dbo.Family WHERE SurName = @FamilySurName)
BEGIN
RAISERROR('Error: Family does not exist.', 16, 1)
RETURN
END

UPDATE dbo.Family
SET BudgetValue = BudgetValue - (SELECT SUM(Value) FROM dbo.Basket WHERE SurName = @FamilySurName)
WHERE SurName = @FamilySurName
END
