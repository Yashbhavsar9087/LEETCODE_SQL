WITH eligible AS (
  SELECT t.request_at AS Day, t.status
  FROM Trips t
  JOIN Users uc ON uc.users_id = t.client_id AND uc.banned = 'No'
  JOIN Users ud ON ud.users_id = t.driver_id AND ud.banned = 'No'
  WHERE t.request_at BETWEEN '2013-10-01' AND '2013-10-03'
),
agg AS (
  SELECT
    Day,
    SUM(CASE WHEN status IN ('cancelled_by_driver','cancelled_by_client') THEN 1 ELSE 0 END) AS cancels,
    COUNT(*) AS total
  FROM eligible
  GROUP BY Day
)
SELECT
  Day,
  ROUND(cancels / total, 2) AS `Cancellation Rate`
FROM agg;
