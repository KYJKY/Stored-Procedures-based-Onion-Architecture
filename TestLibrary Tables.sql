-- TestLibrary Tables
-- DROP
DROP TABLE IF EXISTS Loans;
DROP TABLE IF EXISTS Reservations;
DROP TABLE IF EXISTS Books;
DROP TABLE IF EXISTS Members;

-- CREATE
CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title NVARCHAR(100),
    Author NVARCHAR(100),
    Genre NVARCHAR(50),
    Publisher NVARCHAR(100),
    PublishDate DATE,
    AvailableCopies INT
);

CREATE TABLE Members (
    MemberID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Email NVARCHAR(100),
    PhoneNumber NVARCHAR(20),
    Address NVARCHAR(200),
    MemberType NVARCHAR(50)
);

CREATE TABLE Loans (
    LoanID INT PRIMARY KEY,
    BookID INT,
    MemberID INT,
    LoanDate DATE,
    DueDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

CREATE TABLE Reservations (
    ReservationID INT PRIMARY KEY,
    BookID INT,
    MemberID INT,
    ReservationDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);