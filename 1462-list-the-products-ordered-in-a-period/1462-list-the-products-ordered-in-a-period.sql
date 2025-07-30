/* Write your T-SQL query statement below */
select product_name, sum(unit) as unit 
from products p 
join orders o on p.product_id = o.product_id
where year(order_date) = 2020 and month(order_date) = 02
group by o.product_id, product_name
having sum(unit) >= 100
