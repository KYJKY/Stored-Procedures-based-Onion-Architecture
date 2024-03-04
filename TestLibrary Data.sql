-- TestLibrary Data
-- DELETE
DELETE Loans
DELETE Reservations
DELETE Books
DELETE Members

-- INSERT
INSERT INTO Books (BookID, Title, Author, Genre, Publisher, PublishDate, AvailableCopies)
VALUES
    (1, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction', 'Scribner', '1925-04-10', 5),
    (2, 'To Kill a Mockingbird', 'Harper Lee', 'Fiction', 'J.B. Lippincott & Co.', '1960-07-11', 3),
    (3, '1984', 'George Orwell', 'Fiction', 'Secker & Warburg', '1949-06-08', 8),
    (4, 'Pride and Prejudice', 'Jane Austen', 'Fiction', 'T. Egerton, Whitehall', '1813-01-28', 6),
    (5, 'The Catcher in the Rye', 'J.D. Salinger', 'Fiction', 'Little, Brown and Company', '1951-07-16', 4),
    (6, 'To the Lighthouse', 'Virginia Woolf', 'Fiction', 'The Hogarth Press', '1927-05-05', 7),
    (7, 'Moby-Dick', 'Herman Melville', 'Fiction', 'Richard Bentley', '1851-10-18', 9),
    (8, 'Frankenstein', 'Mary Shelley', 'Horror', 'Lackington, Hughes, Harding, Mavor & Jones', '1818-01-01', 10),
    (9, 'The Hobbit', 'J.R.R. Tolkien', 'Fantasy', 'George Allen & Unwin', '1937-09-21', 2),
    (10, 'The Lord of the Rings', 'J.R.R. Tolkien', 'Fantasy', 'George Allen & Unwin', '1954-07-29', 1),
	(11, 'The Alchemist', 'Paulo Coelho', 'Fiction', 'HarperCollins', '1988-04-25', 5),
    (12, 'The Chronicles of Narnia', 'C.S. Lewis', 'Fantasy', 'Geoffrey Bles', '1950-10-16', 3),
    (13, 'The Hunger Games', 'Suzanne Collins', 'Science Fiction', 'Scholastic Corporation', '2008-09-14', 8),
    (14, 'The Da Vinci Code', 'Dan Brown', 'Mystery', 'Doubleday', '2003-03-18', 6),
    (15, 'The Girl with the Dragon Tattoo', 'Stieg Larsson', 'Thriller', 'Norstedts Förlag', '2005-08-01', 4),
    (16, 'The Picture of Dorian Gray', 'Oscar Wilde', 'Gothic Fiction', 'Ward, Lock and Company', '1890-07-20', 7),
    (17, 'The Road', 'Cormac McCarthy', 'Post-Apocalyptic Fiction', 'Knopf', '2006-09-26', 9),
    (18, 'A Tale of Two Cities', 'Charles Dickens', 'Historical Fiction', 'Chapman & Hall', '1859-11-26', 10),
    (19, 'The Stand', 'Stephen King', 'Horror', 'Doubleday', '1978-10-03', 2),
    (20, 'The Fault in Our Stars', 'John Green', 'Young Adult', 'Dutton Books', '2012-01-10', 1);


INSERT INTO Members (MemberID, FirstName, LastName, Email, PhoneNumber, Address, MemberType)
VALUES
    (1, 'John', 'Doe', 'john.doe@example.com', '123-456-7890', '123 Main St, Anytown', 'Regular'),
    (2, 'Jane', 'Smith', 'jane.smith@example.com', '456-789-0123', '456 Elm St, Othertown', 'Premium'),
    (3, 'Alice', 'Johnson', 'alice.johnson@example.com', '789-012-3456', '789 Oak St, Another Town', 'Regular'),
    (4, 'Bob', 'Brown', 'bob.brown@example.com', '012-345-6789', '012 Pine St, Somewhere', 'Regular'),
    (5, 'Emma', 'Davis', 'emma.davis@example.com', '345-678-9012', '345 Maple St, Nowhere', 'Premium'),
    (6, 'Michael', 'Wilson', 'michael.wilson@example.com', '678-901-2345', '678 Cedar St, Everywhere', 'Regular'),
    (7, 'Sophia', 'Martinez', 'sophia.martinez@example.com', '901-234-5678', '901 Birch St, Anywhere', 'Regular'),
    (8, 'William', 'Anderson', 'william.anderson@example.com', '234-567-8901', '234 Walnut St, Elsewhere', 'Premium'),
    (9, 'Olivia', 'Taylor', 'olivia.taylor@example.com', '567-890-1234', '567 Cherry St, Here', 'Regular');


INSERT INTO Loans (LoanID, BookID, MemberID, LoanDate, DueDate, ReturnDate)
VALUES
    (1, 1, 1, '2024-02-01', '2024-02-15', '2024-02-14'),
    (2, 2, 2, '2024-02-05', '2024-02-20', NULL),
    (3, 3, 3, '2024-02-10', '2024-02-25', NULL),
    (4, 4, 4, '2024-02-15', '2024-03-01', NULL),
    (5, 5, 5, '2024-02-20', '2024-03-05', NULL),
    (6, 6, 6, '2024-02-25', '2024-03-10', NULL),
    (7, 7, 7, '2024-03-01', '2024-03-15', NULL),
    (8, 8, 8, '2024-03-05', '2024-03-20', NULL),
    (9, 9, 1, '2024-03-10', '2024-03-25', NULL),
    (10, 10, 1, '2024-03-15', '2024-03-30', NULL),
	(11, 11, 1, '2024-03-20', '2024-04-04', NULL),
    (12, 12, 2, '2024-03-21', '2024-04-05', NULL),
    (13, 13, 2, '2024-03-22', '2024-04-06', NULL),
    (14, 14, 3, '2024-03-23', '2024-04-07', NULL),
    (15, 15, 3, '2024-03-24', '2024-04-08', NULL),
    (16, 16, 4, '2024-03-25', '2024-04-09', NULL),
    (17, 17, 5, '2024-03-26', '2024-04-10', NULL),
    (18, 18, 6, '2024-03-27', '2024-04-11', NULL),
    (19, 19, 7, '2024-03-28', '2024-04-12', NULL),
    (20, 20, 7, '2024-03-29', '2024-04-13', NULL);

INSERT INTO Reservations (ReservationID, BookID, MemberID, ReservationDate)
VALUES
    (1, 1, 2, '2024-02-05'),
    (2, 2, 3, '2024-02-10'),
    (3, 3, 4, '2024-02-15'),
    (4, 4, 5, '2024-02-20'),
    (5, 5, 6, '2024-02-25'),
    (6, 6, 7, '2024-03-01'),
    (7, 7, 8, '2024-03-05'),
    (8, 8, 9, '2024-03-10');

-- SELECT
SELECT *
FROM Books

SELECT *
FROM Members

SELECT *
FROM Loans

SELECT *
FROM Reservations