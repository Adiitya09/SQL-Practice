use student;

CREATE TABLE Student_Courses (
    student_id INT,
    course_id INT,
    course_name VARCHAR(50),
    course_credit INT
);

INSERT INTO Student_Courses VALUES
(1, 101, 'Java', 4),
(2, 102, 'Python', 3),
(3, 103, 'SQL', 3),
(4, 101, 'Java', 4),
(5, 102, 'Python', 3),
(6, NULL, NULL, NULL),
(7, 103, 'SQL', 3),
(8, NULL, NULL, NULL),
(9, 104, 'Web Development', 4),
(10, 105, 'Data Science', 5),
(11, 101, 'Java', 4),
(12, 103, 'SQL', 3),
(13, 104, 'Web Development', 4),
(14, 105, 'Data Science', 5);


alter table Student_courses rename column Student_id to S_id;
select * from student_courses;

-- Display student names with their course names.
select First_name, Last_Name , course_name from students join Student_courses on (student_id = S_id);

-- Show all students even if they are not enrolled in a course.-- 
select First_name from students;

-- Show all courses even if no student is enrolled.
select course_Name from Student_courses;

-- Count students in each course.
select	course_name, count(S_id) 
from Student_courses group by course_name;

-- Find students enrolled in "Java".
select First_Name, Last_name
 from students join Student_courses on (student_id = S_id)
 where course_name= 'Java' ;




