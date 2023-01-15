create database Test2
use Test2

create table Student 
(	
	rollno int, 
	name varchar(50),
	degree varchar(50),
	birthdate date,
	courseId int,
	batchId int,
	feesPaid int,
	remark varchar(50),
	isPlaced varchar(10)
)
insert into Student values
	(1, 'nayan', 'BTech', cast('11-21-1998' as date), 101, 201, 75000, 'regular', 'no'),
	(2, 'Aditya', 'BE', cast('3-8-2003' as date), 102, 202, 55000, 'regular', 'no'),
	(3, 'Nomita', 'BA', cast('12-24-2000' as date), 103, 203, 60000, 'regular', 'yes'),
	(4, 'Rina', 'BSc', cast('1-26-1997' as date), 104, 204, 70000, 'regular', 'yes'),
	(5, 'Dipesh', 'BE', cast('7-17-1998' as date), 105, 205, 35000, 'distance', 'no'),
	(6, 'mukul', 'BTech', cast('10-16-1999' as date), 106, 206, 80000, 'regular', 'yes'),
	(7, 'lata', 'BTech', cast('1-3-2001' as date), 101, 201, 90000, 'regular', 'yes')
select * from Student


create table Course 
(	
	courseId int, 
	courseName varchar(50),
	duration int,
	trainerId int,
	totalFees int,
)
insert into Course values
	(101, 'CSE', 32, 301, 135000),
	(102, 'Mech', 32, 302, 110000),
	(103, 'Economics', 24, 303, 100000),
	(104, 'Agriculture',24, 304, 90000),
	(105, 'Civil', 32, 305, 110000),
	(106, 'E&Tc', 32, 306, 135000),
	(101, 'CSE', 32, 301, 135000)
select * from Course

insert into Course
values

create table Trainer 
(	
	TrainerId int, 
	TrainerName varchar(50),
	joinDate date,
	email varchar(50),
	experienceInYears int,
)
insert into Trainer values
	(301, 'Shreyas', cast('10-1-2014' as date), 'temp1@gmail.com',4),
	(302, 'Rupak', cast('5-20-2016' as date), 'temp2@gmail.com',2),
	(303, 'Yashi', cast('11-1-2014' as date), 'temp3@gmail.com',5),
	(304, 'Vaidehi', cast('4-15-2012' as date), 'temp4@gmail.com',9),
	(305, 'Salil', cast('12-1-2019' as date), 'temp5@gmail.com',8),
	(306, 'shreya', cast('8-1-2015' as date), 'temp6@gmail.com',6)
select *from Trainer

------------------------------------------------------------------------



--1. Show list of students. List contains roll no , student name , course name , trainer name in order of course name and student name

SELECT s.rollno, s.name, c.courseName, t.TrainerName
from
student s join course c on s.courseId = c.courseId
		join trainer t on c.trainerId = t.TrainerId
ORDER by c.courseName, s.name


--2. Show list of students who have pending fees more than 50000rs . List should have student name , course name , balance fees . Show this list in descending order of balance fees. 

SELECT s.name, c.courseName, (c.totalFees - s.feesPaid) as 'Balance Fees' FROM
Student s join course c 
on
s.courseId=c.courseId
where (c.totalFees - s.feesPaid)>50000
ORDER by [Balance Fees] DESC



--3. Append letter ‘_spl’ to all batch ids of trainer ‘Deepa’.
UPDATE Student set batchid = concat(batchId, ' _spl')
WHERE courseId = 
(
	SELECT CourseId from Course
	WHERE trainerid =
	(
		SELECT TrainerId from Trainer
		where
		TrainerName='Yashi'
	)
)



--4.Update table student. Update ‘remark’ field. Remark should be ‘Eligible for exam’ if fees paid by student is more than 60%.

UPDATE student set remark='Field'
from student s join Course c
on s.courseid = c.courseid
WHERE ((s.feesPaid*100)/(c.totalFees))>60


--check % for own
select s.feesPaid, c.totalFees,((s.feesPaid*100)/
(c.totalFees)) as '%'
from student s
join Course c
on s.courseid = c.courseid



--5.Create a index to make retrieval faster based on course name.


--6. List name of course for which more than 2 students are enrolled.

SELECT c.CourseName from course c join Student s
	on c.courseId = s.Courseid
	GROUP by c.courseName
	having COUNT(s.courseId)>=2
	

--or

SELECT CourseName from course 
GROUP by courseName
having COUNT(courseId)>=2


--7. List name of course for which maximum revenue was generated.( max fee collection)

		select totalFees,courseId,count(CourseId) as 'enrolled students',(totalFees*count(CourseId))as 'revenue' from Course
		group by courseName, courseId,totalFees
		order by [revenue]desc
	

--8. Select name of student who are in same batch as ‘lata’.
select name from Student
where batchId = 
(
	select batchId from Student
	where name='lata'
)


--9. Delete all students who are in course which is less than 2 months duration.
delete from Student 
where courseId in
(
	select courseId from Course
	where duration<=2
)

--10. Delete all students for whom is placed is ‘yes’ and who have paid all the fees of their course.
delete from Student where isPlaced='yes'and remark='feild'


--11. Create a trigger to add student data in ex-student table if student is deleted from student table.

--12. Create a view which shows name of trainer and number of students he is training.
create view V1 
as
	select t.TrainerName, COUNT(c.courseId) as 'count'
	from Trainer t join Course c
	on t.TrainerId=c.trainerId
	group by TrainerName

select * from v1


--13. Show names of students who are more than 20 years old.
select name from Student
where Year(CAST(GETDATE() as date)) - Year(cast(birthdate as date)) > 20


----14. Show names of students who have paid all the fees.
	select s.feesPaid,c.totalFees, ((s.feesPaid*100)/(c.totalFees)) as '%' from student s join Course c
	on s.courseid = c.courseid
	WHERE ((s.feesPaid*100)/(c.totalFees))>50


--15. Write a procedure which accepts student id and returns his balance fees. 
create function GetFeeById(@id int)
returns int
as begin
    return 
	(
		select (c.totalfees-s.feesPaid)
		from Student s join Course c 
		on s.courseid = c.courseid
		where s.rollno=@id
	)
end

select dbo.GetFeeById(3) as 'Remaning fee'




--Student - rollno , sname , degree , birthdate , course id , batch id , fees paid , Remark, is placed
--Course - course id , course name, duration (in months), trainer id , total fees
--Trainer - Trainer id , trainer name , join date , email , experience in years
SELECT * from Student		SELECT *from course			SELECT *from trainer

