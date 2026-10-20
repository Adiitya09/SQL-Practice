create database employee;
use employee;

create table employee1(
		emp_Id int,
		emp_Name varchar(20),
        emp_city varchar(10),
        emp_country varchar(10),
		emp_salary int ) ;
        
insert into employee1 values 
		(1, "Sudip","Mumbai","India",50000),
        (2, "Harry","London","UK",70000),
        (3, "Smith","Sydney","Australia",120000),
        (4, "ABD","Capetown","SA",700000),
        (5, "David","Melborn","Australia",80000),
        (6, "A.cook","London","UK",670000),
        (7, "J.Root","London","UK",560000),
        (8, "Kane","Wellingdon","NZ",50000);
        
-- AND operator
select * from employee1
  where emp_city="London" and emp_country="UK";
  
-- OR operator 
select * from employee1 
	where emp_city="London" or emp_country="Australia";
    
-- NOT operator
select * from employee1
	where emp_city not like 'L%';
    
-- LIKE operator 
select * from  employee1
	where emp_city like 'L%';
    
-- IN operator 
select * from employee1
	where emp_city in ('London','Mumbai');
    
-- BETWEEN operator
select emp_name,emp_salary from employee1
	where emp_salary between 500000 and 1000000;

-- ALL operator
select * from employee1
	where emp_city ='London'
    and emp_Id <= all(
			select emp_Id from employee1
				where emp_city='London' 
                );
                
-- SOME operator
select * from employee1
	where emp_Id <= some(
			select emp_Id from employee1
				where emp_name="Sudip"
                );
                
-- EXIST operator 
select emp_name from employee1
	where exists(
		select emp_Id from employee1
			where emp_city="London"
            );
            
-- ANY operator 
select * from employee1
	where emp_Id between 3 and 6
    and emp_Id <= any(
		select emp_Id from employee1
			where emp_Id between 3 and 6
            );