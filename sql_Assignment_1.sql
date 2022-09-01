create database assignment1
use assignment1

--clients table
create table clients(
Client_ID int primary key,
Cname varchar(40) not null,
Address varchar(30),
Email varchar(30),
Phone bigint,
Business varchar(20) not null)


insert into clients values(1001,'ACME Utilities','Noida','contact@aceutil.com',9071991989,'Manufacturing')
insert into clients values(1002,'Trackon Consultants','Mumbai','consult@trackon.com',8734210090,'Consultant')
insert into clients values(1003,'MoneySaver Distributors','Kolkata','save@moneysaver.com',7799886655,'Reseller')
insert into clients values(1004,'Lawful Corp','Chennai','justice@lawful.com',9210342219,'Professional')
select * from clients

--department table
create table Departments(
Deptno int primary key,
Dname varchar(15)not null,
Location varchar(20))

insert into Departments values(10,'Design','Pune')
insert into Departments values(20,'Development','Pune')
insert into Departments values(30,'Testing','Mumbai')
insert into Departments values(40,'Document','Mumbai')
select * from Departments

create table Employees(
Empno int primary key,
Ename varchar(20)not null,
job varchar(15),
salary float check(salary>0),
Deptno int foreign key references Departments(Deptno))

--employees table
insert into Employees values(7001,'sandeep','analyst',25000,10)
insert into Employees values(7002,'rajesh','designer',30000,10)
insert into Employees values(7003,'madhav','developer',40000,20)
insert into Employees values(7004,'manoj','developer',40000,20)
insert into Employees values(7005,'abhay','designer',35000,10)
insert into Employees values(7006,'uma','tester',30000,30)
insert into Employees values(7007,'gita','tech.writer',30000,40)
insert into Employees values(7008,'priya','tester',30000,30)
insert into Employees values(7009,'nutun','developer',45000,20)
insert into Employees values(7010,'smita','analyst',20000,10)
insert into Employees values(7011,'anand','project mgr',65000,10)
select * from Employees

--projects table
create table projects(
project_Id int primary key,
descr varchar(30) not null,
start_date date,
planned_end_date date,
actual_end_date date ,
budget bigint check(budget>0),
Client_ID int foreign key references clients(Client_ID))

insert into projects values(401,'inventory','01-Apr-11','01-OCT-11','31-OCT-11',150000,1001)
insert into projects(project_Id,descr,start_date,planned_end_date,budget,Client_ID) values(402,'accounting','01-Aug-11','01-Jan-12',500000,1002)
insert into projects(project_Id,descr,start_date,planned_end_date,budget,Client_ID) values(403,'payroll','01-Oct-11','31-Dec-11',75000,1003)
insert into projects(project_Id,descr,start_date,planned_end_date,budget,Client_ID) values(404,'contact mgmt','01-Nov-11','31-Dec-11',50000,1004)

select * from projects

--EmpProjectTasks table
create table EmpProjectTasks(
project_Id int foreign key references projects(project_Id),
Empno int foreign key references Employees(Empno),
start_date date,
end_date date,
task varchar(30)not null,
status varchar(15)not null,
primary key(project_Id,Empno))

insert into EmpProjectTasks values(401,7001,'01-Apr-11','20-Apr-11','system analysis','completed')
insert into EmpProjectTasks values(401,7002,'21-Apr-11','30-May-11','system design','completed')
insert into EmpProjectTasks values(401,7003,'01-Jun-11','15-Jul-11','coding','completed')
insert into EmpProjectTasks values(401,7004,'18-Jul-11','01-Sep-11','coding','completed')
insert into EmpProjectTasks values(401,7006,'03-Sep-11','15-Sep-11','testing','completed')
insert into EmpProjectTasks values(401,7009,'18-Sep-11','05-Oct-11','code changing','completed')
insert into EmpProjectTasks values(401,7008,'06-Oct-11','16-Oct-11','testing','completed')
insert into EmpProjectTasks values(401,7007,'06-Oct-11','22-Oct-11','documentation','completed')
insert into EmpProjectTasks values(401,7011,'22-Oct-11','31-Oct-11','sign off','completed')
insert into EmpProjectTasks values(401,7010,'01-Aug-11','20-Aug-11','system analysis','completed')
insert into EmpProjectTasks values(401,7002,'22-Aug-11','30-Sep-11','system design','completed')

insert into EmpProjectTasks(project_Id,Empno,start_date,task,status) values(402,7004,'01-Oct-11','coding','completed')
select * from EmpProjectTasks

