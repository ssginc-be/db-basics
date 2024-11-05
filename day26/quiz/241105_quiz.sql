-- Q2
create database shop6;
use shop6;

create table productOrder(
	id varchar(100) primary key,
    title varchar(100) not null,
    price int,
    buydate timestamp default current_timestamp,
    addr varchar(200) default 'home' not null
);

-- Q3
insert into productOrder(id, title, price, buydate, addr)
values(100, 'hat', 1000, now(), 'office');

insert into productOrder(id, title, price, buydate)
values(200, 'mouse', 2000, now());

insert into productOrder(id, title, buydate)
values(300, 'pen', now());

select * from productOrder;