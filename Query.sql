





-------------16
select * from answers;
insert into answers values('Gà.....',GETDATE(),null, 1028,0);
insert into answers values('Chó.....',GETDATE(),null, 1028,1);
insert into answers values('Mèo.....',GETDATE(),null, 1028,0);
insert into answers values('Lợn.....',GETDATE(),null, 1028,0);

select * from users;
select * from questions;
insert into questions values('Con gi keu gau gau','4 chan', 1, null);


select * from question_has_answer;
insert into question_has_answer values(1,1)
go
insert into question_has_answer values(1,2)
go
insert into question_has_answer values(1,3)
go
insert into question_has_answer values(1,4)


select * from Practices;
insert into Lesson_Has_Question values(1, 1);

























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