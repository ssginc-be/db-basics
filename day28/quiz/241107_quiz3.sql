## 추가문제 Q1
use school;
desc emp;

-- 1
select e.empno, e.job, e.sal, e.comm, d.dname, d.loc
from emp e
inner join dept d
on e.deptno = d.deptno;

-- 2
select e.empno, e.job, e.sal, e2.empno, e2.job
from emp e, emp e2
where e.mgr = e2.empno;

-- 3
select d.*, e.deptno, e.empno, e.ename
from dept d
right outer join emp e
on d.deptno = e.deptno;

## 추가문제 Q3
-- 1
select * from emp, dept where emp.deptno = dept.deptno and dept.dname = 'SALES'
union
select * from emp, dept where emp.deptno = dept.deptno and dept.dname = 'RESEARCH';

-- 2
select * from emp where emp.sal >= 2000 and emp.job != 'MANAGER'
union
select * from emp where emp.sal >= 2000 and emp.job = 'MANAGER';

-- 3
select * from emp, dept where emp.deptno = dept.deptno and dept.loc = 'DALLAS'
union
select * from emp, dept where emp.deptno = dept.deptno and dept.loc = 'BOSTON';