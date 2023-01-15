
create table Employee_Tbl
(
EmpId int unique not null,
Emp_Name varchar(50) not null,
Email varchar(50) not null,
Designation varchar(50) not null
);
drop table Employee_Tbl;

select * from Employee_Tbl;

insert into Employee_Tbl values(11,'Rahul','rk@gmail.com','Manager');
insert into Employee_Tbl values(12,'Jitesh','jitesh1@gmail.com','Assistant Manager');
insert into Employee_Tbl values(13,'Nayan','nayan@gmail.com','I-t Manager');
insert into Employee_Tbl values(14,'Ajay','ajay@gmail.com','Computer Operator');
insert into Employee_Tbl values(15,'Manthan','manthan@gmail.com','Assistant Director');

create table Department
(
Dpt_Id int unique not null,
Dpt_Name varchar(50) not null,
Dpt_Salary varchar(50) not null,
EmpId int unique not null
);

drop table Department;

select * from Employee_Tbl;
select * from Department;

insert into Department values(111,'Administration','50000',13);
insert into Department values(222,'Accounts','60000',12);
insert into Department values(333,'I-T','40000',11);
insert into Department values(444,'Academic','45000',14);

truncate table Department;

-- INNER JOIN--

select * from Employee_Tbl as A
inner join Department as B
on A.EmpId=B.EmpId;

 select A.Emp_Name,A.Designation,B.Dpt_Name,Dpt_Salary from Employee_Tbl as A
 inner join Department as B
 on A.EmpId=B.EmpId;
