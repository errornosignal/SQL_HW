--Reid Nolan
--Homework 3 – SQL

use MyGuitarShop;

--1. Write a SELECT statement that returns these columns: 
	--The count of the number of orders in the Orders table 
	--The sum of the TaxAmount columns in the Orders table 
	--1 Record
	SELECT COUNT(OrderID) AS 'Order Count', SUM(TaxAmount) AS 'Tax Total'
	FROM Orders;

--2. Write a SELECT statement that returns one row for each category that has products with these columns: 
	--The CategoryName column from the Categories table 
	--The count of the products in the Products table
	--The list price of the most expensive product in the Products table 
	--Sort the result set so the category with the most products appears first.
	--3 Records
	SELECT CategoryName, COUNT(ProductID) AS 'Product Count', MAX(ListPrice) AS 'Highest Item Price'
	FROM Categories AS C JOIN Products AS P
	ON C.CategoryId = P.CategoryID
	GROUP BY CategoryName
	ORDER BY COUNT(ProductID) DESC;

--3. Write a SELECT statement that returns one row for each customer that has orders with these columns: 
	--The EmailAddress column from the Customers table 
	--The sum of the item price in the OrderItems table multiplied by the quantiy in the OrderItems table 
	--The sum of the discount amount column in the OrderItems table multiplied by the quantiy in the OrderItems table 
	--Sort the result set in descending sequence by the item price total for each customer.
	--7 Records
	SELECT EmailAddress, SUM(ItemPrice) * Quantity AS 'Sub-Total', SUM(DiscountAmount) * Quantity AS 'Total Discount', (SUM(ItemPrice) * Quantity) - (SUM(DiscountAmount) * Quantity) AS 'Total'
	FROM Customers AS C JOIN Orders AS O
	ON C.CustomerID = O.CustomerID JOIN OrderItems AS OI
	ON O.OrderID = OI.OrderID
	GROUP BY C.CustomerID, EmailAddress, Quantity
	ORDER BY [Total Discount] DESC;

--4. Write a SELECT statement that returns one row for each customer that has orders with these columns: 
	--The EmailAddress column from the Customers table
	--A count of the number of orders 
	--The total amount for each order (Hint: First, subtract the discount amount from the price. Then, multiply by the quantity.) 
	--Return only those rows where the customer has more than than 1 order. 
	--Sort the result set in descending sequence by the sum of the line item amounts. 
	--3 Records
	SELECT EmailAddress, COUNT(O.OrderID) AS 'Order Count', SUM((ItemPrice - DiscountAmount) * Quantity) AS 'Total'
	FROM Customers AS C JOIN Orders AS O
	ON C.CustomerID = O.CustomerID JOIN OrderItems AS OI
	ON O.OrderID = OI.OrderID
	GROUP BY EmailAddress
	HAVING COUNT(O.OrderID) > 1
	ORDER BY Total DESC
	
--5. Modify the solution to exercise 4 so it only counts and totals line items that have an ItemPrice value that’s greater than 400.
	--2 Records
	SELECT EmailAddress, COUNT(O.OrderID) AS 'Order Count', SUM((ItemPrice - DiscountAmount) * Quantity) AS 'Total'
	FROM Customers AS C JOIN Orders AS O
	ON C.CustomerID = O.CustomerID JOIN OrderItems AS OI
	ON O.OrderID = OI.OrderID
	WHERE ItemPrice > 400
	GROUP BY EmailAddress
	HAVING COUNT(O.OrderID) > 1
	ORDER BY Total DESC

--6. Write a SELECT statement that answers this question: What is the total amount ordered for each product? Return these columns: 
	--The product name from the Products table 
	--The total amount for each product in the OrderItems table (Hint: You can calculate the total amount by subtracting the discount amount from the item price and then multiplying it by the quantity)
	--Use the WITH ROLLUP operator to include a row that gives the grand total.
	--10 Records
	SELECT ProductName, SUM((ItemPrice - DiscountAmount) * Quantity) AS 'Total'
	FROM Products AS P JOIN OrderItems AS OI
	ON P.ProductID = OI.ProductID
	GROUP BY ProductName WITH ROLLUP
	
--7. Write a SELECT statement that answers this question: Which customers have ordered more than one product? Return these columns:
	--The email address from the Customers table
	--The count of distinct products from the customer’s orders
	--3 Records
	SELECT EmailAddress, Count(P.ProductID) AS 'Products Ordered'
	FROM Customers AS C JOIN Orders AS O
	ON C.CustomerID = O.CustomerID JOIN OrderItems AS OI
	ON O.OrderID = OI.OrderID JOIN Products AS P
	ON OI.ProductID = P.ProductID
	GROUP BY EmailAddress
	HAVING Count(P.ProductID) > 1

--Submitting your program -
--You will submit this assignment on blackboard. You are allowed one submission.
--Submit your .sql file and a document (*.docx or *.rtf) that contains screen shots
--of the query results.