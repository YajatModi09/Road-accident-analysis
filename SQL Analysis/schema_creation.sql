-- Drop tables if they exist to start fresh
DROP TABLE IF EXISTS accidents;
DROP TABLE IF EXISTS weather_conditions;
DROP TABLE IF EXISTS road_conditions;
DROP TABLE IF EXISTS vehicle_types;

-- Create dimension tables
CREATE TABLE weather_conditions (weather_id INT PRIMARY KEY, weather_condition VARCHAR(50));
CREATE TABLE road_conditions (road_id INT PRIMARY KEY, road_type VARCHAR(50), surface_condition VARCHAR(50));
CREATE TABLE vehicle_types (vehicle_id INT PRIMARY KEY, vehicle_type VARCHAR(50));

-- Create the main fact table
CREATE TABLE accidents (
    accident_id INT PRIMARY KEY,
    accident_date DATE,
    accident_time TIME,
    latitude DECIMAL(9, 6),
    longitude DECIMAL(9, 6),
    fatalities INT,
    injuries INT,
    weather_id INT,
    road_id INT,
    vehicle_id INT,
    light_condition VARCHAR(50),
    FOREIGN KEY (weather_id) REFERENCES weather_conditions(weather_id),
    FOREIGN KEY (road_id) REFERENCES road_conditions(road_id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicle_types(vehicle_id)
);
-- After running this, use a database tool to import the CSV data.