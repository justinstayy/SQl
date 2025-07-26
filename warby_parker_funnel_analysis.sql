
SELECT *
FROM survey
LIMIT 10;

SELECT 
  question, 
  COUNT(*) AS num_responses
FROM survey
GROUP BY question
ORDER BY num_responses DESC;

SELECT *
FROM quiz
LIMIT 5;

SELECT *
FROM home_try_on
LIMIT 5;

SELECT *
FROM purchase
LIMIT 5;

SELECT
  q.user_id,
  CASE WHEN h.user_id IS NOT NULL THEN TRUE ELSE FALSE END AS is_home_try_on,
  h.number_of_pairs,
  CASE WHEN p.user_id IS NOT NULL THEN TRUE ELSE FALSE END AS is_purchase
FROM quiz q
LEFT JOIN home_try_on h ON q.user_id = h.user_id
LEFT JOIN purchase p ON q.user_id = p.user_id
LIMIT 10;

SELECT 
  COUNT(DISTINCT h.user_id) * 1.0 / COUNT(DISTINCT q.user_id) AS quiz_to_tryon_conversion
FROM quiz q
LEFT JOIN home_try_on h ON q.user_id = h.user_id;

SELECT 
  COUNT(DISTINCT p.user_id) * 1.0 / COUNT(DISTINCT h.user_id) AS tryon_to_purchase_conversion
FROM home_try_on h
LEFT JOIN purchase p ON h.user_id = p.user_id;

SELECT
  h.number_of_pairs,
  COUNT(DISTINCT p.user_id) * 1.0 / COUNT(DISTINCT h.user_id) AS purchase_rate
FROM home_try_on h
LEFT JOIN purchase p ON h.user_id = p.user_id
GROUP BY h.number_of_pairs
ORDER BY h.number_of_pairs;

SELECT
  question,
  answer,
  COUNT(*) AS count
FROM survey
GROUP BY question, answer
ORDER BY question, count DESC;

SELECT 
  item_purchased, 
  COUNT(*) AS num_purchases
FROM purchase
GROUP BY item_purchased
ORDER BY num_purchases DESC;
