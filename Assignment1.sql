create table Customers( customerId int, customerName varchar(60) NOT NULL , city varchar(600),
country varchar(50) ,PostalCode int, PId int, P_Price int)

insert into Customers values(1,'Etho','Sydney','Australia',121116,101,250000)
insert into Customers values(3,'Amla','Nova ','	Bahrain',121117,102,350000)
insert into Customers values(5,' Mico','Scotia','Bagaladesh',121114,103,450000)
insert into Customers values(7,'Lucia','Corner Brook','Brazil',121115,104,550000)
insert into Customers values(8,'Cory','Berlin','Canada',121110,105,650000)
insert into Customers values(9,'Eva','Moncton','Cuba',121118,106,750000)
insert into Customers values(12,'Scott','London','Dominica',121110,107,850000)
insert into Customers values(14,'Eno','Alberta','Georgia',123119,108,950000)
insert into Customers values(16,'Lee','Manitoba','Iceland',121120,109,1050000)
insert into Customers values(18,'Maria','Prince Edward Island','Ireland',121110,140,5750000)
insert into Customers values(20,'Minti','Prince Edward Island','Maldives',121210,141,5450000)

select * from Customers

--1.1.	Write a statement that will select the City column from the Customers table
		select distinct country from Customers 

--2.2. Select all the different values from the Country column in the Customers table.
		select distinct city from Customers

--3.3.  Select all records where the City column has the value "London"
		select * from Customers where country='London' 
		select * from Customers 

--4.4.	Use the NOT keyword to select all records where City is NOT "Berlin"..
		select * from Customers where not country='Berlin' 

--5.5  Select all records where the CustomerID column has the value 23.
		select * from Customers where customerId=23

--6.6  Select all records where the City column has the value 'Berlin' and the PostalCode column has the value 121110.
		select * from Customers where city='Berlin'
		select * from Customers
		
--7.7  Select all records where the City column has the value 'Berlin' or 'London'
		select * from Customers where city in('Berlin' ,'London')

--8.8 Select all records from the Customers table, sort the result alphabetically by the column City.
		select * from Customers order by city

--9.9 Select all records from the Customers table, sort the result reversed alphabetically by the column City.
		select * from Customers order by city desc

--10.10 Select all records from the Customers table, sort the result alphabetically,
--------first by the column Country, then, by the column City
		select* from Customers order by country

--11.11	Select all records from the Customers where the PostalCode column is empty.
		update Customers set PostalCode=null where customerId=26;

--12.12 Select all records from the Customers where the PostalCode column is NOT empty.
		select* from Customers where PostalCode is not null

--13.13 Set the value of the City columns to 'Oslo', but only the ones where the Country column has the value "Norway".
		update Customers set city='Oslo' where city='Moncton'--'Norway'

--14.14 Delete all the records from the Customers table where the Country value is 'Norway'
		delete from Customers where country='Norway' 

--15.15 Use the MIN function to select the record with the smallest value of the Price column
		select min(P_Price) as 'Min salary' from Customers

--16.16 Use an SQL function to select the record with the highest value of the Price column.
		select max(P_Price) as 'Max salary' from Customers

--17.17 Use the correct function to return the number of records that have the Price value set to 20
		select * from Customers where P_Price=20

--18.18 Use an SQL function to calculate the average price of all products
		select AVG(P_Price) from Customers

--19.19 Use an SQL function to calculate the sum of all the Price column values in the Products table
		select sum(P_Price) from Customers

--20.20 Select all records where the value of the City column starts with the letter "a".
		select * from Customers where city like 'a%'

--21.21 Select all records where the value of the City column ends with the letter "a".
		select * from Customers where city like '%a'
		
--22.22 Select all records where the value of the City column contains the letter "a".
		select * from Customers with city  like'%a%'

--23.23 Select all records where the value of the City column starts with letter "a" and ends with the letter "b".
		select * from Customers with city  like 'a%b'

--24.24 Select all records where the value of the City column does NOT start with the letter "a".
		select * from Customers with city like 'a%'

--25.25.Select all records where the second letter of the City is an "a".
		select * from Customers with city like '_a%'

--26.26.Select all records where the first letter of the City is an "a" or a "c" or an "s"
		select * from Customers where city like 'a%' or city like'c%' or city like 's%'

--27.27.Select all records where the first letter of the City starts with anything from an "a" to an "f".
		select * from Customers where city like 'a%' or city like'f%'

--28.28.Select all records where the first letter of the City is NOT an "a" or a "c" or an "f".
		select * from Customers where city like 'a%' and city not like'c%' and city not like'f%'

--29.29	Use the IN operator to select all the records where the Country is either "Norway" or "France".
		select * from Customers where country in('norway' ,' france') 

--30.30	Use the IN operator to select all the records where Country is NOT "Norway" and NOT "France".
		select * from Customers where country not in('norway' ,' france') 

--31.31	Use the BETWEEN operator to select all the records where the value of the Price column is between 10 and 20
		select	* from Customers where P_Price between 10 and 20

--32.32	Use the BETWEEN operator to select all the records where the value of the Price column is NOT between 10 and 20.
		select	* from Customers where P_Price not between 10 and 20

--33.33	Use the BETWEEN operator to select all the records where the value of the ProductName column is alphabetically between 'Geitost' and 'Pavlova'.
		select PostalCode as 'pno' from Customers

--34.34	When displaying the Customers table, make an ALIAS of the PostalCode column, the column should be called Pno instead.
		select customerId,city,country,PostalCode As Pno,P_Price from Customers

--35.35	When displaying the Customers table, refer to the table as Consumers instead of Customers.
		select * from Customers As Consumers

--36.36	List the number of customers in each country.
		
--37.37	List the number of customers in each country, ordered by the country with the most customers first.
		select country, count(customerId) as ' total country' from Customers
		group by customerId
--38.38	Write the correct SQL statement to create a new database called testDB.
		create database testDB

--39.39	Write the correct SQL statement to delete a database named testDB
		Drop DataBase testDB

--40.40	Add a column of type DATE called Birthday in Persons table
	create table Person Drop column (BirthDay Date)
	alter table Customers add DOB date

--41.41	Delete the column Birthday from the Persons table
	alter table Person drop column Birthday
	update Customers set DOB=CAST('6/1/2023' as date) where customerId=7

