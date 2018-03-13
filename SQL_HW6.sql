--Reid Nolan
--Homework 6 – SQL

use MyGuitarShop;

--1. Write a SELECT statement that returns these columns from the Products table:
--a. The ListPrice column
--b. A column that uses the CAST function to return the ListPrice column
--with 1 digit to the right of the decimal point
--c. A column that uses the CONVERT function to return the ListPrice column
--as an integer
--d. A column that uses the CAST function to return the ListPrice column as
--an integer

SELECT 
	ListPrice, 
	CAST(ListPrice AS decimal(18,1)) AS ListPrice_b, 
	CONVERT(int, ListPrice) AS ListPrice_c, 
	CAST(ListPrice AS int) AS ListPrice_d
FROM Products;


--2. Write a SELECT statement that returns these columns from the Products table:
--a. The DateAdded column
--b. A column that uses the CAST function to return the DateAdded column
--with its date only (year, month, and day)
--c. A column that uses the CAST function to return the DateAdded column
--with its full time only (hour, minutes, seconds, and milliseconds)
--d. A column that uses the CAST function to return the DateAdded column
--with just the month and day

SELECT 
	DateAdded, 
	CAST(DateAdded AS date) AS DateAdded_b, 
	CAST(DateAdded AS time) AS DateAdded_c, 
	CAST(DateAdded AS varchar(6)) AS DateAdded_d
FROM Products;


--3. Write a SELECT statement that returns these columns from the Orders table:
--a. A column that uses the CONVERT function to return the OrderDate column
--in this format: MM/DD/YYYY. In other words, use 2-digit months and
--days and a 4-digit year, and separate each date component with
--slashes.
--b. A column that uses the CONVERT function to return the OrderDate column
--with the date, and the hours and minutes on a 12-hour clock with an
--am/pm indicator.
--c. A column that uses the CONVERT function to return the OrderDate column
--with 2-digit hours, minutes, and seconds on a 24-hour clock. Use
--leading zeros for all date/time components.
SELECT
	CONVERT(varchar, OrderDate, 101) AS OrderDate_a,
	CONVERT(varchar, OrderDate) AS OrderDate_b,
	CONVERT(varchar, OrderDate, 8) AS OrderDate_c
FROM Orders;


--Submitting your program -
--You will submit this assignment on blackboard. You are allowed one submission.
--Submit your .sql file and a document (*.docx or *.rtf) that contains screen shots
--of the query results.