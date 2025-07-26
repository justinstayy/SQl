
WITH months AS (
  SELECT DATE('2017-01-01') AS first_day
  UNION ALL
  SELECT DATE('2017-02-01')
  UNION ALL
  SELECT DATE('2017-03-01')
),

cross_join AS (
  SELECT s.*, m.first_day
  FROM subscriptions s
  CROSS JOIN months m
),

status AS (
  SELECT
    id,
    first_day AS month,
    CASE 
      WHEN segment = 87 AND subscription_start < first_day AND (subscription_end >= first_day OR subscription_end IS NULL) 
      THEN 1 ELSE 0 
    END AS is_active_87,
    CASE 
      WHEN segment = 30 AND subscription_start < first_day AND (subscription_end >= first_day OR subscription_end IS NULL) 
      THEN 1 ELSE 0 
    END AS is_active_30,
    CASE 
      WHEN segment = 87 AND subscription_end >= first_day AND subscription_end < DATE(first_day, '+1 month') 
      THEN 1 ELSE 0 
    END AS is_canceled_87,
    CASE 
      WHEN segment = 30 AND subscription_end >= first_day AND subscription_end < DATE(first_day, '+1 month') 
      THEN 1 ELSE 0 
    END AS is_canceled_30
  FROM cross_join
),

status_aggregate AS (
  SELECT
    month,
    SUM(is_active_87) AS sum_active_87,
    SUM(is_active_30) AS sum_active_30,
    SUM(is_canceled_87) AS sum_canceled_87,
    SUM(is_canceled_30) AS sum_canceled_30
  FROM status
  GROUP BY month
)

SELECT
  month,
  ROUND(1.0 * sum_canceled_87 / NULLIF(sum_active_87, 0), 4) AS churn_rate_87,
  ROUND(1.0 * sum_canceled_30 / NULLIF(sum_active_30, 0), 4) AS churn_rate_30
FROM status_aggregate;
