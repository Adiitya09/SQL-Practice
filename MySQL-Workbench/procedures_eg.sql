use Employees;

--  problme 1
create procedure employees() 
select Full_name from office;

call employees();

-- problem 2 
create procedure dept()
select emp_id, FUll_Name, salary  where  department = "Technical";

call dept();

-- problem 3 
create procedure coount() 
select count(*) from office;

call coount();

-- problem 4 
create procedure highSalary()
select * from office where salary>500000;

call highSalary();

-- problem 5
create procedure AVG_sal()
select avg(salary) from office;

call AVG_sal();


-- =======================================================
-- =======================================================
-- problme 1
create procedure add_emp( in id int, Name_ varchar(10), sal int, Dept varchar(20) )
 insert into office values( emp_id = id, Full_name = Name_ , salary =sal , Department = Dept );
 
 call add_emp(111, "Yash" , 200000, "HR" );
 
-- problem 2
 create procedure incr_salary(in Dept varchar(10) )
 select Department , salary , (select (salary + salary*0.5) as incr_salary where Department= Dept ) 
 from office;
 
 call incr_salary("Technical" );
 
 -- problem 3 
 create procedure del(in id int ) 
 delete from office where emp_id = id ;
 
 call del(101);
 
 -- problem 4
 create procedure bonus(in sal int) 
 select Full_name , salary , (select (salary*0.1) from office where salary < salary = sal )  as bonus
 from office ;
 
 call bonus(500000);
 
 
 
 
