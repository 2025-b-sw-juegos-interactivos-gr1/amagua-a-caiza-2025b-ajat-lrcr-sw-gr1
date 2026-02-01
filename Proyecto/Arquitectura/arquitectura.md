# Arquitectura de Software (Diseño Conceptual)

## Cat Coin Rush

**Versión:** 2.0  
**Fecha:** 30/01/2026  
**Autores:** Ariel Amaguaña, Luis Caiza

---

## 1. Objetivo de la arquitectura

Definir una estructura conceptual clara para un juego de plataformas 2D enfocado en movimiento fluido, recolección contrarreloj y feedback inmediato. La arquitectura prioriza responsividad, desacoplamiento mediante señales y escalabilidad para futuras expansiones (múltiples niveles, power-ups, etc.).

Prioridades:

- Alto rendimiento (60 FPS constantes)
- Bajo acoplamiento mediante señales/eventos
- Física determinista y predecible
- Escalabilidad para múltiples niveles y mecánicas adicionales
- Código modular orientado a componentes (node-based en Godot)

---

## 2. Vista general por capas (conceptual)

### 2.1 Gameplay (Lógica de juego)

- **Player**: procesamiento de input, física de plataformas, FSM de animaciones
- **Coin**: detección de recolección, emisión de señales, auto-destrucción
- **ZonaCaida**: detección de límites del nivel, trigger de reinicio
- **Map**: contenedor del nivel, layout de plataformas y obstáculos

### 2.2 Coordinación (Orquestación)

- **UI**: contador de monedas, verificación de condición de victoria
- **UI_Time**: cronómetro descendente, detección de time-out
- **MenuVictoria**: pantalla de fin de juego con opciones
- **Signals/EventBus**: desacople entre recolección y UI

### 2.3 Datos (Configuración)

- Variables exportadas (`@export`) para ajuste en editor
- Parámetros de física (gravedad, velocidad, salto)
- Configuración de niveles (número de monedas, tiempo límite)

### 2.4 Persistencia (Futuro)

- Sistema de guardado de highscores (no implementado en vertical slice)
- Desbloqueo de niveles
- Estadísticas de jugador (tiempo promedio, recolecciones totales)

---

## 3. Componentes y responsabilidades

| Componente                   | Responsabilidad principal                                    | Entrada         | Salida/Resultado                         |
| ---------------------------- | ------------------------------------------------------------ | --------------- | ---------------------------------------- |
| **Player (PlayerMov.gd)**    | Movimiento horizontal/vertical, física, animaciones, estados | WASD/Flechas/Espacio | Movimiento del sprite, cambios de animación |
| **Coin (Coin2D.gd)**         | Detectar colisión con jugador, emitir señal, destruirse     | Colisión física | Señal `coin_collected`, desaparición     |
| **UI (UI.gd)**               | Escuchar señal de monedas, actualizar contador, mostrar victoria | Señal `coin_collected` | HUD actualizado, menú de victoria       |
| **UI_Time (UI_Time.gd)**     | Decrementar cronómetro, actualizar display, detectar time-out | Delta time     | Texto del cronómetro, reinicio de nivel  |
| **MenuVictoria**             | Ofrecer opciones tras victoria (reintentar/salir)           | Input del jugador | Reinicio de escena o cierre del juego   |
| **ZonaCaida**                | Detectar si jugador sale de límites, reiniciar nivel        | Colisión física | Reinicio de escena                       |

---

## 4. Módulos sugeridos (estructura conceptual)

### 4.1 Core

- **GameManager** (futuro): gestión global de estado, transiciones entre niveles, persistencia
- **ConfigManager** (futuro): carga de configuraciones de nivel desde archivos JSON/CSV

### 4.2 Player

- **PlayerMov**: lógica de movimiento y física
- **PlayerState (FSM)**: IDLE / RUNNING / JUMPING / FALLING (implementado implícitamente mediante condicionales)
- **PlayerAnimator** (futuro): desacoplar animaciones de la lógica de movimiento

### 4.3 World

- **Map**: escena contenedora del nivel
- **Platform**: plataformas sólidas (TileMap o StaticBody2D)
- **Background**: capas de parallax para profundidad visual (futuro)

### 4.4 Collectables

- **Coin**: monedas recolectables
- **PowerUp** (futuro): ítems especiales (tiempo extra, velocidad, doble salto)

### 4.5 UI

- **HUD**: contador de monedas y cronómetro
- **MenuVictoria**: pantalla de victoria
- **MenuDerrota** (futuro): pantalla de derrota con opciones
- **MenuPrincipal** (futuro): selección de nivel y opciones

---

## 5. Contratos (interfaces conceptuales)

### 5.1 ICollectable (concepto)

Cualquier entidad recolectable debe:

- Emitir señal cuando es recolectada
- Destruirse tras recolección
- Tener área de colisión configurable

**Implementación actual**: `Coin2D.gd`

**Futuras implementaciones**: `PowerUp`, `TimeBonusItem`

### 5.2 IPlayer (concepto)

Cualquier entidad controlable por el jugador debe:

- Procesar input horizontal/vertical
- Aplicar física de plataformas (gravedad, salto)
- Emitir señales de eventos (aterrizaje, colisión con peligro)
- Manejar estados de animación

**Implementación actual**: `PlayerMov.gd`

### 5.3 IUI (concepto)

Cualquier componente de UI debe:

- Escuchar señales relevantes
- Actualizar display en tiempo real
- Ser independiente de la lógica de juego

**Implementaciones actuales**: `UI.gd`, `UI_Time.gd`

---

## 6. Arquitectura de comunicación (Event-Driven)

### 6.1 Flujo de Recolección de Moneda

```
Player colisiona con Coin
    ↓
Coin detecta colisión (on_body_entered)
    ↓
Coin emite señal coin_collected
    ↓
UI escucha señal (connect en _ready)
    ↓
UI incrementa contador
    ↓
UI verifica si contador == coins_required
    ↓
    Si SÍ: muestra MenuVictoria, pausa cronómetro
    Si NO: continúa jugando
```

### 6.2 Flujo de Cronómetro

```
_ready() → inicializa time = 30
    ↓
_process(delta) → time -= delta
    ↓
Actualiza label del cronómetro
    ↓
Si time <= 0:
    ↓
    Verifica coins_collected < coins_required
        ↓
        Si SÍ: get_tree().reload_current_scene()
        Si NO: (victoria ya ocurrió, no ejecuta)
```

### 6.3 Flujo de Movimiento del Jugador

```
_physics_process(delta)
    ↓
Lee input horizontal (Input.get_axis)
    ↓
Aplica velocidad horizontal
    ↓
Si no está en suelo: aplica gravedad
    ↓
Si presiona salto Y está en suelo: aplica impulso vertical
    ↓
move_and_slide() → actualiza posición
    ↓
Actualiza animaciones según velocidad y estado
```

---

## 7. Patrones de diseño aplicados

### 7.1 Observer (Signals)

**Propósito**: desacoplar emisores de eventos de sus receptores.

**Implementación**:

- `Coin` emite `coin_collected`
- `UI` escucha mediante `connect()`
- Permite que múltiples sistemas reaccionen al mismo evento sin conocerse entre sí

**Ventajas**:

- Bajo acoplamiento
- Escalabilidad (agregar nuevos listeners sin modificar emisor)
- Testeable (mock de señales)

### 7.2 Component-Based Architecture (Godot Nodes)

**Propósito**: modularizar funcionalidad en componentes reutilizables.

**Implementación**:

- Cada entidad es un nodo con un script específico
- Los nodos se componen en escenas (scene tree)
- Ejemplo: `Player` tiene `Sprite2D`, `CollisionShape2D`, `AnimationPlayer` como hijos

**Ventajas**:

- Reutilización de componentes
- Fácil prototipado (drag & drop de escenas)
- Inspector de Godot facilita configuración

### 7.3 State Machine (FSM) Implícita

**Propósito**: gestionar estados del jugador (idle, run, jump, fall).

**Implementación actual** (simplificada):

```gdscript
if is_on_floor():
    if velocity.x != 0:
        estado = RUNNING → animación "run"
    else:
        estado = IDLE → animación "idle"
else:
    if velocity.y < 0:
        estado = JUMPING → animación "jump"
    else:
        estado = FALLING → animación "fall"
```

**Mejora futura**: implementar FSM explícita con clase `State` y transiciones formales.

### 7.4 Singleton (futuro GameManager)

**Propósito**: gestionar estado global del juego (nivel actual, puntuación total, configuración).

**No implementado en vertical slice**, pero recomendado para expansión.

---

## 8. Escalabilidad y Extensiones Futuras

### 8.1 Múltiples Niveles

**Arquitectura sugerida**:

- `LevelManager` (singleton) que carga niveles desde lista o configuración
- Cada nivel es una escena independiente (`Level1.tscn`, `Level2.tscn`)
- Transiciones mediante `change_scene_to_file()`
- Persistencia de progreso (nivel actual desbloqueado)

### 8.2 Power-Ups

**Arquitectura sugerida**:

- Clase base `PowerUp` similar a `Coin`
- Subclases: `TimeBonus`, `SpeedBoost`, `DoubleJump`
- Sistema de `PlayerStats` que aplica modificadores temporales
- Señales para efectos visuales (particles, shaders)

### 8.3 Enemigos y Obstáculos

**Arquitectura sugerida**:

- `Enemy` con AI básica (patrullar, perseguir)
- `Hazard` (pinchos, lava) con área de daño
- Sistema de `Health` para el jugador
- Respawn en checkpoint tras perder vida

### 8.4 Sistema de Puntuación Avanzado

**Arquitectura sugerida**:

- `ScoreManager` que calcula puntos por: monedas, tiempo restante, combos, perfección
- Leaderboards locales o en línea (integración con backend)
- Persistencia mediante `ConfigFile` o SQLite

---

## 9. Diagrama de Arquitectura (Conceptual)

```
┌──────────────────────────────────────────────────────────┐
│                       Map (Escena)                       │
│  ┌────────────┐  ┌────────────┐  ┌──────────────┐       │
│  │   Player   │  │  Coin x6   │  │ Plataformas  │       │
│  │ (PlayerMov)│  │ (Coin2D)   │  │ (StaticBody) │       │
│  └─────┬──────┘  └──────┬─────┘  └──────────────┘       │
│        │                │                                │
│        │ colisión       │ emit signal                    │
│        └────────────────┘                                │
│                         │                                │
│                         ▼                                │
│  ┌──────────────────────────────────────────────┐       │
│  │              UI (CanvasLayer)                │       │
│  │  ┌─────────┐  ┌──────────┐  ┌────────────┐  │       │
│  │  │ Counter │  │  Timer   │  │ MenuVictoria│  │       │
│  │  │ (UI.gd) │  │(UI_Time) │  │             │  │       │
│  │  └────┬────┘  └─────┬────┘  └──────┬──────┘  │       │
│  │       │ listen       │ update       │         │       │
│  │       │ signal       │ display      │ show    │       │
│  └───────┴──────────────┴──────────────┴─────────┘       │
└──────────────────────────────────────────────────────────┘

Señales (Event Bus):
  coin_collected → UI incrementa contador
  victory_condition → muestra MenuVictoria
  time_out → reinicia escena
```

---

## 10. Especificación de Nodos (Scene Tree)

### 10.1 Escena Principal: Map.tscn

```
Map (Node2D)
├── Background (Sprite2D o ParallaxBackground)
├── Plataformas (TileMap o colección de StaticBody2D)
├── Player (CharacterBody2D)
│   ├── Sprite (Sprite2D con texture de gato)
│   ├── CollisionShape (CollisionShape2D)
│   └── AnimationPlayer (AnimationPlayer)
├── Coins (Node2D contenedor)
│   ├── Coin1 (instancia de coin.tscn)
│   ├── Coin2
│   └── ... (hasta Coin6)
├── ZonaCaida (Area2D)
│   └── CollisionShape (límite inferior del nivel)
└── UI (CanvasLayer)
    ├── HUD (Control)
    │   ├── CoinCounter (Label con script UI.gd)
    │   └── Timer (Label con script UI_Time.gd)
    └── MenuVictoria (Panel con script menu_victoria.gd)
```

### 10.2 Prefab: coin.tscn

```
Coin (Area2D con script Coin2D.gd)
├── Sprite (Sprite2D con texture de moneda)
├── CollisionShape (CollisionShape2D)
└── AnimationPlayer (opcional: rotación o brillo)
```

---

## 11. Consideraciones de Rendimiento

### 11.1 Optimizaciones Actuales

- **Física optimizada**: uso de `CharacterBody2D` en lugar de `RigidBody2D` para control directo
- **Señales eficientes**: conexión directa sin nodos intermedios innecesarios
- **Destrucción inmediata**: `queue_free()` tras recolección evita acumulación de nodos inactivos

### 11.2 Optimizaciones Futuras

- **Object Pooling**: reutilizar monedas/power-ups en lugar de instanciar/destruir
- **VisibilityNotifier**: desactivar física de entidades fuera de pantalla
- **Level Streaming**: cargar secciones del nivel dinámicamente en niveles grandes
- **Batching de Sprites**: usar MultiMeshInstance para muchas instancias idénticas

---

## 12. Gestión de Colisiones (Layers & Masks)

| Layer | Nombre     | Entidades                  | Propósito                          |
| ----: | ---------- | -------------------------- | ---------------------------------- |
|     1 | player     | Player (CharacterBody2D)   | Colisión del jugador               |
|     2 | world      | Plataformas, edificios     | Geometría sólida del nivel         |
|     4 | collectables | Coins, PowerUps          | Objetos recolectables (trigger)    |
|     8 | hazards    | ZonaCaida, obstáculos      | Peligros que reinician/dañan       |

**Configuración de colisiones**:

- **Player**: Layer 1, Mask 2+4+8 (colisiona con mundo, colectables y peligros)
- **Plataformas**: Layer 2, Mask 1 (solo interactúan con jugador)
- **Coin**: Layer 4, Mask 1 (solo detecta jugador)
- **ZonaCaida**: Layer 8, Mask 1 (solo detecta jugador)

---

## 13. Manejo de Estados del Juego

### 13.1 Estados Globales (futuro GameManager)

- **MENU**: menú principal, no hay gameplay activo
- **PLAYING**: juego en curso, input habilitado
- **PAUSED**: juego pausado, cronómetro detenido
- **VICTORY**: condición de victoria cumplida, input deshabilitado
- **DEFEAT**: condición de derrota, transición a reinicio

### 13.2 Transiciones de Estado

```
MENU → PLAYING: al iniciar nivel
PLAYING → PAUSED: presionar ESC (futuro)
PAUSED → PLAYING: presionar ESC nuevamente
PLAYING → VICTORY: recolectar todas las monedas
PLAYING → DEFEAT: tiempo llega a 0
VICTORY → MENU: presionar "Salir" en menú
VICTORY → PLAYING: presionar "Reintentar"
DEFEAT → PLAYING: reinicio automático
```

---

## 14. Anexos Técnicos

### Anexo A: Configuración de Godot Project Settings

**Recomendaciones**:

- **Renderizado**: Modo Forward+ para 2D de alto rendimiento
- **Física**: Fixed FPS a 60, Time Scale a 1.0
- **Input Map**: definir acciones `move_left`, `move_right`, `jump`
- **Layers de colisión**: nombrar capas según tabla de sección 12

### Anexo B: Estructura de Directorios Sugerida

```
project_root/
├── Assets/
│   ├── Cat/         (sprites del jugador)
│   ├── Coin/        (sprites de monedas)
│   ├── Buildings/   (texturas de plataformas)
│   ├── Audio/       (SFX y música)
│   └── Texture/     (fondos, UI)
├── Scenes/
│   ├── Map.tscn     (nivel principal)
│   ├── coin.tscn    (prefab de moneda)
│   ├── menu_victoria.tscn
│   └── Levels/      (futuros niveles adicionales)
├── Scripts/
│   ├── PlayerMov.gd
│   ├── Coin2D.gd
│   ├── UI.gd
│   ├── UI_Time.gd
│   └── Managers/    (futuros managers globales)
└── project.godot
```

### Anexo C: Referencias de Arquitectura

**Patrones aplicables**:

- **MVC/MVP** (futuro): separar lógica de presentación
- **Command Pattern** (futuro): sistema de input rebindeable
- **Factory Pattern** (futuro): generación procedural de niveles

**Recursos recomendados**:

- [Godot Best Practices](https://docs.godotengine.org/en/stable/tutorials/best_practices/index.html)
- [Game Programming Patterns](https://gameprogrammingpatterns.com/)
- [Godot GDScript Style Guide](https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_styleguide.html)

---

## 15. Conclusión

La arquitectura de Cat Coin Rush prioriza:

- **Simplicidad**: componentes con responsabilidades claras
- **Escalabilidad**: fácil agregar niveles, mecánicas y power-ups
- **Mantenibilidad**: bajo acoplamiento mediante señales
- **Rendimiento**: optimizaciones desde el diseño inicial

El vertical slice actual demuestra la viabilidad de la arquitectura, y las extensiones futuras están claramente definidas para iteración rápida.
