/*
Reid Nolan
Homework 5 – SQL

!!!NOTE – MAKE SURE you test whether a table has been modified correctly as you do
!!!these exercises, FOR EACH exercise write a select statement to show the data
!!!has been changed. You will need to include two queries for each problem the
!!!(Insert, Update, Delete) and the Select to show it worked.
*/

use MyGuitarShop;

--1. Write an INSERT statement that adds this row to the Categories table:

--CategoryName: Brass

--Code the INSERT statement so SQL Server automatically generates the value for
--the CategoryID column.

INSERT INTO Categories (CategoryName)  VALUES ('Brass');

SELECT CategoryID, CategoryName
FROM Categories
WHERE CategoryName = 'Brass'


--2. Write an UPDATE statement that modifies the row you just added to the
--Categories table. This statement should change the CategoryName column to
--“Woodwinds”, and it should use the CategoryID column to identify the row.

UPDATE Categories
SET CategoryName = 'Woodwinds'
WHERE CategoryID = 5;

SELECT CategoryID, CategoryName
FROM Categories
WHERE CategoryID = 5;


--3. Write a DELETE statement that deletes the row you added to the Categories table
--in exercise 1. This statement should use the CategoryID column to identify the
--row.

DELETE Categories
WHERE CategoryID = 5;

SELECT CategoryID, CategoryName
FROM Categories


--4. Write an INSERT statement that adds this row to the Products table:

--ProductID: The next automatically generated ID
--CategoryID: 4
--ProductCode: dgx_640
--ProductName: Yamaha DGX 640 88-Key Digital Piano
--Description: Long description to come.
--ListPrice: 799.99
--DiscountPercent: 0
--DateAdded: Today’s date/time.

--Use a column list for this statement.

INSERT INTO Products (CategoryID, ProductCode, ProductName,
						Description, ListPrice, DiscountPercent, DateAdded)
VALUES (4, 'dgx_640', 'Yamaha DGX 640 88-Key Digital Piano', 'Long description to come.',
		799.99, 0, SYSDATETIME());

SELECT ProductID,CategoryID, ProductCode, ProductName, Description, ListPrice,
		DiscountPercent, DateAdded
FROM Products
WHERE CategoryID = 4;


--5. Write an UPDATE statement that modifies the product you added in exercise 4.
--This statement should change the DiscountPercent column from 0% to 35%.

UPDATE Products
SET DiscountPercent = 35
WHERE ProductID = 11;

SELECT ProductID, DiscountPercent
FROM Products
WHERE ProductID = 11;


--6. Write a DELETE statement that deletes the row in the Categories table that has
--an ID of 4. When you execute this statement, it will produce an error since the
--category has related rows in the Products table. To fix that, precede the
--DELETE statement with another DELETE statement that deletes all products in this category.

DELETE FROM Products
WHERE CategoryID = 4;
DELETE FROM Categories
WHERE CategoryID = 4;

SELECT ProductID, CategoryID, ProductCode, ProductName,
		Description, ListPrice, DiscountPercent, DateAdded
FROM Products
WHERE CategoryID = 4;

SELECT CategoryID, CategoryName
FROM Categories
WHERE CategoryID = 4;


--7. Write an INSERT statement that adds this row to the Customers table:

--EmailAddress: rick@raven.com
--Password: (empty string)
--FirstName: Rick
--LastName: Raven

--Use a column list for this statement.

INSERT INTO Customers(EmailAddress, Password, FirstName, LastName)
VALUES ('rick@raven.com', '', 'Rick', 'Raven');

SELECT CustomerID, EmailAddress, Password, FirstName, LastName
FROM Customers
WHERE EmailAddress = 'rick@raven.com';


--8. Write an UPDATE statement that modifies the Customers table. Change the
--password column to “secret” for the customer with an email address of rick@raven.com.

UPDATE Customers
SET Password = 'secret'
WHERE EmailAddress = 'rick@raven.com';

SELECT EmailAddress, Password
FROM Customers
WHERE EMailAddress = 'rick@raven.com';


--9. Write an UPDATE statement that modifies the Customers table. Change the
--password column to “reset” for every customer in the table.

UPDATE Customers
SET Password = 'secret';

SELECT EmailAddress, Password
FROM Customers


/*
!!!Open the script named CreateMyGuitarShop.sql from Blackboard and run it. That
!!!should restore the data that’s in the database.

Submitting your program -

You will submit this assignment on blackboard. You are allowed one submission.
Submit your .sql file and a document (*.docx or *.rtf) that contains screen shots
of the query results.
*/