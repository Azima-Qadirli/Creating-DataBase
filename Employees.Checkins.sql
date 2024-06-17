CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Department VARCHAR(100),
    Position VARCHAR(100),
    HireDate DATE,
    IsActive BOOLEAN DEFAULT true,
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Checkins (
    CheckinID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeID INT,
    CheckinTime DATETIME DEFAULT CURRENT_TIMESTAMP,
    CheckinType VARCHAR(50) DEFAULT 'Regular', -- Regular, Overtime, Remote, etc.
    Location VARCHAR(255),
    Notes TEXT,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID) ON DELETE CASCADE
);

CREATE TABLE Checkouts (
    CheckoutID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeID INT,
    CheckoutTime DATETIME DEFAULT CURRENT_TIMESTAMP,
    CheckoutType VARCHAR(50) DEFAULT 'Regular', -- Regular, Overtime, Remote, etc.
    Notes TEXT,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID) ON DELETE CASCADE
);

INSERT INTO Employees (FirstName, LastName, Email, Department, Position, HireDate)
VALUES 
('John', 'Doe', 'john.doe@example.com', 'IT', 'Software Engineer', '2020-01-15'),
('Jane', 'Smith', 'jane.smith@example.com', 'Marketing', 'Marketing Manager', '2018-05-20');

INSERT INTO Checkins (EmployeeID, CheckinTime, CheckinType, Location, Notes)
VALUES
(1, '2023-06-15 09:00:00', 'Regular', 'Office A', 'Started work on time'),
(2, '2023-06-15 08:45:00', 'Regular', 'Office B', 'Early start today');

INSERT INTO Checkouts (EmployeeID, CheckoutTime, CheckoutType, Notes)
VALUES
(1, '2023-06-15 17:00:00', 'Regular', 'Completed tasks for the day'),
(2, '2023-06-15 17:30:00', 'Overtime', 'Stayed late to finish project');
