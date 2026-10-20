create database Aggfun;
use Aggfun;


create table employee2(
		emp_Id int,
		emp_Name varchar(20),
        emp_city varchar(10),
        emp_country varchar(10),
		emp_salary int ) ;
        
insert into employee2 values 
		(1, "Sudip","Mumbai","India",50000),
        (2, "Harry","London","UK",70000),
        (3, "Smith","Sydney","Australia",120000),
        (4, "ABD","Capetown","SA",70000),
        (5, "David","Melborn","Australia",80000),
        (6, "A.cook","London","UK",670000),
        (7, "J.Root","London","UK",560000),
        (8, "Kane","Wellingdon","NZ",50000);
select * from employee2;
insert into employee2(emp_ID, emp_Name, emp_city, emp_country, emp_salary) values
(9, "Dube", "Mumbai", "India", 450000);
select * from employee2;

-- Aggregate Function

-- SUM 
select sum(emp_salary) as Total_Salary from employee2;
select sum(distinct emp_salary) as accurate_salary from employee2;

-- count 
select count(*) as total_records from employee2;
select count(emp_salary) as total_num_salary from employee2;
select count(distinct emp_salary) as accurate_salary from employee2;

-- AVG 
select avg(emp_salary) as avg_salary from employee2;
select avg(distinct emp_salary) as dist_salary from employee2;

-- MIN & MAX 
select min(emp_salary) as min_salary ,max(emp_salary) as max_salary from employee2;
select max(emp_salary) as max_salary from employee2;

alter table employee2 rename to Employee;
select * from Employee;
UPDATE Employee
SET emp_salary = 65600
WHERE emp_Name = 'Kane';

SELECT *
FROM Employee
WHERE emp_Name = 'Kane';


