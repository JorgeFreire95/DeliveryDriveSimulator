# Plan de Acción - DeliveryDriveSimulator

## Próximos Pasos Inmediatos

### Fase 1: Escenas Básicas (Esta semana)

#### 1. Crear MainMenuScene.tscn
- [ ] Nodo Control como raíz
- [ ] Agregar BackgroundPanel (fondo)
- [ ] Agregar título "DeliveryDriveSimulator"
- [ ] Agregar VehicleSelectionPanel
  - [ ] Mostrar lista de vehículos
  - [ ] Botones para cada vehículo
  - [ ] Mostrar especificaciones
- [ ] Agregar LocationSelectionPanel
  - [ ] Mostrar ciudades
  - [ ] Mostrar comunas por ciudad
- [ ] Botón "COMENZAR"
- [ ] Conectar con main_menu.gd

**Archivo**: `scenes/main_menu/main_menu_scene.tscn`

#### 2. Crear GameScene.tscn
- [ ] Node3D como raíz
- [ ] Agregar World3D (contenedor de mapa)
- [ ] Agregar PlayerVehicle (CharacterBody3D)
  - [ ] Mesh para el vehículo
  - [ ] CollisionShape3D
  - [ ] Camera3D
- [ ] Agregar GameHUD (CanvasLayer)
- [ ] Agregar luz (DirectionalLight3D para el sol)
- [ ] Agregar terreno básico (CSGBox3D temporal)

**Archivo**: `scenes/game/game_scene.tscn`

### Fase 2: Escenas 3D Simples (Semana 2)

#### 1. Mapa Básico
- [ ] Crear terreno plano de prueba
- [ ] Agregar carreteras simples (CSGBox3D)
- [ ] Agregar límites del mundo
- [ ] Crear la capital Santiago (zona pequeña)

#### 2. Garages y Dealerships
- [ ] Crear modelo simple de garage
- [ ] Crear modelo simple de concesionaria
- [ ] Posicionarlos en el mapa

### Fase 3: Funcionalidad Core (Semana 3)

#### 1. Sistema de Conducción Completo
- [ ] Mejorar física del movimiento
- [ ] Implementar dirección realista
- [ ] Agregar rotación de vista con mouse
- [ ] Agregar animaciones de cabeza (camera bob)

#### 2. Sistema de Combustible
- [ ] Consumo variable según velocidad
- [ ] Estaciones de gasolina en el mapa
- [ ] Interfaz de repostaje

#### 3. Sistema de Misiones
- [ ] Crear estructura de datos para misiones
- [ ] Implementar generador de misiones
- [ ] Sistema de aceptar/rechazar misiones
- [ ] Mostrar puntos de entrega en el mapa

### Fase 4: Pulido Inicial (Semana 4)

#### 1. Audio
- [ ] Sonido del motor
- [ ] Sonido de aceleración/frenado
- [ ] Música de menú
- [ ] Música de juego

#### 2. Visual
- [ ] Mejorar HUD visual
- [ ] Agregar brújula/mapa
- [ ] Agregar indicadores de misión
- [ ] Mejorar iluminación

---

## Tareas Técnicas Específicas

### Script: MainMenuScene.gd
```gdscript
extends Control

func _ready():
    # Conexiones
    $VehiclePanel/VehicleButtons.pressed.connect(_on_vehicle_selected)
    $LocationPanel/LocationButtons.pressed.connect(_on_location_selected)
    $StartButton.pressed.connect(_on_start_game)

func _on_vehicle_selected(vehicle_data: Dictionary):
    # Mostrar detalles del vehículo
    pass

func _on_location_selected(location_data: Dictionary):
    # Mostrar comunas disponibles
    pass

func _on_start_game():
    # Validar selecciones
    # Guardar en GameManager
    # Cargar escena del juego
    pass
```

### Script: GameScene.gd
```gdscript
extends Node3D

func _ready():
    # Obtener referencias
    var player = $PlayerVehicle
    var hud = $GameHUD
    var game_manager = get_tree().root.get_child(0).get_node("GameManager")
    
    # Configurar vehículo inicial
    var vehicle = game_manager.get_current_vehicle()
    player.setup(vehicle)
    
    print("Juego iniciado en: ", player.global_position)

func _process(delta):
    # Lógica del juego
    pass
```

---

## Recursos Recomendados para Descargar

### Modelos 3D
- **Motocicletas**: Sketchfab (buscar "motorcycle free")
- **Autos**: Sketchfab (buscar "car free")
- **Carreteras**: Kenney.nl
- **Árboles/Natureza**: Sketchfab

### Sonidos
- **Motor**: Freesound.org (buscar "engine sound")
- **Frenado**: Freesound.org (buscar "brake sound")
- **Música**: OpenGameArt.org

### Texturas
- **Asfalto**: Textures.com (versión gratuita)
- **Terreno**: OpenGameArt.org
- **Edificios**: Kenney.nl

---

## Testing Local

### Lista de Verificación Antes de Commit
- [ ] El código compila sin errores
- [ ] El juego inicia sin crashes
- [ ] Se abre el menú principal
- [ ] Se puede seleccionar vehículo
- [ ] Se puede seleccionar ubicación
- [ ] Se puede iniciar el juego
- [ ] El vehículo se puede conducir
- [ ] El HUD muestra información correcta
- [ ] No hay memory leaks (revisar monitor)
- [ ] FPS es aceptable (>30 FPS)

---

## Colaboración y PRs

### Crear Feature Branch
```bash
git checkout -b feature/main-menu-scene
# ... hacer cambios ...
git add -A
git commit -m "Create main menu scene with vehicle selection"
git push origin feature/main-menu-scene
# Abrir PR en GitHub
```

### Checklist de PR
- [ ] Título descriptivo
- [ ] Descripción clara de cambios
- [ ] Referencias a issues relacionados (#123)
- [ ] Testing realizado localmente
- [ ] Sin conflictos con `develop`
- [ ] Código sigue convenciones del proyecto

---

## Issues Conocidos

- [ ] Las escenas .tscn no están creadas aún
- [ ] El sistema de guardado no está completamente implementado
- [ ] Falta la física realista de vehículos
- [ ] El mapa de Chile no está creado
- [ ] Falta audio y música

---

## Notas Importantes

1. **Godot Versión**: Usar 4.2+ (compatible con scripts actuales)
2. **GDScript**: Usar GDScript 2.0 (Godot 4)
3. **Exported Vars**: Usar @export para variables editables en editor
4. **Señales**: Usar signal_name.connect() para conectar
5. **Física**: CharacterBody3D para movimiento, RigidBody3D para física completa

---

## Recursos de Referencia

- Documentación: https://docs.godotengine.org/en/stable/
- GDScript Docs: https://docs.godotengine.org/en/stable/getting_started/scripting/gdscript/
- 3D in Godot: https://docs.godotengine.org/en/stable/tutorials/3d/introduction_to_3d.html
- Física: https://docs.godotengine.org/en/stable/tutorials/3d/using_3d_characters/index.html

---

**Última actualización**: Diciembre 2024
**Próxima revisión**: Semana 1 después de crear las escenas base
