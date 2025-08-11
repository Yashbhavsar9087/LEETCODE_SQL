# Write your MySQL query statement below
select season, category, total_quantity, total_revenue from (select season, category, sum(quantity) as total_quantity, sum(quantity*price)*1.00 as total_revenue, row_number() over(partition by season order by sum(quantity) desc, sum(quantity*price) desc ) as rn
from (select  category, quantity, price,
CASE 
    WHEN month(sale_date) in(01,02,12) THEN 'Winter' 
    WHEN month(sale_date) in (03,04,05) THEN 'Spring'
    WHEN month(sale_date) in (06,07,08) THEN 'Summer'
    ELSE 'Fall'
END as season
from
sales 
join products p on sales.product_id = p.product_id) t 
group by category, season) cte
where rn = 1

