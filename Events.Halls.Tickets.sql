CREATE TABLE Events (
    EventID INT PRIMARY KEY AUTO_INCREMENT,
    EventName VARCHAR(255) NOT NULL,
    Description TEXT,
    EventDate DATE,
    StartTime TIME,
    EndTime TIME,
    Organizer VARCHAR(255),
    VenueID INT,
    FOREIGN KEY (VenueID) REFERENCES Halls(HallID) ON DELETE SET NULL
);

CREATE TABLE Halls (
    HallID INT PRIMARY KEY AUTO_INCREMENT,
    HallName VARCHAR(255) NOT NULL,
    Capacity INT,
    Location VARCHAR(255),
    Description TEXT
);

CREATE TABLE Tickets (
    TicketID INT PRIMARY KEY AUTO_INCREMENT,
    EventID INT,
    TicketName VARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    AvailableQuantity INT NOT NULL,
    FOREIGN KEY (EventID) REFERENCES Events(EventID) ON DELETE CASCADE
);

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY AUTO_INCREMENT,
    TicketID INT,
    Quantity INT,
    SaleDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    TotalAmount DECIMAL(10, 2),
    BuyerName VARCHAR(255),
    BuyerEmail VARCHAR(255),
    FOREIGN KEY (TicketID) REFERENCES Tickets(TicketID) ON DELETE CASCADE
);

INSERT INTO Events (EventName, Description, EventDate, StartTime, EndTime, Organizer, VenueID)
VALUES 
('Music Concert', 'Annual music festival featuring various artists.', '2023-07-15', '18:00:00', '23:00:00', 'Music Events LLC', 1),
('Tech Conference', 'Industry-leading conference on technology and innovation.', '2023-08-20', '09:00:00', '17:00:00', 'Tech Conferences Inc.', 2);

INSERT INTO Halls (HallName, Capacity, Location, Description)
VALUES 
('Main Hall', 500, 'City Center', 'Large hall suitable for concerts and conferences.'),
('Conference Room A', 200, 'Tech Park', 'Small room ideal for tech workshops and meetings.');

INSERT INTO Tickets (EventID, TicketName, Price, AvailableQuantity)
VALUES
(1, 'General Admission', 50.00, 500),
(1, 'VIP Pass', 100.00, 100),
(2, 'Standard Ticket', 150.00, 300);

INSERT INTO Sales (TicketID, Quantity, SaleDate, TotalAmount, BuyerName, BuyerEmail)
VALUES
(1, 2, NOW(), 100.00, 'John Doe', 'john.doe@example.com'),
(2, 1, NOW(), 100.00, 'Jane Smith', 'jane.smith@example.com'),
(3, 2, NOW(), 300.00, 'Michael Brown', 'michael.brown@example.com');
