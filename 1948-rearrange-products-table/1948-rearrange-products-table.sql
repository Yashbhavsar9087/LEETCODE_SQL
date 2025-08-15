# Write your MySQL query statement below

select * from (select product_id, 
case when store1 is not null then 'store1' END as Store,
case when store1 is not null then store1 END as price
from products
    union all
select product_id, 
case when store2 is not null then 'store2' END as Store,
case when store2 is not null then store2 END as price
from products
    union all
select product_id, 
case when store3 is not null then 'store3' END as Store,
case when store3 is not null then store3 END as price
from products) t
where store is not null