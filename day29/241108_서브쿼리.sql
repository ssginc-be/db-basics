use school;

create table departments
as select * from dept;

create table employees
as select * from emp;

select * from departments;
select * from employees;

select empno, ename, deptno
from employees
where deptno in (
	select deptno
    from departments
    where loc = 1800
);

-- 다중 열 서브쿼리
select empno, ename
from employees
where (deptno, job) in (
	select deptno, job
    from employees
    where empno = 7369
);

desc employees;
-- empno가 7499인 사람의 job과 mgr을 찾아서 같은 job과 mgr인 사람들 조회하기
select empno, ename, job, mgr
from employees
where (job, mgr) in ( -- 서브쿼리 먼저 작성하는 것이 직관적임
	select job, mgr
    from employees
    where empno = 7499
);

-- 다중 행 서브쿼리 (ANY) --> OR 연산
SELECT ename, sal
FROM employees
WHERE sal >= ANY (
	SELECT sal
	FROM employees
	WHERE sal >= 2750
);

-- 다중 행 서브쿼리 (ALL)
SELECT empno, ename, sal
FROM employees
WHERE sal > ALL ( -- 리스트의 모든 조건 만족하도록 (AND 연산)
	SELECT AVG(sal)
	FROM employees
	GROUP BY deptno
);

-- 상관서브 쿼리
select empno, ename
from employees
where sal > (
	select avg(sal)
    from employees
);

-- 스칼라(값) 서브쿼리 --> (★) 많이 쓰이는 형태
select empno, ename, (
	select dname
    from departments
    where deptno = e.deptno
) as deptname
from employees e;