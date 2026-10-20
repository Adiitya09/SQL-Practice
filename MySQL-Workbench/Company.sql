CREATE DATABASE CompanyDB;
USE CompanyDB;

CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    salary INT,
    hire_date DATE,
    city VARCHAR(30),
    age INT
);

INSERT INTO Employee VALUES
(101,'Rahul','HR',45000,'2021-05-12','Mumbai',28),
(102,'Priya','IT',75000,'2023-01-18','Pune',25),
(103,'Amit','Finance',68000,'2020-11-02','Delhi',31),
(104,'Sneha','IT',92000,'2022-08-15','Mumbai',29),
(105,'Karan','Sales',55000,'2024-02-10','Nagpur',24),
(106,'Anjali','HR',48000,'2023-04-11','Pune',27),
(107,'Rohit','Marketing',61000,'2021-09-22','Delhi',30),
(108,'Neha','Finance',81000,'2022-06-01','Mumbai',32),
(109,'Vikas','Sales',46000,'2023-12-20','Nagpur',26),
(110,'Pooja','IT',88000,'2021-03-08','Pune',33),
(111,'Arjun','Marketing',53000,'2024-01-15','Mumbai',25),
(112,'Meera','Finance',73000,'2022-10-19','Delhi',29),
(113,'Sahil','HR',39000,'2023-07-25','Pune',24),
(114,'Nisha','IT',97000,'2024-05-12','Mumbai',27),
(115,'Rakesh','Sales',62000,'2020-12-18','Delhi',35);



CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    emp_id INT,
    customer_name VARCHAR(50),
    product VARCHAR(50),
    quantity INT,
    price DECIMAL(10,2),
    order_date DATE,
    FOREIGN KEY (emp_id) REFERENCES Employee(emp_id)
);

INSERT INTO Orders VALUES
(1001,102,'Rohan','Laptop',1,65000,'2024-01-15'),
(1002,104,'Aisha','Mobile',2,25000,'2024-01-20'),
(1003,105,'Vikram','Printer',1,12000,'2024-02-05'),
(1004,102,'Neel','Keyboard',3,2000,'2024-02-08'),
(1005,108,'Anita','Monitor',2,15000,'2024-02-15'),
(1006,110,'Sanjay','Laptop',1,70000,'2024-03-01'),
(1007,114,'Kavya','Tablet',2,18000,'2024-03-10'),
(1008,115,'Arun','Mouse',5,800,'2024-03-18'),
(1009,104,'Pooja','Mobile',1,27000,'2024-04-05'),
(1010,108,'Rahul','Laptop',2,68000,'2024-04-18'),
(1011,110,'Snehal','Monitor',1,16000,'2024-05-02'),
(1012,105,'Riya','Printer',2,11500,'2024-05-10'),
(1013,114,'Kiran','Laptop',1,72000,'2024-05-18'),
(1014,102,'Megha','Headphones',4,3000,'2024-06-01'),
(1015,104,'Yash','Mobile',3,26000,'2024-06-15'),
(1016,108,'Nikhil','Keyboard',2,2200,'2024-06-22'),
(1017,115,'Sonal','Monitor',2,15500,'2024-07-01'),
(1018,110,'Ajay','Laptop',1,69000,'2024-07-10'),
(1019,102,'Anjali','Tablet',1,17500,'2024-07-15'),
(1020,114,'Ritesh','Mobile',2,28000,'2024-07-25');


CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    department_name VARCHAR(30) UNIQUE,
    manager_name VARCHAR(50),
    location VARCHAR(30),
    budget DECIMAL(12,2),
    total_employees INT
);


INSERT INTO Department VALUES
(1, 'HR',        'Sunita Sharma',   'Mumbai',   1200000.00, 3),
(2, 'IT',        'Rajesh Mehta',    'Pune',     5000000.00, 4),
(3, 'Finance',   'Anil Verma',      'Delhi',    3500000.00, 3),
(4, 'Sales',     'Priyanka Joshi',  'Nagpur',   2800000.00, 3),
(5, 'Marketing', 'Vivek Kulkarni',  'Delhi',    2200000.00, 2),
(6, 'Operations','Kiran Patil',     'Bengaluru',3000000.00, 0);



-- ##########
-- Basic Queries 
--  ###########

-- 1.Find employees earning more than ₹50,000. 

select * from Employee where salary> 50000;

-- 2. Display the top 5 highest-paid employees. 
select * from Employee order by salary desc limit 5;

-- 3. Retrieve customers whose names start with 'A'.
select * from Employee where emp_name like "A%" ;

-- 4. Find products priced between ₹500 and ₹2,000.
select * from Employee where salary between 40000 and  80000; 

-- 5. Display employees hired after 2022.
select * from Employee where hire_date > "2022-01-01" ; 

-- 6. Show students ordered by marks (highest to lowest).
select * from Employee order by age desc;

-- 7.Find all orders placed in the last 30 days.
select *  from Employee where hire_date >  dateadd(day,-30,getdate()); 

-- ##########
-- Aggregate Functions & GROUP BY
-- ##########

-- 1. Count employees in each department.
select department , count(emp_id) from Employee group by department;

-- 2. Find the average salary by department.
select department , avg(salary) from Employee group by department;

-- 3.Find the maximum salary in each department.
select department , max(salary) from Employee group by department;

-- 4. Find departments with more than 10 employees.
select department , count(emp_id) as count from Employee where (select count(emp_id) from Employee)   > 2 group by department ;

-- 5. Calculate total sales for each month.
select hire_date , sum(salary) as Total_salary from Employee  group by hire_date ;

-- 6. Find the highest-selling product.
select department ,count(emp_id) from Employee group by department  order by (select count(emp_id) from Employee) desc  limit 1;

-- 7 Find customers who placed more than 5 orders.


-- ############
-- Joins
-- ############

-- 1  Employee and Department Details.
select emp_name , department_name , manager_name from Employee join Department on (Employee.department = Department.department_name);

-- 2. Customers who never placed an order.
select customer_name from Orders where quantity is null;

-- 3. Products never sold.


-- 4.Orders with customer names. 
select emp_name , product from Employee join Orders on (Employee.emp_id = Orders.emp_id) ;

-- 5.Employees with their managers (Self Join).
select emp_name, manager_name from Employee join Department on (Employee.department = Department.department_name);

-- 6. Students with enrolled courses.


-- 7. Full list of customers and orders.
select distinct(product), emp_name  from Employee join Orders on (Employee.emp_id = Orders.emp_id) ;


-- ####################
-- Subqueries
-- ####################

-- 1.Employees earning above average salary.
select emp_name , salary from Employee where salary > ( select avg(salary) from Employee); 

-- 2. Second highest salary.
select  max(salary) from Employee where salary < (select max(salary) from Employee ) ;

-- 3. Products priced above average.
select product, price from Orders where price > (select avg(price) from Orders ) ;

-- 4. Customers who spent the most.


-- 5. Departments with highest average salary.
select department, avg(salary) from Employee where salary > (select avg(salary) from Employee) group by department; 

-- 6. Find employees working in the same department as "John".
select emp_name , department from Employee where department = (select department from Employee where emp_name like "Priya" );

-- 7. Orders greater than average order amount.
select product , price from Orders where price > (select avg(price) from Orders) ;


-- ################
-- Window Functions
-- ################

-- 1. Rank employees by salary.
select emp_name, salary, Rank() over (order by salary desc) as rank_ from Employee ;

-- 2. Dense Rank employees.
select emp_name , department, dense_rank() over() as dence_rank from Employee ;

-- 3. Row Number for each department.
select emp_name, salary , department, row_number() over(partition by department) as _rank from Employee ;

-- 4. Running total of sales.
select emp_name, salary , sum(salary) over(order by salary desc) as runnnig_total from Employee ; 

-- 5. Moving average of sales.
select emp_name , salary , avg(salary) over(order by salary desc) as avg_salary from Employee; 

-- 6. Next salary using LEAD.
select emp_name, salary , lead(salary) over(order by salary desc) as lead_salary from Employee; 


-- ###################
-- Common Table Expressions
-- ###################

-- 1. Average salary using CTE.
with agv_salary as (
select avg(salary) as Avg_salary from Employee ) 
select * from agv_salary ;

-- 2. Top 3 salaries per department.
with top_salary as (
select department , salary , dense_rank() over(partition by department order by salary desc) as rank_ from Employee order by department )
select * from top_salary where rank_ <=3;

-- 3. Running totals using CTE.
with total as (
select emp_name, salary , sum(salary) over( order by salary asc)as total from Employee  )
select * from total;

-- 4. 




