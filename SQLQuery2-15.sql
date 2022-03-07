CREATE TABLE Wk6Employee(
EmployeeID smallint NOT NULL,
LastName varchar(50) NULL,
FirstName varchar(50) NULL,
SupervisorEmployeeID smallint NULL,
CONSTRAINT PK_Wk6Employee PRIMARY KEY CLUSTERED (EmployeeID ASC)
)
SELECT * FROM Wk6Employee


INSERT INTO Wk6Employee (EmployeeID, FirstName, SupervisorEmployeeID) VALUES
(1, 'John', 2)
SELECT * FROM Wk6Employee


DROP TABLE Wk6Employee



CREATE TABLE Wk6Employee(
EmployeeID smallint NOT NULL,
LastName varchar(50) NOT NULL,
FirstName varchar(50) NOT NULL,
SupervisorEmployeeID smallint NULL,
CONSTRAINT PK_Wk6Employee PRIMARY KEY CLUSTERED (EmployeeID ASC)
)
SELECT * FROM Wk6Employee



INSERT INTO Wk6Employee (EmployeeID, FirstName, SupervisorEmployeeID) VALUES
(1, 'John', 2)
SELECT * FROM Wk6Employee


INSERT INTO Wk6Employee (EmployeeID, LastName, FirstName, SupervisorEmployeeID) VALUES
(1, 'Doe', 'John', 2)
SELECT * FROM Wk6Employee


DELETE FROM Wk6Employee
SELECT * FROM Wk6Employee


ALTER TABLE Wk6Employee
ADD CONSTRAINT FK_Wk6EmployeeWk6SupervisorEmployee 
FOREIGN KEY (SupervisorEmployeeID) REFERENCES Wk6Employee(EmployeeID)


INSERT INTO Wk6Employee (EmployeeID, LastName, FirstName, SupervisorEmployeeID) VALUES
(1, 'Doe', 'John', 2)
SELECT * FROM Wk6Employee


INSERT INTO Wk6Employee (EmployeeID, LastName, FirstName, SupervisorEmployeeID) VALUES
(2, 'Smith', 'Jane', NULL)
INSERT INTO Wk6Employee (EmployeeID, LastName, FirstName, SupervisorEmployeeID) VALUES
(1, 'Doe', 'John', 2)
SELECT * FROM Wk6Employee


CREATE TABLE Wk6Login(
LoginID	int NOT NULL,
LoginName varchar(50) NOT NULL,
Password varchar(50) NOT NULL,
EmployeeID smallint NULL,
-- CustomerID smallint NULL
CONSTRAINT PK_Wk6Login PRIMARY KEY CLUSTERED (LoginID ASC),
CONSTRAINT FK_Wk6EmployeeWk6Login FOREIGN KEY (EmployeeID) REFERENCES Wk6Employee(EmployeeID)
) 



INSERT Wk6Login (LoginID, LoginName, Password, EmployeeID) 
VALUES (1, 'f20jdoe0000', 'poe098nig', 1)
INSERT Wk6Login (LoginID, LoginName, Password, EmployeeID) 
VALUES (2, 'f20jdoe0000', 'kyt876mns', 2)
SELECT * FROM Wk6Login


DELETE FROM Wk6Login
SELECT * FROM Wk6Login

ALTER TABLE Wk6Login
ADD CONSTRAINT UC_Wk6Login_LoginName UNIQUE (LoginName)


INSERT Wk6Login (LoginID, LoginName, Password, EmployeeID) 
VALUES (1, 'f20jdoe0000', 'poe098nig', 1)
INSERT Wk6Login (LoginID, LoginName, Password, EmployeeID) 
VALUES (2, 'f20jdoe0000', 'kyt876mns', 2)
SELECT * FROM Wk6Login


INSERT Wk6Login (LoginID, LoginName, Password, EmployeeID) 
VALUES (2, 'f20jsmith1111', 'kyt876mns', 2)
SELECT * FROM Wk6Login



INSERT INTO Wk6Employee (EmployeeID, LastName, FirstName, SupervisorEmployeeID) VALUES
(3, 'Jones', 'Steve', 2)
SELECT * FROM Wk6Employee



INSERT Wk6Login (LoginID, LoginName, Password, EmployeeID) 
VALUES (3, 'f20sjones3333', 'kyt876mns', 99)
SELECT * FROM Wk6Login



INSERT Wk6Login (LoginID, LoginName, Password, EmployeeID) 
VALUES (3, 'f20sjones3333', 'kyt876mns', 2)
SELECT * FROM Wk6Employee
SELECT * FROM Wk6Login


DELETE FROM Wk6Login
WHERE LoginID = 3
SELECT * FROM Wk6Employee
SELECT * FROM Wk6Login



ALTER TABLE Wk6Login
ADD CONSTRAINT UC_Wk6Login_LEmployeeID UNIQUE (EmployeeID)


INSERT Wk6Login (LoginID, LoginName, Password, EmployeeID) 
VALUES (3, 'f20sjones3333', 'kyt876mns', 2)
SELECT * FROM Wk6Login


INSERT Wk6Login (LoginID, LoginName, Password, EmployeeID) 
VALUES (3, 'f20sjones3333', 'kyt876mns', 3)
SELECT * FROM Wk6Employee
SELECT * FROM Wk6Login



UPDATE Wk6Employee SET
EmployeeID = 99
WHERE EmployeeID = 1
SELECT * FROM Wk6Employee
SELECT * FROM Wk6Login


DELETE FROM Wk6Employee WHERE EmployeeID = 1
SELECT * FROM Wk6Employee
SELECT * FROM Wk6Login


ALTER TABLE Wk6Login
DROP CONSTRAINT FK_Wk6EmployeeWk6Login



ALTER TABLE Wk6Login
ADD CONSTRAINT FK_Wk6EmployeeWk6Login 
FOREIGN KEY (EmployeeID) REFERENCES Wk6Employee(EmployeeID) 
ON DELETE SET NULL 
ON UPDATE SET NULL


UPDATE Wk6Employee SET
EmployeeID = 99
WHERE EmployeeID = 1
SELECT * FROM Wk6Employee
SELECT * FROM Wk6Login


UPDATE Wk6Login SET
EmployeeID = 99
WHERE LoginID = 1
SELECT * FROM Wk6Employee
SELECT * FROM Wk6Login


DELETE FROM Wk6Employee WHERE EmployeeID = 99
SELECT * FROM Wk6Employee
SELECT * FROM Wk6Login


ALTER TABLE Wk6Login
DROP CONSTRAINT FK_Wk6EmployeeWk6Login


ALTER TABLE Wk6Login
ADD CONSTRAINT FK_Wk6EmployeeWk6Login 
FOREIGN KEY (EmployeeID) REFERENCES Wk6Employee(EmployeeID) 
ON DELETE SET DEFAULT 
ON UPDATE SET DEFAULT



ALTER TABLE Wk6Login
ADD CONSTRAINT DF_Wk6Login_EmployeeID
DEFAULT '1000' FOR EmployeeID


INSERT INTO Wk6Employee (EmployeeID, LastName, FirstName, SupervisorEmployeeID) VALUES
(1000, 'Deleted', 'Employee', NULL)
SELECT * FROM Wk6Employee
SELECT * FROM Wk6Login



UPDATE Wk6Employee SET
EmployeeID = 88
WHERE EmployeeID = 3
SELECT * FROM Wk6Employee
SELECT * FROM Wk6Login


UPDATE Wk6Login SET
EmployeeID = 88
WHERE LoginID = 3
SELECT * FROM Wk6Employee
SELECT * FROM Wk6Login


DELETE FROM Wk6Employee WHERE EmployeeID = 88
SELECT * FROM Wk6Employee
SELECT * FROM Wk6Login



ALTER TABLE Wk6Login
DROP CONSTRAINT FK_Wk6EmployeeWk6Login


ALTER TABLE Wk6Login
ADD CONSTRAINT FK_Wk6EmployeeWk6Login 
FOREIGN KEY (EmployeeID) REFERENCES Wk6Employee(EmployeeID) 
ON DELETE CASCADE 
ON UPDATE CASCADE



INSERT INTO Wk6Employee (EmployeeID, LastName, FirstName, SupervisorEmployeeID) VALUES
(1, 'Doe', 'John', 2)
UPDATE Wk6Login SET
EmployeeID = 1
WHERE LoginID = 1
SELECT * FROM Wk6Employee
SELECT * FROM Wk6Login


UPDATE Wk6Employee SET
EmployeeID = 99
WHERE EmployeeID = 1
SELECT * FROM Wk6Employee
SELECT * FROM Wk6Login



DELETE FROM Wk6Employee WHERE EmployeeID = 99
SELECT * FROM Wk6Employee
SELECT * FROM Wk6Login