-- TestLibrary Stored-Procedure

-- DROP
DROP PROCEDURE IF EXISTS GetBorrowedBooksInfo
DROP PROCEDURE IF EXISTS GetRecentBooks
DROP PROCEDURE IF EXISTS GetTopBorrower

-- CREATE
CREATE PROCEDURE GetBorrowedBooksInfoForMember
    @MemberId INT
AS
BEGIN
    SELECT
        M.FirstName + ' ' + M.LastName AS MemberName,
        B.Title AS BookTitle,
        B.Author AS BookAuthor,
        L.LoanDate AS LoanDate,
        L.DueDate AS DueDate
    FROM
        Loans L
    INNER JOIN
        Members M ON L.MemberID = M.MemberID
    INNER JOIN
        Books B ON L.BookID = B.BookID
    WHERE
        L.MemberID = @MemberId;
END;



CREATE PROCEDURE GetRecentBooks
AS
BEGIN
    -- Calculate the current date
    DECLARE @Today DATE = GETDATE();

    -- Calculate the date 1 week ago from the current date
    DECLARE @OneWeekAgo DATE = DATEADD(YEAR, -30, @Today);

    -- Query books published within the last 1 week
    SELECT *
    INTO #RecentBooks
    FROM Books
    WHERE PublishDate BETWEEN @OneWeekAgo AND @Today;

    -- Return books published within the last 1 week
    SELECT * FROM #RecentBooks;

    -- Return books published beyond 1 week ago
    SELECT * FROM Books WHERE BookID NOT IN (SELECT BookID FROM #RecentBooks);

    -- Drop the temporary table
    DROP TABLE #RecentBooks;
END;


CREATE PROCEDURE GetTopBorrower
AS
BEGIN
    SELECT TOP 1
        M.FirstName + ' ' + M.LastName AS TopBorrower,
        COUNT(L.LoanID) AS TotalBooksBorrowed
    FROM
        Loans L
    INNER JOIN
        Members M ON L.MemberID = M.MemberID
    GROUP BY
        M.FirstName, M.LastName
    ORDER BY
        TotalBooksBorrowed DESC;
END;