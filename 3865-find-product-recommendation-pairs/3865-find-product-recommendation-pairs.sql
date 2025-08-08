# Write your MySQL query statement below
with cte3 as (
    select c1.user_id, c1.product_id as product1_id, c2.product_id as product2_id, count(*) as customer_count  from ProductPurchases  c1 join ProductPurchases  c2 on c1.user_id = c2.user_id and c1.product_id < c2.product_id
    group by product1_id, product2_id 
    having count(*) >= 3
)

select product1_id, product2_id, pro.category as product1_category, pro1.category as product2_category,  customer_count from cte3
left join ProductInfo pro on cte3.product1_id = pro.product_id
left join ProductInfo pro1 on cte3.product2_id = pro1.product_id
order by customer_count desc, product1_id, product2_id
