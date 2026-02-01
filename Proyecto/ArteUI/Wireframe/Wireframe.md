# Wireframes UI/UX — Cat Coin Rush

---

## Wireframe 1 — HUD en Juego (Contador y Cronómetro)

![Wireframe 1](imagenes/Wireframe1.png)

**Propósito**  
Mostrar información crítica del juego (monedas recolectadas y tiempo restante) sin obstruir la visión del gameplay.

**Cuándo aparece (Trigger)**

- Visible en todo momento durante el gameplay
- Se mantiene en capa de UI superior (CanvasLayer)

**Contenido del UI**

### Contador de Monedas (Superior Izquierda)

- **Ícono**: 🪙 (sprite de moneda pequeño)
- **Texto**: `4 / 6` (monedas actuales / monedas requeridas)
- **Estilo**: fuente grande, negrita, color blanco con outline negro grueso
- **Tamaño**: ~32-48px para lectura rápida

### Cronómetro (Superior Derecha)

- **Ícono**: ⏱️ (sprite de reloj pequeño)
- **Texto**: `0:23` (formato minutos:segundos)
- **Estilo**: igual que contador de monedas
- **Color dinámico**:
  - Blanco: cuando tiempo > 5s
  - Rojo parpadeante: cuando tiempo ≤ 5s (warning visual)

**Comportamiento**

- HUD siempre visible, no se oculta
- Actualización en tiempo real cada frame
- Contador incrementa inmediatamente al recolectar moneda
- Cronómetro decrementa suavemente (no a saltos de 1 segundo)

**Posicionamiento**

```
┌────────────────────────────────────────────────┐
│  🪙 4/6                            ⏱️ 0:23    │
│                                                │
│              [Área de Gameplay]                │
│                                                │
│                                                │
└────────────────────────────────────────────────┘
```

---

## Wireframe 2 — Menú de Victoria

![Wireframe 2](imagenes/Wireframe2.png)

**Propósito**  
Celebrar la victoria del jugador y ofrecer opciones claras para continuar (reintentar o salir).

**Cuándo aparece (Trigger)**

- Cuando el jugador recolecta las 6 monedas requeridas
- El gameplay se pausa automáticamente (cronómetro deja de correr)

**Contenido del UI**

### Overlay de Fondo

- **Estilo**: fondo semi-transparente oscuro (rgba(0, 0, 0, 0.7))
- **Efecto**: desenfoque del gameplay detrás (opcional)

### Panel Central

- **Fondo**: rectángulo sólido con borde dorado/amarillo
- **Tamaño**: ~400x300px (centrado)

### Título

- **Texto**: "¡VICTORIA!" o "¡MISIÓN CUMPLIDA!"
- **Estilo**: fuente grande (~64px), color dorado/amarillo brillante
- **Animación**: scale in desde centro (0.3s)

### Subtítulo (Opcional)

- **Texto**: "Tiempo: 0:23" (muestra tiempo final)
- **Estilo**: fuente mediana (~32px), color blanco

### Botones

#### Botón "Reintentar"

- **Posición**: centro superior del panel
- **Tamaño**: ~200x60px
- **Estilo**: fondo verde, texto blanco, borde redondeado
- **Hover**: escala ligeramente (1.1x)
- **Acción**: recarga la escena actual (`get_tree().reload_current_scene()`)

#### Botón "Salir"

- **Posición**: centro inferior del panel
- **Tamaño**: ~200x60px
- **Estilo**: fondo rojo, texto blanco, borde redondeado
- **Hover**: escala ligeramente (1.1x)
- **Acción**: cierra el juego (`get_tree().quit()`)

**Comportamiento**

- Menú se muestra con animación suave (fade in + scale)
- Input del juego (movimiento/salto) deshabilitado mientras menú está activo
- Navegación con mouse o teclado (Enter para confirmar, flechas para seleccionar)
- SFX de victoria reproduce al mostrar el menú

**Mockup Visual**

```
┌──────────────────────────────────────────────┐
│ [Fondo semitransparente con gameplay pausado]│
│                                              │
│      ╔═══════════════════════════╗          │
│      ║   ¡VICTORIA! ⭐          ║          │
│      ║                           ║          │
│      ║   Tiempo: 0:23            ║          │
│      ║                           ║          │
│      ║   ┌─────────────────┐    ║          │
│      ║   │   Reintentar    │    ║          │
│      ║   └─────────────────┘    ║          │
│      ║                           ║          │
│      ║   ┌─────────────────┐    ║          │
│      ║   │     Salir       │    ║          │
│      ║   └─────────────────┘    ║          │
│      ╚═══════════════════════════╝          │
│                                              │
└──────────────────────────────────────────────┘
```

---

## Wireframe 3 — Pantalla de Derrota (Time's Up!)

![Wireframe 3](imagenes/Wireframe3.png)

**Propósito**  
Informar al jugador que el tiempo se agotó y reiniciar automáticamente el nivel.

**Cuándo aparece (Trigger)**

- Cuando el cronómetro llega a 0:00 y el jugador tiene < 6 monedas

**Contenido del UI**

### Overlay (Opcional)

- **Estilo**: fondo rojo semi-transparente (rgba(255, 0, 0, 0.3))
- **Duración**: 1-2 segundos antes de reiniciar

### Mensaje Central

- **Texto**: "¡TIEMPO AGOTADO!" o "TIME'S UP!"
- **Estilo**: fuente grande (~64px), color rojo/blanco, outline negro
- **Animación**: fade in rápido (0.2s)

**Comportamiento**

- Mensaje se muestra brevemente (1-2s)
- Reinicio automático de la escena (`get_tree().reload_current_scene()`)
- SFX de derrota reproduce al mostrar mensaje
- No hay opciones de interacción (reinicio forzado)

**Mockup Visual**

```
┌──────────────────────────────────────────────┐
│ [Fondo rojo semitransparente]                │
│                                              │
│                                              │
│          ¡TIEMPO AGOTADO! ⏰                 │
│                                              │
│      [Reinicio automático en 2s...]         │
│                                              │
│                                              │
└──────────────────────────────────────────────┘
```

**Nota**: En la versión actual del vertical slice, el reinicio es inmediato sin pantalla de derrota. Este wireframe es para futura mejora.

---

## Wireframe 4 — Feedback de Recolección de Moneda

![Wireframe 4](imagenes/Wireframe4.png)

**Propósito**  
Dar feedback visual inmediato al jugador al recolectar una moneda.

**Cuándo aparece (Trigger)**

- Al momento exacto de colisión entre jugador y moneda

**Contenido del Feedback**

### Moneda (Desaparición)

- **Animación**: fade out rápido (0.2s)
- **Efecto**: escala ligeramente antes de desaparecer (1.2x → 0)

### Partículas

- **Tipo**: 3-5 estrellas pequeñas doradas
- **Movimiento**: explosión radial desde posición de la moneda
- **Duración**: 0.3-0.5s
- **Física**: gravedad ligera, fade out gradual

### Contador (HUD)

- **Animación**: escala brevemente el número (1.0x → 1.3x → 1.0x)
- **Duración**: 0.2s
- **Color**: flash dorado momentáneo

### Audio

- **SFX**: "ding" agudo y satisfactorio (ver Audio.md)

**Mockup Visual (Secuencia)**

```
Frame 1 (colisión):
   🐱 ← jugador
   🪙 ← moneda

Frame 2 (0.1s después):
   🐱
   ✨🪙✨ ← partículas + moneda escalando
   
Frame 3 (0.2s después):
   🐱
   ✨ ✨ ← solo partículas, moneda desapareció
   
HUD:
   🪙 4/6 → 🪙 5/6 (número incrementa con animación)
```

---

## Notas de Consistencia (UI General)

### Tipografía

- **Fuente principal**: sans-serif negrita (ej: Kenney Future, Pixel Font)
- **Tamaños**:
  - HUD: 32-48px
  - Títulos: 64px
  - Botones: 24-32px
  - Subtítulos: 24px
- **Colores**:
  - Texto principal: blanco (#FFFFFF)
  - Outline: negro (#000000, grosor 4px)
  - Acentos: dorado (#FFD700), verde (#00FF00), rojo (#FF0000)

### Espaciado

- **Margen del HUD**: 20px desde bordes de pantalla
- **Padding de botones**: 15px vertical, 30px horizontal
- **Separación entre elementos**: 20px

### Interactividad

- **Hover de botones**: escala 1.1x + cambio de brillo
- **Click de botones**: escala 0.95x momentánea (feedback táctil)
- **Transiciones**: suaves (0.2s) para todas las animaciones de UI

---

## Implementación Técnica (Godot)

### Nodos Sugeridos

#### HUD

```
CanvasLayer (nombre: UI)
├── Control (nombre: HUD)
│   ├── HBoxContainer (nombre: CoinCounter)
│   │   ├── TextureRect (ícono de moneda)
│   │   └── Label (texto "4 / 6")
│   └── HBoxContainer (nombre: Timer)
│       ├── TextureRect (ícono de reloj)
│       └── Label (texto "0:23")
```

#### Menú Victoria

```
CanvasLayer (nombre: UI)
└── Panel (nombre: MenuVictoria, inicialmente hidden)
    ├── ColorRect (fondo semi-transparente)
    ├── Label (título "¡VICTORIA!")
    ├── Label (subtítulo "Tiempo: 0:23")
    ├── Button (nombre: BtnReintentar)
    └── Button (nombre: BtnSalir)
```

---

## Próximos Pasos

1. Crear mockups en alta resolución (Figma, Photoshop, o directamente en Godot)
2. Exportar wireframes como PNG para documentación
3. Implementar HUD con valores estáticos primero (testear legibilidad)
4. Conectar scripts (UI.gd, UI_Time.gd) para actualización dinámica
5. Pulir animaciones y transiciones

---

**Responsables**: Ariel Amaguaña, Luis Caiza  
**Última actualización**: 30/01/2026  
**Versión**: 2.0 (adaptado a Cat Coin Rush)
