-- Create a new calculated column: ride_length
alter table spring_table
add column ride_length numeric
;

-- Calculate and update the values of ride_length column
UPDATE spring_table
SET ride_length = TIMESTAMPDIFF(second,started_at,ended_at)
;

-- Create a new calculated column: day_of_week 
alter table spring_table
add column day_of_week varchar(30)
;

-- Calculate and update the values of day_of_week column
UPDATE spring_table
SET day_of_week = date_format(started_at, '%a')
;

-- COMPLETENESS
-- Check which columns have blanks or nulls

select count(*) 
from spring_table
where ride_id = ''
	or ride_id is null
union all 

select count(*) 
from spring_table
where rideable_type = ''
	or rideable_type is null
union all 

select count(*) 
from spring_table
where started_at is null
union all 

select count(*) 
from spring_table
where ended_at is null
union all 

select count(*) 
from spring_table
where start_station_name = ''
	or start_station_name is null
union all 

select count(*)
from spring_table
where start_station_id = ''
	or start_station_id is null
union all 

select count(*) 
from spring_table
where end_station_name = ''
	or end_station_name is null
union all 

select count(*)
from spring_table
where end_station_id = ''
	or end_station_id is null
union all 

select count(*) 
from spring_table
where start_lat = ''
	or start_lat is null
union all 

select count(*) 
from spring_table
where start_lng = ''
	or start_lng is null
union all 

select count(*) 
from spring_table
where end_lat = ''
	or end_lat is null
union all 

select count(*) 
from spring_table
where end_lng = ''
	or end_lng is null
union all 

select count(*) 
from spring_table
where member_casual = ''
	or member_casual is null
union all 

select count(*)
from spring_table
where ride_length = ''
	or ride_length is null
union all 

select count(*) 
from spring_table
where day_of_week = ''
	or day_of_week is null
;


-- Check the number of empty values in the identified columns grouped by rideable type. 
SELECT rideable_type, count(*) as empty_values
FROM spring_table
WHERE start_station_name = ''
	OR start_station_id = ''
	OR end_station_name = ''
    OR end_station_id = ''
    OR end_lat = ''
    OR end_lng = ''
GROUP BY rideable_type
;

-- Blank values are from bikes starting or stopping at random points.
-- Deleting these rows might skew the data
-- Instead update the table with a placeholder ('random_start_point', 'random_end_point') in the empty station names 
-- Update the station_ids with placeholders 1111 for random_start_point and 2222 for random_end_point
/*
-- Check if the id placeholders exist
SELECT * 
FROM spring_table
where start_station_id = '1111' or end_station_id = '2222'
;
*/
UPDATE spring_table
SET start_station_name = 'random_start_point',
	start_station_id = '1111',
	end_station_name = 'random_end_point',
    end_station_id = '2222'
WHERE (start_station_name = '' AND start_station_id = '' AND end_station_name = '' AND end_station_id = '') 
;

UPDATE spring_table
SET start_station_name = 'random_start_point',
	start_station_id = '1111'
WHERE (start_station_name = '' AND start_station_id = '') 
;

UPDATE spring_table
SET	end_station_name = 'random_end_point',
    end_station_id = '2222'
WHERE (end_station_name = '' AND end_station_id = '') 
;

-- Delete the entries with blank end_lat and end_lng 
DELETE from spring_table
WHERE (end_lat = '' AND end_lng = '') 
;

-- OUTLIERS 
-- Analyse the ride_length column

select started_at, ended_at, ride_length, ride_length/60 as minutes, ride_length/3600 as hours,  ride_length/86400 as days
from spring_table

order by ride_length desc
limit 100
;

-- Assumption - Valid ride-lengths are between 10 seconds and 2 hours(7200 seconds)
-- Delete all outliers that don't fall in this range

DELETE FROM spring_table
WHERE ride_length not between 10 and 7200

;

-- ACCURACY
-- Confirm that values in the spring table fall between March, April, May 2021
-- Between 1st March 2021 and 1st June 2021
select *
from spring_table
where started_at not between '2021-03-01' and '2021-06-01'
;

-- RELEVANCE - Identify and remove irrelevant information 
-- select * 
DELETE FROM spring_table
WHERE start_station_name like '%divvy%' or start_station_name like '%test%' or start_station_name like '%check%' or 
	end_station_name like '%divvy%' or end_station_name like '%test%' or end_station_name like '%check%' 
;

-- UNIQUENESS
-- Check if all ride_id's are unique
SELECT count(*), count(distinct ride_id)
FROM spring_table

;

-- Check if different stations share an id
-- Create two temporary tables to analyse the start and end stations
CREATE TEMPORARY TABLE start_stations_temporary
SELECT distinct start_station_name, start_station_id
FROM spring_table
;

CREATE TEMPORARY TABLE end_stations_temporary
SELECT distinct end_station_name, end_station_id
FROM spring_table
;

-- Identify the non-unique station id's
SELECT start_station_name, start_station_id, COUNT(start_station_id)
FROM
    start_stations_temporary
GROUP BY start_station_id
HAVING COUNT(start_station_id) > 1;

SELECT end_station_name, end_station_id, COUNT(end_station_id)
FROM
    end_stations_temporary
GROUP BY end_station_id
HAVING COUNT(end_station_id) > 1;

-- Delete the non-unique station id's
DELETE FROM spring_table
where start_station_id = 'TA1305000039' or end_station_id = 'TA1305000039'
;

DROP TEMPORARY TABLE start_stations_temporary;
DROP TEMPORARY TABLE end_stations_temporary;




