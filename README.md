# DeliveryDriveSimulator

Un simulador de entregas estilo Euro Truck Simulator 2, ubicado en Chile.

## Características

- 🚗 Selecciona entre motocicleta o automóvil
- 🗺️ Mapa de Chile con diferentes comunas
- 🏢 Garages para guardar vehículos
- 🏪 Concesionarias para comprar nuevos vehículos
- 📦 Sistema de entregas y misiones
- 💰 Economía y gestión de dinero
- 🎮 Controles tipo ETS2 (primera persona)

## Tecnología

- **Motor**: Godot 4.2+
- **Lenguaje**: GDScript
- **Plataforma**: Windows, Linux, macOS (expandible a móviles)

## Estructura del Proyecto

```
DeliveryDriveSimulator/
├── scenes/              # Escenas de Godot (.tscn)
│   ├── main_menu.tscn
│   ├── game/
│   │   ├── player_vehicle.tscn
│   │   └── game_world.tscn
│   └── ui/
├── scripts/             # GDScript (.gd)
│   ├── player/
│   ├── vehicles/
│   ├── game/
│   ├── ui/
│   ├── data/
│   └── utils/
├── assets/              # Recursos (modelos 3D, texturas, audio)
│   ├── models/
│   ├── textures/
│   ├── sounds/
│   └── music/
├── data/                # Datos del juego (JSON, CSV)
│   ├── vehicles.json
│   ├── locations.json
│   └── missions.json
└── project.godot        # Configuración del proyecto
```

## Estado del Proyecto

- [x] Setup inicial
- [ ] Mecánicas de conducción básicas
- [ ] Sistema de selección de vehículos
- [ ] Mapa de Chile
- [ ] Garages
- [ ] Concesionarias
- [ ] Sistema de entregas
- [ ] Multijugador (fase 2)

## Desarrollo

Para abrir el proyecto en Godot:
1. Descarga [Godot 4.2+](https://godotengine.org/download)
2. Abre este directorio como nuevo proyecto
3. Inicia con `scenes/main_menu.tscn`

## Contribuciones

¡Las contribuciones son bienvenidas! Por favor:
1. Fork el proyecto
2. Crea una rama (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abre un Pull Request

## Licencia

MIT License