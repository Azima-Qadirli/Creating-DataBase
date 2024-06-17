CREATE TABLE Patients (
    PatientID INT PRIMARY KEY AUTO_INCREMENT,
    FullName VARCHAR(255) NOT NULL,
    DateOfBirth DATE,
    Gender ENUM('Male', 'Female'),
    Address VARCHAR(255),
    PhoneNumber VARCHAR(20),
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY AUTO_INCREMENT,
    FullName VARCHAR(255) NOT NULL,
    Specialization VARCHAR(255),
    PhoneNumber VARCHAR(20),
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY AUTO_INCREMENT,
    PatientID INT,
    DoctorID INT,
    AppointmentDate DATETIME,
    Notes TEXT,
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID) ON DELETE CASCADE,
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID) ON DELETE CASCADE
);

INSERT INTO Patients (FullName, DateOfBirth, Gender, Address, PhoneNumber) VALUES 
('John Doe', '1980-05-15', 'Male', '123 Main Street, City, Country', '+1234567890'),
('Jane Smith', '1990-10-20', 'Female', '456 Oak Avenue, Town, Country', '+1987654321');

INSERT INTO Doctors (FullName, Specialization, PhoneNumber) VALUES 
('Dr. Smith', 'Cardiology', '+1112223333'),
('Dr. Johnson', 'Pediatrics', '+4445556666');

-- John Doe schedules an appointment with Dr. Smith
INSERT INTO Appointments (PatientID, DoctorID, AppointmentDate, Notes) VALUES 
(1, 1, '2024-07-10 10:00:00', 'Follow-up checkup for hypertension');

-- Jane Smith schedules an appointment with Dr. Johnson
INSERT INTO Appointments (PatientID, DoctorID, AppointmentDate, Notes) VALUES 
(2, 2, '2024-07-12 14:00:00', 'Routine vaccination for children');

