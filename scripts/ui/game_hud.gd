# Game UI - Muestra información en pantalla
extends CanvasLayer

var player_vehicle: Node3D

@onready var speed_label = $HUDPanel/SpeedLabel
@onready var money_label = $HUDPanel/MoneyLabel
@onready var fuel_label = $HUDPanel/FuelLabel
@onready var location_label = $HUDPanel/LocationLabel

func _ready():
	print("🎨 GameHUD iniciando...")
	
	# Obtener referencias
	player_vehicle = get_parent().find_child("Player", true, false)
	
	if not player_vehicle:
		print("⚠️ Advertencia: Player no encontrado en la escena")
		return
	
	print("✅ Player encontrado")
	
	# Conectar señales si existen
	if player_vehicle:
		if player_vehicle.has_signal("speed_changed"):
			player_vehicle.connect("speed_changed", Callable(self, "_on_speed_changed"))
		if player_vehicle.has_signal("fuel_changed"):
			player_vehicle.connect("fuel_changed", Callable(self, "_on_fuel_changed"))
	
	# Inicializar valores
	_update_display()
	print("✅ GameHUD listo")

func _process(_delta):
	# Actualizar pantalla cada frame
	if player_vehicle:
		_update_display()

func _update_display():
	if not player_vehicle:
		return
	
	# Actualizar velocidad
	var speed = float(player_vehicle.get("current_speed")) * 3.6
	speed_label.text = "Velocidad: %.1f km/h" % speed
	
	# Cambiar color según velocidad
	var max_speed = 200.0
	var speed_ratio = min(speed / max_speed, 1.0)
	var color = Color.RED.lerp(Color.GREEN, 1.0 - speed_ratio)
	speed_label.add_theme_color_override("font_color", color)
	
	# Actualizar combustible
	var fuel_amount = float(player_vehicle.get("fuel_amount"))
	var max_fuel = float(player_vehicle.get("max_fuel"))
	var fuel_percentage = (fuel_amount / max_fuel) * 100.0
	fuel_label.text = "Combustible: %.1f%%" % fuel_percentage
	
	# Cambiar color según combustible
	var fuel_color = Color.RED if fuel_percentage < 20.0 else Color.YELLOW if fuel_percentage < 50.0 else Color.GREEN
	fuel_label.add_theme_color_override("font_color", fuel_color)
	
	# Actualizar dinero (valor fijo por ahora)
	money_label.text = "Dinero: $1000"

func _on_speed_changed(speed: float):
	speed_label.text = "Velocidad: %.1f km/h" % speed

func _on_fuel_changed(fuel: float):
	var fuel_percentage = fuel * 100.0
	fuel_label.text = "Combustible: %.1f%%" % fuel_percentage
