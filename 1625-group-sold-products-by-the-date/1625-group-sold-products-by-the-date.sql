/* Write your T-SQL query statement below */
with cte as (select distinct sell_date, product
from activities)

select sell_date, count(distinct product) as num_sold, string_agg(product, ',') within group (order by product) as products
from cte
group by sell_date
order by sell_date