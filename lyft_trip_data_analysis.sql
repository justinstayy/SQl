
SELECT * FROM trips;

SELECT * FROM riders;

SELECT * FROM cars;

SELECT 'trip_id' AS primary_key_trips;

SELECT 'rider_id' AS primary_key_riders;

SELECT 'car_id' AS primary_key_cars;

SELECT * FROM riders
CROSS JOIN cars;

SELECT *
FROM trips
LEFT JOIN riders ON trips.rider_id = riders.rider_id;

SELECT *
FROM trips
INNER JOIN cars ON trips.car_id = cars.car_id;

SELECT * FROM riders
UNION
SELECT * FROM riders2;

SELECT AVG(cost) FROM trips;

SELECT * FROM riders
WHERE total_trips < 500;

SELECT COUNT(*) FROM cars
WHERE status = 'active';

SELECT *
FROM cars
ORDER BY trips_completed DESC
LIMIT 2;
