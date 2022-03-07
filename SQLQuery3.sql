CREATE TABLE Wk3Employee (
EmployeeID smallint NOT NULL,
LastName varchar(50),
FirstName varchar(50),
CONSTRAINT PK_Wk3Employee PRIMARY KEY CLUSTERED (EmployeeID ASC)
)

INSERT INTO Wk3Employee (EmployeeID, LastName, FirstName) VALUES
(1, 'Doe', 'John'), (2, 'Smith', 'Jane'), (3, 'Johnson', 'Steve'), (4, 'Rodriguez', 'Maria'), (5, 'Lee', 'Jackie')

SELECT * FROM Wk3Employee

ALTER TABLE Wk3Employee
ADD SupervisorEmployeeID smallint

SELECT * FROM Wk3Employee

UPDATE Wk3Employee SET
SupervisorEmployeeID = 2
WHERE EmployeeID = 1
SELECT * FROM Wk3Employee

UPDATE Wk3Employee SET
SupervisorEmployeeID = 2
WHERE EmployeeID = 3
SELECT * FROM Wk3Employee

UPDATE Wk3Employee SET
SupervisorEmployeeID = 4
WHERE EmployeeID = 2
SELECT * FROM Wk3Employee

UPDATE Wk3Employee SET
SupervisorEmployeeID = 5
WHERE EmployeeID = 4
SELECT * FROM Wk3Employee

UPDATE Wk3Employee SET
SupervisorEmployeeID = 5
WHERE EmployeeID = 5
SELECT * FROM Wk3Employee

SELECT E.EmployeeID, E.LastName, E.FirstName, E.SupervisorEmployeeID, S.LastName, S.FirstName
FROM Wk3Employee E INNER JOIN Wk3Employee S
ON E.SupervisorEmployeeID = S.EmployeeID 
ORDER BY E.LastName, E.FirstName

CREATE TABLE Wk3Login (
EmployeeID smallint NOT NULL,
LoginName varchar(50),
Password varchar(50),
CONSTRAINT PK_Wk3Login PRIMARY KEY CLUSTERED (EmployeeID ASC)
)

INSERT INTO Wk3Login (EmployeeID, LoginName, Password) VALUES
(1, 'jdoe', 'qwert'), (2, 'jsmith', 'asdfg'), (3, 'sjohnson', 'zxcvb'), (4, 'mrodriguez', 'poiuy'), (5, 'jlee', 'lkjhg')

SELECT * FROM Wk3Login

SELECT * FROM Wk3Employee
SELECT * FROM Wk3Login

SELECT E.EmployeeID, E.LastName, E.FirstName, L.LoginName, L.Password
FROM Wk3Employee E INNER JOIN Wk3Login L
ON E.EmployeeID = L.EmployeeID 
ORDER BY E.LastName, E.FirstName

CREATE TABLE Wk3Customer (
CustomerID smallint NOT NULL,
LastName varchar(50),
FirstName varchar(50),
CONSTRAINT PK_Wk3Customer PRIMARY KEY CLUSTERED (CustomerID ASC)
)

CREATE TABLE Wk3CustomerOrder (
OrderNo int NOT NULL,
OrderDate datetime,
GrandTotal money,
CONSTRAINT PK_Wk3CustomerOrder PRIMARY KEY CLUSTERED (OrderNo ASC)
)

INSERT INTO Wk3Customer (CustomerID, LastName, FirstName) VALUES
(1, 'Curry', 'Michael'), (2, 'Bryant', 'Stephanie'), (3, 'Jordan', 'Irvin')
INSERT INTO Wk3CustomerOrder (OrderNo, OrderDate, GrandTotal) VALUES
(1, '8/31/2020', 50.00), (2, '8/31/2020', 40.00), (3, '9/1/2020', 10.00), (4, '9/1/2020', 35.00)

SELECT * FROM Wk3Customer
SELECT * FROM Wk3CustomerOrder

ALTER TABLE Wk3CustomerOrder
ADD CustomerID smallint

UPDATE Wk3CustomerOrder SET
CustomerID = 1
WHERE OrderNo = 1
SELECT * FROM Wk3Customer
SELECT * FROM Wk3CustomerOrder

UPDATE Wk3CustomerOrder SET
CustomerID = 2
WHERE OrderNo = 2
SELECT * FROM Wk3Customer
SELECT * FROM Wk3CustomerOrder

UPDATE Wk3CustomerOrder SET
CustomerID = 3
WHERE OrderNo = 3
SELECT * FROM Wk3Customer
SELECT * FROM Wk3CustomerOrder

UPDATE Wk3CustomerOrder SET
CustomerID = 1
WHERE OrderNo = 4
SELECT * FROM Wk3Customer
SELECT * FROM Wk3CustomerOrder


SELECT C.CustomerID, C.LastName, C.FirstName, O.OrderNo, O.OrderDate, O.GrandTotal
FROM Wk3Customer C INNER JOIN Wk3CustomerOrder O
ON C.CustomerID = O.CustomerID 
ORDER BY C.CustomerID, O.OrderNo


SELECT * FROM Wk3Employee
SELECT * FROM Wk3CustomerOrder

ALTER TABLE Wk3CustomerOrder
ADD TakesEmployeeID smallint, FillsEmployeeID smallint, ShipsEmployeeID smallint, BillsEmployeeID smallint

SELECT * FROM Wk3Employee
SELECT * FROM Wk3CustomerOrder



UPDATE Wk3CustomerOrder SET
TakesEmployeeID = 1,
FillsEmployeeID = 4,
ShipsEmployeeID = 4,
BillsEmployeeID = 2
WHERE OrderNo = 1
SELECT * FROM Wk3Employee
SELECT * FROM Wk3CustomerOrder

UPDATE Wk3CustomerOrder SET
TakesEmployeeID = 2,
FillsEmployeeID = 1,
ShipsEmployeeID = 3,
BillsEmployeeID = 5
WHERE OrderNo = 2
SELECT * FROM Wk3Employee
SELECT * FROM Wk3CustomerOrder

UPDATE Wk3CustomerOrder SET
TakesEmployeeID = 3,
FillsEmployeeID = 2,
ShipsEmployeeID = 3,
BillsEmployeeID = 4
WHERE OrderNo = 3
SELECT * FROM Wk3Employee
SELECT * FROM Wk3CustomerOrder

UPDATE Wk3CustomerOrder SET
TakesEmployeeID = 1,
FillsEmployeeID = 2,
ShipsEmployeeID = 3,
BillsEmployeeID = 4
WHERE OrderNo = 4
SELECT * FROM Wk3Employee
SELECT * FROM Wk3CustomerOrder



SELECT O.OrderNo, O.OrderDate, O.GrandTotal, O.CustomerID, 
O.TakesEmployeeID, CONCAT(ET.FirstName, ' ', ET.LastName) AS EmployeeTook,
O.FillsEmployeeID, CONCAT(EF.FirstName, ' ', EF.LastName)  AS EmployeeFilled,
O.ShipsEmployeeID, CONCAT(ES.FirstName, ' ', ES.LastName)  AS EmployeeShipped,
O.BillsEmployeeID, CONCAT(EB.FirstName, ' ', EB.LastName)  AS EmployeeBilled
FROM Wk3CustomerOrder O INNER JOIN Wk3Employee ET
ON O.TakesEmployeeID = ET.EmployeeID INNER JOIN Wk3Employee EF
ON O.FillsEmployeeID = EF.EmployeeID INNER JOIN Wk3Employee ES
ON O.ShipsEmployeeID = ES.EmployeeID INNER JOIN Wk3Employee EB
ON O.BillsEmployeeID = EB.EmployeeID 
ORDER BY O.CustomerID, O.OrderNo



CREATE TABLE Wk3Product (
ProductCode smallint NOT NULL,
ProductName varchar(50),
UnitPrice money,
CONSTRAINT PK_Wk3Product PRIMARY KEY CLUSTERED (ProductCode ASC)
)

INSERT INTO Wk3Product (ProductCode, ProductName, UnitPrice) VALUES
(1, 'Pens', 5.00), (2, 'Paper', 10.00), (3, 'Erasers', 20.00)

SELECT * FROM Wk3Product
SELECT * FROM Wk3CustomerOrder



ALTER TABLE Wk3CustomerOrder
ADD ProductCode smallint, QuantityOrdered smallint

SELECT * FROM Wk3CustomerOrder

UPDATE Wk3CustomerOrder SET
ProductCode = 1,
QuantityOrdered = 4
WHERE OrderNo = 1
SELECT * FROM Wk3CustomerOrder




UPDATE Wk3CustomerOrder SET
ProductCode = 2,
QuantityOrdered = 1
WHERE OrderNo = 1
SELECT * FROM Wk3CustomerOrder



ALTER TABLE Wk3CustomerOrder
DROP COLUMN ProductCode, QuantityOrdered
SELECT * FROM WK3CustomerOrder


CREATE TABLE Wk3OrderLine (
OrderLineID int NOT NULL,
ProductCode smallint,
OrderNo int,
QuantityOrdered smallint,
CONSTRAINT PK_Wk3OrderLine PRIMARY KEY CLUSTERED (OrderLineID ASC)
)

INSERT INTO Wk3OrderLine (OrderLineID, ProductCode, OrderNo, QuantityOrdered) 
VALUES (1, 1, 1, 4), (2, 2, 1, 1), (3, 3, 1, 1), (4, 1, 2, 2), (5, 2, 2, 3), 
(6, 2, 3, 1), (7, 1, 4, 1), (8, 2, 4, 1), (9, 3, 4, 1)

SELECT * FROM Wk3CustomerOrder
SELECT * FROM Wk3OrderLine
SELECT * FROM Wk3Product



SELECT OL.OrderLineID, OL.OrderNo, OL.ProductCode, P.ProductName, P.UnitPrice, 
OL.QuantityOrdered, P.UnitPrice*OL.QUantityOrdered AS Total
FROM Wk3OrderLine OL INNER JOIN Wk3PRoduct P
ON OL.ProductCode = P.ProductCode
ORDER BY OL.OrderNo, OL.ProductCode