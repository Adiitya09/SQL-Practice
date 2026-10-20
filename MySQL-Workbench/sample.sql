create database xyz;
use xyz; 

create table student(
  id int primary key,
  name varchar(50),
  roll_no int unique
);

insert into student (id, name, roll_no) 
values
(1, "ABC",01),
(2, "XYZ",02),
(3, "EFG",03),
(4, "OMN",04);

select * from student;

create table student1 (
roll_no int,
foreign key (roll_no) references student(roll_no)
);
show create table student;