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


