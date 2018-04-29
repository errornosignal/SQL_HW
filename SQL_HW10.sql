--Reid Nolan
--Homework 10 – SQL

use MyGuitarShop;

--1. Write a script that creates and calls a stored procedure
--named spInsertCategory. First, code a statement that creates a procedure that adds
--a new row to the Categories table. To do that, this procedure should have
--one parameter for the category name.
	--a. Code at least two EXEC statements that test this procedure. (Note that
	--this table doesn’t allow duplicate category names.)

GO
CREATE PROCEDURE spInsertCategory
	@CategoryName varchar(35)
AS
BEGIN
	INSERT INTO Categories (CategoryName)
	VALUES (@CategoryName);
END
GO

EXECUTE spInsertCategory 'Brass';
EXECUTE spInsertCategory 'Woodwinds';

SELECT * FROM Categories;

--2. Write a script that creates and calls a function named fnDiscountPrice that
--calculates the discount price of an item in the OrderItems table (discount
--amount subtracted from item price). To do that, this function should accept
--one parameter for the item ID, and it should return the value of the
--discount price for that item.

GO
CREATE FUNCTION fnDiscountPrice
	(@ItemID int)
	RETURNS money
AS
BEGIN
	RETURN (SELECT SUM(ItemPrice - DiscountAmount)
			FROM OrderItems
			WHERE ItemID = @ItemID);
END;
GO

DECLARE @Result1 TABLE (ItemID int, OrderID int, ProductID int, ItemPrice money, DiscountAmount money, Quantity int, DiscountPrice money)
DECLARE @RowCount int
SET @RowCount = (SELECT COUNT(ItemID) FROM OrderItems) 
DECLARE @Index int
SET @Index = 1

WHILE (@Index <= @RowCount)
BEGIN
	INSERT INTO @Result1 (ItemID, OrderID, ProductID, ItemPrice, DiscountAmount, Quantity, DiscountPrice) 
	SELECT ItemID, OrderID, ProductID, ItemPrice, DiscountAmount, Quantity, dbo.fnDiscountPrice(@Index)
	FROM OrderItems
	WHERE ItemID = @Index;
	SET @Index = @Index + 1
END

SELECT * FROM @Result1

--3. Write a script that creates and calls a function named fnItemTotal that
--calculates the total amount of an item in the OrderItems table (discount
--price multiplied by quantity). To do that, this function should accept one
--parameter for the item ID, it should use the DiscountPrice function that you
--created in exercise 2, and it should return the value of the total for that item.

GO
CREATE FUNCTION fnItemTotal
	(@ItemID int)
	RETURNS money
AS
BEGIN
	RETURN (SELECT SUM(dbo.fnDiscountPrice(@ItemID) * Quantity)
			FROM OrderItems
			WHERE ItemID = @ItemID);
END;
GO

DECLARE @Result2 TABLE (ItemID int, OrderID int, ProductID int, ItemPrice money, DiscountAmount money, Quantity int, DiscountPrice money, ItemTotal money)
DECLARE @RowCount int
SET @RowCount = (SELECT COUNT(ItemID) FROM OrderItems) 
DECLARE @Index int
SET @Index = 1

WHILE (@Index <= @RowCount)
BEGIN
	INSERT INTO @Result2 (ItemID, OrderID, ProductID, ItemPrice, DiscountAmount, Quantity, DiscountPrice, ItemTotal) 
	SELECT ItemID, OrderID, ProductID, ItemPrice, DiscountAmount, Quantity, dbo.fnDiscountPrice(@Index), dbo.fnItemTotal(@Index)
	FROM OrderItems
	WHERE ItemID = @Index;
	SET @Index = @Index + 1
END

SELECT * FROM @Result2

--4. Write a script that creates and calls a stored procedure named
--spInsertProduct that inserts a row into the Products table. This stored
--procedure should accept five parameters. One parameter for each of these
--columns: CategoryID, ProductCode, ProductName, ListPrice, and DiscountPercent.
  --a. This stored procedure should set the Description column to an empty
  --string, and it should set the DateAdded column to the current date.
  --b. If the value for the ListPrice column is a negative number, the stored
  --procedure should raise an error that indicates that this column
  --doesn’t accept negative numbers. Similarly, the procedure should raise
  --an error if the value for the DiscountPercent column is a negative number.
  --c. Code at least two EXEC statements that test this procedure.

GO
CREATE PROCEDURE spInsertProduct
	(@CategoryID int, @ProductCode varchar(10), @ProductName varchar(255), @ListPrice money, @DiscountPercent money)
AS
BEGIN
	IF (@ListPrice >= 0 AND @DiscountPercent >= 0)
		INSERT INTO Products (CategoryID, ProductCode, ProductName, Description, ListPrice, DiscountPercent, DateAdded)
		VALUES (@CategoryID, @ProductCode, @ProductName, '', @ListPrice, @DiscountPercent, GETDATE());		
	ELSE
		IF @ListPrice < 0
			THROW 51001, 'ListPrice must be non-negative.', 1;
			RETURN;
		IF @DiscountPercent < 0
			THROW 51002, 'DiscountPercent must be non-negative.', 1;
			RETURN;
END
GO

EXECUTE spInsertProduct 2, 'hgh-34','Yamaha 32 MIDI',565,20;
EXECUTE spInsertProduct 3,'ega-32','Ludwig Snare Drum',-320,-15

SELECT * FROM Products

--5. Write a script that creates and calls a stored procedure named
--spUpdateProductDiscount that updates the DiscountPercent column in the
--Products table. This procedure should have one parameter for the product ID
--and another for the discount percent.
  --a. If the value for the DiscountPercent column is a negative number, the
  --stored procedure should raise an error that indicates that the value for this column must be a positive number.
  --b. Code at least two EXEC statements that test this procedure.

GO
CREATE PROCEDURE spUpdateProductDiscount
	@ProductID int,
	@DiscountPercent int
AS
BEGIN
	BEGIN TRY
		UPDATE Products
		SET DiscountPercent = @DiscountPercent
		WHERE ProductID = @ProductID
	END TRY
	BEGIN CATCH
		IF @DiscountPercent < 0
			THROW 51003, 'DiscountPercent must be non-negative.', 1;
			RETURN;
	END CATCH
END;
GO

EXECUTE spUpdateProductDiscount 2,10
EXECUTE spUpdateProductDiscount 1,-50

SELECT * FROM Products

--6. Create a trigger named Products_UPDATE that checks the new value for the
--DiscountPercent column of the Products table. This trigger should raise an
--appropriate error if the discount percent is greater than 100 or less than 0.
  --a. If the new discount percent is between 0 and 1, this trigger should
  --modify the new discount percent by multiplying it by 100. That way, a
  --discount percent of .2 becomes 20.
  --b. Test this trigger with an appropriate UPDATE statement.



--7. Create a trigger named Products_INSERT that inserts the current date for the
--DateAdded column of the Products table if the value for that column is null.
  --a. Test this trigger with an appropriate INSERT statement.



--8. Create a table named ProductsAudit. This table should have all columns of
--the Products table, except the Description column. Also, it should have an
--AuditID column for its primary key, and the DateAdded column should be
--changed to DateUpdated.
  --a. Create a trigger named Products_UPDATE. This trigger should insert the
  --old data about the product into the ProductsAudit table after the row
  --is updated. Then, test this trigger with an appropriate UPDATE
  --statement.



--Submitting your program -
--You will submit this assignment on blackboard. You are allowed one submission.
--Submit your .sql file and a document (*.docx or *.rtf) that contains screen shots
--of the results of your procedures, triggers, and functions.