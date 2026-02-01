# Audio — Cat Coin Rush

**Objetivo:** reforzar feedback de gameplay + crear atmósfera energética sin generar fatiga auditiva.  
**Regla:** audio claro y satisfactorio, con énfasis en recompensa por recolección.

---

## 1) Dirección de Audio (Mood & Referencias)

### 1.1 Música (BGM)

- **Estilo:** upbeat, alegre, energético pero no estresante
- **Tempo:** 100-120 BPM (ritmo constante que mantiene energía)
- **Género:** chiptune, synth pop, electronic casual
- **Instrumentación:** sintetizadores, bajo electrónico, percusión simple
- **Estructura:** loops de 1:00-2:00 min con variación para evitar monotonía
- **Intensidad:** moderada constante; sin drops dramáticos que distraigan

### 1.2 Sonido Ambiental (Ambience)

- **Opcional:** viento ligero en fondo (muy sutil)
- **Efectos de ambiente:** pájaros ocasionales, campanas distantes (urbano)
- **Volumen:** muy bajo (<10% del mix), solo para textura

---

## 2) Lista de Música (mínimo viable)

| ID | Track | Uso | Duración sugerida | Notas |
|---|---|---|---:|---|
| BGM-001 | Cat Rush Theme | Gameplay principal (Nivel 1) | 1:30-2:00 | Loop alegre, ritmo constante |
| BGM-002 | Victory Jingle | Menú de victoria | 3-5s | Fanfarria breve, celebratoria |
| BGM-003 | Defeat Sting | Time's up / derrota | 2-3s | Sonido descendente, no agresivo |

**Referencias musicales:**

- Sonic the Hedgehog (Green Hill Zone) - ritmo upbeat
- Celeste (Resurrections) - energía sin estrés
- Super Meat Boy (Forest Funk) - electronic upbeat

---

## 3) Lista de SFX (mínimo viable)

### 3.1 Gameplay Core

| ID | SFX | Trigger | Propósito | Notas |
|---|---|---|---|---|
| SFX-001 | Coin Collect | Colisión jugador con moneda | Recompensa inmediata | "Ding" agudo, satisfactorio |
| SFX-002 | Jump | Presionar Espacio en suelo | Feedback de acción | "Whoosh" ligero, no invasivo |
| SFX-003 | Landing | Jugador toca suelo tras caída | Confirmación de aterrizaje | Impacto suave (opcional) |

### 3.2 UI y Menús

| ID | SFX | Trigger | Propósito | Notas |
|---|---|---|---|---|
| UI-001 | Button Hover | Mouse sobre botón | Feedback de interacción | Click suave |
| UI-002 | Button Click | Click en botón | Confirmación de selección | "Pop" breve |
| UI-003 | Menu Open | Mostrar menú victoria | Transición | "Swoosh" o campanilla |
| UI-004 | Menu Close | Cerrar menú | Transición | Similar a UI-003 pero reverso |

### 3.3 Eventos Especiales

| ID | SFX | Trigger | Propósito | Notas |
|---|---|---|---|---|
| EVT-001 | Victory Fanfare | Recolectar 6 monedas | Celebración | 3-5s, orquestación simple |
| EVT-002 | Time Warning | Cronómetro ≤ 5s | Alertar urgencia | Tic-tac acelerado (opcional) |
| EVT-003 | Time's Up | Cronómetro llega a 0 | Indicar derrota | Buzzer descendente o "aw" |

### 3.4 Futuras Expansiones

| ID | SFX | Trigger | Propósito | Notas |
|---|---|---|---|---|
| SFX-004 | Power-Up | Recolectar power-up | Feedback especial | Más elaborado que coin |
| SFX-005 | Checkpoint | Activar checkpoint | Confirmación de progreso | Campanilla |
| SFX-006 | Footsteps | Movimiento continuo | Inmersión | Muy sutil, variantes |

---

## 4) Mapeo Audio ↔ Sistemas (coherencia con FSM)

### Estado: IDLE

- **BGM**: música de nivel en loop
- **Ambience**: viento ligero (si está implementado)

### Estado: RUNNING

- **BGM**: música continúa
- **SFX**: Footsteps (opcional, futuro)

### Estado: JUMPING

- **SFX**: Jump (SFX-002) al iniciar salto
- **BGM**: música continúa sin cambio

### Estado: FALLING

- **SFX**: Landing (SFX-003) al tocar suelo
- **BGM**: música continúa

### Evento: RECOLECCIÓN DE MONEDA

- **SFX**: Coin Collect (SFX-001) - prioridad alta
- **HUD**: animación visual del contador sincronizada

### Evento: VICTORIA (6 monedas)

- **BGM**: música de nivel fade out (0.5s)
- **SFX**: Victory Fanfare (EVT-001)
- **BGM**: Victory Jingle (BGM-002) al mostrar menú

### Evento: DERROTA (tiempo = 0)

- **BGM**: música de nivel stop inmediato
- **SFX**: Time's Up (EVT-003)

---

## 5) Especificaciones Técnicas (Godot)

### 5.1 Formato de Audio

- **Música (BGM)**: OGG Vorbis (mejor compresión, loop seamless)
- **SFX**: WAV (baja latencia, sin compresión para feedback inmediato)

### 5.2 Configuración de AudioStreamPlayer

#### Música

```gdscript
AudioStreamPlayer (nombre: MusicPlayer)
- Stream: BGM-001.ogg
- Volume Db: -10 a -5 (ajustar según mezcla)
- Autoplay: true
- Bus: "Music"
```

#### SFX

```gdscript
AudioStreamPlayer (nombre: SFXPlayer)
- Volume Db: 0 (volumen referencia)
- Bus: "SFX"
- Max Polyphony: 8 (permitir múltiples SFX simultáneos)
```

### 5.3 Audio Busses (Mezcla)

```
Master (0 dB)
├── Music (-8 dB) ← música de fondo más baja que SFX
├── SFX (0 dB) ← efectos de sonido a volumen estándar
└── UI (-3 dB) ← sonidos de interfaz ligeramente más bajos
```

---

## 6) Prioridad de Reproducción

**Sistema de prioridad** (si hay múltiples sonidos simultáneos):

1. **Alta prioridad**:
   - Coin Collect (SFX-001)
   - Victory Fanfare (EVT-001)
   - Time's Up (EVT-003)

2. **Media prioridad**:
   - Jump (SFX-002)
   - Button Click (UI-002)

3. **Baja prioridad**:
   - Landing (SFX-003)
   - Footsteps (SFX-004, futuro)
   - Ambience

**Regla**: Si dos SFX de misma prioridad ocurren en < 0.05s, solo reproduce el primero.

---

## 7) Volumen y Mezcla

### 7.1 Niveles Recomendados

- **BGM**: -10 a -8 dB (audible pero no dominante)
- **SFX Core** (coin, jump): 0 dB (referencia)
- **SFX UI**: -3 dB (sutiles)
- **Ambience**: -15 a -12 dB (apenas perceptible)

### 7.2 Ducking (futuro)

- Cuando SFX de alta prioridad (ej. Victory Fanfare) se reproduce:
  - BGM reduce volumen a -20 dB temporalmente (1-2s)
  - BGM retorna a volumen normal tras finalizar SFX

---

## 8) Implementación en Godot

### 8.1 Script de SFX Manager (ejemplo)

```gdscript
# SFXManager.gd (Singleton)
extends Node

@onready var sfx_player = $AudioStreamPlayer

var sfx_library = {
    "coin": preload("res://Assets/Audio/coin_collect.wav"),
    "jump": preload("res://Assets/Audio/jump.wav"),
    "victory": preload("res://Assets/Audio/victory_fanfare.wav"),
}

func play_sfx(sfx_name: String):
    if sfx_library.has(sfx_name):
        sfx_player.stream = sfx_library[sfx_name]
        sfx_player.play()
```

### 8.2 Llamada desde Coin2D.gd

```gdscript
# Coin2D.gd
func _on_body_entered(body):
    if body.name == "Player":
        SFXManager.play_sfx("coin")  # reproduce SFX
        emit_signal("coin_collected")
        queue_free()
```

---

## 9) Checklist de Audio

**Antes de marcar audio como completo**:

- [ ] BGM-001 existe y hace loop seamless sin clics
- [ ] SFX-001 (coin) es audible y satisfactorio
- [ ] SFX-002 (jump) no es invasivo pero se escucha claramente
- [ ] Victoria Fanfare (EVT-001) celebra adecuadamente sin ser excesivo
- [ ] Volumen de BGM no enmascara SFX importantes
- [ ] No hay clipping (distorsión) en el master bus
- [ ] Audio funciona correctamente en export (web, desktop)

---

## 10) Assets de Audio Requeridos (Lista Final)

### Música

- `BGM_cat_rush_theme.ogg` (1:30-2:00 min, loop)
- `BGM_victory_jingle.ogg` (3-5s, no loop)

### SFX Gameplay

- `SFX_coin_collect.wav` (~0.3s)
- `SFX_jump.wav` (~0.2s)
- `SFX_landing.wav` (~0.2s, opcional)

### SFX UI

- `SFX_button_hover.wav` (~0.1s)
- `SFX_button_click.wav` (~0.1s)

### SFX Eventos

- `SFX_victory_fanfare.wav` (3-5s)
- `SFX_time_warning.wav` (1s, loop opcional)
- `SFX_times_up.wav` (~1s)

**Total de assets**: 9-10 archivos de audio

---

## 11) Herramientas Sugeridas

### Creación de Audio

- **Chiptune/Synth**: BeepBox, FamiTracker, Sunvox
- **General DAW**: FL Studio, Ableton Live, LMMS (free)
- **SFX**: Bfxr, ChipTone, Audacity (edición)

### Librerías de Audio Libre

- **Freesound.org**: SFX variados (coin, jump)
- **OpenGameArt.org**: música chiptune gratuita
- **Kenney.nl**: packs de SFX para juegos

### Conversión y Edición

- **Audacity**: editar, normalizar, exportar a WAV/OGG
- **FFmpeg**: conversión batch de formatos

---

## 12) Referencias de Estilo

**Juegos con audio similar**:

- **Sonic the Hedgehog**: SFX icónicos (rings = coins)
- **Super Mario Bros**: feedback satisfactorio al recolectar
- **Celeste**: música que no estresa pero mantiene energía
- **Super Meat Boy**: SFX de salto distintivo

**Principios tomados**:

- Feedback inmediato y claro para todas las acciones
- Música energética pero no invasiva
- Celebración sonora al lograr objetivos
- Audio que refuerza el "flow" de movimiento

---

## 13) Próximos Pasos

1. Crear o adquirir BGM principal (tema de nivel)
2. Crear o adquirir SFX core (coin, jump)
3. Implementar AudioStreamPlayer en escena principal
4. Testear volúmenes y mezcla en gameplay real
5. Ajustar según feedback de playtesting

---

**Responsables**: Ariel Amaguaña, Luis Caiza  
**Última actualización**: 30/01/2026  
**Versión**: 2.0 (adaptado a Cat Coin Rush)
