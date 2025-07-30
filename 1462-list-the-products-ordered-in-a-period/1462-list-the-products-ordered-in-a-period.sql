/* Write your T-SQL query statement below */
select product_name, sum(unit) as unit 
from products p 
join orders o on p.product_id = o.product_id
where format(order_date, 'MM/yyyy') = '02/2020'
group by o.product_id, product_name
having sum(unit) >= 100
