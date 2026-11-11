# Main Menu Controller
extends CanvasLayer

var vehicle_data = preload("res://scripts/data/vehicle_data.gd").new()

var selected_vehicle: Dictionary = {}
var selected_location: String = ""

@onready var vehicle_list = $Panel/VBoxContainer/VehicleList
@onready var start_button = $Panel/VBoxContainer/StartButton

func _ready():
	print("🎮 MainMenu iniciando...")
	
	# Conectar señales
	vehicle_list.item_selected.connect(_on_vehicle_selected)
	start_button.pressed.connect(_on_start_game)
	
	print("✅ MainMenu listo")

func _on_vehicle_selected(index: int):
	var vehicles = vehicle_data.get_all_vehicles()
	if index >= 0 and index < vehicles.size():
		selected_vehicle = vehicles[index]
		print("🏍️ Vehículo seleccionado: ", selected_vehicle.name)

func _on_start_game():
	print("▶️ Iniciando juego...")
	
	if selected_vehicle.is_empty():
		print("❌ Error: Debes seleccionar un vehículo primero")
		return
	
	print("✅ Vehículo: ", selected_vehicle.name)
	print("✅ Cambiando a escena GameScene...")
	
	# Cargar la escena del juego
	var error = get_tree().change_scene_to_file("res://scenes/game/GameScene.tscn")
	
	if error != OK:
		print("❌ Error al cargar escena: ", error)
