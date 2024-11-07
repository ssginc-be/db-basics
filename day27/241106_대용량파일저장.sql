CREATE DATABASE moviedb;
 USE moviedb;
 CREATE TABLE movietbl
 (
    movie_id INT,
    movie_title VARCHAR(30),
    movie_director VARCHAR(20),
    movie_star VARCHAR(20),
    movie_script LONGTEXT,
    movie_film LONGBLOB
 ) DEFAULT CHARSET=utf8mb4;
 
 -- 불러오기: 해당 경로에 원본 파일 있어야 함
INSERT INTO movietbl VALUES ( 1, '쉰들러 리스트', '스필버그', '리암 니슨',
	LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/math.txt'), 
	LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/img1.jpg')
);
 SELECT * FROM movietbl;
 
 -- 내보내기: 텍스트
 SELECT movie_script FROM movietbl WHERE movie_id=1
 INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/math_out.txt'
 LINES TERMINATED BY '\n';
 
 -- 내보내기: 이미지
 SELECT movie_film FROM movietbl WHERE movie_id=3
 INTO DUMPFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/img1_out.jpg';
 
 
######### 로컬에 파일 두는건 예전 방식이고 최근 트렌드는 외부에 업로드 후 링크 저장 #########
 CREATE TABLE movietbl2
 (
    movie_id INT,
    movie_title VARCHAR(30),
    movie_director VARCHAR(20),
    movie_star VARCHAR(20),
    movie_script TEXT,
    movie_film TEXT
 ) DEFAULT CHARSET=utf8mb4;
 
 INSERT INTO movietbl2 VALUES ( 1, '쉰들러 리스트', '스필버그', '리암 니슨',
	'https://drive.google.com/file/d/1utHCRUzrCwelEs2GZTXMaAiJioI8-6DO/view?usp=drive_link', 
	'https://drive.google.com/file/d/1KWwP3F0cOW2DEn6ENXjzX3JBXd41zB8p/view?usp=drive_link'
);
select * from movietbl2;