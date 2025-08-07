with cte as (select *, row_number() over(partition by student_id, subject order by exam_date) as asc_date,
row_number() over(partition by student_id, subject order by exam_date desc) as desc_date
from scores),

low_high_scores as (
    select Student_id, subject,
    max(CASE WHEN asc_date = 1 THEN Score END) as first_score,
    max(CASE WHEN desc_date = 1 THEN Score END) as latest_score
from cte 
group by student_id, subject 
having count(*) > 1
)

select * from low_high_scores
where first_score < latest_score
order by student_id, subject