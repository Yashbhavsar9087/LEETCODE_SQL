CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
    select salary from (select *, DENSE_RANK() OVER (ORDER BY salary DESC) AS dense_rank_value
    from employee) t
    where dense_rank_value = n
    limit 1
  );
END