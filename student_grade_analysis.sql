-- Student Grade Analysis

-- Create Tables
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50)
);

CREATE TABLE grades (
    grade_id INT PRIMARY KEY,
    subject VARCHAR(50),
    marks INT,
    student_id INT REFERENCES students(student_id)
);

-- Insert Data
INSERT INTO students VALUES
(1, 'Aanya Sharma','CSE'),
(2, 'Rohan Das','CSE'),
(3, 'Priya Mehta','ECE'),
(4, 'Souvik Bose','ECE'),
(5, 'Arjun Roy','ME'),
(6, 'Tania Sen','ME');

INSERT INTO grades VALUES
(1,'Mathematics', 88,1),
(2,'Physics',76,1),
(3,'Programming',92,1),
(4,'Mathematics',55,2),
(5,'Physics',60,2),
(6,'Programming',48,2),
(7,'Mathematics',78,3),
(8,'Physics',85,3),
(9,'Programming',35,3),
(10,'Mathematics',42,4),
(11,'Physics',38,4),
(12,'Programming',45,4),
(13,'Mathematics',95,5),
(14,'Physics',89,5),
(15,'Programming',97,5),
(16,'Mathematics',62,6),
(17,'Physics',58,6),
(18,'Programming',70,6);

-- View all students
SELECT * FROM students;

-- View all grades
SELECT * FROM grades;

-- Average marks of each student (Implicit join used here)
SELECT s.name, AVG(g.marks) AS average_marks
FROM students s, grades g
WHERE s.student_id = g.student_id
GROUP BY s.name;

-- Average marks sorted in descending according to scores (Implicit join used here)
SELECT s.name, AVG(g.marks) AS average_marks
FROM students s, grades g
WHERE s.student_id = g.student_id
GROUP BY s.name
ORDER BY average_marks DESC;

-- Department-wise average marks (Implicit join used here)
SELECT s.department, AVG(g.marks) AS dept_average
FROM students s, grades g
WHERE s.student_id = g.student_id
GROUP BY s.department;

-- Students who failed in any subject (marks < 40) (Implicit join used here)
SELECT s.name, g.subject, g.marks
FROM students s, grades g 
WHERE s.student_id = g.student_id
AND g.marks < 40;

-- Subject-wise average marks (best to worst)
SELECT subject, AVG(marks) AS average_marks
FROM grades
GROUP BY subject
ORDER BY average_marks DESC;

-- Marks of a specific student (eg: Tania Sen)
SELECT g.subject, g.marks
FROM students s, grades g
WHERE s.student_id = g.student_id
AND s.name = 'Tania Sen';
