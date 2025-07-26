
SELECT * FROM stream LIMIT 20;

SELECT * FROM chat LIMIT 20;

SELECT DISTINCT game FROM stream;

SELECT DISTINCT channel FROM stream;

SELECT game, COUNT(*) AS view_count
FROM stream
GROUP BY game
ORDER BY view_count DESC;

SELECT country, COUNT(*) AS lol_viewers
FROM stream
WHERE game = 'League of Legends'
GROUP BY country
ORDER BY lol_viewers DESC;

SELECT player, COUNT(*) AS num_streamers
FROM stream
GROUP BY player
ORDER BY num_streamers DESC;

SELECT game,
  CASE
    WHEN game = 'League of Legends' THEN 'MOBA'
    WHEN game = 'Dota 2' THEN 'MOBA'
    WHEN game = 'Heroes of the Storm' THEN 'MOBA'
    WHEN game = 'Counter-Strike: Global Offensive' THEN 'FPS'
    WHEN game = 'DayZ' THEN 'Survival'
    WHEN game = 'ARK: Survival Evolved' THEN 'Survival'
    ELSE 'Other'
  END AS genre
FROM stream
GROUP BY game
ORDER BY game;

SELECT time FROM stream LIMIT 10;

SELECT time, strftime('%S', time)
FROM stream
GROUP BY time
LIMIT 20;

SELECT strftime('%H', time) AS hour, COUNT(*) AS view_count
FROM stream
WHERE country = 'US'
GROUP BY hour
ORDER BY hour;

SELECT *
FROM stream s
JOIN chat c ON s.device_id = c.device_id;
