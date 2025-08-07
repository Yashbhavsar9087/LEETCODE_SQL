# Write your MySQL query statement below

select emp.name from employee as emp
join employee as man on emp.id = man.managerid
group by man.managerid
having count(man.managerid) >= 5