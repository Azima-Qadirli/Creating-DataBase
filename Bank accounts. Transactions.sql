Create Table Users(
UserId INT PRIMARY KEY AUTOINCREMENT,
Username VARCHAR(255) NOT NULL Unique,
FullName VARCHAR(255) NOT NULL,
Email VARCHAR(255) Unique,
Password VARCHAR(255) NOT NULL,
DateOfBirth DATE,Address Text,
PhoneNumber VARCHAR(20)
);


Create Table AccountTypes(
AccountTypeId INT PRIMARY KEY AUTOINCREMENT,
AccountTypeName VARCHAR(30) NOT NULL Unique
);

Create Table Accounts(
AccountId INT PRIMARY KEY AUTOINCREMENT,
UserId INT,
Balance DECIMAL(15,2) NOT NULL,
FOREIGN KEY (AccountTypeId) REFERENCES AccountTypes(AccountTypeId),
FOREIGN KEY (UserId) REFERENCES Users(UserId)
);

Create Table Transactions(
TransactionId INT PRIMARY KEY AUTOINCREMENT,
AccountId INT,
Amount DECIMAL (10,2) NOT NULL,
Foreign Key (AccountId) REFERENCES Accounts(AccountId)
);
Create Table Transfers(
TransferId INT PRIMARY KEY AUTOINCREMENT,
FromAccountId INT,
ToAccountId INT,
Amount DECIMAL(10,2) NOT NULL,
Foreign Key (FromAccountId) REFERENCES Accounts(AccountId),
Foreign Key (ToAccountId) REFERENCES Accounts(AccountId)
);


Insert INTO AccountTypes (AccountTypeName) VALUES ('Checking');
Insert INTO AccountTypes (AccountTypeName) VALUES ('Saving');

INSERT INTO Users (Username,FullName,Email,Password,DateOfBirth,PhoneNumber) VALUES ('azima_qadirli','Azima Qadirli','azima@gmail.com','naa2451i','2003-12-14','125-542-8'),
('akif_qadirli','Akif Qadirli','akif@gmail.com','adnsu','2006-01-28','100-569-578'),

INSERT INTO Accounts(UserId,AccountTypeId,Balance) VALUES(SELECT UserId FROM Users WHERE Username= 'azima_qadirli'),'123456789',(SELECT AccountTypeId FROM AccountTypes WHERE AccountTypeName = 'Cheking'),'500.00';
INSERT INTO Accounts(UserId,AccountTypeId,Balance) VALUES(SELECT UserId FROM Users WHERE Username= 'akif_qadirli'),'8563241',(SELECT AccountTypeId FROM AccountTypes WHERE AccountTypeName = 'Saving'),'785.00';

INSERT INTO Transactions(AccountId,TransactionId,Amount) VALUES ((SELECT AccountId FROM Accounts where AccountTypeId = '123456789'), '45263',302,45);

INSERT INTO Transfers(FromAccountId,ToAccountId,Amount) VALUES ((SELECT AccountId FROM Accounts Where AccountTypeId = '123456789'), (SELECT AccountId FROM Accounts Where AccountTypeId = '8563241'),150.00);
