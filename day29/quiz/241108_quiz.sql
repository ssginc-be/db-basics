-- 직원 테이블에서 직원의 직원이름, 직원job, 부서위치를 검색
use school;

desc departments;
desc employees;

select ename, job, (
	select loc
    from departments d
    where e.deptno = d.deptno
) as loc
from employees e;

-- select 1은 단순히 테이블에 row가 존재하는지 확인하는 용도
select 1
from employees;