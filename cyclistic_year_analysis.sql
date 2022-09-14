-- Total number of rides
SELECT count(*)
from cyclistic_year_table
;

-- Total number of rides based on membership in the year
SELECT member_casual, count(*) as number_of_rides
FROM cyclistic_year_table
GROUP BY member_casual
;

-- Total number of rides based on rideable type in the year
SELECT rideable_type, count(*) as number_of_rides
FROM cyclistic_year_table
GROUP BY rideable_type
;

-- Total number of rides in the year based on day of week
select day_of_week, count(*) as total_rides
from cyclistic_year_table
group by day_of_week
order by total_rides desc
;

-- Total number of rides in the year based on time of day
SELECT DATE_FORMAT(started_at, '%H') as time_of_day,
count(ride_id) as total_rides
from cyclistic_year_table
group by time_of_day
order by total_rides desc
;

-- Calculate mode of all rides
SELECT  (ride_length)/60 as ride_length_minutes, COUNT(*) AS Mode 
FROM cyclistic_year_table 
GROUP BY ride_length
ORDER BY COUNT(*) DESC
limit 1
;

-- Calculate average, max and min ride_length of all rides
SELECT 	avg(ride_length)/60 as average_ride_in_minutes, 
    min(ride_length)/60 as minimum_ride_in_minutes, 
    max(ride_length)/60 as maximum_ride_in_minutes
 FROM cyclistic_year_table
;

-- Calculate average, max and min ride_length member_casual
SELECT member_casual, 
	avg(ride_length)/60 as average_ride_in_minutes, 
    min(ride_length)/60 as minimum_ride_in_minutes, 
    max(ride_length)/60 as maximum_ride_in_minutes
 FROM cyclistic_year_table
GROUP BY member_casual
;

-- Calculate mode member_casual
SELECT  member_casual, (ride_length)/60 as ride_length, COUNT(*) AS Mode 
FROM cyclistic_year_table 
GROUP BY member_casual
ORDER BY COUNT(*) DESC
;

-- Calculate average, max and min ride_length rideable type
SELECT rideable_type, 
	avg(ride_length)/60 as average_ride_in_minutes, 
    min(ride_length)/60 as minimum_ride_in_minutes, 
    max(ride_length)/60 as maximum_ride_in_minutes
 FROM cyclistic_year_table
GROUP BY rideable_type
;

-- Calculate mode rideable type
SELECT  rideable_type, (ride_length)/60 as ride_length, COUNT(*) AS Mode 
FROM cyclistic_year_table 
GROUP BY rideable_type
ORDER BY COUNT(*) DESC
;

-- Export the clean data to a csv file
SELECT "ride_id", "rideable_type", 
"started_at", "ended_at", "start_station_name", "start_station_id", 
"end_station_name", "end_station_id", "start_lat", "start_lng", "end_lat", 
"end_lng", "member_casual", "ride_length", "day_of_week"

UNION ALL

SELECT 
	ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual, ride_length, day_of_week
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/cyclistic_clean_data.csv'
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
FROM cyclistic_year_table
;


        
        