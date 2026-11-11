# Guía de Contribución - DeliveryDriveSimulator

¡Gracias por interesarte en contribuir al proyecto DeliveryDriveSimulator! 🚗

## Cómo Empezar

### Requisitos Previos
- Git instalado
- Godot Engine 4.2+
- Conocimiento básico de GDScript
- Familiaridad con Git y GitHub

### Setup de Desarrollo
1. Fork el repositorio
2. Clona tu fork: `git clone https://github.com/tu-usuario/DeliveryDriveSimulator.git`
3. Agrega el upstream: `git remote add upstream https://github.com/JorgeFreire95/DeliveryDriveSimulator.git`
4. Crea una rama: `git checkout -b feature/tu-caracteristica`

## Tipos de Contribuciones

### 🐛 Reportar Bugs
1. Ve a [Issues](https://github.com/JorgeFreire95/DeliveryDriveSimulator/issues)
2. Haz clic en "New Issue"
3. Selecciona "Bug report"
4. Completa:
   - Descripción clara del problema
   - Pasos para reproducir
   - Comportamiento esperado
   - Comportamiento actual
   - Versión de Godot y SO

### ✨ Proponer Características
1. Ve a [Issues](https://github.com/JorgeFreire95/DeliveryDriveSimulator/issues)
2. Haz clic en "New Issue"
3. Selecciona "Feature request"
4. Completa:
   - Descripción de la característica
   - Por qué sería útil
   - Casos de uso
   - Posible implementación

### 📚 Mejorar Documentación
1. Edita directamente los archivos `.md`
2. Abre un PR con tus cambios
3. En la descripción explica qué mejoraste

### 💻 Código
Ve a "Guía de Desarrollo de Código" abajo

## Guía de Desarrollo de Código

### 1. Selecciona una Tarea
- Busca issues etiquetados con `good first issue`
- O elige del [ROADMAP.md](ROADMAP.md) o [TASKS.md](TASKS.md)
- Comenta en el issue para indicar que trabajarás en ello

### 2. Crea una Rama
```bash
git checkout -b feature/descripcion-corta
# Ejemplos:
# git checkout -b feature/main-menu-ui
# git checkout -b fix/vehicle-physics
# git checkout -b docs/add-tutorials
```

### 3. Desarrolla tu Característica

**Convenciones de Código:**
- Sigue [GDScript Style Guide](https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/style_guide.html)
- Variables: `snake_case`
- Funciones privadas con prefijo `_`: `_private_function()`
- Comentarios solo donde sea necesario
- Máximo 100 caracteres por línea

**Ejemplo:**
```gdscript
# Buen código
extends Node3D

@export var speed: float = 10.0
var _velocity: Vector3 = Vector3.ZERO

func _ready():
    print("Inicializado")

func _process(delta):
    _update_velocity(delta)

func _update_velocity(delta: float):
    _velocity = move_toward(_velocity, Vector3.ZERO, speed * delta)
```

### 4. Prueba tu Código

Antes de hacer commit, verifica:
- ✅ El código compila sin errores
- ✅ No hay warnings en el editor
- ✅ Pruebas manuales en el juego
- ✅ Performance (>30 FPS)
- ✅ No breaks existentes

```gdscript
# Agregar simple tests si es posible
func test_money_calculation():
    var manager = GameManager.new()
    manager.current_money = 100.0
    manager.subtract_money(50.0)
    assert(manager.current_money == 50.0)
```

### 5. Haz Commit

```bash
git add .
git commit -m "Descripción clara de cambios

- Punto 1
- Punto 2
- Punto 3"
```

**Buenas mensajes de commit:**
- Imperativo: "Add feature" no "Added feature"
- Primera línea < 50 caracteres
- Línea vacía antes de detalles
- Máximo 72 caracteres por línea

**Ejemplos:**
```
Add main menu UI with vehicle selection
Fix player vehicle physics
Update documentation for setup
Improve game manager performance
```

### 6. Push y Pull Request

```bash
git push origin feature/tu-caracteristica
```

**En GitHub:**
1. Abre un Pull Request
2. Completa la plantilla:
   - Descripción: ¿Qué cambia?
   - Why: ¿Por qué?
   - Related: ¿Cierra algún issue?
   - Testing: ¿Cómo testear?

**Ejemplo:**
```markdown
## Descripción
Implementa el menú principal con selección de vehículos

## Cambios
- Crear MainMenuScene.tscn
- Agregar main_menu.gd
- Conectar con GameManager
- Agregar UI buttons

## ¿Por qué?
Permite al jugador seleccionar vehículo antes de empezar

## Relacionado
Cierra #5, #12

## Testing
1. Ejecutar juego
2. Ver menú principal
3. Seleccionar vehículo
4. Ver pantalla del juego
```

### 7. Espera Revisión

- Se revisará tu PR
- Puede haber cambios solicitados
- Una vez aprobada, será mergeada a `develop`

## Estándares de Calidad

### Performance
- Mantener >30 FPS en objetivo mínimo
- Perfil regularmente con Monitor
- Evitar crear objetos en loops

### Seguridad
- No comprometer credenciales
- Validar entrada del usuario
- Usar tipos seguros

### Accesibilidad
- Mantener controles configurables
- Texto legible
- Soporte para diferentes idiomas (futuro)

### Documentación
- Comentar código complejo
- Actualizar README si aplica
- Documentar APIs públicas

## Estructura de Carpetas para PR

Si agregas nuevos archivos:
- Scripts → `scripts/categoria/`
- Scenes → `scenes/categoria/`
- Assets → `assets/tipo/`
- Datos → `data/`
- Docs → raíz

## Checklist para PRs

Antes de enviar:
- [ ] Código sigue estilo del proyecto
- [ ] Pruebas locales pasadas
- [ ] Mensaje de commit descriptivo
- [ ] Descripción del PR completa
- [ ] Sin conflictos con main/develop
- [ ] Documentación actualizada si aplica
- [ ] No hay code duplicado
- [ ] Performance adecuado

## Ayuda y Comunidad

### Hacer Preguntas
- Abre un Discussion en GitHub
- Pregunta en Discord (futura comunidad)
- Etiqueta tu pregunta claramente

### Reportar Problemas en PR
- Sé específico
- Proporciona logs/errores
- Incluye versión de Godot
- Sé respetuoso

### Recursos
- [Documentación Godot](https://docs.godotengine.org)
- [GDScript Reference](https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/)
- [GitHub Help](https://help.github.com)

## Reglas de Conducta

Este proyecto adhiere a un Código de Conducta para mantener un ambiente inclusivo y respetuoso:

- Sé respetuoso con otros contribuidores
- Acepta crítica constructiva
- No hagas spam ni acoso
- Mantén discusiones profesionales
- Reporta comportamiento inapropiado

## Reconocimiento

¡Todos los contribuidores serán reconocidos en:
- [CONTRIBUTORS.md](CONTRIBUTORS.md) (futuro)
- Página de créditos del juego
- Discord de la comunidad

## FAQ de Contribución

**P: ¿Puedo trabajar en múltiples features?**
R: Sí, pero abre PRs separados para cada una.

**P: ¿Cuánto tiempo tarda la revisión?**
R: Generalmente 2-7 días dependiendo de complejidad.

**P: ¿Qué pasa si hay conflictos?**
R: Los resolveremos juntos. Haz rebase en develop.

**P: ¿Necesito permiso para trabajar en algo?**
R: Comenta en el issue para evitar duplicados.

**P: ¿Puedo agregar dependencias externas?**
R: Pregunta primero. Preferimos usar Godot built-in.

---

**¡Gracias por contribuir! 🙌**

Para más info, ve a [DEVELOPMENT.md](DEVELOPMENT.md)
