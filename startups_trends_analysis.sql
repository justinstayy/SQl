
SELECT * FROM startups;

SELECT COUNT(*) FROM startups;

SELECT SUM(valuation) FROM startups;

SELECT MAX(raised) FROM startups;

SELECT MAX(raised) FROM startups
WHERE stage = 'Seed';

SELECT MIN(founded_year) FROM startups;

SELECT AVG(valuation) FROM startups;

SELECT category, AVG(valuation)
FROM startups
GROUP BY category;

SELECT category, ROUND(AVG(valuation), 2)
FROM startups
GROUP BY category;

SELECT category, ROUND(AVG(valuation), 2)
FROM startups
GROUP BY category
ORDER BY ROUND(AVG(valuation), 2) DESC;

SELECT category, COUNT(*) AS company_count
FROM startups
GROUP BY category;

SELECT category, COUNT(*) AS company_count
FROM startups
GROUP BY category
HAVING COUNT(*) > 3;

SELECT location, AVG(size) AS avg_size
FROM startups
GROUP BY location;

SELECT location, AVG(size) AS avg_size
FROM startups
GROUP BY location
HAVING avg_size > 500;
