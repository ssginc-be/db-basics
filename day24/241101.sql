use shop3;

create table member(
	id varchar(10), 
    pw varchar(10), 
    name varchar(10), 
    tel varchar(10)
);

insert into member values ('100', '100', 'park', '011');
insert into member values ('200', '200', 'kim', '011');
insert into member values ('300', '300', 'ahn', '011');

-- 요거는 주석 (한 칸 띄워야 인식함)

select * from member;

-- 하단은 preferences의 safe update 끄고 workbench 재시작해야 실행 가능
update member set tel = '999';

update member set tel = '888' where id = '100';

select id, pw from member where id = '100';