WITH weekly AS (
  SELECT
    m.employee_id,
    YEARWEEK(m.meeting_date, 1) AS iso_week,   -- ISO week number, Monday start
    SUM(m.duration_hours) AS week_hours
  FROM meetings m
  GROUP BY m.employee_id, YEARWEEK(m.meeting_date, 1)
),
meeting_heavy AS (
  SELECT employee_id, iso_week
  FROM weekly
  WHERE week_hours > 20
),
counts AS (
  SELECT employee_id, COUNT(*) AS meeting_heavy_weeks
  FROM meeting_heavy
  GROUP BY employee_id
  HAVING COUNT(*) >= 2
)
SELECT
  e.employee_id,
  e.employee_name,
  e.department,
  c.meeting_heavy_weeks
FROM counts c
JOIN employees e USING (employee_id)
ORDER BY c.meeting_heavy_weeks DESC, e.employee_name ASC;
