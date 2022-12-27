create table Employee(
empid int,
empname varchar(50),
emptype varchar(50),
empsalary decimal)

select*from Employee;

insert into Employee values(1,'Rahul','Account',75000);
insert into Employee values(2,'Jitesh','Finance',80000);
insert into Employee values(3,'Sam','Admin',55000);

delete from Employee where empid=3;
--truncate table employee;

update Employee set empsalary=50000 where empid=2;
update Employee set empname='Rahul Kale' where empid=1;
update Employee set emptype='Account' where empid=3;
