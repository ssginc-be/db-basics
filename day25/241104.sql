create database shop4;
use shop4; -- DB선택

-- member 테이블 생성
create table member (
	id varchar(50) not null primary key,
    pw varchar(45),
    `name` varchar(45),
    tel varchar(45)
);

show tables; -- table목록 프린트
SELECT * FROM shop4.member;

insert into member values ('apple', '1234', 'park', '011');
insert into member values ('ice', '1234', null, null);
insert into member values ('melon', '1234', null, null);
insert into member values (null, '1234', null, null);

-- bbs 테이블 생성
create table bbs (
	`no` int primary key not null auto_increment,
    title varchar(45),
    content varchar(45),
    writer varchar(45)
);

-- 외래키 설정 (제약조건 명 지정은 생략)
alter table bbs
add foreign key(writer) references member(id);

select * from shop4.bbs;

-- bbs에 1, 안녕, 오늘은 월요일, apple
-- bbs에 2, 바이, null, ice
-- bbs에 3, 하하, null, banana
insert into bbs values ('1', '안녕', '오늘은 월요일',  'apple');
insert into bbs values ('2', '바이', null,  'ice');
insert into bbs values ('3', '하하', null,  'melon');

select * from bbs;
select * from member;

-- reply 테이블 생성
create table reply (
	id int primary key not null auto_increment,
    oriid int not null, -- bbs의 no
    content varchar(45),
    writer varchar(45) not null
);

-- 외래키 설정 (제약조건 명 지정은 생략)
alter table reply
add foreign key(writer) references member(id);

-- 외래키 설정 (제약조건 명 지정은 생략)
alter table reply
add foreign key(oriid) references bbs(`no`);

-- 외래키 제약조건 삭제
alter table reply
drop foreign key reply_ibfk_2;

-- 테이블 구조 확인 (select문은 테이블 '내용' 확인)
desc reply;

-- 테이블 스펙 수정
alter table reply
modify content varchar(100);

-- 컬럼 삭제
-- alter table reply
-- drop content;