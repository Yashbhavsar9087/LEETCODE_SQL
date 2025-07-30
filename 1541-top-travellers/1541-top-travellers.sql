/* Write your T-SQL query statement below */
select name, coalesce(sum(distance),0) as travelled_distance
from users u 
left join rides r on u.id = r.user_id
group by u.id, name
order by travelled_distance desc, name asc