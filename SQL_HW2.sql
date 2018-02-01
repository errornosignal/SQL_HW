--Reid Nolan
--Homework 2 – SQL
--In these exercises, you’ll enter and run your own SELECT statements.

use MyGuitarShop;

--1. Write a SELECT statement that joins the Categories table to the Products table and returns these columns: CategoryName, ProductName, ListPrice.
--Sort the result set by CategoryName and then by ProductName in ascending order.
--10 Records
	SELECT CategoryName, ProductName, ListPrice
	FROM Categories AS C JOIN Products AS P
	ON C.CategoryID = P.CategoryID
	ORDER BY CategoryName, ProductName;

--2. Write a SELECT statement that joins the Customers table to the Addresses table and returns these columns: FirstName, LastName, Line1, City, State, ZipCode.
--Return one row for each address for the customer with an email address of allan.sherwood@yahoo.com.
--2 Records
	SELECT FirstName, LastName, Line1, City, State, ZipCode
	FROM Customers AS C JOIN Addresses AS A
	ON C.CustomerID = A.CustomerID
	WHERE EmailAddress = 'allan.sherwood@yahoo.com';

--3. Write a SELECT statement that joins the Customers table to the Addresses table and returns these columns: FirstName, LastName, Line1, City, State, ZipCode.
--Return one row for each customer, but only return addresses that are the shipping address for a customer.
--8 Records
	SELECT FirstName, LastName, Line1, City, State, ZipCode
	FROM Customers AS C JOIN Addresses AS A
	ON C.ShippingAddressID = A.AddressID;
	
--4. Write a SELECT statement that joins the Customers, Orders, OrderItems, and Products tables. This statement should return these columns: LastName, FirstName, OrderDate, ProductName, ItemPrice, DiscountAmount, and Quantity.
--Use aliases for the tables.
--Sort the final result set by LastName, OrderDate, and ProductName.
--12 Records
	SELECT LastName, FirstName, OrderDate, ProductName, ItemPrice, DiscountAmount, Quantity
	FROM Customers AS C JOIN Orders AS O
	ON C.CustomerID = O.CustomerID  JOIN OrderItems AS OI
	ON O.OrderID = OI.OrderID JOIN Products AS P
	ON OI.ProductID = P.ProductID
	ORDER BY LastName, OrderDate, ProductName;

--5. Write a SELECT statement that returns the ProductName and ListPrice columns from the Products table.
--Return one row for each product that has the same list price as another product. (Hint: Use a self-join to check that the ProductID columns aren’t equal but the ListPrice column is equal.)
--Sort the result set by ProductName.
--2 Records
	SELECT P1.ProductName, P1.ListPrice
	FROM Products P1, Products P2
	WHERE P1.ProductID <> P2.ProductID AND P1.ListPrice = P2.ListPrice
	ORDER BY ProductName

--6. Write a SELECT statement that returns these two columns:
--CategoryName The CategoryName column from the Categories table
--ProductID The ProductID column from the Products table
--Return one row for each category that has never been used. (Hint: Use an outer join and only return rows where the ProductID column contains a null value.)
--1 Record
	SELECT CategoryName, ProductID
	FROM Categories AS C FULL OUTER JOIN Products AS P
	ON C.CategoryID = P.CategoryID
	WHERE P.ProductID IS NULL

--7. Use the UNION operator to generate a result set consisting of three columns from the Orders table:
--ShipStatus A calculated column that contains a value of SHIPPED or NOT SHIPPED
--OrderID The OrderID column
--OrderDate The OrderDate column
--If the order has a value in the ShipDate column, the ShipStatus column should contain a value of SHIPPED. Otherwise, it should contain a value of NOT SHIPPED.
--Sort the final result set by OrderDate.
--9 Records
	SELECT OrderID, OrderDate, 'SHIPPED' AS ShipStatus
	FROM Orders
	WHERE ShipDate IS NOT NULL
	UNION
	SELECT OrderID, OrderDate, 'NOT SHIPPED' AS ShipStatus
	FROM Orders
	WHERE ShipDate IS NULL
	ORDER BY OrderDate

--Submitting your program -
--You will submit this assignment on blackboard. You are allowed one submission. Submit your .sql file and a document (*.docx or *.rtf) that contains screen shots of the query results.
