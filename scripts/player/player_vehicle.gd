# Player Vehicle - Controla la conducción del vehículo del jugador
extends CharacterBody3D

# Datos del vehículo
var vehicle_data: Dictionary
var current_speed: float = 0.0
var max_speed: float = 100.0
var acceleration: float = 5.0
var braking: float = 10.0
var steering_speed: float = 2.0

# Entrada del jugador
var input_acceleration: float = 0.0
var input_steering: float = 0.0
var input_brake: bool = false

# Física
var gravity: float = -9.8
var fuel_amount: float = 100.0
var max_fuel: float = 100.0

# Cámara
var camera: Camera3D
var camera_height: float = 1.5
var camera_rotation: Vector3 = Vector3.ZERO
var mouse_sensitivity: float = 0.002

# Señales
signal speed_changed(new_speed: float)
signal fuel_changed(new_fuel: float)

func _ready():
	print("🚗 PlayerVehicle iniciando...")
	
	# Obtener cámara
	camera = $Camera3D
	if not camera:
		print("❌ Error: Camera3D no encontrada!")
		return
	
	print("✅ Cámara encontrada")
	
	set_physics_process(true)
	
	# Capturar mouse
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	print("✅ PlayerVehicle listo")

func setup(data: Dictionary):
	vehicle_data = data
	max_speed = data.get("max_speed", 100.0)
	acceleration = data.get("acceleration", 5.0)
	print("Vehículo configurado: ", data.get("name", "Desconocido"))

func _physics_process(delta):
	# Entrada
	_handle_input()
	
	# Física
	_update_movement(delta)
	_update_fuel(delta)
	
	# Movimiento
	move_and_slide()
	
	# Emisión de señales
	speed_changed.emit(current_speed)
	fuel_changed.emit(fuel_amount / max_fuel)

func _handle_input():
	input_acceleration = 0.0
	input_steering = 0.0
	input_brake = false
	
	# Movimiento
	if Input.is_action_pressed("ui_up") or Input.is_key_pressed(KEY_W):
		input_acceleration = 1.0
	if Input.is_action_pressed("ui_down") or Input.is_key_pressed(KEY_S):
		input_brake = true
	
	# Dirección
	if Input.is_action_pressed("ui_left") or Input.is_key_pressed(KEY_A):
		input_steering = -1.0
	if Input.is_action_pressed("ui_right") or Input.is_key_pressed(KEY_D):
		input_steering = 1.0
	
	# Cámara (mouse look)
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
		var mouse_motion = Input.get_last_mouse_velocity()
		camera_rotation.y -= mouse_motion.x * mouse_sensitivity
		camera_rotation.x -= mouse_motion.y * mouse_sensitivity
		camera_rotation.x = clamp(camera_rotation.x, -PI / 2, PI / 2)
		camera.rotation = camera_rotation
	
	# Salir (ESC)
	if Input.is_action_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://scenes/main_menu/MainMenuScene.tscn")

func _update_movement(delta):
	# Aceleración
	if input_acceleration > 0.0:
		current_speed = move_toward(current_speed, max_speed, acceleration * delta)
	elif input_brake:
		current_speed = move_toward(current_speed, 0.0, braking * delta)
	else:
		current_speed = move_toward(current_speed, 0.0, 2.0 * delta)
	
	# Dirección
	var forward = -transform.basis.z
	var right = transform.basis.x
	
	rotation.y += input_steering * steering_speed * delta
	
	# Velocidad
	velocity = forward * current_speed
	
	# Gravedad
	velocity.y -= gravity * delta

func _update_fuel(delta):
	# Consumo de combustible
	if current_speed > 0.0:
		var consumption_rate = 0.1 * (current_speed / max_speed)
		fuel_amount -= consumption_rate * delta
		fuel_amount = max(fuel_amount, 0.0)

func get_speed_kmh() -> float:
	return current_speed * 3.6

func refuel(amount: float):
	fuel_amount = min(fuel_amount + amount, max_fuel)
