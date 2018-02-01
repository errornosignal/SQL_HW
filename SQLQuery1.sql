use northwind;

SELECT EmployeeID, LastName, FirstName
FROM Employees;

SELECT LastName, FirstName
FROM Employees
WHERE EmployeeID = 2;

SELECT EmployeeID
FROM Employees
WHERE LastName = 'Fuller';

SELECT LastName, EmployeeID
FROM Employees
WHERE LastName LIKE 'F%';

SELECT LastName, EmployeeID
FROM Employees
WHERE LastName LIKE 'F[A-U]%';

SELECT * 
FROM Products;


SELECT ProductName, UnitPrice, UnitsInStock, UnitPrice * UnitsInStock AS 'Total Value'
FROM Products
WHERE UnitsInStock > 0
ORDER BY ProductName ASC;

SELECT *
FROM Orders;

SELECT OrderID, OrderDate
FROM Orders
WHERE OrderDate >= '1996-07-01' AND
	  OrderDate < '1996-08-01';