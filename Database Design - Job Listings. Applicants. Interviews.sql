CREATE TABLE JobListings (
    JobID INT PRIMARY KEY AUTO_INCREMENT,
    JobTitle VARCHAR(255) NOT NULL,
    CompanyName VARCHAR(255),
    Location VARCHAR(255),
    Description TEXT,
    PostedDate DATE,
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Applicants (
    ApplicantID INT PRIMARY KEY AUTO_INCREMENT,
    FullName VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    Phone VARCHAR(20),
    Resume TEXT,
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE Interviews (
    InterviewID INT PRIMARY KEY AUTO_INCREMENT,
    JobID INT,
    ApplicantID INT,
    InterviewDate DATETIME,
    InterviewLocation VARCHAR(255),
    Notes TEXT,
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (JobID) REFERENCES JobListings(JobID) ON DELETE CASCADE,
    FOREIGN KEY (ApplicantID) REFERENCES Applicants(ApplicantID) ON DELETE CASCADE
);

INSERT INTO JobListings (JobTitle, CompanyName, Location, Description, PostedDate) VALUES 
('Software Engineer', 'Tech Solutions Inc.', 'New York', 'Seeking experienced software engineers proficient in Java and Python.', '2024-06-01'),
('Marketing Manager', 'Global Marketing Agency', 'San Francisco', 'Looking for a creative marketing manager with 5+ years of experience.', '2024-06-05');

INSERT INTO Applicants (FullName, Email, Phone, Resume) VALUES 
('John Doe', 'john.doe@example.com', '+1234567890', 'Link to resume'),
('Jane Smith', 'jane.smith@example.com', '+1987654321', 'Link to resume');

-- John Doe schedules an interview for the Software Engineer position
INSERT INTO Interviews (JobID, ApplicantID, InterviewDate, InterviewLocation, Notes) VALUES 
(1, 1, '2024-06-15 10:00:00', 'New York Office', 'Technical round');

-- Jane Smith schedules an interview for the Marketing Manager position
INSERT INTO Interviews (JobID, ApplicantID, InterviewDate, InterviewLocation, Notes) VALUES 
(2, 2, '2024-06-20 14:00:00', 'San Francisco Office', 'Portfolio review');
