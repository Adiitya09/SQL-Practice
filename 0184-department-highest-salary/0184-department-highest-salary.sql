# Write your MySQL query statement below

select Department.name  as Department ,  
        Employee.name   as Employee , 
         Salary 
        from Employee join Department
        on (Employee.departmentId = Department.id) 
        where salary = (
            SELECT MAX(e2.salary)
    FROM Employee e2
    WHERE e2.departmentId = Department.Id     
        );


-- SELECT emp_name, department, salary
-- FROM employees e
-- WHERE salary = (
--     SELECT MAX(salary)
--     FROM employees
--     WHERE department = e.department
-- );