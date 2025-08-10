# Write your MySQL query statement below
select stock_name, sum(new_price) as capital_gain_loss  from (select stock_name, CASE WHEN operation = 'Sell' then price ELSE -price END as new_price
from stocks) t
group by stock_name