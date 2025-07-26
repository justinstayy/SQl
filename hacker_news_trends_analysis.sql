
SELECT title, score
FROM hacker_news
ORDER BY score DESC
LIMIT 5;

SELECT SUM(score) FROM hacker_news;

SELECT user, SUM(score) AS total_user_score
FROM hacker_news
GROUP BY user
HAVING total_user_score > 200
ORDER BY total_user_score DESC;

SELECT SUM(score) * 1.0 / (
  SELECT SUM(score) FROM hacker_news
)
FROM hacker_news
WHERE user IN (
  SELECT user
  FROM hacker_news
  GROUP BY user
  HAVING SUM(score) > 200
);

SELECT user, COUNT(*) AS count
FROM hacker_news
WHERE url = 'https://www.youtube.com/watch?v=dQw4w9WgXcQ'
GROUP BY user
ORDER BY count DESC;

SELECT CASE
  WHEN url LIKE '%github.com%' THEN 'GitHub'
  WHEN url LIKE '%medium.com%' THEN 'Medium'
  WHEN url LIKE '%nytimes.com%' THEN 'New York Times'
  ELSE 'Other'
END AS source
FROM hacker_news;

SELECT CASE
  WHEN url LIKE '%github.com%' THEN 'GitHub'
  WHEN url LIKE '%medium.com%' THEN 'Medium'
  WHEN url LIKE '%nytimes.com%' THEN 'New York Times'
  ELSE 'Other'
END AS source,
COUNT(*) AS count
FROM hacker_news
GROUP BY source
ORDER BY count DESC;

SELECT timestamp FROM hacker_news LIMIT 10;

SELECT timestamp, strftime('%H', timestamp)
FROM hacker_news
GROUP BY timestamp
LIMIT 20;

SELECT strftime('%H', timestamp) AS hour,
AVG(score) AS avg_score,
COUNT(*) AS story_count
FROM hacker_news
GROUP BY hour
ORDER BY hour;

SELECT strftime('%H', timestamp) AS hour,
ROUND(AVG(score), 2) AS average_score,
COUNT(*) AS story_count
FROM hacker_news
WHERE timestamp IS NOT NULL
GROUP BY hour
ORDER BY average_score DESC;
