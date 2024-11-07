######### 1106-NEW02-DML.pdf
-- Q1
use university;

select length(ename) from emp; -- 1
select length(ename) from emp where job = 'MANAGER'; -- 2
select ename, job from emp where comm is null; -- 3
select hiredate from emp where comm is not null; -- 4
select substr(ename, 2) from emp; -- 5
select substr(job, 1, 3) from emp; -- 6
select replace(ename, 'K', 'P') from emp; -- 7
select concat(empno, '번은 ', ename, '입니다'); -- 8
select month(hiredate) as month, year(hiredate) as year from emp; -- 9
-- 10
SELECT JOB,
    IF(JOB = 'MANAGER', 'level1',
        IF(JOB = 'SALESMAN', 'level2', 'level3')
    ) AS LEVEL_RESULT
FROM EMP;