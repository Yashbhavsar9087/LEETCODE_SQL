# Write your MySQL query statement below

select user_id, Concat(Upper(SUBSTRING(name, 1,1)),lower(SUBSTRING(name, 2, length(name)))) as name
from users
order by user_id
