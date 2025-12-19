-- create a small table of teachers and students 
-- teachers id(pk) name city department_id(fk) salary year joining
--students id(pk) name city department_id(fk) major batch
--department id(pk) name university HeadofDept year_starting

-- create these tables
--keep 5 to 10 records in each table

--create table department
CREATE TABLE Department(
dept_id INT PRIMARY KEY,
dept_name VARCHAR(50),
university VARCHAR(50),
HeadofDept VARCHAR(50),
year_starting INT
);

--create table teachers
CREATE TABLE Teacher(
teacher_id INT PRIMARY KEY,
teacher_name VARCHAR(50),
city VARCHAR(50),
teacher_dept_id INT,
salary INT,
year_joining INT,
FOREIGN KEY (teacher_dept_id) REFERENCES Department(dept_id)
);

-- create table students
CREATE TABLE Student(
student_id INT PRIMARY KEY,
student_name VARCHAR(50),
student_city VARCHAR(50),
student_dept_id INT,
student_major VARCHAR(50),
student_batch INT,
FOREIGN KEY(student_dept_id) REFERENCES Department(dept_id)
);

-- insert data into department
INSERT INTO Department(dept_id, dept_name, university, HeadofDept, year_starting)
VALUES
(1,'Computer Science', 'UM', 'Mr Idrees', 2020),
(2,'Maths', 'UKM', 'Mr Ahmad', 2015),
(3,'AI', 'UIA', 'Dr Shah', 2010),
(4,'Cognitive Science', 'UNIMAS', 'Dr Hazirah', 2001),
(5,'Pyschology', 'UMS', 'Dr Syu', 1997);

--insert data to teachers
INSERT INTO Teacher(teacher_id, teacher_name, city, teacher_dept_id, salary, year_joining)
VALUES 
(006,'Syu', 'Damansara', 2, 200000, 2024),
(001,'Mel', 'Segamat', 1, 100000, 2020),
(002,'Athirah', 'Damansara', 2, 200000, 2024),
(003,'Amin', 'Penang', 3, 300000, 2020),
(004,'Fairuz', 'Damansara', 4, 300000, 2001),
(005,'Nazihah', 'Ampang', 5, 1000000, 2024);

--insert data into student
INSERT INTO Student(student_id, student_name, student_city, student_dept_id, student_major, student_batch)
VALUES 
(101,'Noor', 'Seremban', 4, 'Cognitive Science', 2020),
(102,'Siti', 'KL', 2, 'Statistics', 2019),
(103,'Aisyah', 'Kuching', 3, 'AIML', 2025),
(104,'Najibah', 'Kuching', 1, 'Computant Science', 2020),
(105,'Hayati', 'Penang', 5, 'Psychology', 2010);

SELECT * FROM Department
SELECT * FROM Teacher
SELECT * FROM Student

UPDATE Student
SET student_city = 'KL'
WHERE student_id = 105

-- change structure of the table 
-- remove columns | DROP and DELETE

--- forgot list id as the primary key??

ALTER TABLE Department
ADD COLUMN teacher_salary REAL;
-- change type
ALTER TABLE Department
ALTER COLUMN teacher_salary TYPE INT;
----
UPDATE Department
SET teacher_salary; 

-- error
ALTER TABLE Teacher
ADD CONSTRAINT salary_fk FOREIGN KEY (salary) REFERENCES Department (teacher_salary);

--- NOT NULL IS ANOTHER CONSTRAINT
ALTER TABLE Teacher
ALTER COLUMN teacher_name SET NOT NULL;

--tukar type teacher salary
ALTER TABLE Department
ALTER COLUMN teacher_salary TYPE INT;

--INNER JOIN TO SEE TEACHER AND NAME OF DEPT
SELECT teacher_name, dept_name
FROM Department
INNER JOIN Teacher ON Department.dept_id = Teacher.teacher_dept_id

SELECT dept_id 
FROM Department
WHERE dept_name = 'Computer Science'

SELECT teacher_name
FROM Teacher
WHERE teacher_dept_id = 2

--SUBQUERY error
SELECT * FROM Teacher
WHERE name IN (
  SELECT teacher_name 
  FROM Teacher
  WHERE teacher_department_id = 2
)