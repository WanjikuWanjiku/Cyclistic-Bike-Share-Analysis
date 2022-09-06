use cyclistic_database;

/*
drop table table_template;
drop table winter_table;
drop table spring_table;
drop table summer_table;
drop table fall_table;

*/

CREATE TABLE table_template(
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
    member_casual varchar(30)
	);

-- Create 4 tables representing the four seasons: Summer, Autumn, Winter, Spring
CREATE TABLE winter_table LIKE table_template;
CREATE TABLE spring_table LIKE table_template;
CREATE TABLE summer_table LIKE table_template;
CREATE TABLE fall_table LIKE table_template;

-- Load December 2020 csv to winter table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/CSV files/202012-divvy-tripdata.csv' 
INTO TABLE winter_table
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
;

-- Load January 2021 csv to winter table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/CSV files/202101-divvy-tripdata.csv' 
INTO TABLE winter_table
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
;

-- Load February 2021 csv to winter table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/CSV files/202102-divvy-tripdata.csv' 
INTO TABLE winter_table
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
;

-- Load March 2021 csv to spring_table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/CSV files/202103-divvy-tripdata.csv' 
INTO TABLE spring_table
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
;

-- Load April 2021 csv to spring_table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/CSV files/202104-divvy-tripdata.csv' 
INTO TABLE spring_table
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
;

-- Load May 2021 csv to spring_table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/CSV files/202105-divvy-tripdata.csv' 
INTO TABLE spring_table
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
;

-- Load June 2021 csv to summer_table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/CSV files/202106-divvy-tripdata.csv' 
INTO TABLE summer_table
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
;

-- Load July 2021 csv to summer_table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/CSV files/202107-divvy-tripdata.csv' 
INTO TABLE summer_table
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
;

-- Load August 2021 csv to summer_table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/CSV files/202108-divvy-tripdata.csv' 
INTO TABLE summer_table
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
;

-- Load September 2021 csv to fall_table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/CSV files/202109-divvy-tripdata.csv' 
INTO TABLE fall_table
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
;

-- Load October 2021 csv to fall_table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/CSV files/202110-divvy-tripdata.csv' 
INTO TABLE fall_table
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
;

-- Load November 2021 csv to fall_table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/CSV files/202111-divvy-tripdata.csv' 
INTO TABLE fall_table
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
;

