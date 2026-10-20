create database student;
use student;

create table students(student_id int ,
						First_Name varchar(10),
                        Last_Name varchar(20), 
                        Age int, 
                        City varchar(20));

insert into students values
	( 1, "Omkar","Jadhav",21, "Kolhapur" ),
    ( 2, "Vinit","Bhosale",21, "Pune" ),
    ( 3, "Rohit","Bhabire",18, "Pune" ),
    ( 4, "Anup","Ketakale",20, "Solapur" ),
    ( 5, "Pranav","Dabade",20, "Sangli" ),
    ( 6, "Varad","Dhumale",20, "Mumbai" ),
    ( 7, "Sudip","Kurundwade",18, "Mumbai" ),
	( 8, "Rohit","Patil",20, "Pune" ),
	( 9, "Joy","Kumar",17, "Panjim" ),
	( 10, "David","Bhaii",16, "Mumbai" ),
	( 11, "Jack","Sher",16, "Delhi" ),
	( 12, "Oggy","Billa",14, "Delhi" ),
    ( 13, "Shravan","Ghorapade",20, "Kolhapur" );
    
    
-- Display all student records 
select * from students;

-- Display only student names.
select First_name, Last_Name from students;

-- Show students whose age is greater than 18. 
select First_name, Age from students where Age >18;

-- Show students who live in Mumbai.
select * from students where City= "Mumbai";

-- Display names and ages of all students.
select First_Name, Age from students;

-- Find students aged between 18 and 25. 
select * from students where Age between 18 and 25;

-- Find students whose name starts with 'A'.
select * from students where First_Name like '%A';

-- Find students whose city is either Mumbai or Pune.
select * from students where City = "Mumbai" or City = "Pune";

-- Find students not living in Delhi.
select * from students where City != "Delhi";

-- Find students whose age is not 20.
select *from students where Age != 20;

-- Display students sorted by age in ascending order.-- 
Select * from students  Order by Age Asc;

-- Display students sorted by age in descending order.
select * from students Order by Age Desc;

-- Sort students alphabetically by name.
select * from students Order by First_Name Asc;

-- Display the youngest student.
select min(Age) as Youngest_Child 
from students;

-- Insert a new student record.
insert into students values (14, "chota" ," Bheem", 21,"Dholakpur");
select * from students ;

-- Update age of a specific student.
update students Set age= 15 where student_id = 3;
select * from students where student_id =3;

-- Change city of all students from Mumbai to Pune.
update students set City="Pune" where City = 'Mumbai';
select * from students;

-- Delete a student with a given ID.
delete from students where student_id=14;
select * from students;

-- Delete all students older than 30.
delete from students where age >22;
select * from students;

-- to disable safe mode
SET SQL_SAFE_UPDATES = 0;

-- to enable safe mode 
SET SQL_SAFE_UPDATES = 1;

-- students who have age more than avg 
select First_Name, age from students where age > (Select avg(age) from students) ;

Alter table students drop column course_id ;

select * from students;

-- Find students older than the average age.
select avg(age) from students;
select First_name , age from students where age > (select avg(age) from students);

-- convert all student names to uppercase 
select upper(First_Name), upper(Last_Name) from students;

-- Display first 3 char of Names
select substring(First_Name from 1 for 3) from students  ;
select left(First_Name ,3) as First_3_char from students  ;

-- find length of Names 
select length(First_Name) from students;

-- replace mumbai with Bombay
update students set City = "Bombay" where City = "Mumbai";

-- concatenate First name , Last name
select concat(First_Name," ", Last_Name) as Full_Name from students;


create table student_one( 
				id1 int, 
                Full_name varchar(20), 
                age int, gender varchar(10), 
                city varchar(20) );

INSERT INTO student_one VALUES
(101, 'Aarav Sharma', 18, 'Male', 'Mumbai'),
(102, 'Priya Patel', 20, 'Female', 'Pune'),
(103, 'Rohan Verma', 19, 'Male', 'Delhi'),
(104, 'Sneha Gupta', 21, 'Female', 'Mumbai'),
(105, 'Aditya Singh', 22, 'Male', 'Bangalore'),
(106, 'Neha Joshi', 20, 'Female', 'Pune'),
(107, 'Karan Mehta', 18, 'Male', 'Ahmedabad'),
(108, 'Ananya Rao', 19, 'Female', 'Hyderabad'),
(109, 'Rahul Kumar', 23, 'Male', 'Delhi'),
(110, 'Pooja Shah', 21, 'Female', 'Mumbai'),
(111, 'Vikram Desai', 22, 'Male', 'Pune'),
(112, 'Isha Nair', 20, 'Female', 'Kochi'),
(113, 'Arjun Patil', 19, 'Male', 'Kolhapur'),
(114, 'Meera Kulkarni', 18, 'Female', 'Nagpur'),
(115, 'Siddharth Jain', 21, 'Male', 'Jaipur'),
(116, 'Kavya Reddy', 22, 'Female', 'Hyderabad'),
(117, 'Yash Thakur', 20, 'Male', 'Mumbai'),
(118, 'Riya Mishra', 19, 'Female', 'Lucknow'),
(119, 'Harsh Agrawal', 23, 'Male', 'Indore'),
(120, 'Tanvi Chavan', 18, 'Female', 'Kolhapur'),
(121, 'Manav Kapoor', 21, 'Male', 'Chandigarh'),
(122, 'Aditi Malhotra', 20, 'Female', 'Delhi'),
(123, 'Nikhil Yadav', 22, 'Male', 'Patna'),
(124, 'Shruti More', 19, 'Female', 'Pune'),
(125, 'Devansh Saxena', 18, 'Male', 'Bhopal');

select * from student_one;

-- Find all female students.
select Full_name, gender from student_one where gender like '%Female' ;

--  Find students older than 20 years.
select Full_name , age from student_one where age>20;

-- Display students from Pune.
select Full_name, city from student_one where city like '%Pune';

-- Find students whose names end with 'n'.
select Full_name from student_one where Full_name like '%n';

-- Count total students.
select count(id1) as total_students from student_one;

-- Find average age of students.
select Full_name , avg(age) as AVG_age from student_one group by Full_name;

--  Find youngest student.
select Full_name , age from student_one  order by age asc limit 1;

-- Find oldest student.
select Full_name , age from student_one  order by age desc limit 1;

-- Count students city-wise.
select city ,count(city) as count from student_one group by city;

-- Find cities having more than 10 students.
with temp_table as ( select city ,count(city) as count from student_one group by city )
select city , count   from temp_table where count >= 2;
