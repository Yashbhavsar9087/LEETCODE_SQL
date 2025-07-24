/* Write your T-SQL query statement below */
select p.product_id, 
CASE WHEN sum(coalesce(units,0)) = 0 THEN 0 
ELSE ROUND(sum(price*units*1.0)/sum(units),2) 
END as average_price from 
prices p 
left join unitssold us on 
(p.product_id = us.product_id) and 
(us.purchase_date between p.start_date and p.end_date)
group by p.product_id