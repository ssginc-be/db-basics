create database quiz_join;
use quiz_join;

CREATE TABLE COMPANY (
	ID VARCHAR(50) PRIMARY KEY,
	NAME VARCHAR(100),
	ADDR VARCHAR(200),
	TEL VARCHAR(20)
);

CREATE TABLE PRODUCT (
	ID INT PRIMARY KEY,
	NAME VARCHAR(50),
	CONTENT VARCHAR(100),
	PRICE INT,
	COMPANY VARCHAR(50),
	IMG VARCHAR(50),
	FOREIGN KEY (COMPANY) REFERENCES COMPANY(ID)
);

INSERT INTO company (ID, NAME, ADDR, TEL) VALUES
('c100', 'good', 'seoul', '011'),
('c200', 'joa', 'busan', '012'),
('c300', 'maria', 'ulsan', '013'),
('c400', 'my', 'kwangju', '014');

INSERT INTO PRODUCT (ID, NAME, CONTENT, PRICE, COMPANY, IMG)
VALUES
(110, 'food11', 'fun food11', 11000, NULL, '11.png'),
(111, 'food12', 'fun food12', 12000, NULL, '12.png'),
(100, 'food1', 'fun food1', 1000, 'c100', '1.png'),
(101, 'food2', 'fun food2', 2000, 'c200', '2.png'),
(102, 'food3', 'fun food3', 3000, 'c300', '3.png'),
(103, 'food4', 'fun food4', 4000, 'c300', '4.png'),
(104, 'food5', 'fun food5', 5000, 'c100', '5.png'),
(105, 'food6', 'fun food6', 6000, 'c100', '6.png'),
(106, 'food7', 'fun food7', 7000, 'c200', '7.png'),
(107, 'food8', 'fun food8', 8000, 'c300', '8.png'),
(108, 'food9', 'fun food9', 9000, 'c100', '9.png'),
(109, 'food10', 'fun food10', 10000, 'c100', '10.png');

-- inner join 문제
select p.id as pid, p.name as pname, c.name as cname
from product p
inner join company c
on p.company = c.id;

-- left outer join 문제
select p.id as pid, p.name as pname, c.name as cname
from product p
left outer join company c
on p.company = c.id;

-- right outer join 문제
select p.id as pid, p.name as pname, c.name as cname
from product p
right outer join company c
on p.company = c.id;