CREATE TABLE Students (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    FullName VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE,
    DateOfBirth DATE
);

CREATE TABLE Exams (
    ExamID INT PRIMARY KEY AUTO_INCREMENT,
    ExamName VARCHAR(255) NOT NULL,
    ExamDate DATE NOT NULL
);

CREATE TABLE Results (
    ResultID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    ExamID INT,
    Score DECIMAL(5, 2),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (ExamID) REFERENCES Exams(ExamID)
);

INSERT INTO Students(FullName, Email, DateOfBirth) VALUES 
('John Doe', 'john.doe@example.com', '2000-05-15'),
('Jane Smith', 'jane.smith@example.com', '2001-08-22');

INSERT INTO Exams (ExamName, ExamDate) VALUES 
('Math Exam', '2023-06-15'),
('Science Exam', '2023-06-20');

INSERT INTO Results (StudentID, ExamID, Score) VALUES 
((SELECT StudentID FROM Students WHERE FullName = 'John Doe'), (SELECT ExamID FROM Exams WHERE ExamName = 'Math Exam'), 85.50),
((SELECT StudentID FROM Students WHERE FullName = 'John Doe'), (SELECT ExamID FROM Exams WHERE ExamName = 'Science Exam'), 78.00),
((SELECT StudentID FROM Students WHERE FullName = 'Jane Smith'), (SELECT ExamID FROM Exams WHERE ExamName = 'Math Exam'), 92.00),
((SELECT StudentID FROM Students WHERE FullName = 'Jane Smith'), (SELECT ExamID FROM Exams WHERE ExamName = 'Science Exam'), 88.50);
