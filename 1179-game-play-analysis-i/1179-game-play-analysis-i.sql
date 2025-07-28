/* Write your T-SQL query statement below */
select player_id, event_date as first_login 
from
(select *, row_number() over(partition by player_id order by event_date asc) as rn
from activity) cte
where rn = 1