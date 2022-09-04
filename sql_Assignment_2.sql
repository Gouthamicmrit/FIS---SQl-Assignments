create database secondassignment
use secondassignment

create table DEPT(
deptno int primary key,
dname varchar(30),
loc varchar(30))

insert into DEPT values(10,'ACCOUNTING','NEW YORK')
insert into DEPT values(20,'RESEARCH','DALLAS')
insert into DEPT values(30,'SALES','CHICAGO')
insert into DEPT values(40,'OPERATIONS','BOSTON')
select * from DEPT

create table EMP(
empno int primary key,
ename varchar(30),
job varchar(50),
mgr_id int,
hiredate date,
sal float,
comm int,
deptno int foreign key references DEPT(deptno))

insert into EMP values(7369,'SMITH','CLERK',7902,'17-DEC-80',800,NULL,20)
insert into EMP values(7499,'ALLEN','SALESMAN',7698,'20-FEB-81',1600,300,30)
insert into EMP values(7521,'WARD','SALESMAN',7698,'22-FEB-81',1250,500,30)
insert into EMP values(7566,'JONES','MANAGER',7839,'02-APR-81',2975,NULL,20)
insert into EMP values(7654,'MARTIN','SALESMAN',7698,'28-SEP-81',1250,1400,30)
insert into EMP values(7698,'BLAKE','MANAGER',7839,'01-MAY-81',2850,NULL,30)
insert into EMP values(7782,'CLARK','MANAGER',7839,'09-JUN-81',2450,NULL,10)
insert into EMP values(7788,'SCOTT','ANALYST',7566,'19-APR-87',3000,NULL,20)
insert into EMP values(7839,'KING','PRESIDENT',NULL,'17-NOV-81',5000,NULL,10)
insert into EMP values(7844,'TURNER','SALESMAN',7698,'08-SEP-81',1500,0,30)
insert into EMP values(7876,'ADAMS','CLERK',7788,'23-MAY-87',1100,NULL,20)
insert into EMP values(7900,'JAMES','CLERK',7698,'03-DEC-81',950,NULL,30)
insert into EMP values(7902,'FORD','ANALYST',7566,'03-DEC-81',3000,NULL,20)
insert into EMP values(7932,'MILLER','CLERK',7782,'23-JAN-82',1300,NULL,10)

select * from Emp
--self join
--list all employee name along with thr manager
select e1.ename as 'employee name ',m1.ename as 'manager name'
from emp e1 inner join emp m1 on e1.mgr_id=m1.empno

--outter join


--find all managers who have more than 2 employees
--1.with mgr id
select mgr_id ,count(empno) from emp group by mgr_id
having count(empno)>2

--2.with name
select mgr.ename 'manager name',count (e.empno) 'no of employees'
from emp e left join emp mgr on e.mgr_id=mgr.empno
where mgr.ename is not null
group by e.mgr_id,mgr.ename
having count(e.empno)>2

select * from emp

--subquerry
select ename,job,sal from emp where job=(select job from emp where ename='james') and 
sal>(select sal from emp where empno=7369)

--nested subquerry
select ename,job,sal from emp where job=(select job from emp where ename='james') and 
sal>(select sal from emp where empno=(select empno from emp where ename='smith')

select deptno,min(sal) from emp group by deptno
having min(sal)>(select min(sal) from emp where deptno=20)
order by deptno desc

select * from emp

--all emp id,name,sal,job where sal is less than of a manager and bt wmployee not should be slaes man
select ename,sal,job from emp where sal <(select min(sal) from emp where job='manager')

select ename,sal,job from emp 
where sal <any (select sal from emp where job='manager')
and job <> 'manager'


--set 1 Assignment

select * from emp where ename like 'A%' --1

select * from emp where mgr_id is   null   --2

select ename,empno,sal  from emp where sal between 1200 and 1400 --3

select * from emp
update emp set sal=sal+(sal*10/100) where deptno=20 --4

select count(job)as Total_no_clerks from emp where job='clerk' --5

select avg(sal) as average_salary,count(job) no_of_ppl_working from emp where job='clerk' --6 

select min(sal) as lowest_salary ,max(sal) as highest_salary from emp --7

select * from dept where deptno not in( select deptno from emp) --8

select ename,sal from emp where job='analyst' and sal > 1200 and deptno=20 order by ename asc --9

select deptno,count(deptno) as [no of employees], sum(sal)  from emp   group by deptno--10

select ename,sal from emp where ename in ('miller','smith') --11

select ename from emp where ename LIKE 'A%' OR  ename like 'M%'  --12

select sum(12*sal) as [smith yearly salary] from emp where ename='smith' --13

select ename,sal  from emp where sal not  between 1200 and 1400 --14














