with c1 as (
    select patient_id,min(test_date) as test_date, result from covid_tests 
    where result = 'Positive'
    group by patient_id
    order by 2,3
),
c2 as (
    select c.patient_id,min(c.test_date) as test_date, c.result from covid_tests c
    join c1 using(patient_id)
    where c.result = 'Negative' and c.test_date > c1.test_date
    group by c.patient_id
    order by 2,3
)


select c1.patient_id, patient_name,age, datediff(c2.test_date, c1.test_date) as recovery_time
from c1 join c2 using(patient_id)
join patients using(patient_id)
where c2.test_date > c1.test_date
order by 4,2