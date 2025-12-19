CREATE TABLE Department(
  id INT PRIMARY KEY,
  name VARCHAR(50),
  university VARCHAR(50),
  Head_Dept VARCHAR(50),
  year_starting INT
);
 
CREATE TABLE Employees(
  id INT PRIMARY KEY,
  name VARCHAR(50),
  department_id INT,
  salary INT,
  city VARCHAR(50),
  hiring_year INT,
  FOREIGN KEY (department_id) REFERENCES Department(id)
  )
 
  ALTER TABLE Employees
  DROP CONSTRAINT salary_fk;

 -- remove the constraint 
 --update the constraint

 
  ALTER TABLE Employees
  ALTER COLUMN name SET NOT NULL
 
  SELECT * FROM department
  SELECT * FROM employees
 
  INSERT INTO department (id,name,university,head_dept,year_starting) 
  VALUES (1, 'Mathematics', 'California University', 'Ibrahim', 2020),
  (2, 'Physics', 'California University', 'Mell', 2020),
  (3, 'Literature', 'California University', 'Hazirah', 2020);
 
  INSERT INTO department (id,name,university,head_dept,year_starting) 
  VALUES (4, 'Computer_Science', 'MIT', 'Idrees', 2020);
 
  UPDATE Department
  SET university =  'California University'
  WHERE id = 4;
 
  UPDATE Department
  SET name =  'Computer Science'
  WHERE id = 4;
 
  -- structure of the table?
  -- remove columns? rows? DROP and DELETE
  -- list id as the primary key??

 --- ignore
ALTER TABLE department
ALTER COLUMN teacher_salary TYPE INT;

ALTER TABLE employees
DROP CONSTRAINT salary_fk;
INSERT INTO employees (id,name,department_id,salary,city, hiring_year) 
  VALUES (1, 'Ibrahim', 4,50000, 'KL', 2020),
  (2, 'Hazirah', 3, 50000,'KL', 2021),
  (3, 'Mell', 2, 50000,'KL', 2023),
  (4, 'Aiysah', 4, 50000,'KL', 2020),
  (5, 'Nazihah', 2, 50000,'KL', 2025),
  (6, 'Amin', 1, 50000,'KL', 2022),
  (7, 'Nazri', 1, 50000,'KL', 2021);

  SELECT university
  FROM Department
  WHERE name = 'Mathematics'

--SUBQUERY
SELECT * FROM employees
WHERE name IN (
  SELECT name 
  FROM employees
  WHERE department_id = 2
)


--employees where dept id = 4

SELECT * FROM Employees
WHERE department_id = 4
-- same as above --
SELECT * FROM employees
WHERE name IN (
SELECT name FROM employees
WHERE department_id = 4
)