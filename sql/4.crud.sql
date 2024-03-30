-- use studentdb

-- Create (Insert)
INSERT INTO Students (student_name, date_of_birth, gender, email) 
VALUES ('Alice Smith', '2002-05-10', 'Female', 'alice.smith@example.com'),
       ('Bob Johnson', '2001-08-20', 'Male', 'bob.johnson@example.com');

-- Read (Select)
SELECT * FROM Students;
SELECT student_name, gender FROM Students WHERE gender = 'Male';

-- Update
UPDATE Students 
SET email = 'alice.smith.updated@example.com' 
WHERE student_id = 1;

UPDATE Students 
SET date_of_birth = '2001-08-21' 
WHERE student_name = 'Bob Johnson';

-- Delete
DELETE FROM Students 
WHERE student_id = 1;

DELETE FROM Students 
WHERE student_name = 'Bob Johnson';


-----------------------------------------------

-- selections

-- select from specific coloumn
SELECT column1, column2, ... FROM table_name;

-- select without FROM
SELECT select_list;

-- select all records
SELECT * FROM table_name;
SELECT 1 + 1;    

-- select with functions
SELECT NOW();
SELECT CONCAT('John',' ','Doe');
SELECT CONCAT('Jane',' ','Doe') AS 'Full name';

-- where
SELECT column1, column2, ...
FROM table_name
WHERE condition;

-- where AND
SELECT column1, column2, ...
FROM table_name
WHERE condition1 AND condition2 AND condition3 ...;

-- where OR
SELECT column1, column2, ...
FROM table_name
WHERE condition1 OR condition2 OR condition3 ...;

-- where NOT
SELECT column1, column2, ...
FROM table_name
WHERE NOT condition;

-- order by
SELECT column1, column2, ...
FROM table_name
ORDER BY column1, column2, ... ASC|DESC;
