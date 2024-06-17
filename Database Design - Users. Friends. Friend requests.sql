CREATE TABLE Users (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    Username VARCHAR(50) UNIQUE NOT NULL,
    FullName VARCHAR(255),
    Email VARCHAR(255) UNIQUE NOT NULL,
    Password VARCHAR(255),
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Friends (
    FriendshipID INT PRIMARY KEY AUTO_INCREMENT,
    UserID1 INT,
    UserID2 INT,
    Status ENUM('Pending', 'Accepted') DEFAULT 'Pending',
    ActionUserID INT,  -- UserID who initiated the action (send/request/accept)
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID1) REFERENCES Users(UserID),
    FOREIGN KEY (UserID2) REFERENCES Users(UserID),
    FOREIGN KEY (ActionUserID) REFERENCES Users(UserID)
);

CREATE TABLE FriendRequests (
    RequestID INT PRIMARY KEY AUTO_INCREMENT,
    SenderID INT,
    ReceiverID INT,
    Status ENUM('Pending', 'Accepted', 'Rejected') DEFAULT 'Pending',
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (SenderID) REFERENCES Users(UserID) ,
    FOREIGN KEY (ReceiverID) REFERENCES Users(UserID)
);

INSERT INTO Users (Username, FullName, Email, Password) VALUES 
('john_doe', 'John Doe', 'john.doe@example.com', 'hashed_password'),
('jane_smith', 'Jane Smith', 'jane.smith@example.com', 'hashed_password');

-- John Doe sends a friend request to Jane Smith
INSERT INTO FriendRequests (SenderID, ReceiverID) VALUES 
(1, 2);

-- Alternatively, Jane Smith could send a friend request to John Doe in a real application.

INSERT INTO Friends (UserID1, UserID2, Status, ActionUserID) VALUES 
(1, 2, 'Accepted', 2);
