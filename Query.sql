
---------------------30
 
 select * from questions;
 select * from subjects

 select * from Lesson_Has_Question

 select * from Quizs
 select * from Quiz_Has_Question
 select * from questions





















-----------------------16

select * from lessons
select * from subjects
select * from Quizs;
select * from users;
select * from questions;
select * from answers;
select * from Practice_Question

CREATE TABLE Student_Take_Quiz (
    Id INT PRIMARY KEY IDENTITY(1,1),
    QuizId INT FOREIGN KEY REFERENCES Quizs(Id),
    UserId INT FOREIGN KEY REFERENCES users(Id),
    Status NVARCHAR(10) CHECK (Status IN ('done', 'pending')),
    NumberCorrect INT
);
drop table Student_Take_Quiz

select * from subject_has_lesson
select * from Student_Take_Quiz
select * from Quizs;
select * from Quiz_Has_Question
select * from lessons;
select * from users;
insert into Student_Take_Quiz values(22,27,'done',1);
	insert into Student_Take_Quiz values(16,27,'done',1);

	update Quiz_Has_Question set QuestionId = 4 where id = 9

CREATE TABLE Student_Quiz_Question (
    Id INT PRIMARY KEY IDENTITY(1,1),
    StudentQuizId INT FOREIGN KEY REFERENCES Student_Take_Quiz(Id),
    QuestionId INT FOREIGN KEY REFERENCES questions(id),
    YourAnswer INT FOREIGN KEY REFERENCES answers(id),
	IsMarked INT
);
drop table Student_Quiz_Question

select * from Student_Quiz_Question;
insert into Student_Quiz_Question values(1, 22, 1018, 1);

insert into Student_Quiz_Question values(2, 10, 1018, 1);
insert into Student_Quiz_Question values(2, 11, 1018, 1);
update Student_Quiz_Question set QuestionId = 23 where Id = 3;
update Student_Quiz_Question set QuestionId = 3 , YourAnswer = 1003 where Id = 4;
update Student_Quiz_Question set QuestionId = 4 , YourAnswer = 1007 where Id = 5;

select * from questions;
select * from question_has_answer;
select * from answers

update question_has_answer set  question_id =  where answer_id = 1018 



update answers set is_correct = 0 where id = 1019










-------------------------34
--add
-- Thêm các cột mới vào bảng Quizs
ALTER TABLE Quizs
ADD SubjectId INT,
    LessonId INT,
    DeleteFlag INT;


ALTER TABLE Quizs
ADD CONSTRAINT FK_Quizs_Subjects
FOREIGN KEY (SubjectId)
REFERENCES Subjects(Id);

-- Đặt khóa ngoại cho LessonId
ALTER TABLE Quizs
ADD CONSTRAINT FK_Quizs_Lessons
FOREIGN KEY (LessonId)
REFERENCES Lessons(Id);

update lessons set Type= 'quiz' where id = 2007;


-- Thêm cột QuizId vào bảng Lessons
ALTER TABLE lessons
ADD QuizId INT;
-- Đặt khóa ngoại cho QuizId liên kết với bảng Quizs
ALTER TABLE Lessons
ADD CONSTRAINT FK_Lessons_Quizs
FOREIGN KEY (QuizId)
REFERENCES Quizs(Id);




--
select * from Quizs
insert into Quizs values('Quiz dau ki', 'Medium', 5, 30, null,GETDATE(),1028,null,null,2,2007,1);

select * from lessons;
update lessons set QuizId = 1 where id = 2007;

select * from questions
insert into questions values('3+3 bang may','1 ban tay', 1 ,null);

select * from answers;
insert into answers values('bang 1',GETDATE(),null,1028,0);
select * from question_has_answer;
insert into question_has_answer values(5,1010);
insert into answers values('bang 6',GETDATE(),null,1028,1);
insert into question_has_answer values(5,1011);
insert into answers values('bang 3',GETDATE(),null,1028,0);
insert into question_has_answer values(5,1012);
insert into answers values('bang 0',GETDATE(),null,1028,0);
insert into question_has_answer values(5,1013);

insert into Quiz_Has_Question values(1,5)


select * from Quizs;
select * from users;
select * from subjects;
select * from subject_has_lesson;
select * from lessons;
select * from questions;
select * from Quiz_Has_Question;
select * from answers;
select * from question_has_answer;
select * from Lesson_Has_Question;
--truong hop search question
select * from questions;
--cho question moi vao thi phai them vao suject, lesson tuong ung
--lay tat ca question theo lessonId
select * from questions where id in (select QuestionId from Lesson_Has_Question where LessonId = 1)
--sau khi chon lay quesion id cho vao quizhas question
insert into Quiz_Has_Question values(14,5)

--xoa question khoi quiz
delete from Quiz_Has_Question where QuizId = 1 and QuestionId = 5

--lay subject theo userId 
select id, name from subjects where creator_id = 1028;

--lay lesson theo subject va chi lay lesson la quiz
select * from lessons;
select * from subject_has_lesson;

select id, name from lessons where id in (select lesson_id from subject_has_lesson where subject_id = 2)
and Type = 'quiz';  

select * from questions where id in (select QuestionId from Quiz_Has_Question where QuizId = 7)









-------------17,18
select * from answers;
insert into answers values('Gà.....',GETDATE(),null, 1028,0);
insert into answers values('Chó.....',GETDATE(),null, 1028,1);
insert into answers values('Mèo.....',GETDATE(),null, 1028,0);
insert into answers values('Lợn.....',GETDATE(),null, 1028,0);

insert into answers values('Paris.....',GETDATE(),null, 1028,0);
insert into answers values('London.....',GETDATE(),null, 1028,1);
insert into answers values('Beclin.....',GETDATE(),null, 1028,0);
insert into answers values('Bangkok.....',GETDATE(),null, 1028,0);


insert into answers values('1.....',GETDATE(),null, 1028,0);
insert into answers values('2.....',GETDATE(),null, 1028,1);
insert into answers values('3.....',GETDATE(),null, 1028,0);
insert into answers values('9.....',GETDATE(),null, 1028,0);

select * from users;
select * from questions;
insert into questions values('Con gi keu gau gau','4 chan', 1, null);
insert into questions values('Thu do cua phap la gi','Mbape', 1, null);
insert into questions values('1+2 bang may','bo cua ban', 1, null);
select * from question_has_answer;
insert into question_has_answer values(1,1)
go
insert into question_has_answer values(1,2)
go
insert into question_has_answer values(1,3)
go
insert into question_has_answer values(1,4)

insert into question_has_answer values(3,1002)
go
insert into question_has_answer values(3,1003)
go
insert into question_has_answer values(3,1004)
go
insert into question_has_answer values(3,1005)
go
insert into question_has_answer values(4,1006)
go
insert into question_has_answer values(4,1007)
go
insert into question_has_answer values(4,1008)
go
insert into question_has_answer values(4,1009)

select * from subjects;
select * from Practices;
select * from lessons;
select * from Lesson_Has_Question;
insert into Lesson_Has_Question values(1, 1);
insert into Lesson_Has_Question values(1, 3);
insert into Lesson_Has_Question values(1, 4);

select * from Practices;
select * from users;
insert into Practices values(27, 6, 'All', 1 ,GETDATE(),null, 5);
update Practices set NumberQuestion = 3 where id = 1002;

select * from Practice_Question;
insert into Practice_Question values(1002, 1, null);
delete from Practice_Question where Id = 2
insert into Practice_Question values(1002, 3, null);
insert into Practice_Question values(1002, 4, null);

update Practices set CreatedAt = GETDATE() where Id = 1002;
update Practices set Duration = 30 where Id = 1002;

ALTER TABLE Practice_Question
ADD IsMarked bit DEFAULT 0;





 SELECT q.id, q.detail, q.suggestion, q.status, q.media, pq.YourAnswer
    FROM questions q
     JOIN practice_question pq ON q.id = pq.QuestionId
    WHERE pq.PracticeId = 1002;

	select * from question_has_answer;

	select * from Dimension;
















update users set status_id = 2 where id = 27;
-------------------12
select * from package_price;
select * from subject_has_price_package;
select * from subjects;

select p.id, p.name, p.duration,p.original_price
from package_price p
where p.id in(
select price_package_id from  subject_has_price_package 
where subject_id = 2);


select * from Subject_Register;
insert into Subject_Register 
values(2,27,1,null,null,null,'pending');

delete from Subject_Register where id = 2004;
delete from users where id > 3000;

select * from users;
insert into users(full_name, email, phone_number, password,gender,created_at,role_id,status_id) 
values('yentyen', 'yen@gmail.com','12312','123',1,'2024-06-06',1,2);


SELECT SCOPE_IDENTITY() AS LastInsertedId;
SELECT @@IDENTITY AS LastInsertedId;


--------------------Menu - Role(1-user, 2-admin, 3-expert, 4-sale, 5-marketing)
------------------------------13
--------------------Subject register : Status(pending/done)
select * from Subject_Register;
select * from users;
select * from roles;


select r.id,s.name, r.CreatedAt, p.name, p.original_price, r.Status 
from Subject_Register r 
left join subjects s on r.SubjectId = s.id
left join package_price p on p.id = r.PackageId
WHERE r.UserId = 27


WITH PagedResults AS (	
    SELECT r.id,s.name AS subject_name, r.CreatedAt, p.name AS package_name, p.original_price, r.Status,
           ROW_NUMBER() OVER (ORDER BY r.CreatedAt) AS row_num
    FROM Subject_Register r 
    LEFT JOIN subjects s ON r.SubjectId = s.id
    LEFT JOIN package_price p ON p.id = r.PackageId
    WHERE r.UserId = 27 
)
SELECT * 
FROM PagedResults
WHERE row_num BETWEEN 1 AND 5
ORDER BY row_num;

WITH PagedResults AS (	
    SELECT r.id,s.name AS subject_name, r.CreatedAt, p.name AS package_name, p.original_price, r.Status,
           ROW_NUMBER() OVER (ORDER BY r.CreatedAt) AS row_num
    FROM Subject_Register r 
    LEFT JOIN subjects s ON r.SubjectId = s.id
    LEFT JOIN package_price p ON p.id = r.PackageId
    WHERE r.UserId = 27 and s.dimensionId = 2
)
SELECT * 
FROM PagedResults
WHERE row_num BETWEEN 1 AND 5
ORDER BY row_num;

WITH PagedResults AS (	
    SELECT r.id,s.name AS subject_name, r.CreatedAt, p.name AS package_name, p.original_price, r.Status,
           ROW_NUMBER() OVER (ORDER BY r.CreatedAt) AS row_num
    FROM Subject_Register r 
    LEFT JOIN subjects s ON r.SubjectId = s.id
    LEFT JOIN package_price p ON p.id = r.PackageId
    WHERE r.UserId = 27 and s.name like '%p%' 
)
SELECT * 
FROM PagedResults
WHERE row_num BETWEEN 1 AND 5
ORDER BY row_num;

WITH PagedResults AS (	
    SELECT r.id,s.name AS subject_name, r.CreatedAt, p.name AS package_name, p.original_price, r.Status,
           ROW_NUMBER() OVER (ORDER BY r.CreatedAt) AS row_num
    FROM Subject_Register r 
    LEFT JOIN subjects s ON r.SubjectId = s.id
    LEFT JOIN package_price p ON p.id = r.PackageId
    WHERE r.UserId = 27 and s.description like '%fdsafadsf%' 
)
SELECT * 
FROM PagedResults
WHERE row_num BETWEEN 1 AND 5
ORDER BY row_num;


select * from Dimension

select * from users;

select * from subjects;
insert into Subject_Register 
values(6,27,1,GETDATE(),null,null,'pending');
insert into Subject_Register 
values(7,27,1,GETDATE(),null,null,'pending');
insert into Subject_Register 
values(8,27,1,GETDATE(),null,null,'pending');
insert into Subject_Register 
values(9,27,1,GETDATE(),null,null,'pending');
insert into Subject_Register 
values(10,27,1,GETDATE(),null,null,'done');
insert into Subject_Register 
values(14,27,1,GETDATE(),null,null,'done');
delete from Subject_Register where id = 10;




WITH PagedResults AS (
    SELECT r.id,s.name AS subject_name, r.CreatedAt, p.name AS package_name, p.original_price, r.Status,
           ROW_NUMBER() OVER (ORDER BY r.CreatedAt) AS row_num
    FROM Subject_Register r 
    LEFT JOIN subjects s ON r.SubjectId = s.id 

    LEFT JOIN package_price p ON p.id = r.PackageId
    WHERE r.UserId = 27 and s.name like '%E%'
)
SELECT * 
FROM PagedResults
WHERE row_num BETWEEN 1 AND 5
ORDER BY row_num;




-----------------------------14 practice list
select * from Practices;
select * from subjects;

insert into Practices values(27, 2, 'All',20,GETDATE(),10,30);
insert into Practices values(27, 6, 'All',20,GETDATE(),10,20);
insert into Practices values(27, 6, 'All',20,GETDATE(),10,20);
insert into Practices values(27, 6, 'All',20,GETDATE(),10,20);
insert into Practices values(27, 6, 'All',20,GETDATE(),10,20);
insert into Practices values(27, 6, 'All',20,GETDATE(),10,20);

WITH PagedResults AS (
    SELECT p.id,s.name AS subject_name, p.CreatedAt, p.NumberQuestion, p.NumberCorrect, p.Duration,
           ROW_NUMBER() OVER (ORDER BY p.CreatedAt) AS row_num
    FROM Practices p
    LEFT JOIN subjects s ON p.SubjectId = s.id 
    WHERE p.UserId = 27
)
SELECT * 
FROM PagedResults
WHERE row_num BETWEEN 1 AND 5
ORDER BY row_num;	



---------------------------15 new practice Type=IT/Economic .Dimenstion: fontEnd, backEnd,hosting
insert into Dimension values('FontEnd','IT','Include html, css, js, ...');
insert into Dimension values('BackEnd','IT','Include java ,c++, c#, ...');
insert into Dimension values('Hosting','IT','Include networking, tracking ...');
insert into Dimension values('Finance','Economy','Include accounting, analysis, ...');
select * from Dimension;
select * from subjects;
select * from lessons;

update subjects set dimensionId = 2;
----type content/quiz
insert into lessons values('Lam quen voi OOP java',null, null,null,1,
'<div class="course">
    <h3>Introduction to Programming</h3>
    <p>Instructor: John Doe</p>
    <p>Duration: 10 weeks</p>
    <p>Description: This course provides an introduction to programming concepts using Python.</p>
</div>',
null,
1,'content');
insert into lessons values('Lam quen voi OOP java part 2',null, null,null,1,
'<div class="course">
    <h3>Introduction to Programming</h3>
    <p>Instructor: John Doe</p>
    <p>Duration: 10 weeks</p>
    <p>Description: This course provides an introduction to programming concepts using Python.</p>
</div>',
null,
2,'content');

insert into subject_has_lesson values(2,1);
insert into subject_has_lesson values(2,2);
select * from subject_has_lesson;

select DimensionName from Dimension;

Select name from subjects where dimensionId = 
(select DimensionId from Dimension where DimensionName = 'BackEnd')

select name from lessons 

select l.name from subject_has_lesson sl 
left join lessons l on sl.lesson_id = l.id
where sl.subject_id =
(select id from subjects where name = 'PRO192')



------------------------------------20
select * from blogs;
select * from categories;
update blogs set CategoryId = 8 

select b.id, b.title, c.name, b.content, b.status, b.thumbnail 
from blogs b left join categories c on b.CategoryId = c.id 
where b.id = 18


-----------------------23
select * from subjects;
select * from users;
select * from roles;
update users set status_id = 2;
update users set role_id = 3 where id = 1028;

update subjects set creator_id = 1028 where id = 2;
update subjects set creator_id = 1028 where id = 6;
update subjects set creator_id = 1028 where id = 7;
update subjects set creator_id = 1028 where id = 8;
update subjects set creator_id = 1028 where id = 9;
update subjects set creator_id = 1028 where id = 10;

insert into roles values('Expert');
insert into roles values('Sale');
insert into roles values('Marketing');


WITH PagedResults AS (
    SELECT 
        s.id, 
        s.name, 
        d.DimensionName, 
        COUNT(sl.lesson_id) as NumberLesson,
        s.status,
        ROW_NUMBER() OVER (ORDER BY s.creater_at) AS row_num
    FROM 
        subjects s 
    LEFT JOIN 
        Dimension d ON s.dimensionId = d.DimensionId
    LEFT JOIN 
        subject_has_lesson sl ON sl.subject_id = s.id
    WHERE 
        s.creator_id = 1028
    GROUP BY 
        s.id, 
        s.name, 
        d.DimensionName, 
        s.status, 
        s.creater_at
)
SELECT * 
FROM PagedResults
WHERE row_num BETWEEN 1 AND 5
ORDER BY row_num;

select * from Dimension;




-------------------------------------24
select * from subjects;
insert into subjects values('a',1028,GETDATE(),null,1,'image','dec',2);
delete from subjects where id = 18;

-------------------------------25
select * from Dimension;
update Dimension set Status = 1;

SELECT 
    pp.*,
    CASE 
        WHEN EXISTS (
            SELECT 1 
            FROM subject_has_price_package shpp 
            WHERE shpp.price_package_id = pp.id 
              AND shpp.subject_id = 3
        ) THEN 'active'
        ELSE 'inactive'
    END AS status
FROM 
package_price pp;




--------------21
select * from Slider;



WITH PagedResults AS (
    SELECT 
       *, 
        ROW_NUMBER() OVER (ORDER BY CreatedAt) AS row_num
    FROM 
        Slider
   )
SELECT * 
FROM PagedResults
WHERE row_num BETWEEN 1 AND 5
ORDER BY row_num;


WITH PagedResults AS (
    SELECT 
       *, 
        ROW_NUMBER() OVER (ORDER BY CreatedAt) AS row_num
    FROM 
        Slider  
	Where Status = 1
   )
SELECT * 
FROM PagedResults
WHERE row_num BETWEEN 1 AND 5
ORDER BY row_num;

UPDATE Slider SET Status = 0 WHERE Status IS NULL;

WITH PagedResults AS (
    SELECT 
       *, 
        ROW_NUMBER() OVER (ORDER BY CreatedAt) AS row_num
    FROM 
        Slider  
	Where Title like '%detail%' or LinkUrl like '%detail%'
   )
SELECT * 
FROM PagedResults
WHERE row_num BETWEEN 1 AND 5
ORDER BY row_num;



select count(*) as total from Slider;

select Status from Slider where ID = 1

update Slider set Status = 1 where ID = 1

insert into Slider values('dfas','dfsa','dsa','fdsa','fdas',GETDATE(),1028,1);
select * from users

update Slider set Title='t',SubTitle='t',Content='t',Image='dfsa',LinkUrl='t',Status=1
where ID = 6








------------------------------28-------------------------------
select * from lessons;
select * from subject_has_lesson;

	WITH PagedResults AS (
		SELECT 
		   *, 
			ROW_NUMBER() OVER (ORDER BY LessonIndex) AS row_num
		FROM 
			lessons
		where id in (select lesson_id from subject_has_lesson where subject_id=2)
	   )
	SELECT * 
	FROM PagedResults
	WHERE row_num BETWEEN 1 AND 5
	ORDER BY row_num;


select count(*) as total from lessons 
where id in 
(select lesson_id from subject_has_lesson 
where subject_id=2) ;


--search name
WITH PagedResults AS (
    SELECT 
       *, 
        ROW_NUMBER() OVER (ORDER BY LessonIndex) AS row_num
    FROM 
        lessons
	where id in (select lesson_id from subject_has_lesson where subject_id=2) and name like '%2%'
   )
SELECT * 
FROM PagedResults
WHERE row_num BETWEEN 1 AND 5
ORDER BY row_num;


select count(*) as total from lessons 
where id in 
(select lesson_id from subject_has_lesson 
where subject_id=2  and name like '%2%' ) ;



--search status
WITH PagedResults AS (
    SELECT 
       *, 
        ROW_NUMBER() OVER (ORDER BY LessonIndex) AS row_num
    FROM 
        lessons
	where id in (select lesson_id from subject_has_lesson where subject_id=2) and status = 1
   )
SELECT * 
FROM PagedResults
WHERE row_num BETWEEN 1 AND 5
ORDER BY row_num;


select count(*) as total from lessons 
where id in 
(select lesson_id from subject_has_lesson 
where subject_id=2   and status = 1) ;



--search type
WITH PagedResults AS (
    SELECT 
       *, 
        ROW_NUMBER() OVER (ORDER BY LessonIndex) AS row_num
    FROM 
        lessons
	where id in (select lesson_id from subject_has_lesson where subject_id=2) and Type = 'content'
   )
SELECT * 
FROM PagedResults
WHERE row_num BETWEEN 1 AND 5
ORDER BY row_num;


select count(*) as total from lessons 
where id in 
(select lesson_id from subject_has_lesson 
where subject_id=2   and Type = 'content')
;


--add
select * from lessons;

insert into lessons values('Lam quen voi String',1028,null,GETDATE(),1,'',null,2,'content')

SELECT @@IDENTITY AS LastInsertedId;

insert into subject_has_lesson values(2,1002);	


--edit
select * from lessons where id = 1;

update lessons set name=? ,content=?, media=?, LessonIndex=?, Type=? 
where id = 1;

update lessons set status = 1 where id = 1;




--dieukien
select creator_id from subjects where id = 2;









select * from roles





------------------23
WITH PagedResults AS (
    SELECT 
        s.id, 
        s.name, 
        d.DimensionName, 
        COUNT(sl.lesson_id) as NumberLesson,
        s.status,
        ROW_NUMBER() OVER (ORDER BY s.creater_at) AS row_num
    FROM 
        subjects s 
    LEFT JOIN 
        Dimension d ON s.dimensionId = d.DimensionId
    LEFT JOIN 
        subject_has_lesson sl ON sl.subject_id = s.id
    WHERE 
        s.creator_id = 1028
    GROUP BY 
        s.id, 
        s.name, 
        d.DimensionName, 
        s.status, 
        s.creater_at
)
SELECT * 
FROM PagedResults
WHERE row_num BETWEEN 1 AND 5
ORDER BY row_num;


WITH PagedResults AS (
    SELECT 
        s.id, 
        s.name, 
        d.DimensionName, 
        COUNT(sl.lesson_id) as NumberLesson,
        s.status,
        ROW_NUMBER() OVER (ORDER BY s.creater_at) AS row_num
    FROM 
        subjects s 
    LEFT JOIN 
        Dimension d ON s.dimensionId = d.DimensionId
    LEFT JOIN 
        subject_has_lesson sl ON sl.subject_id = s.id
    WHERE 
        s.creator_id = 1028 and s.name like '%pro%'
    GROUP BY 
        s.id, 
        s.name, 
        d.DimensionName, 
        s.status, 
        s.creater_at
)
SELECT * 
FROM PagedResults
WHERE row_num BETWEEN 1 AND 5
ORDER BY row_num;


WITH PagedResults AS (
    SELECT 
        s.id, 
        s.name, 
        d.DimensionName, 
        COUNT(sl.lesson_id) as NumberLesson,
        s.status,
        ROW_NUMBER() OVER (ORDER BY s.creater_at) AS row_num
    FROM 
        subjects s 
    LEFT JOIN 
        Dimension d ON s.dimensionId = d.DimensionId
    LEFT JOIN 
        subject_has_lesson sl ON sl.subject_id = s.id
    WHERE 
        s.creator_id = 1028 and s.dimensionId = 2
    GROUP BY 
        s.id, 
        s.name, 
        d.DimensionName, 
        s.status, 
        s.creater_at
)
SELECT * 
FROM PagedResults
WHERE row_num BETWEEN 1 AND 5
ORDER BY row_num;


WITH PagedResults AS (
    SELECT 
        s.id, 
        s.name, 
        d.DimensionName, 
        COUNT(sl.lesson_id) as NumberLesson,
        s.status,
        ROW_NUMBER() OVER (ORDER BY s.creater_at) AS row_num
    FROM 
        subjects s 
    LEFT JOIN 
        Dimension d ON s.dimensionId = d.DimensionId
    LEFT JOIN 
        subject_has_lesson sl ON sl.subject_id = s.id
    WHERE 
        s.creator_id = 1028 and s.status = 1
    GROUP BY 
        s.id, 
        s.name, 
        d.DimensionName, 
        s.status, 
        s.creater_at
)
SELECT * 
FROM PagedResults
WHERE row_num BETWEEN 1 AND 5
ORDER BY row_num;

select * from subjects;