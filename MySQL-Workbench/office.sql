use Employees;

create table office(emp_id int ,
					Full_Name varchar(20),
                    salary int,
                    Department varchar(20));
                    
insert into office values 
		(101, "Sudip",50000,"Technical"),
        (102, "Harry",70000,"HR Management"),
        (103, "Smith",120000,"Management"),
        (104, "ABD",700000,"Technical"),
        (105, "David",80000,"Marketing"),
        (106, "A.cook",670000,"Management"),
        (107, "J.Root",560000,"Marketing"),
        (108, "Kane",50000,"HR Management");
        
insert into office values 
		(109,"Glenn", 80000,"Technical");
        
select * from office;
-- Find the maximum salary. 
select max(salary) as max_salary from office ;

-- Find the minimum salary.
select min(salary) as min_salary from office;

-- Find the average salary.
select avg(salary) as avg_salary from office;

-- Find the total salary paid to employees. 
select sum(salary) as total_salary from office;

-- Count total employees.
select count(Full_Name) as Total_employee from office;

-- Count employees in each department.
select Department, count(Full_name) as count from office group by Department;

-- Find average salary department-wise.
select Department, avg(salary) as Avg_Salary from office group by Department;

-- Find maximum salary in each department.
select Department, max(salary) as Max_salary from office group by Department;

-- Find departments having more than 2 employees.
select Department, count(Full_Name)  as count  from office  group by Department ;

-- Find total salary of each department. 
select Department , sum(salary) as total_salary from office group by Department;

-- Find employee(s) with the highest salary.
select Full_Name from office where salary = (select max(salary) from office);

-- Find employee(s) earning more than average salary.
select Full_Name from office where salary > (select  avg(salary) from office);

-- Find second highest salary.
select Full_Name, salary from office where salary =(
select distinct salary from office order by salary desc limit 1 OFFSET 1 );

-- Sorted salaries:
-- 90000  ← Highest (Offset skips this)
-- 80000  ← Returned by LIMIT 1
-- 70000
-- 60000



-- to disable safe mode
SET SQL_SAFE_UPDATES = 0;

-- to enable safe mode 
SET SQL_SAFE_UPDATES = 1;



-- Find employees from the department having highest average salary.
-- select Full_Name from office where  salary = (
select distinct( Department), Full_name ,max(salary) as max_salary
from office group by Department;

update   office set salary =  700000 where emp_id=106 ;

select max(salary) from office where salary< (select Max(salary) from office);


-- select 3rd max salary
select  Full_Name, salary from office where salary = (
select distinct(salary) from office order by salary desc limit 1 offset 2);

select (salary), Full_Name from office order by salary desc limit 2 OFFSET 0 ;

-- Windows Fun 
select Full_Name , salary , sum(salary) over(order by salary asc ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW ) as Total_sum from office ;
select FUll_Name, salary, avg(salary) from office group by FUll_Name , salary;
select Full_Name , salary, avg(salary) over() from office;

-- Partiotion 
select Full_Name,department , sum(salary) over(partition by department order by Department asc) as total from office;

select Full_Name , department from office order by department asc;

select salary , dense_rank() over(order by salary Asc) as rank_ from office; 
select Full_name, department, rank() over(partition by Department order by Full_name asc) as rank_ from office; 
select salary , row_number() over(order by salary Asc) as rank_ from office; 

select  distinct(department), max(salary) over(partition by Department ) as max_salary from office;


-- Temporary table

create temporary table temp_table(
name_ varchar(10),
last_name varchar(20),
salary int 
);




create temporary table salary_over_1_lac
select * from office where salary>100000;

select* from salary_over_1_lac;

-- Procedures 
create procedure large_salaries() 
select * from office where salary>=100000;

call large_salaries();

-- procedure 2 
create procedure small_salaries()
select * from office where salary <100000;
select * from office where salary between 100000 and  500000;

call small_salaries();

--  procedure 3
create procedure Big_salary()
select Full_Name,salary from office where salary >= 100000;

call Big_salary;

DELIMITER $$

call Big_salary();

-- procedure 4 
create procedure Big_salary2(in min_Sa int)
	select Full_Name,salary from office where salary >=  min_Sa ;
DELIMITER $$

call Big_salary(100000);

-- Procedure input 
DELIMITER $$
CREATE PROCEDURE Salary_min(IN id INT)
BEGIN
    SELECT salary
    FROM office
    WHERE emp_id = id;
END $$

DELIMITER ;
CALL Salary_min(101);




