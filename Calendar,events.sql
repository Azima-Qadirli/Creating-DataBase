Create Table Users(
UserId INTEGER PRIMARY KEY AUTOINCREMENT,
Username VARCHAR(255) NOT NULL,
FullName VARCHAR(255) ,
Email VARCHAR(255)  UNIQUE,
PasswordHash VARCHAR(255) 
);

Create Table Calendars(
CalendarId INTEGER PRIMARY KEY AUTOINCREMENT,
UserId INT,
CalendarName VARCHAR(255) NOT NULL,
Description Text,
FOREIGN KEY (UserId) REFERENCES Users(UserId)
);

Create Table Events(
EventId INTEGER PRIMARY KEY AUTOINCREMENT,
CalendarId INT,
EventTitle VARCHAR(255) NOT NULL,
EventDescription Text,
StartDate DATETIME NOT NULL,
EndDate DATETIME NOT NULL,
CreatedAt DATETIME Default CURRENT_TIMESTAMP,
FOREIGN KEY (CalendarId) REFERENCES Calendars(CalendarId)
);

Create Table EventParticipants(
UserId INT,
EventId INT,
PRIMARY KEY(UserId, EventId),
Foreign Key (EventId) REFERENCES Events(EventId),
FOREIGN KEY (UserId) REFERENCES  Users(UserId)
);

INSERT INTO Users(Username,FullName,Email,PasswordHash) VALUES('azima_qadirli','Azima Qadirli','azima@gmail.com','naa2451'),
('akif_qadirli','Akif Qadirli','akif@gmail.com','485na');

INSERT INTO Calendars(UserId,CalendarName, Description ) VALUES((SELECT UsersId from Users where  Username='azima_qadirli'),'Work Calendar','Calendar for work-related events'),
((SELECT UsersId from Users where  Username='azima_qadirli'),'Work Calendar','Calendar for work-related events');

Insert INTO Events(EventId,EventTitle,EventDescription,StartDate,EndDate) Values ((SELECT CalendarID FROM Calendars WHERE CalendarName = 'Work Calendar'), 'Team Meeting', 'Monthly team meeting.', '2024-06-01 10:00:00', '2024-06-01 11:00:00'),
((SELECT CalendarID FROM Calendars WHERE CalendarName = 'Personal Calendar'), 'Dentist Appointment', 'Routine check-up.', '2024-06-02 14:00:00', '2024-06-02 15:00:00');

INSERT INTO EventParticipants(EventId,UserId) Values ((SELECT EventID FROM Events WHERE EventTitle = 'Team Meeting'), 
 (SELECT UserID FROM Users WHERE Username = 'azima_qadirli')),
((SELECT EventID FROM Events WHERE EventTitle = 'Team Meeting'), 
 (SELECT UserID FROM Users WHERE Username = 'akif_qadirli'));