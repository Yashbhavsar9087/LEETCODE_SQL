# Write your MySQL query statement below
select employee_id, 
CASE 
    when (employee_id % 2 = 0) or name like 'M%' THEN 0 
    ELSE salary
END as bonus
from employees
order by employee_id