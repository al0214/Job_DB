CREATE SCHEMA HomeWork

CREATE TABLE Students(
	StudentID INT,
	FirstName VARCHAR(10),
	LastName VARCHAR(10),
	Birthdate DATE,
	
	# ENUM은 열이 가질 수 있는 가능한 값의 목록을 미리 정의할 수 있다.
	# ENUM('값1','값2')
	Gender ENUM('M','F'),
	
	# NUMERIC은 실수의 자리 수 ( p )와 소수점 자리 수 ( s )를 지정할 수 있다.
	# NUMERIC(p, s)
	GPA NUMERIC(7,2)
	
);

CREATE TABLE Courses (
	CourseID INT PRIMARY KEY,
	CourseName VARCHAR(10),
	Instructor VARCHAR(10),
	Separtment VARCHAR(10)
);

CREATE TABLE Enrollments (
	EnrollmentID INT PRIMARY KEY,
	StudentID INT ,
	CourseID INT ,
	EnrollmentDate DATE
	# FOREIGN Key (StudentID) REFERENCES Students(StudentID),
	# FOREIGN key (CourseID) REFERENCES Courses(CourseID)
	# FOREIGN KEY (외래키_열) REFERENCES 참조할_테이블(기본키_열) 
);


CREATE INDEX idx_Encrollments_StudentID on Enrollments(StudentID);
CREATE INDEX idx_Encrollments_CourseID on Enrollments(CourseID);
# CREATE INDEX 인덱스_이름 ON 테이블_이름 (열_이름);
# 인덱스는 테이블의 열(Column)에 대해 검색 속도를 향상시키기 위해 생성되는 데이터 구조이다.	

# 열 수정
# ALTER TABLE 테이블_이름
# ALTER COLUMN 열_이름 새로운_데이터_타입 [열_제약조건];
ALTER table students drop PRIMARY key;
ALTER table students add PRIMARY key (StudentID);


# INSERT INTO 테이블_이름 (열1, 열2, 열3, ...) VALUES (값1, 값2, 값3, ...);
Insert into Students(StudentID, FirstName, LastName, Birthdate, Gender, GPA) 
VALUES(1, '가','가나', '2005-05-15', 'M', 3.75), 
      (2, '가','다라', '1999-09-21', 'F', 3.9) ,
	  (3, '나','마바', '2001-02-10', 'M', 3.2) ,
	  (4, '나','사아', '2000-11-30', 'F', 3.6) ,
      (5, '나','자차', '2002-07-18', 'M', 3.45);
      
# SELECT 열1, 열2, ... FROM 테이블_이름 WHERE 조건;
select FirstName, LastName from students ORDER BY GPA DESC;
select avg(GPA) from students;
select FirstName, LastName from students ORDER by GPA ASC LIMIT 1;

select Gender, avg(GPA) from students group by gender;

select FirstName, MAX(Birthdate) from students group by FirstName;

select FirstName, Gender, avg(GPA) from students group by FirstName, Gender;

Insert into enrollments(EnrollmentID, StudentID, CourseID, EnrollmentDate) 
VALUES(1, 1, 101, '2023-01-15'),
	  (2, 2, 102, '2023-02-10'),
	  (3, 3, 101, '2023-03-05'),
	  (4, 4, 103, '2023-04-22'),
	  (5, 5, 102, '2023-05-10'),
	  (5, 5, 101, '2023-05-10');
	  
insert into courses(CourseID, CourseName ,Instructor ,Separtment) VALUES (101, 'JAVA', '김상현', 'Math'), (102, 'python', '깨중', 'Arts'), (103, 'Database', '다운', 'Computer');


select * from students join enrollments on students.StudentID = enrollments.StudentID;

select * from students join enrollments on students.StudentID = enrollments.StudentID join courses on enrollments.CourseID = courses.CourseID;

select CourseName, FirstName, LastName, EnrollmentDate from students join enrollments on students.StudentID = enrollments.StudentID join courses on enrollments.CourseID = courses.CourseID;

Select CourseName, COUNT(Courses.CourseID) 
From Students
Join Enrollments On Students.StudentID = Enrollments.StudentID
Join Courses On Enrollments.CourseID = Courses.CourseID 
GROUP BY CourseName;

Select CourseName, MAX(students.GPA) 
From Students
Join Enrollments On Students.StudentID = Enrollments.StudentID
Join Courses On Enrollments.CourseID = Courses.CourseID 
GROUP BY CourseName;

Select  LastName, COUNT(Courses.CourseID) 
From Students
Join Enrollments On Students.StudentID = Enrollments.StudentID
Join Courses On Enrollments.CourseID = Courses.CourseID 
GROUP BY LastName;
