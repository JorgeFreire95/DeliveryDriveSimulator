# Main Menu Controller
extends CanvasLayer

var vehicle_data = preload("res://scripts/data/vehicle_data.gd").new()
var game_manager = preload("res://scripts/game/game_manager.gd")

var selected_vehicle: Dictionary = {}
var selected_location: String = ""

@onready var vehicle_list = $Panel/VBoxContainer/VehicleList
@onready var start_button = $Panel/VBoxContainer/StartButton

func _ready():
	# Conectar señales
	vehicle_list.item_selected.connect(_on_vehicle_selected)
	start_button.pressed.connect(_on_start_game)
	
	# Inicializar GameManager si no existe
	if not GameManager:
		GameManager = game_manager.new()
		get_tree().root.add_child(GameManager)

func _on_vehicle_selected(index: int):
	var vehicles = vehicle_data.get_all_vehicles()
	if index >= 0 and index < vehicles.size():
		selected_vehicle = vehicles[index]
		print("Vehículo seleccionado: ", selected_vehicle.name)

func _on_start_game():
	if selected_vehicle.is_empty():
		print("Debes seleccionar un vehículo primero")
		return
	
	# Configurar el vehículo en GameManager
	GameManager.selected_vehicle = selected_vehicle.id
	GameManager.selected_location = "santiago"  # Por defecto
	
	# Cargar la escena del juego
	get_tree().change_scene_to_file("res://scenes/game/GameScene.tscn")
