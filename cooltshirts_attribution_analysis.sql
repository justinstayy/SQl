
SELECT COUNT(DISTINCT utm_campaign) FROM page_visits;

SELECT COUNT(DISTINCT utm_source) FROM page_visits;

SELECT DISTINCT utm_campaign, utm_source FROM page_visits;

SELECT DISTINCT page_name FROM page_visits;

WITH first_touch AS (
  SELECT user_id, MIN(timestamp) AS first_touch_at
  FROM page_visits
  GROUP BY user_id
)
SELECT pv.utm_campaign, COUNT(*) AS first_touches
FROM first_touch ft
JOIN page_visits pv
  ON ft.user_id = pv.user_id AND ft.first_touch_at = pv.timestamp
GROUP BY pv.utm_campaign
ORDER BY first_touches DESC;

WITH last_touch AS (
  SELECT user_id, MAX(timestamp) AS last_touch_at
  FROM page_visits
  GROUP BY user_id
)
SELECT pv.utm_campaign, COUNT(*) AS last_touches
FROM last_touch lt
JOIN page_visits pv
  ON lt.user_id = pv.user_id AND lt.last_touch_at = pv.timestamp
GROUP BY pv.utm_campaign
ORDER BY last_touches DESC;

SELECT COUNT(DISTINCT user_id)
FROM page_visits
WHERE page_name = '4 - purchase';

WITH last_touch AS (
  SELECT user_id, MAX(timestamp) AS last_touch_at
  FROM page_visits
  GROUP BY user_id
)
SELECT pv.utm_campaign, COUNT(*) AS last_touch_purchases
FROM last_touch lt
JOIN page_visits pv
  ON lt.user_id = pv.user_id AND lt.last_touch_at = pv.timestamp
WHERE pv.page_name = '4 - purchase'
GROUP BY pv.utm_campaign
ORDER BY last_touch_purchases DESC;
