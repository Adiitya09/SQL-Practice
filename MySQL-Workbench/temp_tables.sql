use Employees;


-- problem 1
create temporary table high_salary 
select * from Employee where salary >50000;

select * from high_salary;

-- problem 2
create temporary table TOp5
select EmpName , salary from Employee order by salary desc limit 5;

select * from TOp5;

-- problem 3
create temporary table Dept_emp 
select * from office where Department="HR Management";

select * from Dept_emp;

-- problme 4
