--Reid Nolan
--Homework 9 – SQL

--1. Write a script that adds an index to the MyGuitarShop database for the zip code field in the Addresses table.

use MyGuitarShop;
CREATE INDEX index1 ON Addresses(ZipCode);

--2. Write a script that implements the following design in a database named MyWebDB:
  --a. In the Downloads table, the UserID and ProductID columns are the foreign keys.
  --b. Include a statement to drop the database if it already exists.
  --c. Include statements to create and select the database.
  --d. Include any indexes that you think are necessary.

USE master;
GO

IF  DB_ID('MyWebDB') IS NOT NULL
DROP DATABASE MyWebDB;
GO

CREATE DATABASE MyWebDB;
GO

USE MyWebDB;

-- create the tables for the database
CREATE TABLE Users (
  UserID        INT            PRIMARY KEY   IDENTITY,
  EmailAddress  VARCHAR(255)   NOT NULL      UNIQUE,
  Password      VARCHAR(60)    NOT NULL,
  FirstName     VARCHAR(60)    NOT NULL,
  LastName      VARCHAR(60)    NOT NULL,
);

CREATE TABLE Products (
  ProductID         INT            PRIMARY KEY   IDENTITY,
  ProductName       VARCHAR(255)   NOT NULL,
);

CREATE TABLE Downloads (
  DownloadID    INT            PRIMARY KEY   IDENTITY,
  UserID        INT            REFERENCES    Users (UserID),
  ProductID     INT            REFERENCES    Products (ProductID),
  DownloadDate  DATETIME                     DEFAULT NULL,
  FileName      VARCHAR(255)   NOT NULL,
);

--3. Write a script that adds rows to the database that you created in exercise 2.
  --a. Add two rows to the Users and Products tables.
  --b. Add three rows to the Downloads table: one row for user 1 and product 2; one for user 2 and product 1; and one for user 2 and product 2. Use the GETDATE function to insert the current date and time into the DownloadDate column.
  --c. Write a SELECT statement that joins the three tables and retrieves the data from these tables like this:
  --d. Sort the results by the email address in descending order and the product name in ascending order.

 USE MyWebDB;
 -- Insert data into the tables

SET IDENTITY_INSERT Users ON;
INSERT INTO Users (UserID, EmailAddress, Password, FirstName, LastName) VALUES
(1, 'allan.sherwood@yahoo.com', '650215acec746f0e32bdfff387439eefc1358737', 'Allan', 'Sherwood'),
(2, 'barryz@gmail.com', '3f563468d42a448cb1e56924529f6e7bbe529cc7', 'Barry', 'Zimmer');

SET IDENTITY_INSERT Users OFF;

SET IDENTITY_INSERT Products ON;
INSERT INTO Products (ProductID, ProductName) VALUES
(1, 'uTorrent'),
(2, 'VLC');

SET IDENTITY_INSERT Products OFF;

SET IDENTITY_INSERT Downloads ON;
INSERT INTO Downloads (DownloadID, UserID, DownloadDate, FileName, ProductID) VALUES
(1, 1, '2012-03-30 15:32:51', 'uTorrent.exe', 2),
(2, 2, '2012-03-29 12:52:14', 'vlc-2.2.2-win64.exe', 1),
(3, 2, '2012-03-31 9:11:41', 'vlc-2.2.2-win64.exe', 2);

SET IDENTITY_INSERT Downloads OFF;

SELECT EmailAddress, FirstName, LastName, DownloadDate, FileName, ProductName
FROM Downloads AS D inner join Products AS P
ON D.ProductID = P.ProductID inner join Users AS U
ON D.UserId = U.UserId
ORDER BY EmailAddress DESC, ProductName ASC;

--4. Write an ALTER TABLE statement that adds two new columns to the Products table created in exercise 2.
  --a. Add one column for product price that provides for three digits to the left of the decimal point and two to the right. This column should have a default value of 9.99.
  --b. Add one column for the date and time that the product was added to the database.

 ALTER TABLE Products
 ADD ProductPrice DECIMAL(3,2) DEFAULT 9.99,
     ProductAdded DATE;

--5. Write an ALTER TABLE statement that modifies the Users table created in exercise 2 so the FirstName column cannot store null values and can store a maximum of 20 characters.
  --a. Code an UPDATE statement that attempts to insert a null value into this column. It should fail due to the not null constraint.
  --b. Code another UPDATE statement that attempts to insert a first name that’s longer than 20 characters. It should fail due to the length of the column.
 
ALTER TABLE Users
ALTER COLUMN FirstName VARCHAR(20) NOT NULL;

UPDATE Users
SET FirstName = NULL
WHERE USERID = 2;

UPDATE Users
SET FirstName = 'Wolfe­schlegel­stein­hausen­berger­dorff'
WHERE UserID = 1;