CREATE TABLE Users (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    Username VARCHAR(50) UNIQUE NOT NULL,
    FullName VARCHAR(255),
    Email VARCHAR(255) UNIQUE NOT NULL,
    Password VARCHAR(255),
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Channels (
    ChannelID INT PRIMARY KEY AUTO_INCREMENT,
    ChannelName VARCHAR(255) NOT NULL,
    Description TEXT,
    CreatorID INT,
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (CreatorID) REFERENCES Users(UserID)
);

CREATE TABLE Subscribers (
    SubscriptionID INT PRIMARY KEY AUTO_INCREMENT,
    ChannelID INT,
    SubscriberID INT,
    SubscribeDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ChannelID) REFERENCES Channels(ChannelID),
    FOREIGN KEY (SubscriberID) REFERENCES Users(UserID) 
);

CREATE TABLE Videos (
    VideoID INT PRIMARY KEY AUTO_INCREMENT,
    VideoTitle VARCHAR(255) NOT NULL,
    Description TEXT,
    ChannelID INT,
    UploadDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ChannelID) REFERENCES Channels(ChannelID)
);

CREATE TABLE Comments (
    CommentID INT PRIMARY KEY AUTO_INCREMENT,
    VideoID INT,
    ChannelID INT,
    CommenterID INT,
    Comment TEXT,
    CommentDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (VideoID) REFERENCES Videos(VideoID) ON DELETE CASCADE,
    FOREIGN KEY (ChannelID) REFERENCES Channels(ChannelID) ON DELETE CASCADE,
    FOREIGN KEY (CommenterID) REFERENCES Users(UserID) ON DELETE CASCADE
);

INSERT INTO Users (Username, FullName, Email, Password) VALUES
('john_doe', 'John Doe', 'john.doe@example.com', 'hashed_password'),
('jane_smith', 'Jane Smith', 'jane.smith@example.com', 'hashed_password');


INSERT INTO Channels (ChannelName, Description, CreatorID) VALUES
('Tech Talk', 'Discussions on latest technology trends.', 1), -- Assuming User with UserID 1 exists
('Cooking Recipes', 'Recipes for delicious meals from around the world.', 2); -- Assuming User with UserID 2 exists


INSERT INTO Subscribers (ChannelID, SubscriberID) VALUES
(1, 2), -- User with UserID 2 subscribes to ChannelID 1
(2, 1); -- User with UserID 1 subscribes to ChannelID 2

INSERT INTO Videos (VideoTitle, Description, ChannelID) VALUES
('Introduction to SQL', 'Learn the basics of SQL programming.', 1), -- Video for ChannelID 1
('How to Make Pizza', 'Step-by-step guide to making homemade pizza.', 2); -- Video for ChannelID 2

INSERT INTO Comments (VideoID, ChannelID, CommenterID, Comment) VALUES
(1, 1, 2, 'Great tutorial, very informative!'), -- Comment on VideoID 1 by User with UserID 2
(2, 2, 1, 'I tried this recipe, it turned out amazing!'); -- Comment on VideoID 2 by User with UserID 1