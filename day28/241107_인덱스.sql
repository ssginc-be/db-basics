use school;
create table test(
	id int primary key,
    name varchar(100),
    index name_idx(name) -- 괄호 안은 인덱스로 지정할 컬럼명
);
desc test;

-- join 안쓰고 조회하는 방식
select e.empno, e.ename, e.job, d.dname, d.deptno
from emp e, dept  d
where e.deptno = d.deptno and empno > 7400
order by empno;

-- join으로 조회하는 방식
select e.empno, e.ename, e.job, d.dname, d.deptno
from emp e
inner join dept d -- join 쓴 시점에서 where는 다음에 놓일 수 없음
on e.deptno = d.deptno -- 조인 기준이 되는 조건은 on 다음에 작성
where empno > 7400 -- 부가적인 조건
order by empno;