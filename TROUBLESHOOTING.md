🔧 SOLUCIÓN DE PROBLEMAS - DeliveryDriveSimulator

═════════════════════════════════════════════════════════════════════════════

PROBLEMA: El juego se abre y se cierra cuando hago click en "Comenzar Juego"

SOLUCIÓN:

1️⃣ ABRE LA CONSOLA DE GODOT

   En el editor de Godot:
   - Click en "Output" (esquina inferior)
   O
   - View > Output Console (desde menú)

2️⃣ VUELVE A PRESIONAR PLAY (F5)

   Ahora verás mensajes de error/éxito en la consola

3️⃣ LEE LOS MENSAJES

   Deberías ver mensajes como:
   ✅ "MainMenu iniciando..."
   ✅ "MainMenu listo"
   
   Cuando presiones "Comenzar Juego":
   ▶️ "Iniciando juego..."
   ✅ "Vehículo: [nombre]"
   ✅ "Cambiando a escena GameScene..."
   ✅ "PlayerVehicle iniciando..."
   ✅ "GameHUD iniciando..."

4️⃣ SI VES ERRORES (líneas rojas)

   Anota exactamente qué dice el error y:
   - Comprueba que los archivos están en la carpeta correcta
   - Verifica los nombres de archivos y rutas
   - Asegúrate de que Godot está actualizado (4.2+)

═════════════════════════════════════════════════════════════════════════════

PROBLEMAS COMUNES Y SOLUCIONES:

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

❌ "Can't find scene at..."

SOLUCIÓN:
  • Verifica que existen estos archivos:
    ✓ scenes/main_menu/MainMenuScene.tscn
    ✓ scenes/game/GameScene.tscn
  • En Godot, ve a FileSystem (izquierda) y confirma que los ves
  • Si no los ves, haz Ctrl+Shift+F (reimportar proyecto)

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

❌ "Null instance in built-in script"

SOLUCIÓN:
  • Esto significa que un nodo no se encontró
  • Abre scenes/main_menu/MainMenuScene.tscn
  • Verifica que existe el nodo "Panel/VBoxContainer/VehicleList"
  • Verifica que existe el nodo "Panel/VBoxContainer/StartButton"

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

❌ "Player no encontrado en la escena"

SOLUCIÓN:
  • Abre scenes/game/GameScene.tscn
  • Busca en el árbol (izquierda) si existe el nodo "Player"
  • Si no lo ves, significa que la escena está rota
  • Intenta: Tools > Reimport en el menú de Godot

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

❌ "Connect: signal 'item_selected' not found"

SOLUCIÓN:
  • El nodo VehicleList no es del tipo correcto
  • Abre MainMenuScene.tscn
  • Haz click en VehicleList
  • Verifica que sea un "ItemList" (no un Control o Button)

═════════════════════════════════════════════════════════════════════════════

VERIFICACIÓN PASO A PASO:

1. ¿Godot 4.2+?
   ✓ Help > About Godot (verifica versión)

2. ¿Archivos existen?
   ✓ Abre el FileSystem en Godot (panel izquierda)
   ✓ Expande carpetas y verifica:
     - scenes/main_menu/MainMenuScene.tscn
     - scenes/game/GameScene.tscn
     - scripts/ui/main_menu.gd
     - scripts/ui/game_hud.gd
     - scripts/player/player_vehicle.gd

3. ¿Escenas están correctas?
   ✓ Double-click en MainMenuScene.tscn
   ✓ Verifica que ves un menú gráfico
   ✓ Verifica que hay un botón visible

4. ¿Scripts están asignados?
   ✓ En MainMenuScene, haz click en la raíz "MainMenuScene"
   ✓ En el Inspector (derecha), busca "Script"
   ✓ Debe estar asignado: res://scripts/ui/main_menu.gd

═════════════════════════════════════════════════════════════════════════════

CÓMO ENVIAR INFORMACIÓN DE ERROR:

1. Abre la Output Console (View > Output)
2. Copia TODO el texto de error (incluyendo líneas antes)
3. Toma una captura de pantalla de la consola
4. Comparte el texto exacto del error

Esto nos ayudará a arreglar el problema rápidamente.

═════════════════════════════════════════════════════════════════════════════

ÚLTIMA OPCIÓN - REINICIAR DESDE CERO:

Si nada funciona, intenta esto:

1. Cierra Godot completamente
2. En el Explorador, elimina la carpeta ".godot" del proyecto
3. Reabre el proyecto en Godot
4. Godot reconstruirá los archivos automáticamente
5. Intenta de nuevo

═════════════════════════════════════════════════════════════════════════════

¿SIGUE SIN FUNCIONAR?

Si después de todo esto sigue habiendo problemas, 
copia el TEXTO EXACTO de la consola de error y avísame.

Eso me permitirá diagnosticar el problema específico.

═════════════════════════════════════════════════════════════════════════════
