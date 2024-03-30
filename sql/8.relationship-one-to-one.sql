CREATE DATABASE SCHOOL;
USE SCHOOL;

-- Create Students Table
CREATE TABLE Students (
     Id INT PRIMARY KEY,
     Name VARCHAR(40) NOT NULL,
     Class VARCHAR(20),
     Age INT
);

-- Populate the Students Table with test data
INSERT INTO Students VALUES (1,'John', 'First', 5);
INSERT INTO Students VALUES (2, 'Mary', 'Third', 7);
INSERT INTO Students VALUES (3, 'Mike', 'Second', 6);
INSERT INTO Students VALUES (4, 'Linda', 'Third', 7);

-- Create Addresses Table
CREATE TABLE Addresses (
     AddressId INT PRIMARY KEY, 
     Address VARCHAR(100) NOT NULL,
     StudentId INT NOT NULL UNIQUE
);

-- Populate the Addresses Table with test data
INSERT INTO Addresses VALUES(1001, 'Mumbai', 1);
INSERT INTO Addresses VALUES(1002, 'Delhi', 2);
INSERT INTO Addresses VALUES(1003, 'BBSR', 3);
INSERT INTO Addresses VALUES(1004, 'Hyderabad', 4);



-- Retrieve all students and their addresses:
SELECT Students.Id, Students.Name, Students.Class, Students.Age, Addresses.Address
FROM Students
INNER JOIN Addresses ON Students.Id = Addresses.StudentId;

-- Retrieve the address of a specific student (e.g., student with ID 2):
SELECT Students.Name, Addresses.Address
FROM Students
INNER JOIN Addresses ON Students.Id = Addresses.StudentId
WHERE Students.Id = 2;

-- Retrieve students who have addresses in a particular city (e.g., Mumbai):
SELECT Students.Name, Students.Class, Addresses.Address
FROM Students
INNER JOIN Addresses ON Students.Id = Addresses.StudentId
WHERE Addresses.Address = 'Mumbai';

-- Retrieve students who don't have an address (if any):
SELECT *
FROM Students
WHERE Id NOT IN (SELECT StudentId FROM Addresses);

-- Retrieve students with their addresses sorted by student name:
SELECT Students.Name, Students.Class, Addresses.Address
FROM Students
LEFT JOIN Addresses ON Students.Id = Addresses.StudentId
ORDER BY Students.Name;

