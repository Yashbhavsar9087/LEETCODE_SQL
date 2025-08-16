Select Department , Employee, Salary from (Select e.name as employee, d.name as Department, dense_rank() over(partition by departmentID order by salary desc) as rn, Salary  from employee e
join Department d on e.departmentID = d.id ) t 
where rn < 4

order by Department, Salary
