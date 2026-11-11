# Datos de vehículos del juego
extends Node

const VEHICLES = [
	{
		"id": "motorcycle_sport",
		"name": "Motocicleta Deportiva",
		"type": "motorcycle",
		"price": 15000,
		"max_speed": 200,
		"acceleration": 8.5,
		"weight": 200,
		"cargo_capacity": 50,
		"fuel_consumption": 4.5,  # km/l
		"description": "Rápida y ágil, perfecta para entregas urbanas"
	},
	{
		"id": "motorcycle_cruiser",
		"name": "Motocicleta Cruiser",
		"type": "motorcycle",
		"price": 12000,
		"max_speed": 160,
		"acceleration": 6.5,
		"weight": 250,
		"cargo_capacity": 60,
		"fuel_consumption": 5.0,
		"description": "Cómoda y resistente para largas distancias"
	},
	{
		"id": "car_sedan",
		"name": "Sedán Compacto",
		"type": "car",
		"price": 25000,
		"max_speed": 180,
		"acceleration": 7.0,
		"weight": 1200,
		"cargo_capacity": 200,
		"fuel_consumption": 8.0,
		"description": "Confiable y económico para entregas diarias"
	},
	{
		"id": "car_van",
		"name": "Furgoneta de Carga",
		"type": "car",
		"price": 45000,
		"max_speed": 160,
		"acceleration": 5.5,
		"weight": 2000,
		"cargo_capacity": 500,
		"fuel_consumption": 10.0,
		"description": "Máxima capacidad de carga para entregas grandes"
	},
	{
		"id": "car_suv",
		"name": "SUV Todoterreno",
		"type": "car",
		"price": 35000,
		"max_speed": 190,
		"acceleration": 7.5,
		"weight": 1800,
		"cargo_capacity": 300,
		"fuel_consumption": 9.0,
		"description": "Versátil para diferentes tipos de terreno"
	}
]

const LOCATIONS = [
	{
		"id": "santiago",
		"name": "Santiago",
		"region": "Metropolitana",
		"communes": [
			"Las Condes",
			"Providencia",
			"Ñuñoa",
			"La Florida",
			"Puente Alto",
			"San Bernardo",
			"Maipú",
			"Renca"
		],
		"coordinates": Vector2(300, 400)
	},
	{
		"id": "valparaiso",
		"name": "Valparaíso",
		"region": "Valparaíso",
		"communes": [
			"Valparaíso",
			"Viña del Mar",
			"Quilpué",
			"Villa Alemana"
		],
		"coordinates": Vector2(200, 350)
	},
	{
		"id": "concepcion",
		"name": "Concepción",
		"region": "Bío Bío",
		"communes": [
			"Concepción",
			"Talcahuano",
			"Los Ángeles",
			"Temuco"
		],
		"coordinates": Vector2(250, 550)
	},
	{
		"id": "puerto_montt",
		"name": "Puerto Montt",
		"region": "Los Lagos",
		"communes": [
			"Puerto Montt",
			"Calbuco",
			"Puerto Varas",
			"Llanquihue"
		],
		"coordinates": Vector2(200, 750)
	},
	{
		"id": "antofagasta",
		"name": "Antofagasta",
		"region": "Antofagasta",
		"communes": [
			"Antofagasta",
			"Calama",
			"San Pedro de Atacama"
		],
		"coordinates": Vector2(300, 100)
	}
]

func get_all_vehicles() -> Array:
	return VEHICLES

func get_vehicle_by_id(vehicle_id: String) -> Dictionary:
	for vehicle in VEHICLES:
		if vehicle.id == vehicle_id:
			return vehicle.duplicate()
	return {}

func get_all_locations() -> Array:
	return LOCATIONS

func get_location_by_id(location_id: String) -> Dictionary:
	for location in LOCATIONS:
		if location.id == location_id:
			return location.duplicate()
	return {}

func get_communes_for_location(location_id: String) -> Array:
	var location = get_location_by_id(location_id)
	return location.get("communes", [])
