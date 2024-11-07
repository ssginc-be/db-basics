use university;
select * from emp;
select lower(ename) from emp;
select length(ename) from emp;

-- length는 글자수가 아닌 바이트수 반환
select length('abc'), length('가나다');

select substr(ename, 2) from emp;
-- SQL에선 인덱스가 1부터 시작
select substr(ename, 1, 2) from emp; -- 1번째부터 2개
select substr(ename, -2, 2) from emp; -- 음수 인덱스도 지원함

select concat('번호는 ', empno, ' 이름은 ', ename) as 문자열결합 from emp; -- 다 붙여서 검색
select trim(' hong '); -- 공백제거
select trim('W' from 'WILL') as w제거;

#### 숫자/날짜/자료형 변환 함수 ####
select round(1234.567, 1); -- 소숫점 1번째까지 반올림하세요.
select round(1234.567, 0); -- 정수 1의자리까지 반올림하세요.
select round(1234.567, -1); -- 정수 2의자리까지 반올림하세요.
select truncate(1234.567, 1); -- 소숫점 1의자리까지 남기고 잘라라.

select adddate('2024-09-23', interval 6 month); -- 6개월 이후 날짜
select timestampdiff(DAY, '2024-09-23', now()); -- 일 차이
select date_format(now(), '%Y년%m월%d일 %H시%i분%S초') as 결과; -- 날짜 출력 포맷 설정

SELECT EMPNO, ENAME, JOB, SAL,
    IF(JOB = 'MANAGER', SAL * 1.1,
        IF(JOB = 'SALESMAN', SAL * 1.05,
            IF(JOB = 'ANALYST', SAL, SAL * 1.03)
        )
    ) AS U_SAL
FROM EMP;

SELECT job, count(SAL), sum(SAL), round(AVG(sal)), 
       MIN(SAL), MAX(SAL)
FROM EMP
where job in ('MANAGER', 'CLERK', 'SALESMAN')
GROUP BY job
HAVING job in ('MANAGER','CLERK')
ORDER BY JOB DESC;