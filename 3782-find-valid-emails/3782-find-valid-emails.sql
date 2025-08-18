# Write your MySQL query statement below
select * 
from users
where email REGEXP '^[A-Za-z0-9_]+@[A-Za-z]+\\.com$'
order by user_id