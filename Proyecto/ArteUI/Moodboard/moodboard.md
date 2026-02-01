# Moodboard Visual — Cat Coin Rush

Este moodboard resume la **dirección visual** y el **lenguaje de UI** propuesto para *Cat Coin Rush* (juego de plataformas 2D), priorizando **claridad**, **accesibilidad** y **feedback visual inmediato**.

![Moodboard Visual](imagenes/moodboard_visual.png)

## 1) Atmósfera y composición

**Objetivo:** transmitir un entorno urbano colorido y dinámico que invite a la exploración vertical.

- **Escenarios urbanos legibles:** edificios, tejados y plataformas con siluetas claras y distinguibles.
- **Parkour vertical:** diseño en múltiples alturas que guía al jugador a subir y explorar.
- **Contraste funcional:** elementos de gameplay (gato, monedas) destacan sobre el fondo.
- **Texturas simples:** pixel art limpio sin exceso de detalles que distraigan.

## 2) Paleta de Colores

### 2.1 Fondo/Escenario

- **Edificios**: grises, marrones, azules apagados (tonos neutros)
- **Cielo**: azul claro o gradiente suave (día soleado)
- **Sombras**: tonos oscuros para profundidad sin complejidad

### 2.2 Elementos de Gameplay

- **Gato**: colores cálidos (naranja, blanco, marrón claro) para destacar
- **Monedas**: amarillo/dorado brillante, posible animación de rotación o brillo
- **Plataformas**: tonos de ladrillo/cemento realistas pero estilizados

### 2.3 UI

- **HUD**: texto blanco con outline negro grueso para máxima legibilidad
- **Iconos**: símbolos claros (🪙 para monedas, ⏱️ para cronómetro)
- **Menús**: fondo semi-transparente oscuro, botones con borde claro

## 3) Estilo Visual

**Pixel Art / Sprites 2D con estilo cartoon**

- **Sprites del gato**: proporciones adorables, expresiones simples pero claras
- **Animaciones fluidas**: 6-8 frames por animación (run), 2-3 frames para transiciones (jump/fall)
- **Monedas**: rotación sutil o efecto de brillo (sparkle)
- **Partículas**: efectos simples al recolectar (estrellas pequeñas, destellos)

## 4) Referencias Visuales

### 4.1 Juegos de Referencia

| Juego | Qué tomar de referencia |
| ----- | ----------------------- |
| **Celeste** | Pixel art limpio, paleta clara, feedback visual satisfactorio |
| **Super Meat Boy** | Contraste alto entre personaje y fondo, movimiento fluido |
| **Sonic the Hedgehog** | Colorido vibrante, momentum visual, animaciones dinámicas |
| **Mario Bros (NES)** | Diseño de niveles legible, power-ups distinguibles |

### 4.2 Paleta de Referencia (Ejemplo)

```
Gato:        #FF8C42 (naranja), #FFFFFF (blanco), #4A4A4A (gris oscuro para contorno)
Monedas:     #FFD700 (dorado), #FFA500 (naranja cálido para brillo)
Edificios:   #8B7355 (marrón ladrillo), #696969 (gris cemento)
Cielo:       #87CEEB (azul cielo), #FFFACD (amarillo claro para horizonte)
UI:          #FFFFFF (texto), #000000 (outline), #333333 (fondo menús)
```

## 5) UI / Señales de Gameplay

La UI debe ser **mínima** y reforzar la jugabilidad sin obstruir:

### 5.1 HUD en Juego

- **Contador de Monedas**: esquina superior izquierda
  - Formato: `🪙 4 / 6`
  - Tamaño grande para lectura rápida
  - Color dorado para el ícono, blanco para el número
  
- **Cronómetro**: esquina superior derecha
  - Formato: `⏱️ 0:23`
  - Color blanco cuando hay tiempo, rojo parpadeante en últimos 5 segundos
  - Actualización fluida (no por segundos discretos)

### 5.2 Feedback de Recolección

- **Moneda recolectada**:
  - Desaparición con fade out rápido (0.2s)
  - Partículas doradas pequeñas (3-5 estrellas)
  - SFX "ding" agudo
  - Contador incrementa inmediatamente

### 5.3 Menú de Victoria

- Overlay con fondo semi-transparente oscuro (rgba(0,0,0,0.7))
- Título grande: "¡VICTORIA!" en amarillo/dorado
- Subtítulo opcional: "Tiempo: 0:23" (muestra tiempo final)
- Dos botones centrados:
  - **Reintentar** (verde)
  - **Salir** (rojo)
- Animación de entrada (scale from center)

## 6) Animaciones del Gato

| Estado    | Frames | Descripción | Velocidad |
| --------- | -----: | ----------- | --------- |
| **Idle**  | 4-6    | Respiración suave, orejas moviéndose, mirada curiosa | 8 FPS |
| **Run**   | 6-8    | Ciclo de carrera, patas alternadas, cola al viento | 12 FPS |
| **Jump**  | 2-3    | Impulso inicial, patas recogidas, expresión concentrada | Hold frame |
| **Fall**  | 2-3    | Patas extendidas, cola hacia arriba, preparándose para aterrizar | Hold frame |

### Transiciones de Animación

- Idle → Run: inmediata (sin interpolación)
- Run → Idle: fade suave (0.1s)
- Idle/Run → Jump: inmediata
- Jump → Fall: cuando velocidad vertical > 0
- Fall → Idle/Run: al tocar suelo

## 7) Elementos de Escenario

### 7.1 Plataformas

- **Estilo**: ladrillos, vigas de madera, tejados
- **Texturas**: repetición de patrones simples (2-4 variantes)
- **Bordes**: outline oscuro para definir límites claramente
- **Colores**: tonos tierra (marrones, grises, rojos ladrillo)

### 7.2 Decoración (No Interactiva)

- **Nubes**: blancas/azul claro en fondo, movimiento parallax lento
- **Ventanas**: en edificios, algunas con luz (detalle)
- **Antenas/Cables**: siluetas en primer plano (profundidad)
- **Pájaros**: pequeños sprites animados ocasionales (ambiente)

**Regla**: Decoración nunca interfiere con lectura de gameplay.

## 8) Mockup de Pantalla (Wireframe)

```
┌────────────────────────────────────────────────────────┐
│  🪙 4/6                                      ⏱️ 0:23   │ ← HUD
├────────────────────────────────────────────────────────┤
│                                                        │
│         🏢  Edificios                  🏢             │
│              🪙  ← Moneda visible                      │
│    🐱  ← Gato jugador                                 │
│    ══════════  ← Plataforma                           │
│                                                        │
│           🪙          🏢                               │
│         ═══════    ══════════                         │
│                                                        │
│  🪙                         🪙                         │
│  ═══════════════════════════════════                  │
└────────────────────────────────────────────────────────┘

Nota: Gato y monedas con colores vibrantes, edificios en grises.
```

## 9) Criterios de Validación Visual

Se considera consistente con el moodboard si:

- [ ] El gato se distingue claramente del fondo en todo momento
- [ ] Las 6 monedas son visibles sin esfuerzo visual excesivo
- [ ] El cronómetro es legible desde cualquier ángulo sin pausar
- [ ] El contador de monedas actualiza instantáneamente al recolectar
- [ ] Los menús tienen contraste suficiente para lectura rápida
- [ ] Las animaciones del gato se ven fluidas a 60 FPS

## 10) Assets Visuales Requeridos (Lista Mínima)

### Sprites del Gato

- `cat_idle_001.png` → `cat_idle_006.png` (6 frames)
- `cat_run_001.png` → `cat_run_008.png` (8 frames)
- `cat_jump_001.png` → `cat_jump_003.png` (3 frames)
- `cat_fall_001.png` → `cat_fall_003.png` (3 frames)

### Sprites de Monedas

- `coin_001.png` → `coin_006.png` (6 frames de rotación, opcional)
- O: `coin_static.png` + shader de brillo

### Tiles de Escenario

- `building_wall.png` (textura repetible)
- `platform_brick.png` (plataforma sólida)
- `platform_wood.png` (variante)
- `background_sky.png` (fondo estático o gradiente)

### UI

- `icon_coin.png` (ícono para HUD)
- `icon_timer.png` (ícono para cronómetro)
- `button_reintentar.png`
- `button_salir.png`
- `panel_victoria.png` (fondo del menú)

### Partículas

- `particle_star.png` (destello al recolectar)
- `particle_dust.png` (opcional: al aterrizar)

## 11) Herramientas Sugeridas

- **Sprite Editor**: Aseprite, Piskel, Photoshop
- **Tilesets**: Tiled Map Editor (para niveles grandes)
- **Paleta**: Lospec Palette List, Adobe Color
- **Referencias**: Pinterest, ArtStation (buscar "pixel art platformer")

## 12) Próximos Pasos

1. Crear sprites del gato (idle primero para testear tamaño)
2. Diseñar tileset de plataformas (3-4 variantes)
3. Crear sprite de moneda (animado o estático)
4. Diseñar UI (HUD y menú de victoria)
5. Testear en Godot con escala 1:1 (verificar legibilidad)

---

**Responsables**: Ariel Amaguaña, Luis Caiza  
**Última actualización**: 30/01/2026  
**Versión del moodboard**: 2.0 (adaptado a Cat Coin Rush)
