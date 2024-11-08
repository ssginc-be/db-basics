use school;
select * from emp;

select e.empno, e.ename, e.mgr, e2.ename, e2.job
from emp e, emp e2 -- 나 자신과 join
where e.mgr = e2.empno;