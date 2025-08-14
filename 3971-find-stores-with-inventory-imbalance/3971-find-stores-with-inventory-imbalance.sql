WITH cte AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY store_id ORDER BY price) AS rn
    FROM inventory
),
min_max_value as (SELECT store_id,
       MIN(rn) AS min_rn,
       MAX(rn) AS max_rn,
       count(distinct product_name) as distinct_product
FROM cte
GROUP BY store_id
having count(distinct product_name) > 2)

select cte.store_id, s.store_name, s.location,cte2.product_name as most_exp_product, cte.product_name as cheapest_product, ROUND((cte.quantity/cte2.quantity)*1.0,2) as imbalance_ratio  from min_max_value mm
join cte on cte.store_id = mm.store_id and cte.rn = mm.min_rn
join cte as cte2 on cte2.store_id = mm.store_id and cte2.rn = mm.max_rn
join stores s on cte.store_id = s.store_id

where (max_rn > min_rn) and (cte2.quantity < cte.quantity)

order by imbalance_ratio desc, store_name asc
