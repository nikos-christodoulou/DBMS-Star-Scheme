create table accdata (
	accident_id varchar(15),
	severity_id integer,
	severity varchar(10),
	road_surface_conditions_id integer,
	road_surface_conditions varchar(50),
	accident_date date,
	number_of_vehicles integer,
	vehicle_type_id integer,
	vehicle_type varchar(50),
	driver_class_id integer,
	sex_of_driver varchar(6),
	age_of_driver integer,
	sex_of_casualty varchar(6),
	age_of_casualty integer
);

BULK INSERT accdata
FROM 'C:\Users\Nikos\Desktop\DBMS\Project_2\ACCDATA.TXT'
WITH (FIRSTROW =2, FIELDTERMINATOR='|', ROWTERMINATOR = '\n');

