CREATE TABLE Hotel (
    HotelID INT PRIMARY KEY AUTO_INCREMENT,
    HotelName VARCHAR(255) NOT NULL,
    Address VARCHAR(255),
    PhoneNumber VARCHAR(20),
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE Rooms (
    RoomID INT PRIMARY KEY AUTO_INCREMENT,
    HotelID INT,
    RoomNumber VARCHAR(10) NOT NULL,
    RoomType VARCHAR(50),
    Rate DECIMAL(10, 2),
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (HotelID) REFERENCES Hotel(HotelID) ON DELETE CASCADE
);

CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY AUTO_INCREMENT,
    RoomID INT,
    GuestFullName VARCHAR(255) NOT NULL,
    CheckInDate DATE,
    CheckOutDate DATE,
    TotalAmount DECIMAL(10, 2),
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (RoomID) REFERENCES Rooms(RoomID) ON DELETE CASCADE
);

INSERT INTO Hotel(HotelName,Address,PhoneNumber) VALUES 
('Sample Hotel', '123 Main Street, City, Country', '+1234567890');

INSERT INTO Rooms(HotelID,RoomNumber,RoomType,Rate) VALUES
(1, '101', 'Standard', 100.00),
(1, '102', 'Deluxe', 150.00),
(1, '103', 'Suite', 250.00);

INSERT INTO Booking(RoomId,GuestFullName,CheckInDate,CheckOutDate,TotalAmount) VALUES
(1, 'John Doe', '2024-06-20', '2024-06-22', 200.00),
(2, 'Jane Smith', '2024-07-05', '2024-07-10', 750.00);