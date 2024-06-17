Create  Table MenuItems(
MenuItemID INT PRIMARY KEY AUTOINCREMENT,
ItemName VARCHAR(255) NOT NULL,
Description TEXT,
Price DECIMAL (10,2) NOT NULL,
CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP
);

Create Table Customers(
CustomerID INT PRIMARY KEY AUTOINCREMENT,
FullName VARCHAR(255) NOT NULL,
Email VARCHAR(255) NOT NULL,
Phone VARCHAR(255),
CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP
);

Create Table Orders(
OrderID INT PRIMARY KEY AUTOINCREMENT,
CustomerID INT,
MenuItemId INT,
Quantity INT NOT NULL,
TotalAmount DECIMAL (10,2) NOT NULL,
OrderDate Date,
CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) ,
FOREIGN KEY (MenuItemID) REFERENCES MenuItems(MenuItemID) 
);

INSERT INTO MenuItems (ItemName, Description, Price) VALUES 
('Spaghetti Carbonara', 'Pasta with bacon, eggs, and Parmesan cheese', 12.99),
('Margherita Pizza', 'Classic pizza with tomato sauce, mozzarella, and basil', 10.99),
('Grilled Salmon', 'Grilled salmon fillet with steamed vegetables', 16.99);

INSERT INTO Customers (FullName, Email, Phone) VALUES 
('John Doe', 'john.doe@example.com', '+1234567890'),
('Jane Smith', 'jane.smith@example.com', '+1987654321');

-- John Doe orders 2 Spaghetti Carbonara dishes
INSERT INTO Orders (CustomerID, MenuItemID, Quantity, TotalAmount, OrderDate) VALUES 
(1, 1, 2, 25.98, '2024-07-01');

-- Jane Smith orders 1 Margherita Pizza
INSERT INTO Orders (CustomerID, MenuItemID, Quantity, TotalAmount, OrderDate) VALUES 
(2, 2, 1, 10.99, '2024-07-02');
