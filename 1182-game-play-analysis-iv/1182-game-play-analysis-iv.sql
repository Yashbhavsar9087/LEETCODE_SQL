with cte as (
    select player_id, min(event_date) as et
    from activity 
    group by player_id

)
select Round((count(distinct activity.player_id)*1.0/ (select count(distinct player_id) from cte)),2) as fraction  from cte left join activity 
on cte.player_id = activity.player_id and activity.event_date = dateadd(day, 1, cte.et)