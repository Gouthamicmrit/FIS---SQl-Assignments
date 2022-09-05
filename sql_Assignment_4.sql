create database assignment3
use assignment3
--1
create table books(
id int primary key,
title varchar(30),
author varchar(30),
isbn varchar(20)unique,
published_date datetime)

insert into books values(1,'My first SQL book','Mary Parker',981483029127,'2012-02-22 12:08:17')
insert into books values(2,'My second SQL book','John mayer',857300923713,'1972-07-03 09:22:45')
insert into books values(3,'My third SQL book','cary flint',523120967812,'2015-10-18 14:05:44')
select * from books

select * from books where author like'%er'  
--2
create table reviews(
id int foreign key references books(id),
bookid int,
review_name varchar(30),
content varchar(30),
rating int,
published_date datetime)

insert into reviews values(1,1,'john smith','My first review',4,'2017-12-10 05:50:11')
insert into reviews values(2,2,'john smith','My second review',5,'2017-10-13 15:05:12')
insert into reviews values(3,2,'alice walker','Another review',1,'2017-10-22 23:47:10')
select * from reviews

select books.title,books.author,reviews.review_name from books join reviews on  books.id=reviews.id

--3
select review_name from reviews group by review_name having count( review_name)>1

--4
create table forth(
id int primary key,
name varchar(30),
age int,
address varchar(30),
salary int)
insert into forth values(1,'ramesh',32,'ahmedabad',2000)
insert into forth values(2,'khilan',25,'delhi',1500)
insert into forth values(3,'kaushik',23,'kota',2000)
insert into forth values(4,'chaitali',25,'mumbai',6500)
insert into forth values(5,'hardik',27,'bhopal',8500)
insert into forth values(6,'komal',22,'Mp',4500)
insert into forth values(7,'muffy',24,'indore',10000)
select * from forth

select name from forth where address like'%o%'  
--5
create table orders(
oid int ,
Date datetime,
id int foreign key references forth(id),
amount int)

insert into orders values(102,'2009-10-08',3,3000)
insert into orders values(100,'2009-10-08',3,1500)
insert into orders values(101,'2009-11-20',2,1560)
insert into orders values(103,'2009-05-20',4,2060)

select Date,count(id) from orders group by Date 
--6
create table employee(
id int primary key,
name varchar(30),
age int,
address varchar(30),
salary int)
insert into employee values(1,'ramesh',32,'ahmedabad',2000)
insert into employee values(2,'khilan',25,'delhi',1500)
insert into employee values(3,'kaushik',23,'kota',2000)
insert into employee values(4,'chaitali',25,'mumbai',6500)
insert into  employee values(5,'hardik',27,'bhopal',8500)
insert into employee values(6,'komal',22,'Mp',null)
insert into employee  values(7,'muffy',24,'indore',null)
select * from employee

select * from employee where salary is null

--7
create table student(
registerno int,
name varchar(40),
age int,
qualification varchar(20),
mobno varchar(20),
mailid varchar(30),
location varchar(40),
gender varchar(4))

insert into student values(2,'sai',22,'BE',9900884467,'sai@gmail.com','chennai','M')
insert into student values(3,'kumar',20,'Bsc',9900884467,'kumar@gmail.com','madurai','M')
insert into student values(4,'selvi',22,'Btech',9900884467,'selvi@gmail.com','selam','f')
insert into student values(5,'nisha',25,'mE',9900884467,'nisha@gmail.com','theni','f')
insert into student values(6,'sairam',21,'Ba',9900884467,'sairam@gmail.com','madurai','f')
insert into student values(7,'tom',23,'BCA',9900884467,'tom@gmail.com','pune','M')

select count(gender),gender from student group by gender 
--8
create table coursedetails(
cid varchar(10)primary key,
cname varchar(30),
startdate date,
enddate date,
fee int)
insert into coursedetails values('DN003','DOTNET','2018-02-01','2018-02-28',15000)
insert into coursedetails values('DV004','DATAVISUALISATION','2018-03-01','2018-04-15',15000)
insert into coursedetails values('JA002','CORE JAVA','2018-01-02','2018-01-20',10000)
insert into coursedetails values('JC001','ADVANCE JAVA','2018-02-01','2018-01-12',3000)

create table coursereg
(regno int,
cid varchar(10) foreign key references coursedetails(cid),
batch varchar(10))

insert into coursereg values(2,'DN003','FN'),(3,'DV004','AN'),(4,'JA002','FN'),(2,'JA002','AN'),(5,'JC001','FN')

select cname,cid from coursedetails where startdate between '2018-01-02' and '2018-02-28' order by cid desc
--9
create table customer(
cid int,firstname varchar(30),lastname varchar(30))
insert into customer values(1,'george','washinhton'),(2,'john','adams'),(3,'thomas','jefferson'),(4,'james','madison'),
(5,'james','monroe')

create table order2(
oid int,amt int,cid int)
insert into order2 values(1,234,1),(2,78,3),(3,124,2),(4,65,3),(5,25,10),(6,14,9)

select  firstname,lastname,order2.oid,order2.cid from customer join order2 on 
order2.cid=customer.cid order by oid

--10
select reverse(name),upper(location) from student
