create database Employees;
use Employees;

create table Employee(
	EmpID INT,
    EmpName VARCHAR(50),
    Salary INT,
    Bonus INT );

insert into Employee (EmpID,EmpName,Salary,Bonus) values 
			(1,"Amit",70000,5000),
            (2,"Ajit",50000,3000),
            (3,"Sunil",65000,4500),
            (4,"Anil",90000,6000),
            (5,"Arun",75000,5200),
            (6,"Suresh",120000,7000);
            
Select * from Employee;
Select EmpName,Salary , Bonus,
			Salary + Bonus as Total_Salary,			-- Addition
            Salary - Bonus as Salary_After_Deduction,  -- Subtraction
            Salary * 0.10  as  Ten_percent_Salary,  -- Multiplication
            Salary / 12  as Monthly_Salary,  -- Division 
            Salary % 10000  as Reminder_Salary  -- Modulus 
	from Employee;
    
show create table Employee;

-- WHERE CLAUSE    
select* from Employee Where salary >50000 and Bonus >4500;

-- GROUP BY CLAUSE
select EmpId,EmpName, 
		max(Salary) + max(Bonus) as Total_salary 
from Employee
group by EmpId,EmpName;

-- ORDER BY CLAUSE
select Salary, Bonus ,
		Salary + Bonus as Total_Salary
	from Employee
    order by Total_Salary desc;
            
-- HAVING CLAUSE
select * from employee having salary>75000;

-- WITH CLAUSE
with large_income(EmpId,EmpName,Salary)
as ( select EmpId,Empname, Salary 
		from Employee
        Where Salary > 75000
        )
select * from large_income;


-- second highest salary 
select EmpName, salary from employee where salary =(
select distinct(salary) from Employee order by salary desc limit 1 offset 1);