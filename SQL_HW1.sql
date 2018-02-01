--Reid Nolan
--Homework 1 – SQL
--In these exercises, you’ll enter and run your own SELECT statements.

use MyGuitarShop;

--1. Write a SELECT statement that returns four columns from the Products table: ProductCode, ProductName, ListPrice, and DiscountPercent. Then, run this statement to make sure it works correctly.
--Add an ORDER BY clause to this statement that sorts the result set by list price in descending sequence. Then, run this statement again to make sure it works correctly. This is a good way to build and test a statement, one clause at a time.
--10 RECORDS
	SELECT ProductCode, ProductName, ListPrice, DiscountPercent
	FROM Products
	ORDER BY ListPrice DESC;

--2. Write a SELECT statement that returns one column from the Customers table named FullName that joins the LastName and FirstName columns.
--Format this column with the last name, a comma, a space, and the first name like this:
--Doe, John
--Sort the result set by last name in ascending sequence.
--Return only the contacts whose last name begins with a letter from M to Z.
--4 RECORDS
	SELECT LastName + ', ' + FirstName AS FullName
	FROM Customers
	WHERE LastName > 'M'
	ORDER BY LastName

--3. Write a SELECT statement that returns these column names and data from the Products table:
--ProductName The ProductName column
--ListPrice The ListPrice column
--DateAdded The DateAdded column
--Return only the rows with a list price that’s greater than 500 and less than 2000.
--Sort the result set in descending sequence by the DateAdded column.
--5 RECORDS
	SELECT ProductName, ListPrice, DateAdded
	FROM Products
	WHERE ListPrice > 500 AND ListPrice < 2000
	ORDER BY DateAdded DESC;

--4. Write a SELECT statement that returns these column names and data from the Products table:
--ProductName The ProductName column
--ListPrice The ListPrice column
--DiscountPercent The DiscountPercent column
--DiscountAmount A column that’s calculated from the previous two columns
--DiscountPrice A column that’s calculated from the previous three columns
--Sort the result set by discount price in descending sequence.
--10 RECORDS
	SELECT ProductName, ListPrice, DiscountPercent, ListPrice * DiscountPercent * 0.01 AS DiscountAmount, ListPrice - (ListPrice * DiscountPercent * 0.01) AS DiscountPrice
	FROM Products
	ORDER BY DiscountPrice DESC;

--5. Write a SELECT statement that returns these column names and data from the OrderItems table:
--ItemID The ItemID column
--ItemPrice The ItemPrice column
--DiscountAmount The DiscountAmount column
--Quantity The Quantity column
--PriceTotal A column that’s calculated by multiplying the item
--price by the quantity
--DiscountTotal A column that’s calculated by multiplying the discount
--amount by the quantity
--ItemTotal A column that’s calculated by subtracting the discount
--amount from the item price and then multiplying by the
--quantity
--Only return rows where the ItemTotal is greater than 500.
--Sort the result set by item total in descending sequence.
--5 RECORDS
	SELECT ItemID, ItemPrice, DiscountAmount, Quantity, ItemPrice * Quantity AS PriceTotal, DiscountAmount * Quantity AS DiscountTotal, (ItemPrice - DiscountAmount) * Quantity AS ItemTotal
	FROM OrderItems
	WHERE  (ItemPrice - DiscountAmount) * Quantity > 500
	ORDER BY ItemTotal DESC;

--Work with nulls and test expressions
--6. Write a SELECT statement that returns these columns from the Orders table:
--OrderID The OrderID column
--OrderDate The OrderDate column
--ShipDate The ShipDate column
--Return only the rows where the ShipDate column contains a null value.
--3 RECORDS
	SELECT OrderID, OrderDate, ShipDate
	FROM Orders
	WHERE ShipDate IS NULL;

--7. Write a SELECT statement without a FROM clause that creates a row with these
--columns:
--Price 100 (dollars)
--TaxRate .07 (7 percent)
--TaxAmount The price multiplied by the tax rate
--Total The price plus tax
--To calculate the fourth column, add the expressions you used for the first and
--third columns.
--1 RECORD
	SELECT 100 AS Price, 0.07 AS TaxRate, 100 * 0.07 AS TaxAmount, 100 + (100 * 0.07) AS Total

--Submitting your program -
--You will submit this assignment on blackboard. You are allowed one submission.
--Submit your .sql file and a document (*.docx or *.rtf) that contains screen shots
--of the query results.