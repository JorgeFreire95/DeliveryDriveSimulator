# Main Menu Controller
extends Control

var vehicle_data = preload("res://scripts/data/vehicle_data.gd").new()

var selected_vehicle: Dictionary = {}
var selected_location: String = ""

@onready var vehicle_list = $Panel/VBoxContainer/VehicleList
@onready var start_button = $Panel/VBoxContainer/StartButton
@onready var selection_status: Label = $Panel/VBoxContainer/SelectionStatus
@onready var menu_panel: Panel = $Panel
@onready var menu_container: VBoxContainer = $Panel/VBoxContainer

func _ready():
	print("🎮 MainMenu iniciando...")
	add_child(vehicle_data)
	_layout_menu()
	get_viewport().size_changed.connect(_layout_menu)
	
	vehicle_list.clear()
	for vehicle in vehicle_data.get_all_vehicles():
		var vehicle_type = "Motocicleta" if vehicle.type == "motorcycle" else "Automóvil"
		vehicle_list.add_item("%s — %s" % [vehicle_type, vehicle.name])

	selection_status.text = "Selecciona un vehículo para continuar."
	start_button.disabled = true

	# Conectar señales
	vehicle_list.item_selected.connect(_on_vehicle_selected)
	start_button.pressed.connect(_on_start_game)
	
	print("✅ MainMenu listo")

func _layout_menu():
	var viewport_size = get_viewport_rect().size
	set_anchors_and_offsets_preset(Control.PRESET_TOP_LEFT)
	position = Vector2.ZERO
	size = viewport_size
	menu_panel.set_anchors_and_offsets_preset(Control.PRESET_TOP_LEFT)
	menu_panel.position = Vector2.ZERO
	menu_panel.size = viewport_size
	menu_container.set_anchors_and_offsets_preset(Control.PRESET_TOP_LEFT)
	menu_container.size = Vector2(520.0, 480.0)
	menu_container.position = (viewport_size - menu_container.size) / 2.0

func _on_vehicle_selected(index: int):
	var vehicles = vehicle_data.get_all_vehicles()
	if index >= 0 and index < vehicles.size():
		selected_vehicle = vehicles[index]
		selection_status.text = "Seleccionado: %s" % selected_vehicle.name
		start_button.disabled = false
		print("🏍️ Vehículo seleccionado: ", selected_vehicle.name)

func _on_start_game():
	print("▶️ Iniciando juego...")
	
	if selected_vehicle.is_empty():
		selection_status.text = "Primero selecciona un vehículo de la lista."
		print("❌ Error: Debes seleccionar un vehículo primero")
		return
	
	print("✅ Vehículo: ", selected_vehicle.name)
	print("✅ Cambiando a escena GameScene...")
	selection_status.text = "Cargando juego..."
	
	var game_scene = ResourceLoader.load("res://scenes/game/GameScene.tscn") as PackedScene
	if game_scene == null:
		selection_status.text = "No se pudo leer GameScene.tscn. Revisa Salida."
		push_error("No se pudo cargar res://scenes/game/GameScene.tscn como PackedScene.")
		return

	var error = get_tree().change_scene_to_packed(game_scene)
	
	if error != OK:
		selection_status.text = "No se pudo cargar el juego (error %d)." % error
		print("❌ Error al cargar escena: ", error)
