# Game UI - Muestra información en pantalla
extends CanvasLayer

var game_manager: Node
var player_vehicle: Node3D

# Elementos UI
@onready var speed_label = Label.new()
@onready var money_label = Label.new()
@onready var fuel_label = Label.new()
@onready var location_label = Label.new()

func _ready():
	# Obtener referencias
	game_manager = get_tree().root.get_child(0).get_node("GameManager")
	player_vehicle = get_tree().root.find_child("PlayerVehicle", true, false)
	
	# Crear UI
	_create_hud()
	
	# Conectar señales
	if game_manager:
		game_manager.money_changed.connect(_on_money_changed)
	if player_vehicle:
		player_vehicle.speed_changed.connect(_on_speed_changed)
		player_vehicle.fuel_changed.connect(_on_fuel_changed)

func _create_hud():
	# Velocímetro
	speed_label.text = "Velocidad: 0 km/h"
	speed_label.add_theme_font_size_override("font_size", 20)
	add_child(speed_label)
	
	# Dinero
	money_label.text = "Dinero: $%d" % game_manager.current_money
	money_label.add_theme_font_size_override("font_size", 20)
	money_label.anchor_left = 1.0
	money_label.offset_left = -250
	add_child(money_label)
	
	# Combustible
	fuel_label.text = "Combustible: 100%"
	fuel_label.add_theme_font_size_override("font_size", 20)
	fuel_label.anchor_top = 1.0
	fuel_label.offset_top = -50
	add_child(fuel_label)
	
	# Ubicación
	location_label.text = "Santiago, Chile"
	location_label.add_theme_font_size_override("font_size", 16)
	location_label.anchor_top = 1.0
	location_label.offset_left = 10
	location_label.offset_top = -50
	add_child(location_label)

func _on_speed_changed(speed: float):
	speed_label.text = "Velocidad: %.1f km/h" % speed
	
	# Cambiar color según velocidad
	var max_speed = 200.0
	var speed_ratio = min(speed / max_speed, 1.0)
	var color = Color.RED.lerp(Color.GREEN, 1.0 - speed_ratio)
	speed_label.add_theme_color_override("font_color", color)

func _on_money_changed(amount: float):
	money_label.text = "Dinero: $%.0f" % amount

func _on_fuel_changed(fuel: float):
	var fuel_percentage = fuel / 100.0 * 100.0
	fuel_label.text = "Combustible: %.1f%%" % fuel_percentage
	
	# Cambiar color según combustible
	var color = Color.RED if fuel < 20.0 else Color.YELLOW if fuel < 50.0 else Color.GREEN
	fuel_label.add_theme_color_override("font_color", color)
