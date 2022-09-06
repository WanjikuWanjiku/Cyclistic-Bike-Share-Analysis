-- Create a table to hold the information for the 12 months
-- drop table cyclistic_year_table;

CREATE TABLE cyclistic_year_table(
   ride_id	varchar(30),
	rideable_type varchar(30),
    started_at datetime,
    ended_at datetime,
    start_station_name varchar(255),	
    start_station_id varchar(50),
    end_station_name varchar(255),
    end_station_id varchar(50),
    start_lat varchar(50),
    start_lng varchar(50),
    end_lat	varchar(50),
    end_lng	varchar(50),
    member_casual varchar(30), 
    ride_length numeric, 
    day_of_week varchar(30)
    
	);
    
-- Insert the four seasons tables into the the year table

INSERT INTO cyclistic_year_table

SELECT * FROM winter_table
UNION ALL 
SELECT * FROM spring_table
UNION ALL
SELECT * FROM summer_table
UNION ALL
SELECT *
FROM fall_table
;

