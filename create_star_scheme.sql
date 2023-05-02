--We start with the dw's dimensions.

/*

create table vehicles (
	vehicle_type_id int primary key,
	vehicle_type varchar(50)
);

create table drivers (
	driver_class_id int primary key,
	sex_of_driver varchar(6),
	age_of_driver integer
);

create table severities (
	severity_id integer primary key,
	severity varchar(10)
);

create table road_conditions(
	road_surface_conditions_id integer primary key,
	road_surface_conditions varchar(50)
);


create table dateinfo (
	acc_date date primary key,
	acc_year int,
	acc_month int,
	acc_quarter int,
);


--Procede with the fact table

create table accidents (
	accident_id varchar(15),
	driver_class_id int,
	vehicle_type_id int,
	road_surface_conditions_id int,
	severity_id integer,
	accident_date date,
	number_of_vehicles int,
	number_of_casualties integer,

	primary key (accident_id, driver_class_id, vehicle_type_id, road_surface_conditions_id, severity_id, accident_date),
	foreign key (driver_class_id) references drivers(driver_class_id),
	foreign key (vehicle_type_id) references vehicles(vehicle_type_id),
	foreign key (road_surface_conditions_id) references road_conditions(road_surface_conditions_id),
	foreign key (severity_id) references severities (severity_id),
	foreign key (accident_date) references dateinfo (acc_date)

);
*/


insert into vehicles
	select distinct vehicle_type_id, vehicle_type 
	from accdata;


insert into drivers 
	select distinct driver_class_id, sex_of_driver, age_of_driver
	from accdata;

insert into severities
	select distinct severity_id, severity 
	from accdata;

insert into road_conditions
	select distinct road_surface_conditions_id, road_surface_conditions
	from accdata
	

insert into dateinfo
	select distinct accident_date, datepart(year, accident_date),
					datepart(month, accident_date), datepart(quarter, accident_date)
	from accdata
	
insert into accidents
	select accident_id,
	driver_class_id,
	vehicle_type_id,
	road_surface_conditions_id,
	severity_id,
	accident_date,
	number_of_vehicles,
	count(age_of_casualty)
	
  from accdata group by accident_id,driver_class_id,vehicle_type_id,road_surface_conditions_id,
					severity_id,accident_date,number_of_vehicles;



