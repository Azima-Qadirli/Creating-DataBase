CREATE TABLE ProductsServices (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(255) NOT NULL,
    Description TEXT,
    Price DECIMAL(10, 2) NOT NULL,
    SupplierID INT,
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY AUTO_INCREMENT,
    SupplierName VARCHAR(255) NOT NULL,
    ContactName VARCHAR(255),
    Address VARCHAR(255),
    PhoneNumber VARCHAR(20),
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE Invoices (
    InvoiceID INT PRIMARY KEY AUTO_INCREMENT,
    InvoiceNumber VARCHAR(50) UNIQUE NOT NULL,
    InvoiceDate DATE,
    DueDate DATE,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    Paid BOOLEAN DEFAULT FALSE,
    SupplierID INT,
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

CREATE TABLE InvoiceItems (
    InvoiceItemID INT PRIMARY KEY AUTO_INCREMENT,
    InvoiceID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10, 2) NOT NULL,
    TotalPrice DECIMAL(10, 2) NOT NULL,
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (InvoiceID) REFERENCES Invoices(InvoiceID) ON DELETE CASCADE,
    FOREIGN KEY (ProductID) REFERENCES ProductsServices(ProductID) ON DELETE CASCADE
);

INSERT INTO Suppliers (SupplierName, ContactName, Address, PhoneNumber) VALUES 
('Supplier A', 'John Smith', '123 Main Street, City, Country', '+1234567890'),
('Supplier B', 'Jane Doe', '456 Oak Avenue, Town, Country', '+1987654321');

INSERT INTO ProductsServices (ProductName, Description, Price, SupplierID) VALUES 
('Product A', 'Description of Product A', 50.00, 1),
('Service B', 'Description of Service B', 100.00, 2);

INSERT INTO Invoices (InvoiceNumber, InvoiceDate, DueDate, TotalAmount, SupplierID) VALUES 
('INV-2024-001', '2024-06-15', '2024-07-15', 150.00, 1),
('INV-2024-002', '2024-06-20', '2024-07-20', 200.00, 2);

-- Invoice 1: Products
INSERT INTO InvoiceItems (InvoiceID, ProductID, Quantity, UnitPrice, TotalPrice) VALUES 
(1, 1, 2, 50.00, 100.00);

-- Invoice 2: Services
INSERT INTO InvoiceItems (InvoiceID, ProductID, Quantity, UnitPrice, TotalPrice) VALUES 
(2, 2, 1, 100.00, 100.00);

