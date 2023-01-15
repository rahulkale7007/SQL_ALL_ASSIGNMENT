create DATABASE Test1
use Test1


--1
CREATE TABLE Book
(
    bookId int,
    bookName varchar(50),
    authorId int,
    price int,
    publishedDate DATE
)
INSERT into Book VALUES
    (1, 'The Hunger Games', 101, 12000, cast('10-4-2008' as date)),
    (2, 'Harry Potter', 102, 9000, cast('6- 21-2003' as date)),
    (3, 'Pride and Prejudice', 103, 5000, cast('1-28-1813' as date)),
    (4, 'To Kill a Mockingbird', 104, 15000, cast('1-1-1960' as date)),
    (5, 'The Book Thief', 105, 3000, cast('3-1-2006' as date)),
    (6, 'Twilight', 106, 5000, cast('10-5-2005' as date)),
    (7, 'Animal Farm', 107, 10000, cast('8-17-1945' as date)),
    (8, 'The Chronicles of Narnia', 108, 7000, cast('1-1-1956' as date)),
    (9, 'The Hobbit and The Lord of the Rings', 109, 3000, cast('10-20-1955' as date)),
    (10, 'The Fault in Our Stars', 110, 13500, cast('1-10-2012' as date))
SELECT *from Book

--2
CREATE TABLE Author
(
    authorId int,
    authorName varchar(50),
    phoneNo int,
    email varchar(50),
    city varchar(50),
    country varchar(50)
)
INSERT into Author VALUES
    (101, 'Suzanne Collins', 772581476, 'temp1@gmail.com' , 'Hartford', 'US' ),
    (102, 'J.K. Rowling', 512458969, 'temp2@gmail.com' , 'Yate', 'England'),
    (103, 'Jane Austen', 425874365, 'temp3@gmail.com' , 'Hampshire', 'England' ),
    (104, 'Harper Lee', 745625874, 'temp4@gmail.com' , 'Monroeville', 'US'),
    (105, 'Markus Zusak', 722388644, 'temp5@gmail.com'  , 'Sydney', 'Australia' ),
    (106, 'Stephenie Meyer', 452981425, 'temp6@gmail.com'  , 'Hartford', 'US' ),
    (107, 'George Orwell', 521447739, 'temp7@gmail.com' , 'London', 'England' ),
    (108, 'C.S. Lewis', 712346674, 'temp8@gmail.com' , 'Belfast', 'Ireland' ),
    (109, 'J.R.R. Tolkien', 912358964, 'temp9@gmail.com' , 'Bournemouth', 'England' ),
    (110, 'John Green', 822255588, 'temp10@gmail.com' , 'Indianapolis', 'US' )
SELECT * FROM Author



--3
CREATE TABLE Awards
(
    awardId int,
    awardTypeId int,
    authorId int,
    bookId int,
    year int
)
INSERT into Awards VALUES
    (1010, 50, 101, 1 , 2008 ),
    (1020, 60, 102, 2 , 2003),
    (1030, 50, 103, 3 , 1813 ),
    (1040, 30, 104, 4 , 1960),
    (1050, 40, 105, 5  , 2006 ),
    (1060, 50, 106, 6  , 2005 ),
    (1070, 70, 107, 7 , 1945 ),
    (1080, 60, 108, 8 , 1956 ),
    (1090, 50, 109, 9 , 1955 ),
    (1100, 80, 110, 10 , 2012 )
SELECT *from Awards



--4
create table AwardsMaster
(
    awardTypeId int, 
    awardName varchar(50), 
    awardPrice int
)
INSERT into AwardsMaster VALUES
    (50, 'California Young Reader Medal', 100000),
    (60, 'World Science Fiction Conventions Hugo Award', 250000),
    (50, 'Sense and Sensibility' , 100000),
    (30, 'Pulitzer Prize', 200000 ),
    (40, 'Margaret A. Edwards Award' , 10000),
    (50, 'Best Fiction for Young Adults' , 100000 ),
    (70, 'Pulitzer Prize', 200000 ),
    (60, 'Margaret A. Edwards Award' , 10000 ),
    (50, 'Pulitzer Prize', 200000),
    (80, 'Best Young Adult' , 10000  )
SELECT *from AwardsMaster


----------------------------------------------------------------------------
--all 4 tables
SELECT * from Book
SELECT * from Author
SELECT * from Awards
SELECT * from AwardsMaster
----------------------------------------------------------------------------



--1. Write a query to show book name , author name and award name for all books which has received any award.
SELECT b.bookName, au.authorName, am.awardName
from book b join Author au on b.authorId = au.authorId 
			join Awards aw on au.authorId = aw.authorId
			join AwardsMaster am on aw.awardTypeId = am.awardTypeId


--2. Write a query to update author name of authors whose book price is > 100. Prefix author name with ‘Honourable’ .
update Author set authorName = CONCAT('Honourable. ', authorName) 
where authorId in
(
	select authorId from Book
	where price>10000
)


--3. Write a query to display authors and number of books written by that author. Show author who has written maximum books at the top.
select authorName, COUNT(authorId) as 'total Written book count' from Author
group by authorName 
order by [total Written book count] desc


--4. Write a query to select book name with 5 th highest price.
select * from book order by price desc, bookName
offset 4 rows
fetch next 1 rows only


--5. Select list of books which have same price as book ‘Harry Potter’.
select * from Book where price = 
(select price from book where bookName = 'Harry Potter')


--6. Increase price of all books written by 'J.K. Rowling' by 5%
update book set price=(price*1.50) where authorId = 
(	
	select authorId from Author
	where authorName = 'J.K. Rowling' 
)


--7. Show award names and number of books which got these awards. 
select awardname, count(awardtypeid) as 'number of books which got these awards' from AwardsMaster
group by awardName


--8. Delete all books written by ‘C.S. Lewis’ 
delete book where authorId = 
(select authorId from Author
where authorName='C.S. Lewis'
)


--9. Create view to show name of book and year when it has received award. 
create view V1 as
select b.bookName, aw.year from book b join Awards aw
on b.authorid = aw.authorid;

select * from V1


--10. Create trigger to ensure min price of any book must be Rs. 100. 


--11. Increase price of book by 10% if that book has received any award.
update book set price = (price*1.10) where bookId in 
(	select bookId from Awards
	where awardTypeId in
	(
		select awardTypeId from AwardsMaster
	)
)


--12. Show names of author and number of books written by that Author.
select authorName, count(authorId) as 'book count'
from Author
group by authorName


--13. Show names of authors whose books are published before year 2000.
select a.AuthorName,b.bookName, b.publishedDate from Author a join book b
on a.authorId = b.authorId
where b.publishedDate < cast('1-1-2000' as date)


--14. Show name of books which has published within 1 year after 15 August 2020.
select * from Book 
where publishedDate between '2005-1-1' and '2010-1-1'


--15. Delete all authors whose no book is published in year beetween 1900 to 2020.
delete from Author where authorId in
(
	select authorId from Book
	where (YEAR(cast(publishedDate as date)))
	not between 	 
		(YEAR(cast('1900' as date))) and (YEAR(cast('2020' as date)))	
)
