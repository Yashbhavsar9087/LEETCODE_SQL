# Write your MySQL query statement below



select pr.employee_id, name,  (pr2.rating - pr.rating) as improvement_score
from
    (select employee_id, review_date, rating, row_number() over(partition by employee_id order by review_date desc) as rn
    from performance_reviews) pr
join performance_reviews pr1 on pr.employee_id = pr1.employee_id and pr.review_date < pr1.review_date and pr.rating < pr1.rating
join performance_reviews pr2 on pr1.employee_id = pr2.employee_id and pr1.review_date < pr2.review_date and pr1.rating < pr2.rating
join employees e on pr.employee_id = e.employee_id
where rn between 1 and 3
group by employee_id
order by improvement_score desc, name asc
