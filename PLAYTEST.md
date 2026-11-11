# 🎮 PLAYTEST - DeliveryDriveSimulator v0.1.0

## ¡El juego ya está listo para probar!

Se han creado las escenas mínimas necesarias para un prototipo jugable.

---

## 🚀 Cómo ejecutar el juego

### 1️⃣ Requisitos
- **Godot 4.2+** (Descarga desde https://godotengine.org/download)
- Este proyecto (`DeliveryDriveSimulator/`)

### 2️⃣ Pasos para jugar

1. Abre **Godot 4.2+**
2. Click en **File > Open Project**
3. Navega a: `C:\Users\libre\OneDrive\Documentos\DeliveryDriveSimulator`
4. Click en **Select Current Folder**
5. Espera a que se abra el editor (~10-15 segundos)
6. Presiona **F5** o click en el botón **▶️ Play** en la esquina superior derecha

¡El juego debería iniciar! 🎉

---

## 🎮 Controles en juego

### En el menú
- **Click en vehículo**: Selecciona tu vehículo
- **Click en "Comenzar Juego"**: Inicia el juego

### Durante la conducción

| Control | Acción |
|---------|--------|
| **W** o **↑** | Acelerar |
| **S** o **↓** | Frenar |
| **A** o **←** | Girar izquierda |
| **D** o **→** | Girar derecha |
| **Mouse Derecha + Movimiento** | Mover cámara |
| **ESC** | Volver al menú |

---

## 📊 Qué puedes probar

✅ **Menú de selección** - Elige entre 5 vehículos:
  - 🏍️ Yamaha Motocicleta (rápida)
  - 🏍️ Harley Motocicleta (potente)
  - 🚗 Toyota Auto (económico)
  - 🚕 Scania Camioneta (carga)
  - 🚘 Volvo Premium (lujo)

✅ **Conducción 3D** - Maneja en primera persona:
  - Aceleración progresiva
  - Frenado realista
  - Giro suave
  - Control de cámara con mouse

✅ **Sistema de combustible** - Consume gasolina:
  - Vea el porcentaje en tiempo real
  - El consumo depende de la velocidad
  - Indicador cambia de color (rojo = bajo)

✅ **HUD en juego** - Información en pantalla:
  - Velocímetro (km/h)
  - Nivel de combustible (%)
  - Dinero ($)
  - Ubicación actual
  - Controles

---

## 🐛 Problemas conocidos (v0.1.0)

1. **Terreno plano** - Actualmente es solo un plano grande
   - ✅ PRÓXIMO: Crear terreno de Chile con alturas

2. **Sin modelos 3D** - Vehículos son cubos por ahora
   - ✅ PRÓXIMO: Descargar/crear modelos de Sketchfab

3. **Sin misiones** - No hay entregas todavía
   - ✅ PRÓXIMO: Implementar sistema de entregas (v0.2)

4. **Sin garages/concesionarias** - No hay puntos de interés
   - ✅ PRÓXIMO: Agregar ubicaciones especiales (v0.2)

5. **Mapa sin límites** - Puedes salir del área visible
   - ✅ PRÓXIMO: Añadir límites de mapa (v0.2)

---

## ✨ Características implementadas

- ✅ Sistema de conducción 3D en primera persona
- ✅ Selección de vehículos en menú
- ✅ Sistema de combustible realista
- ✅ HUD con velocímetro y combustible
- ✅ Controles intuitivos (WASD + Mouse)
- ✅ Base de datos de 5 vehículos
- ✅ Base de datos de 5 ciudades chilenas

---

## 🎯 Próximas características (v0.2)

- 📍 Sistema de entregas/misiones
- 🏠 Garages para guardar vehículos
- 🏪 Concesionarias para comprar vehículos
- 🗺️ Mapa real de Chile (terreno 3D)
- 🚗 Modelos 3D reales de vehículos
- 🎵 Sonido de motor y música
- 💰 Sistema económico expandido

---

## 📞 Si algo no funciona

1. Asegúrate de que **Godot 4.2+** está instalado
2. Verifica que las carpetas `scripts/`, `scenes/`, `data/` existen
3. Revisa la **Consola de Salida** (Output) en Godot para errores
4. Intenta **Reimportar** el proyecto: Tools > Reimport
5. Si sigue sin funcionar, revisa **DEVELOPMENT.md**

---

## 🎉 ¡A divertirse!

Eres uno de los primeros en probar DeliveryDriveSimulator. 

Envía feedback sobre:
- ¿Cómo se siente la conducción?
- ¿Las velocidades son realistas?
- ¿Los controles son intuitivos?
- ¿Qué mejoría harías primero?

**Versión:** 0.1.0 MVP  
**Estado:** Prototipo Jugable  
**Última actualización:** 11/11/2026
