-- Create Database
CREATE DATABASE student_db;
USE student_db;

-- Create Tables
CREATE TABLE Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    age INT
);

CREATE TABLE Courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100),
    instructor VARCHAR(100)
);

CREATE TABLE Enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    grade DECIMAL(4,2),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- Insert Data into Students
INSERT INTO Students (first_name, last_name, email, age) VALUES
('Aarav', 'Kumar', 'aarav.kumar@example.com', 20),
('Priya', 'Sharma', 'priya.sharma@example.com', 22),
('Rohan', 'Verma', 'rohan.verma@example.com', 21),
('Sneha', 'Reddy', 'sneha.reddy@example.com', 23),
('Kiran', 'Patel', 'kiran.patel@example.com', 19);

-- Insert Data into Courses
INSERT INTO Courses (course_name, instructor) VALUES
('Database Systems', 'Dr. Mehta'),
('Operating Systems', 'Prof. Rao'),
('Machine Learning', 'Dr. Gupta'),
('Data Structures', 'Prof. Singh');

-- Insert Data into Enrollments
INSERT INTO Enrollments (student_id, course_id, grade) VALUES
(1, 1, 88.5),
(2, 1, 92.0),
(3, 2, 75.5),
(4, 3, 89.0),
(5, 4, 78.0),
(1, 3, 95.0),
(2, 2, 81.0),
(3, 4, 84.5);

-- Queries to Extract Useful Data

-- # View all students
SELECT * FROM Students;

-- # List all courses
SELECT * FROM Courses;

--- # Find students enrolled in 'Database Systems'
SELECT s.first_name, s.last_name, c.course_name
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
WHERE c.course_name = 'Database Systems';

-- #  Calculate average grade per course
SELECT c.course_name, AVG(e.grade) AS avg_grade
FROM Enrollments e
JOIN Courses c ON e.course_id = c.course_id
GROUP BY c.course_name;

-- #  Find top-performing students (grade > 90)
SELECT s.first_name, s.last_name, e.grade, c.course_name
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
WHERE e.grade > 90
ORDER BY e.grade DESC;
