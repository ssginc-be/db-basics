use shop5;

select m.id, m.name, b.no, b.title, b.content
from member m
inner join bbs b
on m.id = b.writer
where b.no > 105
order by b.title desc;

#### outerjoin(외부조인, 아우터조인)
select b.*, m.name
from bbs b
left join member m
on b.writer = m.id;

select b.no, m.*
from bbs b
right join member m
on b.writer = m.id;

insert into member values ('melon', '1234', 'melon', '8888');
insert into member values ('pen', '1234', 'melon', '8888');
select * from member;
select count(*) from member;

select m.*, b.no, b.title
from member m -- left join 할 것이므로 왼쪽 테이블인 member 선택
left join bbs b -- 오른쪽 테이블인 bbs 붙이기
on m.id = b.writer;