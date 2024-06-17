CREATE TABLE Software (
    SoftwareID INT PRIMARY KEY AUTO_INCREMENT,
    SoftwareName VARCHAR(255) NOT NULL,
    Version VARCHAR(50),
);

CREATE TABLE Licenses (
    LicenseID INT PRIMARY KEY AUTO_INCREMENT,
    SoftwareID INT,
    LicenseKey VARCHAR(255) UNIQUE NOT NULL,
    ExpiryDate DATE,
    FOREIGN KEY (SoftwareID) REFERENCES Software(SoftwareID)
);


CREATE TABLE Users (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    FullName VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE UserLicenses (
    UserLicenseID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    LicenseID INT,
    AssignedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (LicenseID) REFERENCES Licenses(LicenseID) 
);

INSERT INTO Software (SoftwareName, Version) VALUES 
('Antivirus Pro', '1.0'),
('Office Suite', '3.2');

INSERT INTO Licenses (SoftwareID, LicenseKey, ExpiryDate) VALUES 
((SELECT SoftwareID FROM Software WHERE SoftwareName = 'Antivirus Pro'), 'ABC123XYZ', '2024-06-15'),
((SELECT SoftwareID FROM Software WHERE SoftwareName = 'Office Suite'), 'XYZ789ABC', '2025-12-31');

INSERT INTO Users (FullName, Email) VALUES 
('John Doe', 'john.doe@example.com'),
('Jane Smith', 'jane.smith@example.com');

INSERT INTO UserLicenses (UserID, LicenseID) VALUES 
((SELECT UserID FROM Users WHERE FullName = 'John Doe'), (SELECT LicenseID FROM Licenses WHERE LicenseKey = 'ABC123XYZ')),
((SELECT UserID FROM Users WHERE FullName = 'Jane Smith'), (SELECT LicenseID FROM Licenses WHERE LicenseKey = 'XYZ789ABC'));
