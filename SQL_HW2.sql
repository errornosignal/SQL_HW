--Reid Nolan
--Homework 2 – SQL
--In these exercises, you’ll enter and run your own SELECT statements.
--1. Write a SELECT statement that joins the Categories table to the Products table and returns these columns: CategoryName, ProductName, ListPrice.
--Sort the result set by CategoryName and then by ProductName in ascending order.
--10 Records


--2. Write a SELECT statement that joins the Customers table to the Addresses table and returns these columns: FirstName, LastName, Line1, City, State, ZipCode.
--Return one row for each address for the customer with an email address of allan.sherwood@yahoo.com.
--2 Records


--3. Write a SELECT statement that joins the Customers table to the Addresses table and returns these columns: FirstName, LastName, Line1, City, State, ZipCode.
--Return one row for each customer, but only return addresses that are the shipping address for a customer.
--8 Records


--4. Write a SELECT statement that joins the Customers, Orders, OrderItems, and Products tables. This statement should return these columns: LastName, FirstName, OrderDate, ProductName, ItemPrice, DiscountAmount, and Quantity.
--Use aliases for the tables.
--Sort the final result set by LastName, OrderDate, and ProductName.
--12 Records


--5. Write a SELECT statement that returns the ProductName and ListPrice columns from the Products table.
--Return one row for each product that has the same list price as another product. (Hint: Use a self-join to check that the ProductID columns aren’t equal but the ListPrice column is equal.)
--Sort the result set by ProductName.
--2 Records


--6. Write a SELECT statement that returns these two columns:
--CategoryName The CategoryName column from the Categories table
--ProductID The ProductID column from the Products table
--Return one row for each category that has never been used. (Hint: Use an outer join and only return rows where the ProductID column contains a null value.)
--1 Record


--7. Use the UNION operator to generate a result set consisting of three columns from the Orders table:
--ShipStatus A calculated column that contains a value of SHIPPED or NOT SHIPPED
--OrderID The OrderID column
--OrderDate The OrderDate column
--If the order has a value in the ShipDate column, the ShipStatus column should contain a value of SHIPPED. Otherwise, it should contain a value of NOT SHIPPED.
--Sort the final result set by OrderDate.
--9 Records


--Submitting your program -
--You will submit this assignment on blackboard. You are allowed one submission. Submit your .sql file and a document (*.docx or *.rtf) that contains screen shots of the query results.
