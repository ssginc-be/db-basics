-- NEW02-MySQL-3(DML심화2-조인).pdf
-- Q2 (지난주에 못한거)
create table dept2
as select * from dept;

create table emp2
as select * from emp;

select * from dept2;
select * from emp2;

##### 여기까지 테이블 생성 #####

-- 1. 최고 연봉을 받는 직원의 이름과 그의 부서명 찾기
select e2.ename, d2.dname
from emp2 e2, dept2 d2
where e2.deptno = d2.deptno and
	e2.sal = (
		select max(sal) from emp2
	);

-- 2. 각 부서의 평균 연봉보다 더 많은 연봉을 받는 직원들의 목록
select deptno, avg(sal)
from emp2
group by deptno;
-- 직원들의 정보 목록: 이름, 잡, 연봉 --> 조인X
--                이름, 잡, 연봉, 부서명 --> 조인O
select e2.ename, e2.sal, d2.dname
from emp2 e2
join dept2 d2
on e2.sal > (
	select avg(sal) from emp e1
    where e1.deptno = e2.deptno
);

-- 3. 부서별로 최고 연봉 목록을 구하고, 이 최고 연봉과 동일한 연봉을 받는 직원의 정보 찾기
select *
from emp2 e2
where e2.sal in ( -- 다중 행을 return 하기에 in 대신 =는 불가능
	select max(sal)
    from emp2
    group by deptno
);

-- 4. 부서 위치가 'CHICAGO'인 모든 직원들의 정보
select e2.*, d2.loc
from emp2 e2
inner join dept2 d2
on e2.deptno = d2.deptno
where d2.loc = 'CHICAGO';

-- 5. 모든 매니저(MGR) 아래에서 일하는 직원들의 목록
SELECT e1.ename as '직원이름', e2.ename as '매니저 이름'
from emp2 e2
join emp2 e1
on e2.empno = e1.mgr; -- 원본은 매니저 id가 empno에도 있는 형태여서 가능
