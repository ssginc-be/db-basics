-- Q1
create database shop4;
use shop4;

-- member 테이블 생성
create table member (
	id varchar(100) primary key not null,
    pw varchar(100) not null,
    name varchar(100) not null,
    tel varchar(100)
);

-- bbs 생성 이전에 member row 2개 넣기
insert into member values('001', 'mypswd', '큐리', '010-1234-5678');
insert into member values('777', 'asdfasdf', '관리자', '010-7777-7777');
select * from member;

-- bbs 테이블 생성
create table bbs (
	no int primary key not null auto_increment,
    title varchar(100),
    content varchar(100),
    writer varchar(100) not null
);

-- reply 생성 이전에 bbs row 2개 넣기
insert into bbs values(null, '공지사항', '안녕하세요 관리자입니다 이상한 글 쓰시면 썰겠습니다', '777');
insert into bbs values(null, '가입입사 드려용', '뉴비 받아라 이 고인물들아!!', '001');
select * from bbs;

alter table bbs
add foreign key(writer) references member(id);

-- reply 테이블 생성
create table reply (
	id varchar(100) primary key not null,
    oriid int not null,
    content varchar(100),
    writer varchar(100)
);

-- reply row 2개 넣기
insert into reply values('c-01', 1, '관리자님 무서워요', '001');
insert into reply values('c-02', 2, '반갑습니다~', '777');

alter table reply
add foreign key(oriid) references bbs(no);

alter table reply
add foreign key(writer) references member(id);

select * from reply;

-- Q2
-- Database - Reverse Engineer 에서 ERD 생성하기

-- Q3
-- 2.
alter table member modify tel varchar(50);
desc member;

-- 3.
alter table bbs drop title;
desc bbs;

-- 4.
alter table bbs
add passwd varchar(100) not null;
desc bbs;

-- 5.
desc member;

-- 6.
show tables;

-- 7.
show databases;

-- 8.
drop table reply;
drop table bbs;
drop table member;
show tables;