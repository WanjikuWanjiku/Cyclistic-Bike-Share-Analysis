# Cyclistic-Bike-Share-Analysis
This is my capstone project submission for the Google Professional Data Analytics Certificate. The data contains over 5 million rows which I cleaned and analysed using MySQL for the Cyclistic Bike Share Company.

This case-study aims to identify differences in how annual members and casual riders use cyclistic bikes. 

I analysed the data from December 2020 to November 2021. 
This made it possible to break down the analysis based on seasons. (winter, spring, summer, fall)

##Queries
There are a total of 11 query files. 
The queries should be executed in the following order:

	1. Cyclistic_database  
		- Create the database
		- Create the seasons tables
		- Load data from csv files to the tables

	2. Winter_table | spring_table | summer_table | fall_table
		- Create a new calculated column: ride_length
		- Calculate and update the values of ride_length column
		- Create a new calculated column: day_of_week 
		- Calculate and update the values of day_of_week column
		- Check completeness (Fill or delete empty fields)
		- Check accuracy (Confirm dates)
		- Check relevance (Identify and remove irrelevant information )
		- Check uniqueness (Identify and remove duplicate id's) 
		
	3. Winter_analysis | spring_analysis | summer_analysis | fall_analysis
		- Calculate total_rides, average, mode, maximum and minimum ride lengths 
	
	4. Cyclistic_year_table
		- Create a table to hold the information for the 12 months
		- Insert data from the four seasons tables into the year table
		
	5. Cyclistic_year_analysis
		- Calculate total_rides, average, mode, maximum and minimum ride lengths 

##Summary Statistics 
|                          |    Total Rides   | Average ride length |   Mode ride length  |
| :-----------------:| :-----------------:|:-------------------------: | :------------------------:|
|            All          |   5,210,101    |       17 minutes        |       6 minutes          |
|       Member    |   2,896,978    |       12 minutes        |       10 minutes        |
|        Casual       |   2,313,123    |       22 minutes        |        60 minutes       |
	
##Articles about this analysis. 
##Visualization. 
