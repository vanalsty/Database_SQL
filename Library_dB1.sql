CREATE DATABASE db_Library1;

USE db_Library1;

CREATE TABLE tbl_LibraryBranch (
	BranchID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	BranchName VARCHAR(50) NOT NULL,
	BrandchAddress VARCHAR(50) NOT NULL
);

INSERT INTO tbl_LibraryBranch 
	(BranchName, BrandchAddress)
	VALUES
	('Sharpstown', '123 NE First St'),
	('Midland', '234 SE Second St'),
	('Belmont', '345 NE Third St'),
	('Downtown', '456 SE Fourth St'),
	('Hawthorne', '567 SE Fifth St'),
	('East', '678 SE Sixth St')
;

SELECT * FROM tbl_LibraryBranch

CREATE TABLE tbl_Borrower (
	CardNo INT PRIMARY KEY NOT NULL,
	BorrowerName VARCHAR(50) NOT NULL,
	BorrowerAddress VARCHAR(50) NOT NULL,
	BorrowerPhone VARCHAR(50) NOT NULL
);

INSERT INTO tbl_Borrower 
	(CardNo, BorrowerName, BorrowerAddress, BorrowerPhone)
	VALUES
	(1234, 'Barney Rubble', '8 Branches St.', '425-220-3719'),
	(1235, 'Fred Flintstone', '231 Addison St', '928-298-4645'),
	(1236, 'Astro Dog', '107 Rock Creek Ave.', '906-241-6193'),
	(1237, 'Sheldon Cooper', '9572 Fulton St.', '937-548-7811'),
	(1238, 'Mr. Clean', '8301 Orange Lane', '954-985-8205'),
	(1239, 'Olaf Snowman', '47 High Point Dr.', '720-275-7100'),
	(1240, 'Jingle Bells', '555 East St', '720-275-4332')
;


SELECT * FROM tbl_Borrower

CREATE TABLE tbl_Book_Copies (
	BookID INT NOT NULL,
	BranchID INT NOT NULL,
	Number_of_Copies INT
);

ALTER TABLE tbl_Book_Copies
ADD FOREIGN KEY (BranchID) REFERENCES tbl_LibraryBranch(BranchID);

ALTER TABLE tbl_Book_Copies
ADD FOREIGN KEY (BookID) REFERENCES tbl_Books(BookID);

INSERT INTO tbl_Book_Copies
	(BranchID, BookID, Number_of_Copies)
	VALUES
	(1,1,2),
	(1,3,4),
	(1,5,2),
	(1,7,6),
	(1,9,2),
	(1,11,2),
	(1,13,3),
	(1,15,2),
	(1,17,2),
	(1,19,2),
	(2,2,2),
	(2,4,3),
	(2,8,2),
	(2,12,5),
	(2,14,3),
	(2,16,2),
	(3,4,2),
	(3,5,3),
	(3,6,2),
	(3,7,5),
	(3,8,3),
	(3,20,2),
	(4,20,2),
	(4,19,2),
	(4,18,4),
	(4,17,2),
	(4,16,7),
	(4,15,3),
	(5,9,4),
	(5,10,2),
	(5,11,7),
	(5,12,8),
	(5,13,3),
	(5,14,2),
	(6,20,2),
	(6,9,2),
	(6,8,2),
	(6,6,2)	
;

SELECT * FROM tbl_Book_Copies

CREATE TABLE tbl_Book_Loans (
	BookID INT NOT NULL,
	BranchID INT NOT NULL,
	CardNo INT NOT NULL,
	DateOut DATE NOT NULL,
	DateDue DATE NOT NULL
);

ALTER TABLE tbl_Book_Loans
ADD FOREIGN KEY (BranchID) REFERENCES tbl_LibraryBranch(BranchID);

ALTER TABLE tbl_Book_Loans
ADD FOREIGN KEY (CardNo) REFERENCES tbl_Borrower(CardNo);

ALTER TABLE tbl_Book_Loans
ADD FOREIGN KEY (BookID) REFERENCES tbl_Books(BookID);

INSERT INTO tbl_Book_Loans
	(BookID, BranchID, CardNo, DateOut, DateDue)
	VALUES
	(1,1,1234,'2020-05-20', '2020-06-10'),
	(5,1,1234,'2020-05-20', '2020-06-10'),
	(4,2,1235,'2020-05-21', '2020-06-11'),
	(8,2,1235,'2020-05-21', '2020-06-11'),
	(8,3,1236,'2020-05-22', '2020-06-12'),
	(20,3,1236,'2020-05-22', '2020-06-12'),
	(15,4,1237,'2020-05-23', '2020-06-13'),
	(16,4,1237,'2020-05-23','2020-06-13'),
	(12,5,1238,'2020-05-24', '2020-06-14'),
	(6,6,1239,'2020-05-24', '2020-06-14')
;

SELECT * FROM tbl_Book_Loans

CREATE TABLE tbl_Books (
	BookID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	Title VARCHAR(50) NOT NULL,
	PublisherName VARCHAR(50) NOT NULL
);

ALTER TABLE tbl_Books
ADD FOREIGN KEY (PublisherName) REFERENCES tbl_Publisher(PublisherName);

INSERT INTO tbl_Books
	(Title, PublisherName)
	VALUES
	('The Lost Tribe', 'Random House'),
	('The Color Purple', 'White House'),
	('Catch-22', 'Blue House'),
	('Atlas Shrugged', 'Red House'),
	('The Lord of the Rings', 'Purple House'),
	('Hamlet','Brown House'),
	('Ulysses', 'Random House'),
	('Invisible Man', 'White House'),
	('Watchmen', 'Blue House'),
	('Schindlers List', 'Red House'),
	('Clifford Big Red Dog', 'Purple House'),
	('Green Eggs and Ham','Brown House'),
	('Just Another Book', 'Random House'),
	('The Color Purple', 'White House'),
	('Pioneer', 'Blue House'),
	('Tell me a Riddle', 'Red House'),
	('Turkey', 'Purple House'),
	('Red Sunset','Brown House'),
	('All Quiet on the Western Front', 'Purple House'),
	('Last One','Brown House')
;

SELECT * FROM tbl_Books

CREATE TABLE tbl_Publisher (
	PublisherName VARCHAR(50) PRIMARY KEY NOT NULL,
	PublisherAddress VARCHAR(50) NOT NULL,
	Phone VARCHAR(50) NOT NULL
);


INSERT INTO tbl_Publisher
	(PublisherName, PublisherAddress, Phone)
	VALUES
	('Random House', '8 A St.', '425-220-4323'),
	('White House',  '231 B St', '928-298-2333'),
	('Blue House',  '107 C Ave.', '906-241-8787'),
	('Red House',  '9572 D St.', '937-548-8908'),
	('Purple House',  '8301 E Lane', '954-985-3244'),
	('Brown House', '47 F Dr.', '720-275-4223')
;

SELECT * FROM tbl_Publisher



CREATE TABLE tbl_Book_Authors (
	BookID INT NOT NULL,
	AuthorName VARCHAR(50) NOT NULL
);

ALTER TABLE tbl_Book_Authors 
ADD FOREIGN KEY (BookID) REFERENCES tbl_Books(BookID);

INSERT INTO tbl_Book_Authors
	(BookID, AuthorName)
	VALUES
	(1, 'Tom Thumb'),
	(2, 'Tom Thumb'),
	(3, 'Fanny Finger'),
	(4, 'Fanny Finger'),
	(5, 'Barry Banana'),
	(6, 'Barry Banana'),
	(7, 'Carrie Cherry'),
	(8, 'Carrie Cherry'),
	(9, 'Dolly Donut'),
	(10, 'Dolly Donut'),
	(11, 'Marvin Melon'),
	(12, 'Marvin Melon'),
	(13, 'Olivia Orange'),
	(14, 'Olivia Orange'),
	(15, 'Petunia Peach'),
	(16, 'Petunia Peach'),
	(17, 'Orville Onion'),
	(18, 'Orville Onion'),
	(19, 'Sandy Sandwich'),
	(20, 'Sandy Sandwich')
;

SELECT * FROM tbl_Book_Authors

SELECT *
FROM tbl_Book_Loans
FULL OUTER JOIN tbl_Borrower ON tbl_Book_Loans.CardNo = tbl_Borrower.CardNo
FULL OUTER JOIN tbl_Books ON tbl_Book_Loans.BookID = tbl_Books.BookID;

/*returns all book titles and the authors name*/
SELECT tbl_Book_Authors.AuthorName, tbl_Books.Title
FROM tbl_Books
INNER JOIN tbl_Book_Authors ON tbl_Books.BookID = tbl_Book_Authors.BookID;



/*How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?*/


/*How many copies of the book titled "The Lost Tribe" are owned by each library branch?*/

/*Retrieve the names of all borrowers who do not have any books checked out.*/