CREATE TABLE Polls (
    PollID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(255) NOT NULL,
    Description TEXT,
);

CREATE TABLE Questions (
    QuestionID INT PRIMARY KEY AUTO_INCREMENT,
    PollID INT,
    QuestionText TEXT NOT NULL,
    FOREIGN KEY (PollID) REFERENCES Polls(PollID) 
);

CREATE TABLE Answers (
    AnswerID INT PRIMARY KEY AUTO_INCREMENT,
    QuestionID INT,
    AnswerText TEXT NOT NULL,
    FOREIGN KEY (QuestionID) REFERENCES Questions(QuestionID)
);

INSERT INTO Polls(Title, Description) Values ('Customer Satisfaction Survey', 'Survey to gather customer satisfaction feedback.'),
('Employee Engagement Survey', 'Survey to measure employee engagement.');

INSERT INTO Questions(PollID,QuestionText) Values ((SELECT PollID FROM Polls WHERE Title = 'Customer Satisfaction Survey'), 'How satisfied are you with our service?'),
((SELECT PollID FROM Polls WHERE Title = 'Customer Satisfaction Survey'), 'Would you recommend our service to others?'),
((SELECT PollID FROM Polls WHERE Title = 'Employee Engagement Survey'), 'How engaged do you feel at work?');

INSERT INTO Answers(QuestionID, AnswerText) Values  
((SELECT QuestionID FROM Questions WHERE QuestionText = 'How satisfied are you with our service?'), 'Very Satisfied'),
((SELECT QuestionID FROM Questions WHERE QuestionText = 'How satisfied are you with our service?'), 'Satisfied'),
((SELECT QuestionID FROM Questions WHERE QuestionText = 'How satisfied are you with our service?'), 'Neutral'),
((SELECT QuestionID FROM Questions WHERE QuestionText = 'How satisfied are you with our service?'), 'Dissatisfied'),
((SELECT QuestionID FROM Questions WHERE QuestionText = 'How satisfied are you with our service?'), 'Very Dissatisfied'),
((SELECT QuestionID FROM Questions WHERE QuestionText = 'Would you recommend our service to others?'), 'Yes'),
((SELECT QuestionID FROM Questions WHERE QuestionText = 'Would you recommend our service to others?'), 'No'),
((SELECT QuestionID FROM Questions WHERE QuestionText = 'How engaged do you feel at work?'), 'Very Engaged'),
((SELECT QuestionID FROM Questions WHERE QuestionText = 'How engaged do you feel at work?'), 'Engaged'),
((SELECT QuestionID FROM Questions WHERE QuestionText = 'How engaged do you feel at work?'), 'Neutral'),
((SELECT QuestionID FROM Questions WHERE QuestionText = 'How engaged do you feel at work?'), 'Disengaged'),
((SELECT QuestionID FROM Questions WHERE QuestionText = 'How engaged do you feel at work?'), 'Very Disengaged');