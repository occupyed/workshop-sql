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
