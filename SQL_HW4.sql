--Reid Nolan
--Homework 4 – SQL

use MyGuitarShop;

--1. Write a SELECT statement that returns the same result set as this SELECT
	--statement, but don’t use a join. Instead, use a subquery in a WHERE clause that 
	--uses the IN keyword.
		--SELECT DISTINCT CategoryName
		--FROM Categories c JOIN Products p
		--	ON c.CategoryID = p.CategoryID
		--ORDER BY CategoryName
	--3 Records
	SELECT CategoryName 
	FROM Categories
	WHERE CategoryID IN
		(SELECT CategoryID
		FROM Products)
	ORDER BY CategoryName;

--2. Write a SELECT statement that answers this question: Which products have a list
	--price that’s greater than the average list price for all products?
	--Return the ProductName and ListPrice columns for each product.
	--Sort the results by the ListPrice column in descending sequence.
	--2 Records
	SELECT ProductName, ListPrice
	FROM Products
	WHERE ListPrice >
		(SELECT AVG(ListPrice)
		FROM Products)
		ORDER BY ListPrice DESC

--3. Write a SELECT statement that returns the CategoryName column from the
	--Categories table.
	--Return one row for each category that has never been assigned to any product in
	--the Products table. To do that, use a subquery introduced with the NOT EXISTS
	--operator.
	--1 Record
	SELECT DISTINCT CategoryName
	FROM Categories AS C
	WHERE NOT EXISTS
		(SELECT CategoryID
		FROM Products AS P
		WHERE C.CategoryID = P.CategoryID)

--4. Write a SELECT statement that returns three columns: EmailAddress, OrderID, and
	--the order total for each customer. To do this, you can group the result set by
	--the EmailAddress and OrderID columns. In addition, you must calculate the order
	--total from the columns in the OrderItems table.

	--Write a second SELECT statement that uses the first SELECT statement in its
	--FROM clause. The main query should return two columns: the customer’s email
	--address and the largest order for that customer. To do this, you can group the
	--result set by the EmailAddress column.
	--9 Records

	SELECT C.EmailAddress, MAX([Order Total]) AS 'Largest Order'
	FROM Customers AS C JOIN  Orders AS O
	ON C.CustomerID = O.CustomerID JOIN 
		(SELECT C.EmailAddress, O.OrderID, (ItemPrice * Quantity) - (Quantity * DiscountAmount) AS 'Order Total'
		FROM Customers AS C JOIN Orders AS O
		ON C.CustomerID= O.CustomerID JOIN OrderItems AS OI
		ON O.OrderID = OI.OrderID) AS L
	ON L.OrderId = O.OrderID
	GROUP BY C.EmailAddress

	--Suggested by Shane:
	--SELECT EmailAddress, MAX(OrderTotal) AS MaxOrderTotal
	--FROM
	--(
	--  SELECT EmailAddress, o.OrderID, SUM((ItemPrice - DiscountAmount) * Quantity) AS OrderTotal
	--  FROM Customers c
	--    JOIN Orders o ON c.CustomerID = o.CustomerID
	--    JOIN OrderItems oi ON o.OrderID = oi.OrderID
	--  GROUP BY EmailAddress, o.OrderID
	--) IC
	--GROUP BY EmailAddress, OrderID​

--5. Write a SELECT statement that returns the name and discount percent of each
	--product that has a unique discount percent. In other words, don’t include
	--products that have the same discount percent as another product.
	--Sort the results by the ProductName column.
	--6 Records
	SELECT P1.ProductName, P1.DiscountPercent
	FROM Products AS P1
	WHERE P1.DiscountPercent NOT IN
		(SELECT P2.DiscountPercent
		FROM Products AS P2
		WHERE P1.ProductName <> P2.ProductName)
	Order BY ProductName

--6. Use a correlated subquery to return one row per customer, representing the
	--customer’s oldest order (the one with the earliest date). Each row should
	--include these three columns: EmailAddress, OrderID, and OrderDate.
	--7 Records
	SELECT EmailAddress, OrderID, OrderDate
	FROM Customers AS C JOIN Orders AS O_main
	ON C.CustomerID = O_main.CustomerID
	WHERE OrderDate =
		(SELECT MIN(OrderDate)
		FROM Orders AS O_sub
		WHERE O_sub.CustomerID = O_main.CustomerID)
	ORDER BY EmailAddress, OrderID
		
--Submitting your program -
--You will submit this assignment on blackboard. You are allowed one submission.
--Submit your .sql file and a document (*.docx or *.rtf) that contains screen shots
--of the query results.