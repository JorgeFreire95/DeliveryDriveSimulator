# Game Manager - Controla el estado global del juego
extends Node

var current_player: Node
var current_money: float = 50000.0  # Dinero inicial
var owned_vehicles: Array = []
var current_vehicle_index: int = -1

signal money_changed(new_amount: float)
signal vehicle_changed(new_vehicle: Dictionary)

func _ready():
	add_to_group("game_manager")
	print("GameManager inicializado")

func add_money(amount: float):
	current_money += amount
	money_changed.emit(current_money)
	print("Dinero: $", current_money)

func subtract_money(amount: float) -> bool:
	if current_money >= amount:
		current_money -= amount
		money_changed.emit(current_money)
		print("Dinero: $", current_money)
		return true
	print("Dinero insuficiente")
	return false

func buy_vehicle(vehicle_data: Dictionary) -> bool:
	var price = vehicle_data.get("price", 0)
	if subtract_money(price):
		vehicle_data["purchase_date"] = Time.get_ticks_msec()
		owned_vehicles.append(vehicle_data)
		print("Vehículo comprado: ", vehicle_data.get("name", "Desconocido"))
		return true
	return false

func select_vehicle(index: int):
	if index >= 0 and index < owned_vehicles.size():
		current_vehicle_index = index
		vehicle_changed.emit(owned_vehicles[index])
		print("Vehículo seleccionado: ", owned_vehicles[index].get("name"))

func get_current_vehicle() -> Dictionary:
	if current_vehicle_index >= 0 and current_vehicle_index < owned_vehicles.size():
		return owned_vehicles[current_vehicle_index]
	return {}

func save_game(filename: String = "user://savegame.json"):
	var save_data = {
		"money": current_money,
		"vehicles": owned_vehicles,
		"current_vehicle_index": current_vehicle_index,
		"timestamp": Time.get_ticks_msec()
	}
	var json_string = JSON.stringify(save_data)
	var file = FileAccess.open(filename, FileAccess.WRITE)
	file.store_string(json_string)
	print("Juego guardado: ", filename)

func load_game(filename: String = "user://savegame.json") -> bool:
	if FileAccess.file_exists(filename):
		var file = FileAccess.open(filename, FileAccess.READ)
		var json_string = file.get_as_text()
		var json = JSON.new()
		if json.parse(json_string) == OK:
			var data = json.data
			current_money = data.get("money", 50000.0)
			owned_vehicles = data.get("vehicles", [])
			current_vehicle_index = data.get("current_vehicle_index", -1)
			print("Juego cargado exitosamente")
			return true
	print("No se pudo cargar el juego")
	return false
