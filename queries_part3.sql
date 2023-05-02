select count(accident_id), severity, road_surface_conditions, vehicle_type 
	from accidents, severities, road_conditions, vehicles
		where accidents.severity_id = severities.severity_id and
			accidents.road_surface_conditions_id = road_conditions.road_surface_conditions_id and
				accidents.vehicle_type_id = vehicles.vehicle_type_id
	group by cube(severity, road_surface_conditions, vehicle_type);


