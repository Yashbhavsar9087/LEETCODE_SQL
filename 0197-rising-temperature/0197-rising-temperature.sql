select id from 
(select *, lag(recordDate) over(order by recorddate) as previous_value, dateadd(day, -1, recorddate) as yestersday_date, lag(temperature) over(order by recorddate) as previous_temp_value from weather) cte
where previous_value = yestersday_date and temperature > previous_temp_value
