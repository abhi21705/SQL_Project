-- =============================================
-- Project: Student Course Management System
-- Author: [Your Name]
-- Description: A sample SQL project to manage students, courses, and enrollments.
-- =============================================

-- Drop existing tables (for re-runs)
DROP TABLE IF EXISTS enrollments;
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS courses;

-- ========================
-- Create Tables
-- ========================

CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    dob DATE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100) NOT NULL,
    course_code VARCHAR(20) UNIQUE NOT NULL,
    credits INT NOT NULL
);

CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_date DATE NOT NULL,
    grade CHAR(2),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- ========================
-- Insert Sample Data
-- ========================

INSERT INTO students (first_name, last_name, dob, email) VALUES
('Rahul', 'Sharma', '2000-05-14', 'rahul.sharma@example.com'),
('Priya', 'Mehta', '1999-08-20', 'priya.mehta@example.com'),
('Amit', 'Kumar', '2001-01-10', 'amit.kumar@example.com');

INSERT INTO courses (course_name, course_code, credits) VALUES
('Database Management Systems', 'DBMS101', 4),
('Java Programming', 'JAVA201', 3),
('Web Development', 'WEB301', 3);

INSERT INTO enrollments (student_id, course_id, enrollment_date, grade) VALUES
(1, 1, '2025-01-15', 'A'),
(1, 2, '2025-01-15', 'B'),
(2, 1, '2025-01-16', 'A'),
(3, 3, '2025-01-17', 'B');

-- ========================
-- Queries
-- ========================

-- 1. List all students
SELECT * FROM students;

-- 2. List all courses
SELECT * FROM courses;

-- 3. Show enrollments with student and course details
SELECT s.first_name, s.last_name, c.course_name, e.grade
FROM enrollments e
JOIN students s ON e.student_id = s.student_id
JOIN courses c ON e.course_id = c.course_id;

-- 4. Find students with grade 'A'
SELECT s.first_name, s.last_name, c.course_name
FROM enrollments e
JOIN students s ON e.student_id = s.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE e.grade = 'A';
