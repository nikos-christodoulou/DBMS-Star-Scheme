select count(accident_id) as number_of_accidents, severity, acc_year 
	from accidents, severities, dateinfo 
		where accidents.severity_id = severities.severity_id and
			dateinfo.acc_date = accidents.accident_date
		group by acc_year, severity 
		order by acc_year desc


set statistics io on

select count(accident_id) as num_of_fatal_accidents, sex_of_driver, age_of_driver, sum(number_of_casualties) as sum_of_casualties
	from accidents, drivers, severities 
		where drivers.driver_class_id = accidents.driver_class_id and
			accidents.severity_id = severities.severity_id and 
				severity = 'Fatal' 
		group by sex_of_driver, age_of_driver


select count(accident_id) as num_of_accidents, road_surface_conditions, severity
	from accidents, road_conditions, severities 
		where accidents.road_surface_conditions_id = road_conditions.road_surface_conditions_id and
			severities.severity_id = accidents.severity_id
		group by road_surface_conditions, severity


select count(accident_id) as num_of_accidents, sum(number_of_casualties) as sum_of_casualties, vehicle_type, acc_year 
	from accidents, vehicles, dateinfo
		where accidents.vehicle_type_id = vehicles.vehicle_type_id and
			accidents.accident_date = dateinfo.acc_date and
				number_of_vehicles > 2
	group by vehicle_type, acc_year


select count(accident_id) as num_of_accidents, sum(number_of_vehicles) as sum_of__vehicles, sum(number_of_casualties) as sum_of_casualties, acc_year, acc_quarter, acc_month
	from accidents, dateinfo where accidents.accident_date = dateinfo.acc_date 
		group by rollup(acc_year, acc_quarter, acc_month)
