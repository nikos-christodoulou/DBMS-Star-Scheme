create view v1 with schemabinding
	as select count_big(*) as num_of_accidents, severity, road_surface_conditions, vehicle_type 
	from dbo.accidents, dbo.severities, dbo.road_conditions, dbo.vehicles
		where accidents.severity_id = severities.severity_id and
			accidents.road_surface_conditions_id = road_conditions.road_surface_conditions_id and
				accidents.vehicle_type_id = vehicles.vehicle_type_id
	group by severity, road_surface_conditions, vehicle_type;


SET NUMERIC_ROUNDABORT OFF;
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT,
   QUOTED_IDENTIFIER, ANSI_NULLS ON;
--Create view with schemabinding.
IF OBJECT_ID ('v1 ', 'view') IS NOT NULL
   DROP VIEW v1;

create unique clustered index idx_accidents on v1(severity, road_surface_conditions, vehicle_type)

select * from v1

select sum(num_of_accidents), severity from dbo.v1
	group by severity

select sum(num_of_accidents), road_surface_conditions from dbo.v1
	group by road_surface_conditions

select sum(num_of_accidents), vehicle_type from dbo.v1
	group by vehicle_type

select sum(num_of_accidents), severity, road_surface_conditions from dbo.v1
	group by severity, road_surface_conditions

select sum(num_of_accidents), severity, vehicle_type from dbo.v1
	group by severity, vehicle_type

select sum(num_of_accidents), road_surface_conditions, vehicle_type from dbo.v1
	group by road_surface_conditions, vehicle_type

select sum(num_of_accidents) from dbo.v1
