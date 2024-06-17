CREATE TABLE Users(
UserId INTEGER PRIMARY KEY AUTOINCREMENT,
Username VARCHAR(255) NOT NULL,
FullName VARCHAR(255) NOT NULL,
Email VARCHAR(255) NOT NULL,
PasswordHash VARCHAR(255) NOT NULL,
CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP
);

Create Table Quizzes(
QuizId INTEGER PRIMARY KEY AUTOINCREMENT,
QuizTitle VARCHAR(255) NOT NULL,
Description Text,
CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Questions(
QuestionId INTEGER PRIMARY KEY AUTOINCREMENT,
QuizId INT,
QuestionText Text NOT NULL,
Foreign Key (QuizId) References Quizzes(QuizId);
);

Create Table Answers(
AnswerId INTEGER PRIMARY KEY AUTOINCREMENT,
QuestionId INT,
AnswerText TEXT NOT NULL,
IsCorrect Boolean NOT NULL DEFAULT FALSE,
Foreign Key(QuestionId) References Questions(QuestionId);
);

INSERT INTO Users(Username,FullName,Email,PasswordHash) VALUES ('azima_qadirli','Azima Qadirli','azima@gmail.com','152364');
INSERT INTO Users(Username,FullName,Email,PasswordHash) VALUES ('akif_qadirli','Akif Qadirli','akif@gmail.com','45867');

INSERT INTO Quizzes(QuizTitle,QuizDescription) VALUES('Object oriented programming', 'A quiz to test your knowledge about OOP');

INSERT INTO Questions(QuizId,QuestionText) VALUES((SELECT QuizId FROM Quizzes WHERE QuizTitle = 'Object oriented programming'),'What is color of Sun?');
INSERT INTO Questions(QuizId,QuestionText) VALUES((SELECT QuizId FROM Quizzes WHERE QuizTitle = 'Object oriented programming'),'What is 2+2?');

INSERT INTO Answers(QuestionId,AnswerText,IsCorrectAnswer) VALUES((SELECT QuestionId FROM Questions WHERE QuestionText='What is color of Sun?'),'Yellow',TRUE);
INSERT INTO Answers(QuestionId,AnswerText,IsCorrectAnswer) VALUES((SELECT QuestionId FROM Questions WHERE QuestionText='What is color of Sun?'),'Red',FALSE);

INSERT INTO Answers(QuestionId,AnswerText,IsCorrectAnswer) VALUES((SELECT QuestionId FROM Questions WHERE QuestionText='What is 2+2?'),'4',True);
INSERT INTO Answers(QuestionId,AnswerText,IsCorrectAnswer) VALUES((SELECT QuestionId FROM Questions WHERE QuestionText='What is 2+2?'),'5',FALSE);