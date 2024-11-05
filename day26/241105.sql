create database school;
use school;

-- 마법사 이용해서 csv 파일 불러온 후
show tables;
select * from emp; # 인스턴스 출력

-- 왜 마법사에 datetime만 있냐
alter table emp modify hiredate date;

--
CREATE TABLE bonus(
ENAME VARCHAR(10),
JOB VARCHAR(9),
SAL int(11),
COMM int(11)
);

ALTER TABLE DEPT ADD (
CONSTRAINT PK_DEPT
PRIMARY KEY
(DEPTNO)); 

ALTER TABLE EMP ADD (
CONSTRAINT PK_EMP
PRIMARY KEY
(EMPNO));

ALTER TABLE EMP ADD (
CONSTRAINT FK_DEPTNO
FOREIGN KEY (DEPTNO)
REFERENCES DEPT (DEPTNO));

## 서브쿼리를 이용한 테이블 복사
create table dept2 as select * from dept;
desc dept2; # 스키마 출력

--
CREATE TABLE example1 (
id INT AUTO_INCREMENT,
name VARCHAR(50),
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (id)
);

desc example1;

-- 명시적
INSERT INTO example1 (name, created_at, updated_at)
VALUES ('John Doe', '2022-07-01 12:34:56', '2022-07-01 12:34:56');

-- 디폴트값 사용
INSERT INTO example1 (name) VALUES ('Jane Smith');

-- now() 테스트
insert into example1(created_at) values (now());

select * from example1;