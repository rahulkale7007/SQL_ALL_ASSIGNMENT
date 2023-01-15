create table HockeyParticipants
(
id int primary key,
name varchar(50) not null,
email varchar(50) not null
);
drop table HockeyParticipants;
select* from HockeyParticipants;

insert into HockeyParticipants values(1,'rahul kale','rk@gmail.com');
insert into HockeyParticipants values(2,'dinesh kartik','dk@gmail.com');
insert into HockeyParticipants values(3,'rohit sharma','rs@gmail.com');
insert into HockeyParticipants values(4,'Cristiano Ronaldo','cr7@gmail.com');

create table FootballParticipants
(
id int primary key,
name varchar(50) not null,
email varchar(50) not null
);
drop table FootballParticipants;

select* from FootballParticipants;
insert into FootballParticipants values(1,'Lionel Messi','lm@gmail.com');
insert into FootballParticipants values(2,'Robert Lewandowski','rl@gmail.com');
insert into FootballParticipants values(3,'Kylian Mbappe','kmbapee@gmail.com');
insert into FootballParticipants values(4,'Cristiano Ronaldo','cr7@gmail.com');

select* from HockeyParticipants
union all
select* from FootballParticipants;

select* from HockeyParticipants
union
select* from FootballParticipants;

select* from HockeyParticipants
intersect
select* from FootballParticipants;

select* from HockeyParticipants
except
select* from FootballParticipants;

select* from FootballParticipants
except
select* from HockeyParticipants;

select* from HockeyParticipants
intersect
select* from FootballParticipants;

select* from HockeyParticipants
union union all except intersects
select* from FootballParticipants;