use school;

desc employees;
desc departments;

-- 1. 단일행 서브쿼리 --> ACCOUNTING부서의 deptno를 조회해서
--    해당부서의 직원이름과 급여를 검색
--    (단일 행 서브쿼리)

-- 2. loc가 1800인 부서no를 검색해서 
--    해당 부서에 속한 직원들의 이름과 부서no를 검색
--    (다중 행 서브쿼리)
SELECT ename, deptno
FROM employees
WHERE deptno IN (
	SELECT deptno
	FROM departments
	WHERE loc = 1800
);

-- 3. 특정 직원(empno=7499)의 deptno와 job가 같은 
--    다른 직원들의 ID와 이름을 조회하세요.
--    (다중 열 서브쿼리)
SELECT empno, ename
FROM employees
WHERE (deptno, job) IN (
	SELECT deptno, job
	FROM employees
	WHERE empno = 7499
);

-- 4. 부서에서 deptno가 10이 있으면 
--    직원테이블에서 empno와 결과라는 컬럼을 만들어 "있음"으로 출력
select empno, "있음" as "결과" from employees
where exists (select 1 from departments where deptno = 10);