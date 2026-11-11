# Guía de Desarrollo - DeliveryDriveSimulator

## Setup Inicial

### Requisitos
- Godot Engine 4.2 o superior
- Windows 10+, Linux, o macOS
- Git para control de versiones

### Instalación

1. **Descargar Godot**:
   - Ve a https://godotengine.org/download
   - Descarga la versión 4.2 o superior
   - Extrae el ejecutable

2. **Clonar el repositorio**:
   ```bash
   git clone https://github.com/JorgeFreire95/DeliveryDriveSimulator.git
   cd DeliveryDriveSimulator
   ```

3. **Abrir en Godot**:
   - Abre Godot
   - Clic en "Abrir proyecto"
   - Navega a la carpeta del proyecto
   - Selecciona `project.godot`
   - Clic en "Abrir"

4. **Primera ejecución**:
   - Presiona F5 o clic en el botón Play
   - El proyecto debería cargar la escena principal

## Estructura de Carpetas

```
DeliveryDriveSimulator/
├── scripts/
│   ├── game/              # Lógica del juego
│   │   └── game_manager.gd
│   ├── player/            # Scripts del jugador
│   │   └── player_vehicle.gd
│   ├── vehicles/          # Lógica de vehículos
│   ├── ui/                # Scripts de interfaz
│   │   ├── main_menu.gd
│   │   └── game_hud.gd
│   ├── data/              # Datos del juego
│   │   └── vehicle_data.gd
│   └── utils/             # Utilidades
├── scenes/
│   ├── main_menu/
│   ├── game/
│   └── ui/
├── assets/
│   ├── models/            # Modelos 3D (.fbx, .glb)
│   ├── textures/          # Texturas
│   ├── sounds/            # Efectos de sonido
│   └── music/             # Música de fondo
├── data/                  # Archivos de datos JSON
└── project.godot          # Archivo de configuración
```

## Convenciones de Código

### GDScript
- **Clases**: CamelCase (ej: `PlayerVehicle`, `GameManager`)
- **Variables**: snake_case (ej: `current_speed`, `max_fuel`)
- **Funciones**: snake_case (ej: `_handle_input()`, `update_fuel()`)
- **Privadas**: prefijo _ (ej: `_update_movement()`)

### Nombres de Archivos
- Archivos de script: snake_case (ej: `player_vehicle.gd`)
- Escenas: snake_case (ej: `main_menu.tscn`)
- Directorios: plural en inglés (ej: `scripts/`, `scenes/`)

## Flujo de Trabajo Git

### Ramas
- `main` - Versión estable
- `develop` - Rama de desarrollo
- `feature/nombre-feature` - Nuevas características

### Crear nueva rama
```bash
git checkout -b feature/nueva-caracteristica
```

### Commit
```bash
git commit -m "Agregar descripción de cambio"
```

### Push
```bash
git push origin feature/nueva-caracteristica
```

### Pull Request
- Abre un PR en GitHub
- Describe los cambios
- Espera revisión

## Guía de Desarrollo de Escenas

### Crear una nueva escena

1. **En Godot Editor**:
   - Clic en `Scene` > `New Scene`
   - Selecciona el nodo raíz (ej: `Node3D`, `Control`)
   - Guarda la escena: Ctrl+S

2. **Estructura recomendada**:
   ```
   SceneName (Node3D/Control)
   ├── Mesh/Sprite/etc
   ├── CollisionShape3D
   ├── Script (attach script)
   └── Subnodos...
   ```

3. **Script principal**:
   ```gdscript
   extends Node3D
   
   func _ready():
       print("Escena cargada")
   
   func _process(delta):
       pass
   ```

## Guía de Desarrollo de Scripts

### Estructura básica de un script
```gdscript
# Descripción del script
extends Node3D

# Variables exportadas (visibles en editor)
@export var speed: float = 10.0

# Variables privadas
var _velocity: Vector3 = Vector3.ZERO

# Señales personalizadas
signal speed_changed(new_speed: float)

func _ready():
    # Código de inicialización
    pass

func _process(delta):
    # Código que se ejecuta cada frame
    pass

func _physics_process(delta):
    # Física
    pass

func custom_function():
    # Funciones personalizadas
    pass
```

### Conectar señales

**En editor**:
- Selecciona el nodo
- Va a pestaña "Node"
- Busca la señal
- Clic en "Connect"

**En código**:
```gdscript
signal_source.signal_name.connect(_on_signal_received)

func _on_signal_received(param):
    print("Señal recibida: ", param)
```

## Agregar Contenido 3D

### Importar modelos
1. Descarga modelos 3D (Blender, SketchUp, etc.)
2. Exporta como `.fbx` o `.gltf`
3. Copia a `assets/models/`
4. Godot importará automáticamente
5. Arrastra al editor para usar

### Crear el mapa de Chile
1. Opción 1: Usar terreno procedural (Godot)
2. Opción 2: Descargar mapa pre-hecho (Sketchfab)
3. Opción 3: Crear modelo en Blender

**Recomendado**: Empezar con Godot's Terrain3D plugin

## Sistema de Datos

### Estructura JSON
```json
{
  "vehicles": [
    {
      "id": "unique_id",
      "name": "Nombre",
      "type": "motorcycle|car",
      "price": 25000,
      "max_speed": 200,
      "acceleration": 7.0
    }
  ]
}
```

### Cargar datos en GDScript
```gdscript
var json = JSON.new()
var file = FileAccess.open("res://data/game_data.json", FileAccess.READ)
var data = json.parse(file.get_as_text())
```

## Testing

### Pruebas básicas
```gdscript
func test_vehicle_creation():
    var vehicle = {"name": "Test", "price": 1000}
    assert(vehicle.name == "Test")
```

## Debugging

### Console Output
```gdscript
print("Mensaje de debug")
print("Valor: ", variable)
```

### Debugger
- Presiona F5 para ejecutar
- Usa el Debugger en la parte inferior

### Breakpoints
- Haz clic en el número de línea para agregar breakpoints
- El juego se pausará cuando llegue al breakpoint

## Performance

### Profiler
- `Debug` > `Monitor` en el editor
- Muestra FPS, uso de memoria, etc.

### Optimizaciones básicas
```gdscript
# Evita actualizaciones innecesarias
if not is_visible_in_tree():
    return

# Usa process solamente cuando sea necesario
set_process(false)  # Desactiva si no se necesita
```

## Resources

### Documentación oficial
- https://docs.godotengine.org/
- https://gdscript.com/

### Comunidad
- Discord: https://discord.gg/godotengine
- Reddit: r/godot
- GitHub Discussions

### Assets gratuitos
- OpenGameArt.org
- Sketchfab.com
- Kenney.nl (game assets)
- Freesound.org (sonidos)

## FAQ

**P: ¿Por qué mi script no se carga?**
R: Verifica que el path sea correcto y que el archivo no tenga errores de sintaxis.

**P: ¿Cómo agrego música de fondo?**
R: Copia archivos `.wav` o `.ogg` a `assets/music/`, crea un AudioStreamPlayer, y asigna el archivo.

**P: ¿Puedo usar C# en lugar de GDScript?**
R: Sí, pero este proyecto usa GDScript por simplicidad.

## Siguientes Pasos

1. Familiarízate con el editor de Godot
2. Lee ARCHITECTURE.md para entender la estructura
3. Comienza con una característica simple
4. Prueba tu código antes de hacer commit
5. Abre un PR cuando tengas listos los cambios
