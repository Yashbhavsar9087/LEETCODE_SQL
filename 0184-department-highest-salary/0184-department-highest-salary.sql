# Write your MySQL query statement below
select Department, Employee, Salary from 
(select e.name as Employee, d.name as Department,  Salary, dense_rank() over(partition by departmentID order by salary desc) as dr from 
employee e join department d on e.departmentID = d.ID) cte 
where dr = 1