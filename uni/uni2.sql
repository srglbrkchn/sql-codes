SELECT * FROM student_courses;

SELECT courses.name as 'Course Name',
COUNT(student_courses.course_id) AS 'Students' 
FROM courses
JOIN student_courses ON courses.id = student_courses.course_id
GROUP BY student_courses.course_id 
HAVING Students > 1;

DELETE FROM courses
WHERE id = 103;

SELECT s.name AS 'Student Name'
FROM students s
WHERE NOT EXISTS (
    SELECT c.id
    FROM courses c
    WHERE NOT EXISTS (
        SELECT sc.course_id
        FROM student_courses sc
        WHERE sc.student_id = s.id AND sc.course_id = c.id
    )
);

SELECT s.name AS 'Student Name'
FROM students
WHERE NOT EXISTS(
	SELECT c.id
    FROM courses c
    WHERE NOT EXISTS (
		SELECT sc.course_id
        FROM student_courses sc
        WHERE sc.student_id = s.id AND sc.course_id = c.id
    )
);
