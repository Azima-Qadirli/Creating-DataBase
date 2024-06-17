CREATE TABLE Teachers (
    TeacherID INT PRIMARY KEY AUTO_INCREMENT,
    FullName VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Students (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    FullName VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Classes (
    ClassID INT PRIMARY KEY AUTO_INCREMENT,
    ClassName VARCHAR(255) NOT NULL,
    TeacherID INT,
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID)
);


CREATE TABLE StudentClasses (
    StudentClassID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    ClassID INT,
    EnrolledAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (ClassID) REFERENCES Classes(ClassID)
);

INSERT INTO Teachers (FullName, Email,TeacherID) VALUES 
('John Doe', 'john.doe@example.com',1),
('Jane Smith', 'jane.smith@example.com',2);

INSERT INTO Students (FullName, Email) VALUES 
('Alice Johnson', 'alice.johnson@example.com'),
('Bob Brown', 'bob.brown@example.com');

INSERT INTO Classes (ClassName, TeacherID) VALUES 
('Mathematics', (SELECT TeacherID FROM Teachers WHERE FullName = 'John Doe')),
('History', (SELECT TeacherID FROM Teachers WHERE FullName = 'Jane Smith'));

INSERT INTO StudentClasses (StudentID, ClassID) VALUES 
((SELECT StudentID FROM Students WHERE FullName = 'Alice Johnson'), (SELECT ClassID FROM Classes WHERE ClassName = 'Mathematics')),
((SELECT StudentID FROM Students WHERE FullName = 'Bob Brown'), (SELECT ClassID FROM Classes WHERE ClassName = 'Mathematics')),
((SELECT StudentID FROM Students WHERE FullName = 'Alice Johnson'), (SELECT ClassID FROM Classes WHERE ClassName = 'History'));
