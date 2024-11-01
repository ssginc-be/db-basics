-- Q1 -------------------------------------------------
create database newdb;
use newdb;
create table product(
	productName varchar(4) not null,
    cost int not null,
    makeDate date,
    company varchar(5),
    amount int not null
);

create table member2(
	memberId varchar(8) not null,
    memberName varchar(5) not null,
    memberAddress varchar(20)
);

show tables;

-- Q2 -------------------------------------------------
create user programmer1@localhost identified by '1234';
grant all privileges on *.* to programmer1@localhost;
drop user programmer1@localhost; -- 원상복구

-- Q3 -------------------------------------------------
create database quiz_shop2;
use quiz_shop2;
create table member (
	memberID varchar(45),
    memberPW varchar(45)
);

insert into member values('100', '100');
select * from member;

create database quiz_shop3;

-- cmd에서 mysqldump, mysql 명령어로 백업 및 복구 후 하단 실행
use quiz_shop3;
select * from member;