-- Query 1: Comprehensive Accident View
-- Objective: Join all tables to get a full picture of each accident.
SELECT a.accident_id, a.accident_date, a.accident_time, a.light_condition,
    wc.weather_condition, rc.road_type, rc.surface_condition, vt.vehicle_type,
    a.fatalities, a.injuries
FROM accidents a
JOIN weather_conditions wc ON a.weather_id = wc.weather_id
JOIN road_conditions rc ON a.road_id = rc.road_id
JOIN vehicle_types vt ON a.vehicle_id = vt.vehicle_id;

-- Query 2: Temporal Analysis (Accidents by Hour)
-- Objective: Find the most dangerous hours of the day.
SELECT EXTRACT(HOUR FROM accident_time) AS hour_of_day, COUNT(accident_id) AS total_accidents
FROM accidents
GROUP BY hour_of_day ORDER BY total_accidents DESC;

-- Query 3: Spatial Analysis (Accident Hotspots)
-- Objective: Identify geographical "blackspots".
SELECT latitude, longitude, COUNT(accident_id) AS total_accidents, SUM(fatalities) AS total_fatalities
FROM accidents
GROUP BY latitude, longitude ORDER BY total_accidents DESC LIMIT 5;

-- Query 4: Factor Analysis (CTE for Two-Wheelers in Rain)
-- Objective: Calculate the percentage of accidents in rainy conditions that involve two-wheelers.
WITH rainy_day_accidents AS (
    SELECT a.accident_id, vt.vehicle_type
    FROM accidents a
    JOIN weather_conditions wc ON a.weather_id = wc.weather_id
    JOIN vehicle_types vt ON a.vehicle_id = vt.vehicle_id
    WHERE wc.weather_condition = 'Rainy'
)
SELECT (COUNT(CASE WHEN vehicle_type = 'Two-Wheeler' THEN 1 END) * 100.0) / COUNT(accident_id) AS percentage_two_wheeler_in_rain
FROM rainy_day_accidents;