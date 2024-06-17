CREATE TABLE Events (
    EventID INT PRIMARY KEY AUTO_INCREMENT,
    EventName VARCHAR(255) NOT NULL,
    EventDate DATE NOT NULL,
    Venue VARCHAR(255),
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Tickets (
    TicketID INT PRIMARY KEY AUTO_INCREMENT,
    EventID INT,
    TicketType VARCHAR(50) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    AvailableQuantity INT NOT NULL,
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (EventID) REFERENCES Events(EventID) 
);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FullName VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    Phone VARCHAR(20),
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    TicketID INT,
    Quantity INT NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    OrderDate DATE,
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (TicketID) REFERENCES Tickets(TicketID) 
);


INSERT INTO Events(EventName,EventDate,VenueDate,) VALUES
('Music Festival', '2024-07-15', 'Central Park'),
('Tech Conference', '2024-08-20', 'Convention Center');

INSERT INTO Tickets(EventID,TicketType,Price,AvailableQuantity) VALUES
(1, 'General Admission', 50.00, 500),
(1, 'VIP Pass', 150.00, 100),
(2, 'Conference Pass', 200.00, 300);

INSERT INTO Customers (FullName, Email, Phone) VALUES 
('John Doe', 'john.doe@example.com', '+1234567890'),
('Jane Smith', 'jane.smith@example.com', '+1987654321');

INSERT INTO Orders(CustomerID,TicketID,Quantity,TotalAmount,OrderDate) VALUES
(1, 1, 2, 100.00, '2024-07-01');

INSERT INTO Orders (CustomerID, TicketID, Quantity, TotalAmount, OrderDate) VALUES 
(2, 2, 1, 150.00, '2024-07-02');