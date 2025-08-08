-- select user_id, sum(coalesce(trial_avg_duration,0)) as trial_avg_duration, sum(coalesce(paid_avg_duration,0)) as paid_avg_duration from 
-- (select ua.user_id as user_id, CASE WHEN activity_type = 'free_trial' THEN round(avg(activity_duration),2) END as trial_avg_duration,
-- CASE WHEN activity_type = 'paid' THEN round(avg(activity_duration),2) END as paid_avg_duration from (select distinct user_id as uid from UserActivity
-- where activity_type = 'paid') t
-- join UserActivity ua on t.uid = ua.user_id
-- group by ua.user_id, activity_type) cte 
-- group by user_id

Select user_id,
    round(avg(CASE WHEN activity_type = 'free_trial' THEN activity_duration ELSE NULL END),2) AS trial_avg_duration,
    round(avg(CASE WHEN activity_type = 'paid' THEN activity_duration ELSE NULL END),2) AS paid_avg_duration
    from 
    useractivity
group by user_id
having paid_avg_duration > 0
order by user_id
