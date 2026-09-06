# Write your MySQL query statement below

with last as (
    select person_name, Turn, sum(weight) over(order by turn) as total_weight 
    from Queue 
    
)
select person_name from last where total_weight <= 1000 order by turn desc  limit 1;
