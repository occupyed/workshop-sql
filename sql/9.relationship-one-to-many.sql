CREATE DATABASE Company;
USE Company;

-- Create Students Table
CREATE TABLE Employee (
 Id INT PRIMARY KEY,
 Name VARCHAR(45) NOT NULL,
 Department VARCHAR(45) NOT NULL,
 Salary FLOAT NOT NULL,
 Gender VARCHAR(45) NOT NULL,
 Age INT NOT NULL,
 City VARCHAR(45) NOT NULL
);

-- Populate the Employee Table with test data
INSERT INTO Employee VALUES (1001, 'John', 'IT', 35000, 'Male', 25, 'London');
INSERT INTO Employee VALUES (1002, 'Smith', 'HR', 45000, 'Female', 27, 'London');
INSERT INTO Employee VALUES (1003, 'James', 'Finance', 50000, 'Male', 28, 'London');
INSERT INTO Employee VALUES (1004, 'Mike', 'Finance', 50000, 'Male', 28, 'London');
INSERT INTO Employee VALUES (1005, 'Linda', 'HR', 75000, 'Female', 26, 'London');
INSERT INTO Employee VALUES (1006, 'Anurag', 'IT', 35000, 'Male', 25, 'Mumbai');
INSERT INTO Employee VALUES (1007, 'Priyanla', 'HR', 45000, 'Female', 27, 'Mumbai');
INSERT INTO Employee VALUES (1008, 'Sambit', 'IT', 50000, 'Male', 28, 'Mumbai');
INSERT INTO Employee VALUES (1009, 'Pranaya', 'IT', 50000, 'Male', 28, 'Mumbai');
INSERT INTO Employee VALUES (1010, 'Hina', 'HR', 75000, 'Female', 26, 'Mumbai');

-- Create Projects Table
CREATE TABLE Projects (
 ProjectId INT PRIMARY KEY,
        Title VARCHAR(200) NOT NULL,
        ClientId INT,
        EmployeeId INT,
        StartDate DATETIME,
        EndDate DATETIME,
        FOREIGN KEY (EmployeeId) REFERENCES Employee(Id)
);

-- Populate the Projects Table with test data
INSERT INTO Projects VALUES (1, 'Develop ecommerse website from scratch', 1, 1003, NOW(), DATE_ADD(NOW(), INTERVAL 30 DAY));
INSERT INTO Projects VALUES (2, 'WordPress website for our company', 1, 1002, NOW(), DATE_ADD(NOW(), INTERVAL 45 DAY));
INSERT INTO Projects VALUES (3, 'Manage our company servers', 2, 1007, NOW(), DATE_ADD(NOW(), INTERVAL 45 DAY));
INSERT INTO Projects VALUES (4, 'Hosting account is not working', 3, 1009, NOW(), DATE_ADD(NOW(), INTERVAL 7 DAY));
INSERT INTO Projects VALUES (5, 'MySQL database from my desktop application', 4, 1010, NOW(), DATE_ADD(NOW(), INTERVAL 15 DAY));
INSERT INTO Projects VALUES (6, 'Develop new WordPress plugin for my business website', 2, 1003, NOW(), DATE_ADD(NOW(), INTERVAL 10 DAY));
INSERT INTO Projects VALUES (7, 'Migrate web application and database to new server', 2, 1002, NOW(), DATE_ADD(NOW(), INTERVAL 5 DAY));
INSERT INTO Projects VALUES (8, 'Android Application development', 4, 1004, NOW(), DATE_ADD(NOW(), INTERVAL 30 DAY));
INSERT INTO Projects VALUES (9, 'Hosting account is not working', 3, 1001, NOW(), DATE_ADD(NOW(), INTERVAL 7 DAY));
INSERT INTO Projects VALUES (10, 'MySQL database from my desktop application', 4, 1008, NOW(), DATE_ADD(NOW(), INTERVAL 15 DAY));
INSERT INTO Projects VALUES (11, 'Develop new WordPress plugin for my business website', 2, 1007, NOW(), DATE_ADD(NOW(), INTERVAL 10 DAY));



-- Retrieve all projects along with the details of the employees assigned to them:
SELECT Projects.ProjectId, Projects.Title, Projects.StartDate, Projects.EndDate, Employee.Name, Employee.Department
FROM Projects
INNER JOIN Employee ON Projects.EmployeeId = Employee.Id;

-- Retrieve projects along with the details of employees and their salaries, where the project end date is in the future:
SELECT Projects.ProjectId, Projects.Title, Projects.StartDate, Projects.EndDate, Employee.Name, Employee.Salary
FROM Projects
INNER JOIN Employee ON Projects.EmployeeId = Employee.Id
WHERE Projects.EndDate > NOW();


-- Retrieve the project with the longest duration along with the details of the assigned employee:
SELECT Projects.ProjectId, Projects.Title, Projects.StartDate, Projects.EndDate, Employee.Name, Employee.Department
FROM Projects
INNER JOIN Employee ON Projects.EmployeeId = Employee.Id
ORDER BY DATEDIFF(Projects.EndDate, Projects.StartDate) DESC
LIMIT 1;


-- Retrieve the employee who is assigned to the most projects:
SELECT Employee.Id, Employee.Name, Employee.Department, COUNT(Projects.ProjectId) AS ProjectCount
FROM Employee
LEFT JOIN Projects ON Employee.Id = Projects.EmployeeId
GROUP BY Employee.Id
ORDER BY ProjectCount DESC
LIMIT 1;

-- Retrieve all employees along with the count of projects they are assigned to:
SELECT Employee.Name, Employee.Department, COUNT(Projects.ProjectId) AS ProjectCount
FROM Employee
LEFT JOIN Projects ON Employee.Id = Projects.EmployeeId
GROUP BY Employee.Id;
