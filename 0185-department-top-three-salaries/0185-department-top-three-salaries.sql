# Write your MySQL query statement below
with top as(
select d.name as Department , e.name as Employee , e.Salary as Salary,
dense_rank() OVER (PARTITION BY d.name ORDER BY salary DESC) AS rn
from Employee as e join Department as d on e.departmentId = d.id 
)

select Department, Employee, Salary from top where rn <4;