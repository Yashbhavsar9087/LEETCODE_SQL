# Write your MySQL query statement below
select id, 
CASE when p_id is NULL then 'Root'
    when id in (select distinct p_id from tree where p_id is not null) THEN 'Inner'
    else 'Leaf' end as type
    from tree