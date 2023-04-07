CREATE TABLE day_of_week(
id INTEGER PRIMARY KEY,
day_name VARCHAR(20) NOT NULL);


CREATE TABLE accident (
accident_index VARCHAR(13) PRIMARY KEY,
location_easting_osgr NUMERIC,
location_northing_osgr NUMERIC,
longitude  NUMERIC,
latitude NUMERIC,
police_force INTEGER,
accident_severity INTEGER,
number_of_vehicle INTEGER,
number_of_casualties INTEGER,
date DATE,
day_of_week_id INTEGER REFERENCES day_of_week(id),
time TIME);

CREATE TABLE vehicle_type (
id INTEGER PRIMARY KEY,
label TEXT UNIQUE);


CREATE TABLE vehicle (
id SERIAL PRIMARY KEY,
accident_index VARCHAR,
vehicle_type_id INTEGER REFERENCES vehicle_type(id),
age_of_driver INTEGER,
engine_capacity_cc INTEGER,
propulsion_code INTEGER);

INSERT INTO day_of_week(id,day_name) VALUES
(1,'Sunday'),
(2,'Monday'),
(3,'Tuesday'),
(4,'Wednesday'),
(5,'Thursday'),
(6,'Friday'),
(7,'Saturday');

\copy accident FROM '/Users/ORESANYA/Classic Isaac/Git/PostgreSQL/dataset/accident_preprocessed.csv' WITH (FORMAT CSV, HEADER);
\copy vehicle_type(id,model) FROM '/Users/ORESANYA/Classic Isaac/Git/PostgreSQL/dataset/vehicle_type.csv' WITH (FORMAT CSV, HEADER);
\copy vehicle(accident_index,vehicle_type_id,age_of_driver,engine_capacity_cc,propulsion_code) FROM '/Users/ORESANYA/Classic Isaac/Git/PostgreSQL/dataset/vehicle_preprocessed.csv' WITH (FORMAT CSV, HEADER);


SELECT * FROM accident LIMIT 5;
SELECT * FROM vehicle LIMIT 5;
SELECT * FROM vehicle_type;

-- Find the number of accidents in the dataset
SELECT COUNT(*) FROM accident;

-- Find the number of accidents by severity level
SELECT accident_severity,COUNT(accident_severity)
FROM accident GROUP BY accident_severity
ORDER BY COUNT(accident_severity) DESC;

-- Find the number of accident by day of the week
SELECT day_of_week.day_name,COUNT(accident.day_of_week_id)
FROM day_of_week
JOIN accident ON day_of_week.id=accident.day_of_week_id
GROUP BY day_of_week.day_name,accident.day_of_week_id
ORDER BY accident.day_of_week_id;

-- Find the most common vehicle types involved in accidents
SELECT vehicle_type.label,COUNT(vehicle.vehicle_type_id)
FROM vehicle_type
FULL JOIN vehicle ON vehicle_type.id=vehicle.vehicle_type_id
GROUP BY vehicle_type.label
ORDER BY COUNT(vehicle.vehicle_type_id) DESC;

-- Find the average age of drivers involved in accidents
SELECT AVG(age_of_driver) FROM vehicle;

-- Find the number of accidents that occured in each month of the year
SELECT EXTRACT(month FROM date) AS month,COUNT(date)
FROM accident GROUP BY month
ORDER BY month;

-- Find the number of accidents by hour of day and police force
SELECT police_force,EXTRACT(hour FROM time) AS hour,count(*) AS num_accidents
FROM accident GROUP BY police_force,hour
ORDER BY police_force,hour;


SELECT accident.date,day_of_week.day_name,accident.accident_severity,
vehicle_type.label,vehicle.age_of_driver
FROM accident
FULL JOIN vehicle ON accident.accident_index=vehicle.accident_index
JOIN vehicle_type ON vehicle.vehicle_type_id=vehicle_type.id
JOIN day_of_week ON accident.day_of_week_id=day_of_week.id;

