-- Create a new database for storing student-related information
CREATE DATABASE IF NOT EXISTS StudentDB;
USE StudentDB;

-- Create a table for storing information about students
CREATE TABLE Students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(100) NOT NULL,
    date_of_birth DATE,
    gender ENUM('Male', 'Female', 'Other'),
    email VARCHAR(100) UNIQUE
);

-- Create a table for storing information about courses
CREATE TABLE Courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100) NOT NULL,
    course_description TEXT
);

-- Create a table to represent the relationship between students and courses
CREATE TABLE Student_Courses (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);



-- Insert 20 records into the Students table with Indian names
INSERT INTO Students (student_name, date_of_birth, gender, email) VALUES
('Aarav Patel', '2000-01-15', 'Male', 'aarav.patel@example.com'),
('Aditi Gupta', '1999-05-20', 'Female', 'aditi.gupta@example.com'),
('Aryan Kumar', '2001-03-10', 'Male', 'aryan.kumar@example.com'),
('Isha Singh', '2000-08-25', 'Female', 'isha.singh@example.com'),
('Rohan Sharma', '1998-11-12', 'Male', 'rohan.sharma@example.com'),
('Ananya Shah', '2002-02-28', 'Female', 'ananya.shah@example.com'),
('Vedant Joshi', '1999-09-17', 'Male', 'vedant.joshi@example.com'),
('Neha Malhotra', '2001-06-05', 'Female', 'neha.malhotra@example.com'),
('Virat Gupta', '2000-04-03', 'Male', 'virat.gupta@example.com'),
('Kriti Patel', '1998-12-20', 'Female', 'kriti.patel@example.com'),
('Arjun Singh', '2002-07-08', 'Male', 'arjun.singh@example.com'),
('Divya Mishra', '1999-10-14', 'Female', 'divya.mishra@example.com'),
('Yash Sharma', '2001-01-30', 'Male', 'yash.sharma@example.com'),
('Tanvi Patel', '2000-11-22', 'Female', 'tanvi.patel@example.com'),
('Krishna Verma', '1998-06-18', 'Male', 'krishna.verma@example.com'),
('Meera Gupta', '2002-04-12', 'Female', 'meera.gupta@example.com'),
('Raj Patel', '1999-08-08', 'Male', 'raj.patel@example.com'),
('Aaradhya Shah', '2001-02-05', 'Female', 'aaradhya.shah@example.com'),
('Kabir Singh', '2000-10-01', 'Male', 'kabir.singh@example.com'),
('Jiya Sharma', '1998-07-25', 'Female', 'jiya.sharma@example.com');

-- Insert 20 records into the Courses table
INSERT INTO Courses (course_name, course_description) VALUES
('Mathematics', 'Introduction to algebra, geometry, and calculus.'),
('English Literature', 'Study of classic and contemporary literature.'),
('Computer Science', 'Introduction to programming, algorithms, and data structures.'),
('History', 'Study of past events, civilizations, and societies.'),
('Chemistry', 'Study of the composition, structure, and properties of substances.'),
('Physics', 'Study of matter, energy, and the fundamental forces of nature.'),
('Biology', 'Study of living organisms and their interactions with the environment.'),
('Art', 'Exploration of various artistic techniques and styles.'),
('Music', 'Study of musical theory, composition, and performance.'),
('Psychology', 'Study of behavior and mental processes.'),
('Sociology', 'Study of human society and social behavior.'),
('Economics', 'Study of production, distribution, and consumption of goods and services.'),
('Philosophy', 'Exploration of fundamental questions about existence, knowledge, and values.'),
('Political Science', 'Study of government systems, political behavior, and public policies.'),
('Geography', 'Study of Earth\'s landscapes, environments, and spatial phenomena.'),
('Anthropology', 'Study of human cultures, societies, and their development over time.'),
('Environmental Science', 'Study of the natural environment and the impact of human activity.'),
('Literacy', 'Improvement of reading, writing, and critical thinking skills.'),
('Foreign Language', 'Study of languages other than one\'s native language.'),
('Physical Education', 'Promotion of physical fitness and healthy lifestyles.');

-- Insert 20 records into the Student_Courses table (random assignments for demonstration purposes)
INSERT INTO Student_Courses (student_id, course_id) VALUES
(1, 1), (1, 3), (1, 6), (2, 2), (2, 4),
(2, 8), (3, 3), (3, 5), (3, 7), (4, 1),
(4, 9), (4, 11), (5, 2), (5, 6), (5, 10),
(6, 3), (6, 5), (6, 8), (7, 1), (7, 7);
