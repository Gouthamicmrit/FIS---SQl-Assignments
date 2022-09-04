-- set 2

select * from emp where job='manager' --1

select ename,sal from emp where sal >1000  --2

select ename,sal from emp where ename != 'james' --3

select * from emp where ename like 'S%' --4

select * from emp where ename like '%A%' --5

select * from emp where ename like '__L%' --6

select sal=(sal/30) from emp where ename='jones' --7

select sum(sal) from emp --8

select avg(sal) as [Average annual salary] from emp --9

select ename,job,sal from emp where deptno !=30 or job!='salesman' --10

select distinct dname from dept inner join emp on emp.deptno=dept.deptno --11

select ename as employee ,sal as [monthly salary] from emp where sal >1500 and (deptno =10 or deptno =30) --12

select ename,job,sal from emp where (job ='manager' or job = 'analyst') and sal !=1000 and sal!=3000 and sal!=5000 --13

select ename,sal=sal+(sal*10/100),comm from emp  where comm>sal  --14

select * from emp where ename like '%LL%' and (deptno = 30 or mgr_id = 7782) --15

select ename,sal from emp where job='analyst' and sal > 1200 and deptno=20 order by ename asc  --16 

select  dept.dname,emp.ename from dept inner join emp on dept.deptno=emp.deptno order by dept.dname asc,emp.ename desc --17

select ename,empno ,datediff(year,hiredate,getdate()) as experience from EMP  where ename='miller'  --18
