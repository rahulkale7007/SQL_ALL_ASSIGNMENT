create table Customer_tbl
(C_id int primary key,
C_Name varchar(50),
C_Address varchar(max),
City Varchar (50)
);

select * from Customer_tbl;

insert into Customer_tbl values(1,'Jitesh','Lativada No: 8','Nashik');
insert into Customer_tbl values(2,'Ram','Lativada No: 2','Nagar');
insert into Customer_tbl values(3,'Avi','Lativada No: 5','Pune');
insert into Customer_tbl values(4,'Ajay','Lativada No: 7','Mumbai');
insert into Customer_tbl values(5,'Sham','Lativada No: 7','Hyderabad');


create table [order]
(
Ord_Id int primary key,
Item varchar (50),
Quantity int,
Price_Of_1 int,
C_id int foreign key references Customer_tbl(C_id)
on delete cascade
on update cascade
);

insert into [order] values(111,'Hardisk',2,500,3);
insert into [order] values(222,'Ram',1,300,1);
insert into [order] values(333,'Keyboard',3,400,4);
insert into [order] values(444,'Mouse',2,300,2);
insert into [order] values(555,'Speaker',1,3000,2);
insert into [order] values(666,'USB',2,1000,5);
insert into [order] values(777,'USB',1,1000,5);

delete from [order] where Ord_id=777;

 select * from Customer_tbl;
 select * from [order];

 drop table Customer_tbl;
 drop table[order];

 
 alter table [order] add foreign key (C_id) references Customer_tbl(C_id);