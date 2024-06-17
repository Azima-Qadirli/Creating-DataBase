CREATE TABLE Articles (
    ArticleID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(255) NOT NULL,
    Content TEXT,
    AuthorID INT,
    PublishedDate DATE,
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (AuthorID) REFERENCES Users(UserID)
);

CREATE TABLE Users (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    Username VARCHAR(50) UNIQUE NOT NULL,
    FullName VARCHAR(255),
    Email VARCHAR(255) UNIQUE NOT NULL,
    Password VARCHAR(255),
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Views (
    ViewID INT PRIMARY KEY AUTO_INCREMENT,
    ArticleID INT,
    ViewerID INT,
    ViewedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ArticleID) REFERENCES Articles(ArticleID),
    FOREIGN KEY (ViewerID) REFERENCES Users(UserID) 
);
INSERT INTO Users (Username, FullName, Email, Password) VALUES 
('john_doe', 'John Doe', 'john.doe@example.com', 'hashed_password'),
('jane_smith', 'Jane Smith', 'jane.smith@example.com', 'hashed_password');

INSERT INTO Articles (Title, Content, AuthorID, PublishedDate) VALUES 
('Introduction to SQL', 'SQL is a powerful language for managing relational databases.', 1, '2024-06-01'),
('Web Development Trends', 'Explore the latest trends in web development technologies.', 2, '2024-06-05');

-- John Doe views the article 'Introduction to SQL'
INSERT INTO Views (ArticleID, ViewerID, ViewedAt) VALUES 
(1, 1, '2024-06-10 10:00:00');

-- Jane Smith views the article 'Web Development Trends'
INSERT INTO Views (ArticleID, ViewerID, ViewedAt) VALUES 
(2, 2, '2024-06-12 14:00:00');
