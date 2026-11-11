# Quick Start Guide - DeliveryDriveSimulator

Guía rápida para empezar con el proyecto en 5 minutos.

## ⚡ Setup en 5 Minutos

### 1️⃣ Descargar Godot
```
👉 https://godotengine.org/download
👉 Descarga: Godot 4.2 o superior
👉 Extrae el archivo
```

### 2️⃣ Clonar Repositorio
```bash
git clone https://github.com/JorgeFreire95/DeliveryDriveSimulator.git
cd DeliveryDriveSimulator
```

### 3️⃣ Abrir en Godot
```
1. Ejecuta Godot
2. Click en "Open Project"
3. Navega a: DeliveryDriveSimulator/
4. Click en "Open"
```

### 4️⃣ Ejecutar Juego
```
Presiona: F5
O: Click en botón Play (▶️) arriba a la derecha
```

## 📂 Estructura Básica

```
DeliveryDriveSimulator/
├── scripts/              # Código GDScript
│   ├── game/            # Lógica del juego
│   ├── player/          # Control del jugador
│   ├── ui/              # Interfaz
│   └── data/            # Datos
├── scenes/              # Escenas (a crear)
├── assets/              # Modelos, texturas, sonidos
├── data/                # Archivos JSON
├── ARCHITECTURE.md      # Arquitectura del proyecto
├── DEVELOPMENT.md       # Guía de desarrollo detallada
└── README.md            # Información del proyecto
```

## 🎮 Controles Básicos (Cuando el juego esté completo)

| Acción | Tecla |
|--------|-------|
| Acelerar | W / ⬆️ |
| Frenar | S / ⬇️ |
| Girar Izquierda | A / ⬅️ |
| Girar Derecha | D / ➡️ |
| Mirar | Click Derecho + Mouse |

## 🔧 Primeras Tareas

1. **Leer Documentación**
   - Empieza con README.md
   - Lee ARCHITECTURE.md
   - Consulta TASKS.md

2. **Crear Escenas Base**
   - MainMenuScene.tscn
   - GameScene.tscn
   (Ver TASKS.md para detalles)

3. **Ejecutar el Juego**
   - Presionar F5 en Godot
   - Ver que aparece el menú principal

## 💡 Características Actuales (v0.1.0)

✅ **Sistema de Gestión**
- GameManager (dinero, vehículos, estado)

✅ **Base de Datos**
- 5 vehículos disponibles
- 5 ciudades chilenas
- 24 comunas

✅ **Scripts Base**
- Control de vehículo (primera persona)
- Menú de selección
- HUD con información

❌ **Aún No Implementado**
- Escenas 3D (tscn files)
- Mapa de Chile
- Sistema de entregas
- Audio y música

## 🚀 Próximas Características

| Fase | Duración | Features |
|------|----------|----------|
| **v0.1** | Actual | MVP base |
| **v0.2** | 1-2 meses | Mapa, entregas, garages |
| **v0.3** | 2-3 meses | Pulido visual, sonido |
| **v1.0** | 3-5 meses | Lanzamiento |

## 📚 Archivos Importantes

```
🔴 LEER PRIMERO:
├── README.md              ← Información general
├── ARCHITECTURE.md        ← Cómo está organizado
└── TASKS.md              ← Qué hacer ahora

🟡 REFERENCIA:
├── DEVELOPMENT.md        ← Guía completa de desarrollo
├── ROADMAP.md           ← Features planeadas
└── CONTRIBUTING.md      ← Cómo contribuir

🟢 CONFIGURACIÓN:
├── project.godot        ← Config de Godot
└── .editorconfig        ← Estilo de código
```

## ❓ Preguntas Frecuentes

**P: ¿Qué versión de Godot necesito?**
R: Godot 4.2 o superior (compatible con GDScript 2.0)

**P: ¿Puedo usar C# en lugar de GDScript?**
R: Técnicamente sí, pero el proyecto está en GDScript

**P: ¿Dónde descargo modelos 3D?**
R: Sketchfab, Kenney.nl, OpenGameArt.org

**P: ¿Cómo contribuyo?**
R: Lee CONTRIBUTING.md y abre un PR

**P: ¿Se ejecuta en móviles?**
R: Godot lo soporta, pero será para PC primero

## 📞 Obtener Ayuda

- 📖 Docs: https://docs.godotengine.org/
- 💬 Discord: https://discord.gg/godotengine
- 🐛 Issues: https://github.com/JorgeFreire95/DeliveryDriveSimulator/issues
- 💬 Discussions: GitHub Discussions (futuro)

## ✅ Checklist de Inicio

- [ ] Descargué Godot 4.2+
- [ ] Clonié el repositorio
- [ ] Abrí el proyecto en Godot
- [ ] Leí el README.md
- [ ] Leí el ARCHITECTURE.md
- [ ] Ejecuté F5 para ver el proyecto
- [ ] Exploré los scripts en `scripts/`
- [ ] Leí el TASKS.md
- [ ] Estoy listo para empezar a desarrollar

## 🎯 Tu Primer PR (Recomendado)

**Opción 1: Fácil**
- Mejorar documentación
- Agregar comentarios a scripts

**Opción 2: Intermedia**
- Crear MainMenuScene.tscn
- Implementar selección de vehículo

**Opción 3: Avanzada**
- Crear GameScene.tscn
- Implementar física de conducción mejorada

¡Elige una y abre un PR! 🚀

---

**¿Necesitas más ayuda?** 👉 Abre un [Discussion](https://github.com/JorgeFreire95/DeliveryDriveSimulator/discussions) en GitHub

**Última actualización**: Diciembre 2024
**Versión**: 0.1.0
