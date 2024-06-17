CREATE TABLE Packages (
    PackageID INT PRIMARY KEY AUTO_INCREMENT,
    TrackingNumber VARCHAR(50) UNIQUE NOT NULL,
    SenderName VARCHAR(255) NOT NULL,
    RecipientName VARCHAR(255) NOT NULL,
    DestinationAddress TEXT NOT NULL,
    ShippingDate DATE,
    EstimatedDeliveryDate DATE,
    ActualDeliveryDate DATE,
    Status VARCHAR(50) DEFAULT 'In Transit',
    Notes TEXT,
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE TrackingHistory (
    TrackingID INT PRIMARY KEY AUTO_INCREMENT,
    PackageID INT,
    Status VARCHAR(50),
    Location VARCHAR(255),
    UpdateDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    Notes TEXT,
    FOREIGN KEY (PackageID) REFERENCES Packages(PackageID)
);

INSERT INTO Packages (TrackingNumber, SenderName, RecipientName, DestinationAddress, ShippingDate, EstimatedDeliveryDate, Status, Notes)
VALUES 
('ABC123456789', 'John Doe', 'Jane Smith', '123 Main St, City, Country', '2023-06-15', '2023-06-20', 'In Transit', 'Fragile item'),
('XYZ987654321', 'Alice Johnson', 'Bob Brown', '456 Elm St, City, Country', '2023-06-16', '2023-06-22', 'Delivered', 'Left at front porch');


INSERT INTO TrackingHistory (PackageID, Status, Location, UpdateDate, Notes)
VALUES
(1, 'In Transit', 'Shipping Facility A', '2023-06-15 10:00:00', 'Package picked up'),
(1, 'In Transit', 'Shipping Facility B', '2023-06-16 08:00:00', 'Arrived at sorting center'),
(1, 'In Transit', 'Destination City', '2023-06-20 15:00:00', 'Out for delivery'),
(1, 'Delivered', 'Recipient Address', '2023-06-20 16:30:00', 'Successfully delivered'),
(2, 'In Transit', 'Shipping Facility C', '2023-06-16 11:00:00', 'Package picked up'),
(2, 'In Transit', 'Shipping Facility D', '2023-06-17 09:00:00', 'Arrived at sorting center'),
(2, 'Delivered', 'Recipient Address', '2023-06-22 14:00:00', 'Left at front porch');
