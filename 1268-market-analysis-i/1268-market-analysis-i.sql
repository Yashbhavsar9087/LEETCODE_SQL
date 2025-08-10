# Write your MySQL query statement below
with cte as (select count(*) as orders_in_2019, buyer_id
from orders
where year(order_date) = 2019
group by buyer_id)

select user_id as buyer_id, join_date,  Coalesce(orders_in_2019,0) as orders_in_2019
from users u 
left join cte on u.user_id = cte.buyer_id
