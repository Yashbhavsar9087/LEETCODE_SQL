/* Write your T-SQL query statement below */
with cte as (
    select *, row_number() over(partition by email order by id) as rn
    from person
)
DELETE from cte 
where rn > 1 