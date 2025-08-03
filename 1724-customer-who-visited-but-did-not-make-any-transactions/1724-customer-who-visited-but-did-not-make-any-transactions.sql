# Write your MySQL query statement below
select customer_id, count(customer_id) as count_no_trans 
from (select customer_id, v.visit_id from visits v
left join transactions t 
on v.visit_id = t.visit_id
where t.visit_id is NULL) cte
group by customer_id
