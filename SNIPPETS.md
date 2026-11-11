# Tips y Recetas de Código - DeliveryDriveSimulator

Snippets y ejemplos útiles para acelerar el desarrollo.

## 🔧 Recetas Comunes

### Acceder al GameManager desde cualquier script

```gdscript
var game_manager = get_tree().root.get_child(0).get_node("GameManager")
game_manager.add_money(1000)
```

### Usar señales del GameManager

```gdscript
func _ready():
    var game_manager = get_tree().root.get_child(0).get_node("GameManager")
    game_manager.money_changed.connect(_on_money_changed)

func _on_money_changed(new_amount):
    print("Dinero: $", new_amount)
```

### Cambiar escena

```gdscript
get_tree().change_scene_to_file("res://scenes/game/game_scene.tscn")
```

### Cargar datos JSON

```gdscript
var json = JSON.new()
var file = FileAccess.open("res://data/game_data.json", FileAccess.READ)
if file:
    var data = json.parse(file.get_as_text())
    if json.error == 0:
        print("Datos cargados:", data)
```

### Crear un Button programáticamente

```gdscript
var button = Button.new()
button.text = "Click me"
button.custom_minimum_size = Vector2(200, 50)
button.pressed.connect(_on_button_pressed)
add_child(button)

func _on_button_pressed():
    print("¡Botón presionado!")
```

### Movimiento 3D básico

```gdscript
extends CharacterBody3D

@export var speed: float = 10.0

func _physics_process(delta):
    velocity = (transform.basis.z * Input.get_axis("ui_up", "ui_down") * speed)
    velocity = move_and_slide()
```

### Panel HUD con información

```gdscript
extends CanvasLayer

func _ready():
    var label = Label.new()
    label.text = "Velocidad: 0 km/h"
    label.add_theme_font_size_override("font_size", 24)
    add_child(label)
```

---

## 🎨 Color Palette para UI

```gdscript
var colors = {
    "primary": Color.from_string("#2E7D32", Color.WHITE),      # Verde
    "secondary": Color.from_string("#1976D2", Color.WHITE),    # Azul
    "warning": Color.from_string("#F57C00", Color.WHITE),      # Naranja
    "danger": Color.from_string("#C62828", Color.WHITE),       # Rojo
    "success": Color.from_string("#00796B", Color.WHITE),      # Verde oscuro
    "text": Color.from_string("#212121", Color.WHITE),         # Negro
    "text_light": Color.from_string("#757575", Color.WHITE),   # Gris
}
```

---

## 📝 Template para Nuevo Script

```gdscript
# Nombre del Script - Descripción breve
extends Node3D

# Variables exportadas
@export var speed: float = 10.0

# Variables privadas
var _velocity: Vector3 = Vector3.ZERO

# Señales
signal state_changed(new_state: String)

func _ready():
    print("Script inicializado")

func _process(delta):
    pass

func _physics_process(delta):
    pass

func custom_function():
    pass
```

---

## 🎬 Template para Nueva Escena

1. Crea una nueva escena
2. Selecciona el nodo raíz según el tipo:
   - **UI**: Control
   - **3D**: Node3D
   - **Física**: CharacterBody3D o RigidBody3D

3. Estructura recomendada:
```
RootNode (Node3D/Control)
├── VisualElement (Mesh/Sprite)
├── Collision (CollisionShape3D)
├── SubNodes (children)
└── Script (attach .gd)
```

---

## 🐛 Debugging Tips

### Ver variables en tiempo real

```gdscript
print("Variable: ", variable)
print("Posición: ", global_position)
print("Frame: ", get_frame())
```

### Usar el Monitor

- Panel derecho > "Monitor"
- Muestra FPS, memoria, etc.

### Breakpoints

- Haz clic en el número de línea
- El juego se pausará al llegar

### Exportar variable para editar en editor

```gdscript
@export var health: float = 100.0  # Visible en Inspector
```

---

## ⚡ Performance Tips

### Desactivar proceso cuando no sea necesario

```gdscript
set_process(false)           # Desactiva _process()
set_physics_process(false)   # Desactiva _physics_process()
```

### Cachear referencias

```gdscript
func _ready():
    @onready var player = $Player  # Se asigna en _ready()
```

### Usar Autoload para singletons

En Project Settings > Autoload, agrega scripts que se cargan siempre.

---

## 📦 Estructura de Datos Común

### Vehicle Data

```gdscript
var vehicle = {
    "id": "unique_id",
    "name": "Nombre del vehículo",
    "type": "motorcycle",  # o "car"
    "price": 25000,
    "max_speed": 200,
    "acceleration": 7.0,
    "weight": 1200,
    "cargo_capacity": 200,
    "fuel_consumption": 8.0
}
```

### Mission Data

```gdscript
var mission = {
    "id": "mission_001",
    "from_location": "Santiago",
    "to_location": "Valparaíso",
    "cargo": "Paquetes variados",
    "weight": 100,
    "reward": 5000,
    "time_limit": 3600,  # segundos
    "difficulty": "easy"  # easy, medium, hard
}
```

### Player State

```gdscript
var player_state = {
    "money": 50000,
    "vehicles": [],
    "current_vehicle": 0,
    "current_location": "Santiago",
    "level": 1,
    "experience": 0,
    "missions_completed": 0
}
```

---

## 🎮 Input Handling

### Detectar teclas

```gdscript
func _input(event):
    if event is InputEventKey:
        if event.pressed:
            if event.keycode == KEY_W:
                print("W presionado")
            elif event.keycode == KEY_ESCAPE:
                get_tree().quit()
```

### Usar InputMap

```gdscript
# Ya están en project.godot por defecto:
if Input.is_action_pressed("ui_up"):
    print("Arriba")
if Input.is_action_just_pressed("ui_accept"):
    print("Espacio presionado")
```

### Mouse

```gdscript
if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
    print("Click izquierdo")
    
var mouse_pos = get_global_mouse_position()
```

---

## 💾 Guardado y Carga

### Guardar en JSON

```gdscript
var save_data = {
    "money": 50000,
    "vehicles": [],
    "timestamp": Time.get_ticks_msec()
}

var json_string = JSON.stringify(save_data)
var file = FileAccess.open("user://savegame.json", FileAccess.WRITE)
file.store_string(json_string)
```

### Cargar desde JSON

```gdscript
if FileAccess.file_exists("user://savegame.json"):
    var file = FileAccess.open("user://savegame.json", FileAccess.READ)
    var json = JSON.new()
    if json.parse(file.get_as_text()) == OK:
        var data = json.data
        print("Datos cargados")
```

---

## 🔊 Audio Básico

### Reproducir sonido simple

```gdscript
var sound = AudioStreamPlayer.new()
sound.stream = load("res://assets/sounds/engine.wav")
add_child(sound)
sound.play()
```

### Música de fondo

```gdscript
var music = AudioStreamPlayer.new()
music.stream = load("res://assets/music/background.ogg")
music.bus = "Music"  # Si tienes buses de audio
add_child(music)
music.play()
```

---

## 🌍 Manejo de Escenas

### Instanciar escena

```gdscript
var scene = preload("res://scenes/game/player.tscn")
var instance = scene.instantiate()
add_child(instance)
```

### Cambiar escena con transición

```gdscript
get_tree().change_scene_to_file("res://scenes/game/game_scene.tscn")
```

---

## 📊 Útiles para Debugging

### Timer para medir tiempo

```gdscript
var start_time = Time.get_ticks_msec()

# ... hacer algo ...

var elapsed = Time.get_ticks_msec() - start_time
print("Tiempo: ", elapsed, " ms")
```

### Contar frames

```gdscript
var frame_count = 0

func _process(delta):
    frame_count += 1
    if frame_count % 60 == 0:  # Cada ~1 segundo
        print("FPS: ", Engine.get_frames_per_second())
```

---

## 🎯 Convenciones de Código

### Nombrar variables

```gdscript
var player_health: float = 100.0      # Pública
var _internal_state: bool = true       # Privada
var CONST_VALUE = 42                   # Constante
```

### Nombrar funciones

```gdscript
func update_position():                # Pública
func _update_physics():                # Privada (prefijo _)
func _ready():                         # Ciclo de vida
func _process(delta):                  # Ciclo de vida
```

### Comentarios

```gdscript
# Comenta código COMPLEJO, no lo obvio
# Bueno: explicar por qué, no qué
# Usa /// para documentación

## Realiza cálculo especial para la física
func _calculate_velocity():
    pass
```

---

## 🚀 Optimizaciones Comunes

### Evitar crear objetos en loops

```gdscript
# ❌ Malo
for i in range(1000):
    var pos = Vector3(i, 0, 0)

# ✅ Bueno
var pos = Vector3.ZERO
for i in range(1000):
    pos.x = i
```

### Usar métodos built-in

```gdscript
# ✅ Mejor
speed = move_toward(speed, max_speed, acceleration)

# ❌ Más lento
if speed < max_speed:
    speed += acceleration
```

---

## 📚 Recursos Adicionales

- [GDScript Reference](https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/)
- [Built-in Functions](https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_basics.html)
- [API Reference](https://docs.godotengine.org/en/stable/classes/)

---

**¡Usa estos snippets para acelerar el desarrollo!** 🚀
