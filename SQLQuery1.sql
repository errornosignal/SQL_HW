use northwind;

--SELECT EmployeeID, LastName, FirstName
--FROM Employees;

--SELECT LastName, FirstName
--FROM Employees
--WHERE EmployeeID = 2;

--SELECT EmployeeID
--FROM Employees
--WHERE LastName = 'Fuller';

--SELECT LastName, EmployeeID
--FROM Employees
--WHERE LastName LIKE 'F%';

--SELECT LastName, EmployeeID
--FROM Employees
--WHERE LastName LIKE 'F[A-U]%';

--SELECT * 
--FROM Products;

--SELECT ProductName, UnitPrice, UnitsInStock, UnitPrice * UnitsInStock AS 'Total Value'
--FROM Products
--WHERE UnitsInStock > 0
--ORDER BY ProductName ASC;

--SELECT *
--FROM Orders;

--SELECT OrderID, OrderDate
--FROM Orders
--WHERE OrderDate >= '1996-07-01' AND
--	  OrderDate < '1996-08-01';

--SELECT EmployeeID, LastName, FirstName
--FROM Employees;

--SELECT OrderID, OrderDate
--FROM Orders;

-------------------------------------------------------------------
----JOINS
--SELECT LastName, FirstName, OrderID, OrderDate
--FROM Employees JOIN Orders ON
--Employees.EmployeeID = Orders.EmployeeID
--WHERE LastName = 'Peacock';

--SELECT LastName, FirstName, OrderID, OrderDate
--FROM Employees, Orders
--WHERE Employees.EmployeeID = Orders.EmployeeID AND
--LastName = 'Peacock'

--SELECT OrderID, OD.UnitPrice, ProductName
--FROM [Order Details] AS OD JOIN Products AS P
--ON OD.ProductID = P.ProductID
--WHERE OrderID = 10250;

--SELECT OD.OrderID, OD.UnitPrice, ProductName, E.EmployeeID, LastName, FirstName
--FROM [Order Details] AS OD JOIN Products AS P
--ON OD.ProductID = P.ProductID JOIN Orders AS O
--ON OD.OrderID = O.OrderID JOIN Employees AS E
--ON O.EmployeeID = E.EmployeeID
--WHERE O.OrderID = 10250;

--SELECT E.EmployeeID, O.OrderID, E.LastName, E.FirstName
--FROM Employees AS E LEFT JOIN Orders AS O
--ON E.EmployeeID = O.EmployeeID
--WHERE O.OrderID IS NULL;

--SELECT Workers.EmployeeID, Workers.LastName, Workers.FirstName, Workers.ReportsTo,
--		Managers.EmployeeID Managers, Managers.LastName, Managers.FirstName
--FROM Employees AS Managers JOIN Employees AS Workers
--ON Managers.EmployeeID = Workers.ReportsTo

--SELECT CompanyName, ProductName
--FROM Suppliers AS S LEFT JOIN  Products AS P
--ON S.SupplierID = P.SupplierID
--WHERE P.ProductID IS NULL;

--SELECT City, CompanyName, ContactName, 'Customer' AS Relationship
--FROM Customers
--UNION
--SELECT City, CompanyName, ContactName, 'Supplier' AS Relationship
--FROM Suppliers
--ORDER BY City, CompanyName;


----ONLY FOR INNER JOINS
----EXPLICIT SYNTAX
--SELECT ProductName, Discontinued, CategoryName
--FROM Products AS P JOIN Categories AS C
--ON P.CategoryID = C.CategoryID
--WHERE Discontinued = 'True'
--ORDER BY C.CategoryName;

----IMPLICIT SYNTAX
--SELECT ProductName,Discontinued, CategoryName
--FROM Products AS P, Categories AS C
--WHERE p.CategoryID = C.CategoryID AND P.Discontinued = 'True'
---------------------------------------------------------------------

--SELECT OrderID,  P.ProductID, ProductName, OD.Quantity, OD. UnitPrice, OD.Quantity * OD.UnitPrice AS 'Total'
--FROM Products AS P JOIN [Order Details] AS OD
--ON P.ProductID = OD.ProductID
--ORDER BY OD.OrderID, ProductID
----WHERE OrderID IS NULL

--SELECT * FROM Products

--SELECT DISTINCT E.FirstName + ' ' +  E.LastName AS 'Employee Name', P.ProductName, P.ProductID, OD.OrderID, O.CustomerID,
--C.CompanyName, C.ContactName, E.EmployeeID
--FROM Products AS P FULL OUTER JOIN [Order Details] AS OD
--ON P.ProductID = OD.ProductID FULL OUTER JOIN Orders AS O
--ON OD.OrderID = O.OrderID FULL OUTER JOIN Customers AS C
--ON O.CustomerID = C.CustomerID FULL OUTER JOIN Employees AS E
--ON O.EmployeeID = E.EmployeeID
--WHERE ProductName = 'Tofu' AND E.FirstName IS NULL
--Order By [Employee Name]


--SELECT DISTINCT E.FirstName + ' ' +  E.LastName AS 'Employee Name', P.ProductName, P.ProductID, OD.OrderID, O.CustomerID, E.EmployeeID
--FROM Products AS P JOIN [Order Details] AS OD
--ON P.ProductID = OD.ProductID  JOIN Orders AS O
--ON OD.OrderID = O.OrderID JOIN Customers AS C
--ON O.CustomerID = C.CustomerID JOIN Employees AS E
--ON O.EmployeeID = E.EmployeeID
--WHERE ProductName = 'Tofu'
--EXCEPT
--Select E.FirstName + ' ' +  E.LastName AS 'Employee Name', P.ProductName, P.ProductID, OD.OrderID, O.CustomerID, E.EmployeeID
--FROM Employees AS E JOIN Orders AS O
--ON E.EmployeeID = O.EmployeeID Join [Order Details] AS OD
--ON O.OrderID = OD.OrderID JOIN Products AS P
--ON OD.ProductID = P.ProductID
--ORDER BY ProductName, [Employee Name]



--Select E.FirstName + ' ' +  E.LastName AS 'Employee Name', P.ProductName, P.ProductID, OD.OrderID, O.CustomerID, E.EmployeeID
--FROM Employees AS E JOIN Orders AS O
--ON E.EmployeeID = O.EmployeeID Join [Order Details] AS OD
--ON O.OrderID = OD.OrderID JOIN Products AS P
--ON OD.ProductID = P.ProductID


--SELECT DISTINCT E.FirstName + ' ' +  E.LastName AS 'Employee Name', P.ProductName, P.ProductID, OD.OrderID, O.CustomerID, E.EmployeeID
--FROM Products AS P JOIN [Order Details] AS OD
--ON P.ProductID = OD.ProductID  JOIN Orders AS O
--ON OD.OrderID = O.OrderID JOIN Customers AS C
--ON O.CustomerID = C.CustomerID JOIN Employees AS E
--ON O.EmployeeID = E.EmployeeID
--WHERE ProductName = 'Tofu'(Select E.FirstName + ' ' +  E.LastName AS 'Employee Name' FROM Employees AS E)
----ORDER BY P.ProductName, [Employee Name]

--SELECT C.CustomerId, C.ContactName
--FROM  Customers AS C LEFT JOIN Orders AS O 
--ON O.CustomerId = C.CustomerId
--WHERE OrderId IS NULL

---------------------------------TOFU SUBMIT------------------------
--SELECT Distinct E.FirstName + ' ' + E.LastName AS [Employee Name], P.ProductName, P.ProductID, O.OrderID
--FROM Employees AS E LEFT JOIN Orders AS O
--ON E.EmployeeID = O.EmployeeID Join [Order Details] AS OD
--ON O.OrderID = OD.OrderID JOIN Products AS P
--ON OD.ProductID = P.ProductID
--WHERE ProductName = 'Tofu'
--Order By [Employee Name]

--SELECT E.FirstName + ' ' + E.LastName AS [Employee Name]
--FROM Products AS P Join [Order Details] AS OD
--ON P.ProductID = OD.ProductID JOIN Orders AS O
--ON OD.OrderID = O.OrderID JOIN Employees AS E
--ON O.EmployeeID = E.EmployeeID
--EXCEPT
--SELECT DISTINCT E.FirstName + ' ' + E.LastName AS [Employee Name] 
--FROM Products AS P Join [Order Details] AS OD
--ON P.ProductID = OD.ProductID JOIN Orders AS O
--ON OD.OrderID = O.OrderID JOIN Employees AS E
--ON O.EmployeeID = E.EmployeeID
--WHERE ProductName = 'Tofu'

--SELECT Distinct E.FirstName + ' ' + E.LastName AS [Employee Name]
--FROM Products AS P Join [Order Details] AS OD
--ON P.ProductID = OD.ProductID JOIN Orders AS O
--ON OD.OrderID = O.OrderID JOIN Employees AS E
--ON O.EmployeeID = E.EmployeeID
--Order BY [Employee Name]

--SELECT DISTINCT E.LastName + ', ' + E.FirstName AS 'Employee'
--FROM Products AS P JOIN [Order Details] AS OD
--ON P.ProductID = OD.ProductID JOIN Orders AS O
--ON OD.OrderID = O.OrderID AND P.ProductName = 'Tofu' RIGHT JOIN Employees AS E
--ON O.EmployeeID = E.EmployeeID  
--WHERE O.OrderID IS NULL​
------------------------------------END OF TOFU SUBMIT----------------

--use Northwind;

--SELECT * 
--FROM Orders;

--SELECT ShipCountry, COUNT(OrderID) AS 'Total Orders'
--FROM Orders
--GROUP BY ShipCountry
--HAVING COUNT(OrderID) < 50
--ORDER BY 'Total Orders' DESC;

--SELECT * FROM Products;

--SELECT P.ProductName, SUM(OD.Quantity) AS 'Total Sold',
--COUNT(OD.OrderID) AS 'Total Orders', AVG(OD.Quantity) AS 'Average Sold'
--FROM Products AS P, [Order Details] AS OD
--WHERE P.ProductID = OD.ProductID AND
--P.ProductID = 17
--GROUP BY P.ProductName;

--SELECT P.ProductName, SUM(OD.Quantity) AS 'Total Sold',
--COUNT(OD.OrderID) AS 'Total Orders', AVG(OD.Quantity) AS 'Average Sold'
--FROM Products AS P, [Order Details] AS OD
--WHERE P.ProductID = OD.ProductID AND
--P.Discontinued = 'False'
--GROUP BY P.ProductName WITH ROLLUP;

--SELECT COUNT(ProductID) FROM Products WHERE Discontinued = 'True';

--SELECT * FROM Shippers;

--SELECT S.CompanyName, COUNT(O.OrderID) AS 'Total Orders'
--FROM Shippers AS S JOIN Orders AS O
--ON S.ShipperID = O.ShipVia
--GROUP BY S.CompanyName WITH ROLLUP;

--SELECT COUNT(OrderID) FROM Orders;

--SELECT E.FirstName + ' ' + E.LastName AS 'Employee Name', 
--SUM(OD.UnitPrice * OD.Quantity) AS 'Total Sold', COUNT(DISTINCT O.OrderID)
--FROM Employees AS E JOIN Orders AS O 
--ON E.EmployeeID = O.EmployeeID JOIN [Order Details] AS OD
--ON O.OrderID = OD.OrderID
--GROUP BY E.FirstName + ' ' + E.LastName WITH ROLLUP;

--use Northwind;

--SELECT * 
--FROM Customers;

--SELECT O.OrderID
--FROM Orders AS O, Customers AS C
--WHERE O.CustomerID = C.CustomerID AND C.Phone = '030-0074321';

--SELECT OrderID 
--FROM Orders
--WHERE CustomerID = (
--	SELECT CustomerID 
--	FROM Customers
--	WHERE Phone = '030-0074321');

--SELECT ProductName
--FROM Products
--WHERE CategoryID = (
--	SELECT CategoryID
--	FROM Categories
--	WHERE CategoryName = 'Seafood');

--SELECT OrderID 
--FROM Orders
--WHERE CustomerID IN (
--	SELECT CustomerID 
--	FROM Customers
--	WHERE City = 'London');

--SELECT City 
--FROM Employees;

--SELECT ShipCity
--FROM Orders;

--SELECT O.OrderID 
--FROM Orders AS O
--WHERE EmployeeID IN (
--	SELECT EmployeeID 
--	FROM Employees AS E
--	WHERE O.ShipCity = E.City);

--SELECT OrderID
--FROM Orders
--WHERE OrderID IN (
--	SELECT OrderID 
--	FROM [Order Details]
--	WHERE ProductID = (
--		SELECT ProductID
--		FROM Products
--		WHERE ProductName = 'Tofu'));

---- We want a report of all Order ID Where the customer did not
---- purchase more than 10% of the average quantity sold for a given
---- product. 
--SELECT OD.OrderID
--FROM [Order Details] as OD
--WHERE Quantity < (
--	SELECT AVG(Quantity) * .1 
--	FROM [Order Details]
--	WHERE OD.ProductID = ProductID);

--SELECT * 
--FROM Products
--WHERE UnitPrice > ANY (
--	SELECT MAX(UnitPrice) AS 'Max Price'
--	FROM Products
--	GROUP BY CategoryID);