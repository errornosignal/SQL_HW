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
--FROM Products AS P JOIN [Order Details] AS OD
--ON P.ProductID = OD.ProductID JOIN Orders AS O
--ON OD.OrderID = O.OrderID JOIN Customers AS C
--ON O.CustomerID = C.CustomerID JOIN Employees AS E
--ON O.EmployeeID = E.EmployeeID
--WHERE ProductName = 'Tofu';


--SELECT * --DISTINCT E.FirstName + ' ' +  E.LastName AS 'Employee Name', P.ProductName, P.ProductID, OD.OrderID, O.CustomerID, C.CompanyName, C.ContactName, E.EmployeeID
--FROM Products AS P FULL OUTER JOIN [Order Details] AS OD
--ON P.ProductID = OD.ProductID  FULL OUTER JOIN Orders AS O
--ON OD.OrderID = O.OrderID FUll OUTER JOIN Customers AS C
--ON O.CustomerID = C.CustomerID FUll OUTER JOIN Employees AS E
--ON O.EmployeeID = E.EmployeeID
--WHERE ProductName = 'Tofu' --AND O.OrderID = 0;
--ORDER BY ProductName




----GET 3 employees that did not sell tofu
--SELECT E.FirstName + ' ' + E.LastName AS 'Employee Name', P.ProductName
--FROM Employees AS E JOIN Orders AS O
--ON E.EmployeeID = O.EmployeeID JOIN [Order Details] AS OD
--ON O.OrderID = OD.OrderID JOIN Products AS P 
--ON OD.ProductID = P.ProductID
--WHERE 
--ORDER BY P.ProductName, [Employee Name]


--SELECT* FROM Orders;

--SELECT Count(OrderID) AS 'Total Orders'
--FROM Orders
--WHERE OrderDate > '1996-06-30' AND OrderDate < '1996-08-01';

--SELECT OrderID, ProductID, COUNT(ProductID) AS 'Unique Items', SUM(Quantity) AS 'Total Items'
--FROM [Order Details]
--GROUP BY OrderID, ProductID with CUBE
--HAVING SUM(Quantity) > 3

--SELECT OrderID, COUNT(ProductID) AS 'Total'
--FROM [Order Details]
--GROUP BY OrderID
--HAVING COUNT(ProductID) < 3;



--SELECT Distinct E.FirstName + ' ' + E.LastName AS 'Employee Name', E.EmployeeID, SUM(OD.UnitPrice * OD.Quantity) AS 'Total'
--FROM Employees AS E JOIN Orders AS O
--ON E.EmployeeID = O.EmployeeID JOIN [Order Details] AS OD
--ON O.OrderID = OD.OrderID JOIN Products AS P
--ON OD.ProductId  = P.ProductID
--Group By  E.EmployeeID, E.FirstName + ' ' + E.LastName
--Having  P.ProductName = 'Tofu'
--ORDER BY [Employee Name]


--SELECT P.ProductName, P. ProductID, COUNT(O.OrderID) AS 'Total Orders'
--FEOM Orders AS O JOIN 
--ON E.EmployeeID = O.EmployeeID JOIN [Order Details] AS OD
--ON O.OrderID = OD.OrderID JOIN Products AS P 
--ON OD.ProductID = P.ProductID
--WHERE P.ProductName = 'Tofu'
--GROUP BY P.ProductName, P. ProductID


--SELECT P.ProductID, P.ProductName, SUM(OD.UnitPrice * OD.Quantity) AS 'Total'
--FROM Orders AS O JOIN [Order Details] AS OD
--ON O.OrderID = OD.OrderID JOIN Products AS P
--ON OD.ProductID = P.ProductID
--GROUP BY P.ProductID, P.ProductName
--Having SUM(OD.UnitPrice * OD.Quantity) < 5000
--Order BY Total
