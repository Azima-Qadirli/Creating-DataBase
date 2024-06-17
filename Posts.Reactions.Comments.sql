CREATE TABLE Posts (
    PostID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    Content TEXT NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE Reactions (
    ReactionID INT PRIMARY KEY AUTO_INCREMENT,
    PostID INT,
    UserID INT,
    ReactionType VARCHAR(50) NOT NULL,
    FOREIGN KEY (PostID) REFERENCES Posts(PostID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID) 
);
CREATE TABLE Comments (
    CommentID INT PRIMARY KEY AUTO_INCREMENT,
    PostID INT,
    UserID INT,
    Content TEXT NOT NULL,
    FOREIGN KEY (PostID) REFERENCES Posts(PostID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);


INSERT INTO Posts(UserId,Content) VALUES (1,'This is the first post'),
(2,'This is the second post');

INSERT INTO Reactions(PostId,UserId,ReactionType) VALUES (1,1,'Like'),
(1,2,'Love'),
(2,1,'Like');

INSERT INTO Comments(PostId,UserId,Content) Values 
(1,1,'This is a comment for first post.'),
(1,2,'Another comment on the first post.'),
(2,1,'A comment on the second post');

