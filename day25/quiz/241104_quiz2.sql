-- 추가 문제: NEW02-MySQL-1(DDL2).pdf 36페이지
create database university;
use university;

create table dept (
	deptno int primary key not null,
    dname varchar(30) not null,
    loc varchar(100)
);

insert into dept values(1, '컴퓨터공학과', 'loc가 머지');
insert into dept values(2, '시각디자인학과', '나도 몰?루');

-- student는 professor보다 외래키가 하나 더 있으므로 professor 테이블 먼저 생성
create table professor (
	id varchar(50) primary key not null,
    name varchar(30) not null,
    tel varchar(20) not null,
    deptid int not null,
    addr varchar(100),
    roomno varchar(20)
);

-- create 문에 같이 지정할 수도 있음
alter table professor
add foreign key(deptid) references dept(deptno);

create table student (
	id varchar(50) primary key not null,
    name varchar(30) not null,
    tel varchar(20) not null,
    deptid int not null,
    professorid varchar(50) not null
);

alter table student
add foreign key(deptid) references dept(deptno);

alter table student
add foreign key(professorid) references professor(id);

create table emp (
	empno int primary key not null auto_increment,
    ename varchar(30) not null,
    job varchar (30) not null,
    mgr int,
    hiredate date not null, -- datetime도 ㄱㅊ은데 날짜만 쓸거면 date도 상관은 없음
    sal int,
    comm int,
    deptno int not null
);

alter table emp
add foreign key(deptno) references dept(deptno);