/* Write your T-SQL query statement below */
select unique_id, name 
from employees e 
left join employeeUNI EN on e.id = EN.id 
