CREATE TABLE Products(
ProductId INT PRIMARY KEY AUTOINCREMENT,
Name VARCHAR(255) NOT NULL,
DESCRIPTION Text,
Price DECIMAL(5,2),
CategoryID INT
);

CREATE TABLE Category(
    CategoryID INT PRIMARY KEY AUTOINCREMENT,
Name VARCHAR(255) NOT NULL,
ParentID INT,
FOREIGN KEY (ParentID) REFERENCES Categories(CategoryID)
);




INSERT INTO Categories(Name,ParentID) VALUES ('Electronics',NULL);
INSERT INTO Categories(Name,ParentID) VALUES ('Computers',(SELECT CategoryID FROM Categories WHERE Name='Electronics'));
INSERT INTO Categories(Name,ParentID) VALUES ('SmartPhones',(SELECT CategoryID FROM Categories WHERE Name='SmartPhones'));
