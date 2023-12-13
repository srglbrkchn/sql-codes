CREATE DATABASE university;
USE university;

CREATE TABLE students(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE courses(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE student_courses (
	student_id INT NOT NULL,
    course_id INT NOT NULL,
    
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (course_id) REFERENCES courses(id)
);

INSERT INTO students(name) VALUES('Alice');
INSERT INTO students(name) VALUES('Bob');
INSERT INTO students(name) VALUES('Mimi');

INSERT INTO courses VALUES(101, 'Math');
INSERT INTO courses VALUES(102, 'History');
INSERT INTO courses VALUES(103, 'Databasy System');

INSERT INTO student_courses VALUES(1, 101);
INSERT INTO student_courses VALUES(1, 102);
INSERT INTO student_courses VALUES(2, 101);
INSERT INTO student_courses VALUES(3, 102);



SELECT students.name AS 'Student Name', courses.name AS 'Course'
FROM students JOIN student_courses ON 
students.id = student_courses.student_id
JOIN courses ON courses.id = student_courses.course_id
WHERE students.id = student_courses.student_id 
AND courses.id = student_courses.course_id;

SELECT * 
FROM courses
LEFT JOIN student_courses ON courses.id = student_courses.course_id
;

SELECT courses.name AS 'Course Not Taken'
FROM courses 
LEFT JOIN student_courses ON courses.id = student_courses.course_id
WHERE student_courses.student_id IS NULL;


SELECT students.name, 
COUNT(student_courses.student_id) AS 'Courses Taken'
FROM students
JOIN student_courses ON student_courses.student_id = students.id
GROUP BY student_courses.student_id 
ORDER BY 'Courses Taken' DESC LIMIT 1;
