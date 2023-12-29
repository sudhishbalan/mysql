create database library;
show databases;
use library;
create table Branch(
   Branch_no varchar(20) PRIMARY KEY,
   Manager_Id varchar(20),
   Branch_address varchar(50),
   Contact_no int
   );
create table Employee(
   Emp_Id varchar(20) PRIMARY KEY,
   Emp_name varchar(50),
   Position varchar(30),
   Salary float,
   Branch_no varchar(20),
   FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
   );
 create table Customer(
   customer_Id varchar(20) PRIMARY KEY,
   Customer_name varchar(50),
   Customer_address varchar(50),
   Reg_date date
   );
   
create table Books(
   ISBN varchar(20) PRIMARY KEY,
   Book_title varchar(70),
   Category varchar(20) ,
   Rental_Price decimal(10,2),
   status varchar(3) check(status in ('yes','no')),
   Author varchar(50),
   Publisher  varchar(60)
   );
create table IssueStatus(
   Issue_Id varchar(20)PRIMARY KEY,
   Issued_cust varchar(20),
   Issued_book_name varchar(70),
   Issue_date date,
   ISBN_book varchar(20),
   FOREIGN KEY (Issued_cust)REFERENCES Customer(Customer_Id),
   FOREIGN KEY (ISBN_book) REFERENCES Books (ISBN)
   );
create table ReturnStatus(
   Return_Id varchar(20) PRIMARY KEY,
   Return_CUST varchar(60),
   Return_book_name varchar(80),
   Return_date date,
   Isbn_book2 varchar(20),
   FOREIGN KEY(Isbn_book2 ) REFERENCES Books(ISBN)
   );
   INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no)
   VALUES
       ('SOO1', 'BOO1', '998 Alangad street', 96566542),
       ('SOO2', 'BOO2', '887 TPK avenue', 76854302),
       ('SOO3', 'BOO3', '765 Villan street', 90876321),
       ('SOO4', 'BOO1', 'VINU Anenue', 87695321),
	   ('SOO5', 'BOO2', '890 maple lane', 34694321);
       
   INSERT INTO Employee (Emp_id, Emp_name, Position, Salary, Branch_No)
   VALUES
       ('VOO1', 'vinu', 'clerk', 30000, 'SOO1'),
	   ('VOO2', 'AJAY', 'Library assistant', 35000, 'SOO1'),
       ('VOO3', 'pooja', 'librarian', 50000, 'SOO2'),
       ('VOO4', 'midhu', 'assistant librarian', 40000, 'SOO2'),
       ('VOO5', 'shijin', 'IT specialist', 55000, 'SOO3'),
       ('VOO6', 'raman', 'maintanance staff', 32000, 'SOO4'),
       ('VOO7', 'kochu', 'clerk', 32000, 'SOO5');
       
   INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
   VALUES
       ('KOO1','David wilsin', '505 walnut road, municipality', '2021-12-22'),
	   ('KOO2','alice johnson', '303 elm street, cityville', '2023-01-15'),
       ('KOO3','praveen bro', '876 oak Aveenu, townsville', '2023-03-10'),
       ('KOO4','sanju sing', '985 maple lane, villageton', '2023-04-05'),
       ('KOO5','willionson', '405 Birch lane, Districttown', '2023-05-12'),
       ('KOO6','arun  mahan', '721 maple Drive,Township', '2022-10-08'),
       ('KOO7','jishnu', ' 0002 tpk avenue, township', '2023-01-15'),
	   ('KOO8','smith son', '50098 munnur road ,municipality', '2023-09-27');
       
INSERT INTO Books (ISBN, Book_title, Category, Rental_price, Status, Author, Publisher)
VALUES       
       ('ISBNOO1', 'Harry potter and the philospher stone', 'fantasy Magic', 15.99 , 'yes', 'j.k. rowling', 'bloomsbury'),
	   ('ISBNOO2', 'the great gatsby', 'fiction' , 10.99, 'yes', 'scott fitzgerald', 'Scribner'),
       ('ISBNOO3', 'Introduction to python', 'Programming', 8.99 , 'yes', 'john doe','Tect Publications'),
       ('ISBNOO4', 'Data Science for Beginners', 'Data Science', 12.99 , 'no', 'Jane smith', 'Data Insights'),
       ('ISBNOO5', 'The kill a Mockingbird', 'Novel', 11.99 , 'yes', 'J.D Salinger',  'little, brown and Company'),
       ('ISBNOO6', 'The hunger games', 'Dystopian fiction', 10.99 , 'yes', 'suzanne collins', 'scholastic'),
       ('ISBNOO7', 'Pride and prejudice', 'classic', 10.99 , 'yes', 'jane Austen', 'Thomas Emerton'),
       ('ISBNOO8', 'The Diary of a Young girl', 'Autobiography', 19.99 , 'yes', 'anne frank', 'Doubleday');
       
INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)  
VALUES
     ('IOO1', 'KOO1', 'Harry potter and the philospher stone', '2023-04-01', 'ISBNOO1'),
	 ('IOO2', 'KOO2', 'Introduction to python', '2023-05-15', 'ISBNOO3'),
     ('IOO3', 'KOO3', 'To kill a Mockingbrid', '2023-06-10', 'ISBNOO5'),
     ('IOO4', 'KOO4', 'Data Science for Begininers', '2023-07-05', 'ISBNOO4'),
     ('IOO5', 'KOO5', 'The Diary of Young Girl', '2023-08-12', 'ISBNOO8');
     
INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2)
VALUES
     ('LOO1', 'KOO1', 'Sapiens:A Brief history of humankind', '2023-11-15', 'ISBNOO1'),
	 ('LOO2', 'KOO2', 'Introduction to python', '2023-08-20', 'ISBNOO3'),
     ('LOO3', 'KOO3', 'To kill a Mockingbrid', '2023-09-05', 'ISBNOO5'),
     ('LOO4', 'KOO4', 'Data Science for Begininers', '2023-10-12', 'ISBNOO4'),
     ('LOO5', 'KOO5', 'The Diary of Young Girl', '2023-11-18', 'ISBNOO8');

-- 1. Retrive the book title, category, and rental price of all available books.
SELECT Book_title, Category, Rental_price
FROM Books
WHERE Status = 'yes';

-- 2. List the employee name and their respective salaries in descending order of salary.
SELECT Emp_name, Salary
FROM Employee
ORDER BY Salary DESC;

-- 3. Retrive the book titles and the corresponding customer who have issued those books.
SELECT IssueStatus.Issued_book_name, Customer. Customer_name
FROM IssueStatus
LEFT JOIN Customer on IssueStatus.Issued_cust = Customer. Customer_Id;

-- 4. Display the count of books in each category
SELECT Category, COUNT(*) AS TotalBook
FROM Books
GROUP BY Category;

-- 5. Retrive the employee name and their positions for the employee whose salaryes are above rs.50,000.
SELECT Emp_name, position
FROM Employee
WHERE Salary>50000;

-- 6. List the customer name who registered before 2022-01-01 and have not issued any books yet.
SELECT Customer_name
FROM Customer
WHERE Reg_date <'2022-01-01'
 AND Customer_Id NOT IN(
 SELECT DISTINCT Issued_cust
 FROM Issuestatus);
 
 
 -- 7. Display the branch number and the total count of employee in each branch.
 SELECT Branch_no, count(*)AS Employee_count
 FROM Employee
 GROUP BY Branch_no;
 
 -- 8. Display the name of customer who have issued books in the month of june 2023.
 SELECT DISTINCT Customer_name
 FROM Customer
 LEFT JOIN IssueStatus on Customer. Customer_Id =IssueStatus. ISSUED_CUST
 WHERE IssueStatus. Issue_date between '2023-05-31'AND '2023-07-1';
 
 -- 9.Retrieve book_title from book table containing history.
 SELECT Book_title
 FROM Books
 WHERE LOWER(Book_title) LIKE '%history%';
 
 -- 10. Retrive the branch number along with the count of emplyee for branchs having more thane 5 emplyees
 SELECT Branch_no, count(*) AS Employee_count
 FROM Employee
 GROUP BY Branch_no
 HAVING Employee_count >1;
 


     



   
   
   
   
