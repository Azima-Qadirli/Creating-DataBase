Create Table Books(
BookId INTEGER PRIMARY KEY AUTOINCREMENT,
Title VARCHAR(255) NOT NULL,
PublishedYear INTEGER ,
CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP 
);
Create Table Authors(
AuthorId INTEGER PRIMARY KEY AUTOINCREMENT,
FullName VARCHAR(255) NOT NULL,
Biography Text,
BirthDate Date,
);

Create Table Genres(
GenreId INTEGER PRIMARY KEY AUTOINCRE,
GenreName VARCHAR(255) NOT NULL,
Description Text
);
Create Table BookAuthors(
BookId INT,
AuthorId INT,
Primary Key (BookId, AuthorId),
FOREIGN KEY (BookId) REFERENCES Books(BookId),
Foreign Key (AuthorId) REFERENCES Authors(AuthorId)
);

Create Table BookGenres(
BookId INT,
GenreId INT,
Primary Key (BookId, GenreId),
Foreign Key (GenreId) REFERENCES Genres(GenreId),
Foreign Key (BookId) REFERENCES Books(BookId)
);

INSERT INTO Authors (FullName, Biography, Birthdate) VALUES 
('J.K. Rowling', 'British author, best known for the Harry Potter series', '1965-07-31'),
('Stephen King', 'American author of horror, supernatural fiction, suspense, and fantasy novels', '1947-09-21');

INSERT INTO Genres (GenreName, Description) VALUES 
('Fantasy', 'A genre of speculative fiction set in a fictional universe, often inspired by real world myth and folklore.'),
('Horror', 'A genre of speculative fiction which is intended to frighten, scare, or disgust.');

INSERT INTO Books (Title, ISBN, PublishedYear) VALUES 
('Harry Potter and the Philosopher\'s Stone', '9780747532699', 1997),
('The Shining', '9780385121675', 1977);
