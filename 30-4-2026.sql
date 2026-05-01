CREATE DATABASE EduPro;
USE EduPro;

CREATE TABLE teachers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    salary DECIMAL(10,2) CHECK (salary >= 0)
);

CREATE TABLE courses (
    id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100) NOT NULL,
    teacher_id INT,
    credits INT,
    tuition_fee DECIMAL(10,2),
    FOREIGN KEY (teacher_id) REFERENCES teachers(id)
);

CREATE TABLE students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    date_of_birth DATE,
    gender VARCHAR(10)
);

CREATE TABLE enrollments (
    id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    enroll_date DATE,
    score DECIMAL(3,1),
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (course_id) REFERENCES courses(id)
);
INSERT INTO teachers (full_name, salary) VALUES 
('Nguyen Van A', 1000),
('Tran Thi B', 1200),
('Le Van IT', 1500);

INSERT INTO courses (course_name, teacher_id, credits, tuition_fee) VALUES 
('Lap trinh C', 1, 3, 500),
('SQL Server', 1, 3, 600),
('Web Basic', 2, 2, 400),
('Java Core', 3, 4, 800),
('Python IT', 3, 3, 700),
('Mobile App', NULL, 3, 900);

INSERT INTO students (full_name, date_of_birth, gender) VALUES 
('Hoc Vien 1', '2006-01-01', 'Nam'),
('Hoc Vien 2', '2006-02-02', 'Nu'),
('Hoc Vien 3', '2006-03-03', 'Nam'),
('Hoc Vien 4', '2006-04-04', 'Nu'),
('Hoc Vien 5', '2006-05-05', 'Nam'),
('Hoc Vien 6', '2006-06-06', 'Nu'),
('Hoc Vien 7', '2006-07-07', 'Nam'),
('Hoc Vien 8', '2006-08-08', 'Nu'),
('Hoc Vien 9', '2006-09-09', 'Nam'),
('Hoc Vien 10', '2006-10-10', 'Nu');

INSERT INTO enrollments (student_id, course_id, enroll_date, score) VALUES 
(1, 1, '2026-04-01', 8.5), (1, 2, '2026-04-01', 7.0), (1, 3, '2026-04-01', 9.0),
(2, 1, '2026-04-02', 4.0), (2, 4, '2026-04-02', NULL), (3, 2, '2026-04-03', 6.5),
(4, 3, '2026-04-04', 5.0), (5, 5, '2026-04-05', 8.0), (6, 1, '2026-04-06', 7.5),
(7, 2, '2026-04-07', 3.0), (8, 4, '2026-04-08', 10.0), (9, 5, '2026-04-09', NULL),
(10, 1, '2026-04-10', 6.0), (3, 4, '2026-04-11', 7.0), (5, 2, '2026-04-12', 8.5);
UPDATE teachers
SET salary = salary * 1.1
WHERE id IN (
    SELECT DISTINCT teacher_id 
    FROM courses 
    WHERE course_name LIKE '%IT%'
);