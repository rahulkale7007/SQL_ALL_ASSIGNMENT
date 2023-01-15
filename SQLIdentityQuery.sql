create table Teacher
(
Tid int primary key identity(100,5),
Tname varchar(50) not null,
Tqualification varchar(50) not null,
Tsalary varchar(50) not null
);
drop table Teacher;
select * from Teacher;
insert into Teacher values('Jitesh','BE','25000');
insert into Teacher values('Komal','Masters','20000');
insert into Teacher values('Sandy','BCA','20000');
insert into Teacher values('Ganesh','BBA','25000');