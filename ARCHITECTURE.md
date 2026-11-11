# Arquitectura del Juego - DeliveryDriveSimulator

## Visión General

DeliveryDriveSimulator es un juego de simulación de entregas estilo Euro Truck Simulator 2, desarrollado en Godot Engine usando GDScript. El juego se enfoca en la conducción realista, gestión de vehículos, y sistema de entregas en el territorio chileno.

## Componentes Principales

### 1. **Game Manager** (`scripts/game/game_manager.gd`)
- **Responsabilidad**: Gestión del estado global del juego
- **Funciones principales**:
  - Control de dinero del jugador
  - Gestión del inventario de vehículos
  - Selección de vehículo actual
  - Sistema de guardado/carga de partidas
  - Emisión de eventos globales
- **Señales**:
  - `money_changed(amount)` - Cuando cambia el dinero
  - `vehicle_changed(vehicle)` - Cuando se selecciona un vehículo

### 2. **Vehicle Data** (`scripts/data/vehicle_data.gd`)
- **Responsabilidad**: Base de datos de vehículos y ubicaciones
- **Contiene**:
  - Lista de todos los vehículos disponibles
  - Lista de ciudades y comunas de Chile
  - Métodos para consultar datos por ID
- **Estructura de datos de Vehículo**:
  ```gd
  {
    "id": "motorcycle_sport",
    "name": "Motocicleta Deportiva",
    "type": "motorcycle",
    "price": 15000,
    "max_speed": 200,
    "acceleration": 8.5,
    "weight": 200,
    "cargo_capacity": 50,
    "fuel_consumption": 4.5
  }
  ```

### 3. **Player Vehicle** (`scripts/player/player_vehicle.gd`)
- **Responsabilidad**: Física y control del vehículo del jugador
- **Características**:
  - Movimiento 3D con CharacterBody3D
  - Control de aceleración, frenado y dirección
  - Sistema de combustible
  - Cámara en primera persona tipo ETS2
  - Control por mouse para cámara
- **Señales**:
  - `speed_changed(speed)` - Velocidad actual
  - `fuel_changed(fuel)` - Combustible disponible

### 4. **Main Menu** (`scripts/ui/main_menu.gd`)
- **Responsabilidad**: Interfaz de menú principal
- **Funcionalidad**:
  - Selección de vehículo (motorcycles vs cars)
  - Selección de ciudad de inicio
  - Lanzamiento del juego
  - Integración con GameManager

### 5. **Game HUD** (`scripts/ui/game_hud.gd`)
- **Responsabilidad**: Interfaz en juego
- **Elementos mostrados**:
  - Velocímetro (km/h)
  - Dinero disponible
  - Nivel de combustible
  - Ubicación actual
  - Misiones activas (futuro)

## Flujo de Datos

```
GameManager (Estado Global)
    ├── money: float
    ├── owned_vehicles: Array[Dictionary]
    └── current_vehicle_index: int
            ↓
        PlayerVehicle (Primera Persona)
            ├── velocity: Vector3
            ├── current_speed: float
            ├── current_fuel: float
            └── camera: Camera3D
                ↓
            GameHUD (UI)
                ├── speed_label
                ├── money_label
                ├── fuel_label
                └── location_label
```

## Escenas de Godot

### Jerarquía de Escenas
```
Main
├── GameManager (Autoload/Singleton)
├── MainMenu Scene
│   └── MainMenuUI
└── GameScene
    ├── World3D (Terreno y objetos)
    ├── PlayerVehicle
    │   └── Camera3D
    ├── GameHUD
    ├── Garages (Lista de nodos Garage)
    ├── Dealerships (Lista de nodos Dealership)
    └── DeliveryPoints (Lista de puntos de entrega)
```

## Sistemas Futuros

### Sistema de Misiones
- Generación de entregas aleatorias
- Sistema de rutas
- Recompensas monetarias
- Sistema de reputación

### Sistema de Garages
- Almacenamiento de vehículos
- Reparación y mantenimiento
- Modificaciones estéticas

### Sistema de Concesionarias
- Compra de nuevos vehículos
- Visualización en 3D
- Sistema de financiamiento (créditos)

### Sistema Multijugador (Fase 2)
- Sincronización de posiciones
- Comunicación de voz
- Entregas cooperativas

## Patrones de Diseño Utilizados

1. **Singleton Pattern**: GameManager es un autoload único
2. **Observer Pattern**: Señales (signals) de Godot para comunicación
3. **MVC Pattern**: Separación entre datos (Scripts), vistas (Scenes) y controles (Input)
4. **Factory Pattern**: Creación de vehículos desde datos en vehicle_data.gd

## Configuración de Entrada

| Acción | Tecla |
|--------|-------|
| Acelerar | W / Arriba |
| Frenar | S / Abajo |
| Girar Izquierda | A / Izquierda |
| Girar Derecha | D / Derecha |
| Cámara | Click derecho + Mouse |
| Pausa | ESC (futuro) |
| Mapa | M (futuro) |

## Optimizaciones Consideradas

- LOD (Level of Detail) para objetos lejanos
- Culling de objetos fuera de pantalla
- Compresión de texturas
- Instancing para objetos repetitivos
- Cargar/descargar áreas del mapa dinámicamente

## Dependencias Externas

- Godot 4.2+
- GDScript (lenguaje nativo de Godot)

## Roadmap

### v0.1.0 (MVP Actual)
- [x] Estructura base del proyecto
- [x] Sistema de selección de vehículo
- [x] Controles básicos de conducción
- [ ] Escenas 3D básicas

### v0.2.0 (Gameplay Base)
- [ ] Mapa 3D de Chile
- [ ] Sistema de misiones/entregas
- [ ] Garages funcionales
- [ ] Concesionarias funcionales

### v0.3.0 (Pulido)
- [ ] Efectos visuales
- [ ] Sonidos y música
- [ ] UI mejorada
- [ ] Física mejorada

### v1.0.0 (Lanzamiento)
- [ ] Contenido completo
- [ ] Optimizaciones de rendimiento
- [ ] Pruebas extensivas

### v1.1.0+ (Futuro)
- [ ] Multijugador
- [ ] Expansiones de mapa
- [ ] Nuevos vehículos
- [ ] Modos de juego adicionales
