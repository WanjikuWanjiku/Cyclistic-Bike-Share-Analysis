-- Total number of rides
SELECT count(*)
from winter_table
;

-- Total number of rides based on membership in winter
SELECT member_casual, count(*) as number_of_rides
FROM winter_table
GROUP BY member_casual
;

-- Total number of rides based on rideable type in winter
SELECT rideable_type, count(*) as number_of_rides
FROM winter_table
GROUP BY rideable_type
;

-- Total number of rides in winter based on day of week
select day_of_week, count(*) as total_rides
from winter_table
group by day_of_week
order by total_rides desc
;

-- Total number of rides in winter based on time of day
SELECT DATE_FORMAT(started_at, '%H') as time_of_day,
count(ride_id) as total_rides
from winter_table
group by time_of_day
order by total_rides desc
;

-- Calculate mode of all rides
SELECT  (ride_length)/60 as ride_length_minutes, COUNT(*) AS Mode 
FROM winter_table 
GROUP BY ride_length
ORDER BY COUNT(*) DESC
limit 1
;

-- Calculate average, max and min ride_length of all rides
SELECT 	avg(ride_length)/60 as average_ride_in_minutes, 
    min(ride_length)/60 as minimum_ride_in_minutes, 
    max(ride_length)/60 as maximum_ride_in_minutes
 FROM winter_table
;

-- Calculate average, max and min ride_length member_casual
SELECT member_casual, 
	avg(ride_length)/60 as average_ride_in_minutes, 
    min(ride_length)/60 as minimum_ride_in_minutes, 
    max(ride_length)/60 as maximum_ride_in_minutes
 FROM winter_table
GROUP BY member_casual
;

-- Calculate mode member_casual
SELECT  member_casual, (ride_length)/60 as ride_length, COUNT(*) AS Mode 
FROM winter_table 
GROUP BY member_casual
ORDER BY COUNT(*) DESC
;

-- Calculate average, max and min ride_length rideable type
SELECT rideable_type, 
	avg(ride_length)/60 as average_ride_in_minutes, 
    min(ride_length)/60 as minimum_ride_in_minutes, 
    max(ride_length)/60 as maximum_ride_in_minutes
 FROM winter_table
GROUP BY rideable_type
;

-- Calculate mode rideable type
SELECT  rideable_type, (ride_length)/60 as ride_length, COUNT(*) AS Mode 
FROM winter_table 
GROUP BY rideable_type
ORDER BY COUNT(*) DESC
;