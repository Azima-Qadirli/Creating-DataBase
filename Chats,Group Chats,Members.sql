CREATE TABLE Users(
UserId INT PRIMARY KEY AUTOINCREMENT,
USERNAME VARCHAR(255) NOT NULL,
DISPLAY_NAME VARCHAR(255) NOT NULL,
EMAIL VARCHAR(255) NOT NULL,
Password VARCHAR(255) NOT NULL,
CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE CHATS(
ChatId INT PRIMARY KEY AUTOINCREMENT,
IsGroupChat Boolean NOT NULL DEFAULT FALSE,
GroupName VARCHAR(255) NOT NULL,
CraetedAt DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- ALTER TABLE Users 
-- ADD EMAIL VARCHAR(255) NOT NULL

CREATE TABLE Messages(
MessagesId INT PRIMARY KEY AUTOINCREMENT,
ChatId INT,
SenderId INT,
Context Text,
Foreign Key (ChatId) References Chats(ChatsId),
Foreign Key (SenderId) References Users(UserId)
);

Insert INTO Users(USERNAME,DISPLAY_NAME,Password,EMAIL) VALUES ('Azima','Azimakhanim','maa2451i','azima@gmail.com');
Insert INTO Users(USERNAME,DISPLAY_NAME,Password,EMAIL) VALUES ('Ali','Abasqulizade','academy','ali@gmail.com');

INSERT INTO Chats(IsGroupChat) VALUES(False);
INSERT INTO Chats(IsGroupChat,GroupName) VALUES(True,'Backend');

Insert INTO Messages(ChatsId,SenderId,Context) VALUES (1,(SELECT UserId FROM Users WHERE USERNAME='Azima'),'Hi!!!');
Insert INTO Messages(ChatsId,SenderId,Context) VALUES (2,(SELECT UserId FROM Users WHERE USERNAME='Ali'),'Good luck!');

