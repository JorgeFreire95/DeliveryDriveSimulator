# Main Menu Controller
extends Control

@onready var title_label = Label.new()
@onready var vehicle_selection_container = VBoxContainer.new()
@onready var location_selection_container = VBoxContainer.new()

var vehicle_data = preload("res://scripts/data/vehicle_data.gd").new()
var selected_vehicle: Dictionary
var selected_location: String
var selected_commune: String

func _ready():
	# Crear la interfaz del menú
	create_menu_ui()

func create_menu_ui():
	# Contenedor principal
	var main_container = VBoxContainer.new()
	main_container.anchor_left = 0.5
	main_container.anchor_top = 0.5
	main_container.anchor_right = 0.5
	main_container.anchor_bottom = 0.5
	main_container.offset_left = -200
	main_container.offset_top = -300
	add_child(main_container)
	
	# Título
	var title = Label.new()
	title.text = "DeliveryDriveSimulator"
	title.add_theme_font_size_override("font_size", 40)
	main_container.add_child(title)
	
	# Separador
	main_container.add_child(Control.new())
	
	# Selección de Vehículo
	var vehicle_label = Label.new()
	vehicle_label.text = "Selecciona tu Vehículo:"
	vehicle_label.add_theme_font_size_override("font_size", 20)
	main_container.add_child(vehicle_label)
	
	for vehicle in vehicle_data.get_all_vehicles():
		var btn = Button.new()
		btn.text = "%s ($%d)" % [vehicle.name, vehicle.price]
		btn.custom_minimum_size = Vector2(400, 50)
		btn.pressed.connect(_on_vehicle_selected.bindv([vehicle]))
		main_container.add_child(btn)
	
	# Separador
	main_container.add_child(Control.new())
	
	# Selección de Ubicación
	var location_label = Label.new()
	location_label.text = "Selecciona tu Ciudad de Inicio:"
	location_label.add_theme_font_size_override("font_size", 20)
	main_container.add_child(location_label)
	
	for location in vehicle_data.get_all_locations():
		var btn = Button.new()
		btn.text = location.name
		btn.custom_minimum_size = Vector2(400, 40)
		btn.pressed.connect(_on_location_selected.bindv([location.id]))
		main_container.add_child(btn)
	
	# Botón para comenzar
	var start_button = Button.new()
	start_button.text = "COMENZAR JUEGO"
	start_button.custom_minimum_size = Vector2(400, 60)
	start_button.add_theme_font_size_override("font_size", 24)
	start_button.pressed.connect(_on_start_game)
	main_container.add_child(start_button)

func _on_vehicle_selected(vehicle: Dictionary):
	selected_vehicle = vehicle
	print("Vehículo seleccionado: ", vehicle.name)

func _on_location_selected(location_id: String):
	selected_location = location_id
	print("Ubicación seleccionada: ", location_id)

func _on_start_game():
	if selected_vehicle.is_empty() or selected_location.is_empty():
		print("Debes seleccionar vehículo y ubicación")
		return
	
	# Obtener el GameManager y configurar el vehículo inicial
	var game_manager = get_tree().root.get_child(0).get_node("GameManager")
	if game_manager:
		game_manager.buy_vehicle(selected_vehicle)
		game_manager.select_vehicle(0)
	
	# Cargar la escena del juego
	get_tree().change_scene_to_file("res://scenes/game/game_scene.tscn")
