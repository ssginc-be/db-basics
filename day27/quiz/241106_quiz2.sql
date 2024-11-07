######### 1106-NEW02-DML2.pdf (심화)
CREATE TABLE Youth (
    YouthID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    BirthDate DATE NOT NULL,
    Gender ENUM('Male', 'Female', 'Other') NOT NULL,
    City VARCHAR(100) NOT NULL,
    Phone VARCHAR(15),
    Email VARCHAR(100) NOT NULL
);

CREATE TABLE Activities (
    ActivityID INT AUTO_INCREMENT PRIMARY KEY,
    ActivityName VARCHAR(100) NOT NULL,
    Description VARCHAR(255)
);

CREATE TABLE YouthActivities (
    YouthActivityID INT AUTO_INCREMENT PRIMARY KEY,
    YouthID INT NOT NULL,
    ActivityID INT NOT NULL,
    ParticipationDate DATE NOT NULL,
    FOREIGN KEY (YouthID) REFERENCES Youth(YouthID),
    FOREIGN KEY (ActivityID) REFERENCES Activities(ActivityID)
);

INSERT INTO Youth (Name, BirthDate, Gender, City, Phone, Email) VALUES
('kimchulsoo', '2003-05-21', 'Male', '서울', '010-1234-5678', 'chulsoo@example.com'),
('leeyounghi', '2004-07-30', 'Female', '부산', '010-8765-4321', 'younghi@example.com'),
('parkgimin', '2005-02-15', 'Other', '대구', '010-1357-2468', 'jimin@example.com'),
('choiyoori', '2002-10-11', 'Female', '인천', '010-2468-1357', 'yuri@example.com'),
('jangmiho', '2001-12-25', 'Male', '광주', '010-5678-1234', 'minho@example.com');

INSERT INTO Activities (ActivityName, Description) VALUES
('socker', '팀 스포츠의 하나로, 11명이 한 팀을 이루어 공을 차서 상대방의 골대에 넣는 게임'),
('music', '다양한 악기와 목소리를 사용하여 조화로운 소리를 만드는 예술 활동'),
('volunteering', '지역 사회 봉사를 통해 사회에 기여하는 활동'),
('programming', '컴퓨터 소프트웨어를 개발하는 과정'),
('art', '그림, 조각 등 시각적 예술을 통해 창의적 표현을 하는 활동');

INSERT INTO YouthActivities (YouthID, ActivityID, ParticipationDate) VALUES
(1, 1, '2024-01-20'),
(2, 2, '2024-02-15'),
(3, 3, '2024-03-10'),
(4, 4, '2024-04-05'),
(5, 5, '2024-05-01');


SELECT Name, CHAR_LENGTH(Name) AS NameLength FROM Youth;
SELECT UPPER(ActivityName) AS UppercaseActivityName FROM Activities;
SELECT Email, SUBSTRING_INDEX(Email, '@', -1) AS EmailDomain FROM Youth;
SELECT CONCAT(UPPER(LEFT(Name, 1)), SUBSTRING(Name, 2)) AS ProperName FROM Youth;
SELECT Description, LOCATE('활동', Description) AS Position FROM Activities;
SELECT YouthID, COUNT(*) AS NumberOfActivities 
FROM YouthActivities 
GROUP BY YouthID;
SELECT ActivityID, COUNT(*) AS ParticipationCount 
FROM YouthActivities 
GROUP BY ActivityID;

SELECT Name, DATEDIFF(CURDATE(), BirthDate) AS DaysSinceBirth 
FROM Youth;
SELECT MAX(ParticipationDate) AS MostRecentParticipation 
FROM YouthActivities;
SELECT 
	YEAR(ParticipationDate) AS Year, 
	MONTH(ParticipationDate) AS Month, 
	COUNT(*) AS ParticipationCount
FROM YouthActivities
GROUP BY Year, Month;

SELECT Name, 
	CASE 
		WHEN Gender = 'Male' THEN '안녕하세요,  반가워요!'
		WHEN Gender = 'Female' THEN '안녕하세요, 즐거운 월요일!'
		ELSE '안녕하세요!' 
	END AS Greeting
FROM Youth;
SELECT ActivityID, COUNT(DISTINCT YouthID) AS ParticipantCount 
FROM YouthActivities 
GROUP BY ActivityID;
SELECT ActivityID, MIN(ParticipationDate) AS FirstParticipation
FROM YouthActivities 
GROUP BY ActivityID;

delete from YouthActivities;
delete from Activities;
delete from Youth;