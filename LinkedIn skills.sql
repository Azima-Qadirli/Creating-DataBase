CREATE TABLE Users (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Password VARCHAR(255) NOT NULL,  -- For simplicity, store hashed passwords in real scenarios
    ProfilePicture VARCHAR(255),    -- URL or path to profile picture
    Bio TEXT,
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Skills (
    SkillID INT PRIMARY KEY AUTO_INCREMENT,
    SkillName VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE UserSkills (
    UserSkillID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    SkillID INT,
    Endorsements INT DEFAULT 0,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (SkillID) REFERENCES Skills(SkillID),
    UNIQUE (UserID, SkillID)
);

INSERT INTO Users (FirstName, LastName, Email, Password, ProfilePicture, Bio)
VALUES 
('John', 'Doe', 'john.doe@example.com', 'hashed_password', 'https://example.com/profile/john_doe.jpg', 'Passionate about technology and innovation.'),
('Jane', 'Smith', 'jane.smith@example.com', 'hashed_password', 'https://example.com/profile/jane_smith.jpg', 'Experienced marketing professional with a focus on digital strategy.');

INSERT INTO Skills (SkillName)
VALUES 
('Software Development'),
('Digital Marketing'),
('Project Management'),
('Data Analysis'),
('Graphic Design');

-- John Doe's skills
INSERT INTO UserSkills (UserID, SkillID, Endorsements)
VALUES 
(1, 1, 10), -- Software Development
(1, 3, 5),  -- Project Management

-- Jane Smith's skills
(2, 2, 8),  -- Digital Marketing
(2, 4, 3);  -- Data Analysis
