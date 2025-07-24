with cte as( select * from 
students 
cross join subjects 
)

select cte.student_id, cte.student_name, cte.subject_name, count(e.student_id) as attended_exams from 
cte 
left join examinations e on cte.student_id = e.student_id and cte.subject_name = e.subject_name
group by cte.student_id,cte.student_name, cte.subject_name
