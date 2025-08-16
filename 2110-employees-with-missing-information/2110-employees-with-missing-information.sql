# Write your MySQL query statement below
select employee_id from (select distinct employee_id 
from employees

union all 

select distinct employee_id 
from salaries) t 
group by employee_id
having count(employee_id) = 1
order by employee_id asc
