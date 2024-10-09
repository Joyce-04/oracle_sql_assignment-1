



--Creating database tables

CREATE TABLE Students (student_id INT PRIMARY KEY, first_name VARCHAR(50),last_name VARCHAR(50), date_of_birth DATE,gender VARCHAR(10));
CREATE TABLE Courses (course_id INT PRIMARY KEY,course_name VARCHAR(100), course_code VARCHAR(10) UNIQUE);
CREATE TABLE Teachers (teacher_id INT PRIMARY KEY,first_name VARCHAR(50),last_name VARCHAR(50),subject VARCHAR(50) );
CREATE TABLE Enrollments (enrollment_id INT PRIMARY KEY,student_id INT,course_id INT,enrollment_date DATE,FOREIGN KEY (student_id) REFERENCES Students(student_id),FOREIGN KEY (course_id) REFERENCES Courses(course_id));
CREATE TABLE CourseTeachers (course_teacher_id INT PRIMARY KEY, course_id INT, teacher_id INT,FOREIGN KEY (course_id) REFERENCES Courses(course_id), FOREIGN KEY (teacher_id) REFERENCES Teachers(teacher_id)
);

--Inserting data into tables
 
INSERT INTO Students (student_id, first_name, last_name, date_of_birth, gender)
VALUES (1, 'Mutesi', 'Noella', TO_DATE('2005-04-12', 'YYYY-MM-DD'), 'Female');

INSERT INTO Students (student_id, first_name, last_name, date_of_birth, gender)
VALUES (2, 'NSHUTI', 'Kevin', TO_DATE('2002-03-11', 'YYYY-MM-DD'), 'Male');

INSERT INTO Students (student_id, first_name, last_name, date_of_birth, gender)
VALUES (3, 'UMUTONI', 'Ornella', TO_DATE('2002-03-11', 'YYYY-MM-DD'), 'Female');

INSERT INTO Courses (course_id, course_name, course_code)
VALUES (4, 'PLsql', '123');

INSERT INTO Courses (course_id, course_name, course_code)
VALUES (5, 'DBMS', '345');

INSERT INTO Courses (course_id, course_name, course_code)
VALUES (6, 'Networks', '678');

INSERT INTO CourseTeachers (course_teacher_id, course_id, teacher_id)
VALUES (1, 4, 7);  -- PLsql taught by Eric Maniraguha

INSERT INTO CourseTeachers (course_teacher_id, course_id, teacher_id)
VALUES (2, 5, 8);  -- DBMS taught by Jean Claude Turiho

INSERT INTO CourseTeachers (course_teacher_id, course_id, teacher_id)
VALUES (3, 6, 9);  -- Networks taught by Isaac Shema

INSERT INTO Teachers (teacher_id, first_name, last_name, subject)
VALUES (7, 'Eric', 'Maniraguha', 'PL');

INSERT INTO Teachers (teacher_id, first_name, last_name, subject)
VALUES (8, 'Jean Claude', 'Turiho', 'DBMS');

INSERT INTO Teachers (teacher_id, first_name, last_name, subject)
VALUES (9, 'Isaac', 'Shema', 'Nets');

INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date)
VALUES (1, 1, 4, TO_DATE('2023-09-01', 'YYYY-MM-DD'));  -- Enroll student 1 in course 4 (PLsql)

INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date)
VALUES (2, 2, 5, TO_DATE('2023-09-01', 'YYYY-MM-DD'));  -- Enroll student 2 in course 5 (DBMS)

INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date)
VALUES (3, 3, 6, TO_DATE('2023-09-01', 'YYYY-MM-DD'));  -- Enroll student 3 in course 6 (Networks)


--Updating tables


UPDATE Students SET last_name = 'Ishimwe' WHERE student_id = 1;
UPDATE Courses SET course_name = 'Advanced PL/SQL' WHERE course_id = 4;
UPDATE Teachers SET first_name = 'Emmanuel' WHERE teacher_id = 7;
UPDATE Enrollments SET enrollment_date = TO_DATE('2023-10-01', 'YYYY-MM-DD') WHERE enrollment_id = 1;
UPDATE Students SET first_name = 'Elvis', last_name = 'Mugisha' WHERE student_id = 2;
UPDATE Courses SET course_name = 'Computer Networks', course_code = 'NET101' WHERE course_id = 6;

DELETE FROM Students WHERE student_id = 1;
DELETE FROM Courses WHERE course_id = 4;
DELETE FROM Teachers WHERE teacher_id = 7;
DELETE FROM Enrollments WHERE enrollment_id = 1; 
DELETE FROM Students WHERE first_name = 'NSHUTI' AND last_name = 'Kevin'; --Delete a Student by First Name and Last Name

SELECT S.student_id, S.first_name, S.last_name, C.course_name, C.course_code, E.enrollment_date 
FROM Students S JOIN Enrollments E ON S.student_id = E.student_id JOIN Courses C ON E.course_id = C.course_id;

SELECT S.student_id, S.first_name, S.last_name, C.course_name, T.first_name AS teacher_first_name, T.last_name AS teacher_last_name
FROM Students S
JOIN Enrollments E ON S.student_id = E.student_id
JOIN Courses C ON E.course_id = C.course_id
JOIN CourseTeachers CT ON C.course_id = CT.course_id
JOIN Teachers T ON CT.teacher_id = T.teacher_id;

SELECT S.student_id, S.first_name, S.last_name, C.course_name, T.first_name AS teacher_first_name, T.last_name AS teacher_last_name
FROM Students S
JOIN Enrollments E ON S.student_id = E.student_id
JOIN Courses C ON E.course_id = C.course_id
JOIN CourseTeachers CT ON C.course_id = CT.course_id
JOIN Teachers T ON CT.teacher_id = T.teacher_id;
SELECT S.student_id, S.first_name, S.last_name, C.course_name, T.first_name AS teacher_first_name, T.last_name AS teacher_last_name
FROM Students S
JOIN Enrollments E ON S.student_id = E.student_id
JOIN Courses C ON E.course_id = C.course_id
JOIN CourseTeachers CT ON C.course_id = CT.course_id
JOIN Teachers T ON CT.teacher_id = T.teacher_id;

SELECT T.first_name, T.last_name, C.course_name, C.course_code
FROM Teachers T
JOIN CourseTeachers CT ON T.teacher_id = CT.teacher_id
JOIN Courses C ON CT.course_id = C.course_id;

SELECT E.enrollment_id, S.first_name AS student_first_name, S.last_name AS student_last_name,
       C.course_name, C.course_code, T.first_name AS teacher_first_name, T.last_name AS teacher_last_name, E.enrollment_date
FROM Enrollments E
JOIN Students S ON E.student_id = S.student_id
JOIN Courses C ON E.course_id = C.course_id
JOIN CourseTeachers CT ON C.course_id = CT.course_id
JOIN Teachers T ON CT.teacher_id = T.teacher_id;

-- Create tables
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    gender VARCHAR(10)
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    course_code VARCHAR(10) UNIQUE
);

CREATE TABLE Teachers (
    teacher_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    subject VARCHAR(50)
);

CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

CREATE TABLE CourseTeachers (
    course_teacher_id INT PRIMARY KEY,
    course_id INT,
    teacher_id INT,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id),
    FOREIGN KEY (teacher_id) REFERENCES Teachers(teacher_id)
);

--DDL
-- Insert data into Students
INSERT INTO Students (student_id, first_name, last_name, date_of_birth, gender)
VALUES (1, 'Mutesi', 'Noella', TO_DATE('2005-04-12', 'YYYY-MM-DD'), 'Female');

INSERT INTO Students (student_id, first_name, last_name, date_of_birth, gender)
VALUES (2, 'NSHUTI', 'Kevin', TO_DATE('2002-03-11', 'YYYY-MM-DD'), 'Male');

INSERT INTO Students (student_id, first_name, last_name, date_of_birth, gender)
VALUES (3, 'UMUTONI', 'Ornella', TO_DATE('2002-03-11', 'YYYY-MM-DD'), 'Female');

-- Insert data into Courses
INSERT INTO Courses (course_id, course_name, course_code)
VALUES (4, 'PLsql', '123');

INSERT INTO Courses (course_id, course_name, course_code)
VALUES (5, 'DBMS', '345');

INSERT INTO Courses (course_id, course_name, course_code)
VALUES (6, 'Networks', '678');

-- Insert data into Teachers
INSERT INTO Teachers (teacher_id, first_name, last_name, subject)
VALUES (7, 'Eric', 'Maniraguha', 'PL');

INSERT INTO Teachers (teacher_id, first_name, last_name, subject)
VALUES (8, 'Jean Claude', 'Turiho', 'DBMS');

INSERT INTO Teachers (teacher_id, first_name, last_name, subject)
VALUES (9, 'Isaac', 'Shema', 'Nets');

-- Insert data into CourseTeachers
INSERT INTO CourseTeachers (course_teacher_id, course_id, teacher_id)
VALUES (1, 4, 7);  -- PLsql taught by Eric Maniraguha

INSERT INTO CourseTeachers (course_teacher_id, course_id, teacher_id)
VALUES (2, 5, 8);  -- DBMS taught by Jean Claude Turiho

INSERT INTO CourseTeachers (course_teacher_id, course_id, teacher_id)
VALUES (3, 6, 9);  -- Networks taught by Isaac Shema

-- Insert data into Enrollments
INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date)
VALUES (1, 1, 4, TO_DATE('2023-09-01', 'YYYY-MM-DD'));  -- Enroll student 1 in course 4 (PLsql)

INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date)
VALUES (2, 2, 5, TO_DATE('2023-09-01', 'YYYY-MM-DD'));  -- Enroll student 2 in course 5 (DBMS)

INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date)
VALUES (3, 3, 6, TO_DATE('2023-09-01', 'YYYY-MM-DD'));  -- Enroll student 3 in course 6 (Networks)

--TCL
BEGIN;
UPDATE Students SET last_name = 'Ishimwe' WHERE student_id = 1;
UPDATE Courses SET course_name = 'Advanced PL/SQL' WHERE course_id = 4;
UPDATE Teachers SET first_name = 'Emmanuel' WHERE teacher_id = 7;
COMMIT;
ROLLBACK;
--DML
SELECT S.student_id, S.first_name, S.last_name, C.course_name, C.course_code, E.enrollment_date 
FROM Students S 
JOIN Enrollments E ON S.student_id = E.student_id 
JOIN Courses C ON E.course_id = C.course_id;

-- Select data with teacher information
SELECT S.student_id, S.first_name, S.last_name, C.course_name, T.first_name AS teacher_first_name, T.last_name AS teacher_last_name
FROM Students S
JOIN Enrollments E ON S.student_id = E.student_id
JOIN Courses C ON E.course_id = C.course_id
JOIN CourseTeachers CT ON C.course_id = CT.course_id
JOIN Teachers T ON CT.teacher_id = T.teacher_id;

SELECT S.student_id, S.first_name, S.last_name
FROM Students S
JOIN Enrollments E ON S.student_id = E.student_id
WHERE E.course_id = 4; -- Change the course_id as needed

-- Insert new record into Students
INSERT INTO Students (student_id, first_name, last_name, date_of_birth, gender)
VALUES (5, 'Giselle', 'Amani', TO_DATE('2003-07-20', 'YYYY-MM-DD'), 'Female');

-- Update the first name of the newly added student
UPDATE Students
SET first_name = 'Gigi'
WHERE student_id = 5;

-- Select all students to verify the insert and update
SELECT * FROM Students;

-- Delete the student we just added
DELETE FROM Students
WHERE student_id = 5;

--RIGHT JOIN
SELECT S.student_id, S.first_name, S.last_name, C.course_name
FROM Students S
JOIN Enrollments E ON S.student_id = E.student_id
JOIN Courses C ON E.course_id = C.course_id;

-- LEFT JOIN
SELECT S.student_id, S.first_name, S.last_name, C.course_name
FROM Students S
LEFT JOIN Enrollments E ON S.student_id = E.student_id
LEFT JOIN Courses C ON E.course_id = C.course_id;
 
--FULL JOIN
SELECT S.first_name, S.last_name, C.course_name
FROM Students S
FULL OUTER JOIN Enrollments E ON S.student_id = E.student_id
FULL OUTER JOIN Courses C ON E.course_id = C.course_id;

--SIMPLE SUBQUERY
SELECT S.student_id, S.first_name, S.last_name
FROM Students S
WHERE S.student_id IN (
    SELECT E.student_id
    FROM Enrollments E
    JOIN CourseTeachers CT ON E.course_id = CT.course_id
    WHERE CT.teacher_id = 7  -- Example teacher_id
);
--SUBQUERY IN SELECT STATEMENT
SELECT S.first_name, S.last_name,
       (SELECT COUNT(*)
        FROM Enrollments E
        WHERE E.student_id = S.student_id) AS enrollment_count
FROM Students S;
--CORRELATED SUBQUERY
SELECT S.first_name, S.last_name
FROM Students S
WHERE (
    SELECT COUNT(*)
    FROM Enrollments E
    WHERE E.student_id = S.student_id
) > (
    SELECT AVG(enrollment_count)
    FROM (
        SELECT COUNT(*) AS enrollment_count
        FROM Enrollments
        GROUP BY student_id
    )
);






--Selecting from tables


select * from students;
select * from courses;
select * from teachers;
select * from enrollments;































