# GAME DESIGN DOCUMENT (GDD)

## Cat Coin Rush

**Versión:** 2.0  
**Fecha:** 30 / 01 / 2026  
**Autores:** Ariel Amaguaña, Luis Caiza  
**Curso/Proyecto:** Proyecto 02 – Diseño de Videojuegos, Arquitectura y Análisis

---

## Changelog (Documento Vivo)

| Versión | Fecha      | Cambio                                                                                                                                                                                    |
| ------- | ---------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 2.0     | 2026-01-30 | Reestructuración completa del GDD para Cat Coin Rush: pilares de plataformas, MDA, loop de recolección contrarreloj, sistemas de movimiento y scoring, arquitectura para juego arcade.     |
| 2.1     | Por definir | Planeado: expansión de niveles procedurales; sistema de power-ups; mejora de tabla de scoring; agregar wireframes de HUD y menús, moodboard visual actualizado.                           |
| 2.2     | Por definir | Planeado: sistema de dificultad progresiva; múltiples personajes jugables; modo multijugador local; diagramas UML completos de clases y FSM del jugador.                                   |

---

## 1. Resumen del Proyecto

**Cat Coin Rush** es un juego de plataformas 2D con vista lateral enfocado en recolección contrarreloj y movimiento fluido. El jugador controla un gato ágil que debe recolectar monedas dispersas en niveles urbanos antes de que se agote el tiempo. El juego prioriza la accesibilidad, el "flow" de movimiento y la recompensa por habilidad sobre la complejidad narrativa o mecánicas de combate.

---

## 2. Ficha Técnica

| Campo                   | Valor                                                               |
| ----------------------- | ------------------------------------------------------------------- |
| Título                  | Cat Coin Rush                                                       |
| Género                  | Plataformas 2D / Arcade de Recolección                              |
| Plataforma              | PC (Windows / Linux / Web)                                          |
| Público objetivo        | Jugadores casuales, todas las edades (7+)                           |
| Experiencia buscada     | Flow de movimiento, precisión, gratificación por habilidad          |
| Diferenciador           | Mecánica contrarreloj con parkour vertical simple y accesible       |
| Motor                   | Godot 4.x (2D)                                                      |
| Input principal         | Teclado (Flechas/WASD + Espacio para saltar)                        |
| Duración de partida     | 30-60 segundos por nivel                                            |

---

## 3. Visión de Diseño y Pilares del Juego

### 3.1 Visión General

El juego busca una experiencia arcade accesible y satisfactoria, donde el jugador experimenta el placer del movimiento fluido y la recompensa inmediata. El progreso se mide en habilidad: cada segundo cuenta, cada salto importa, y cada moneda recolectada refuerza la sensación de dominio del espacio.

### 3.2 Pilares de Diseño

**Pilar 1: Movimiento Fluido y Responsive**  
El control del personaje debe sentirse inmediato y preciso. El jugador debe poder ejecutar saltos, cambios de dirección y movimientos complejos sin fricción. La física del personaje prioriza la satisfacción táctil sobre el realismo.

**Pilar 2: Presión de Tiempo Positiva**  
El cronómetro no es un castigo, sino un motivador. El tiempo límite genera urgencia que transforma la recolección en un desafío emocionante. La tensión crea momentos memorables y incentiva rejogar para mejorar.

**Pilar 3: Recompensa Inmediata y Clara**  
Cada moneda recolectada produce feedback audiovisual satisfactorio. El progreso es visible en todo momento (HUD con contador). La victoria es celebrada de forma clara y motivante.

**Pilar 4: Accesibilidad sin Sacrificar Profundidad**  
Controles simples (mover + saltar) permiten que cualquiera juegue, pero el dominio del timing y las rutas óptimas ofrece profundidad para jugadores habilidosos. Curva de aprendizaje suave con techo de habilidad alto.

---

## 4. Análisis MDA (Mechanics – Dynamics – Aesthetics)

### 4.1 Tabla de MDA Conectado

| Aesthetics (Emoción) | Dynamics (Comportamiento)                | Mechanics (Reglas)                                        |
| -------------------- | ---------------------------------------- | --------------------------------------------------------- |
| Desafío              | Optimización de rutas y timing           | Movimiento 8-direccional + salto con física de plataformas |
| Flow                 | Ejecución fluida de secuencias de movimiento | Controles responsive + animaciones fluidas             |
| Satisfacción         | Feedback inmediato por cada logro pequeño | Sistema de recolección + SFX + partículas                 |
| Urgencia             | Gestión del tiempo bajo presión          | Cronómetro descendente + condiciones de victoria/derrota  |

### 4.2 Aesthetics (Experiencia del Jugador)

El diseño busca provocar:

- **Desafío**: el jugador siente que su habilidad es puesta a prueba de forma justa.
- **Flow**: la experiencia de movimiento continuo y sin obstáculos mentales.
- **Satisfacción**: cada moneda recolectada y cada victoria genera dopamina.
- **Urgencia**: la presión del tiempo crea tensión emocionante sin resultar frustrante.

### 4.3 Dynamics (Comportamiento Emergente)

- El jugador experimenta con diferentes rutas para optimizar tiempo.
- Desarrolla "muscle memory" para secuencias de saltos.
- La presión del tiempo genera momentos de tensión dramática (últimos segundos).
- La práctica mejora el desempeño, creando curva de maestría satisfactoria.

### 4.4 Mechanics (Reglas del Sistema)

**Mecánicas principales:**

- Movimiento horizontal continuo (velocidad constante ajustable)
- Salto con física de arco parabólico
- Recolección por colisión (trigger zone)
- Cronómetro descendente desde 30 segundos
- Sistema de scoring (monedas recolectadas / monedas totales)

**Restricciones conscientes:**

- Sin combate o enemigos en el vertical slice
- Sin power-ups o habilidades especiales (versión base)
- Sin sistema de vidas (reinicio inmediato)
- Sin economía compleja (monedas = objetivo, no moneda)

---

## 5. Loop de Juego

### 5.1 Core Game Loop

1. **Iniciar nivel**: aparece el cronómetro, el jugador toma control
2. **Moverse y explorar**: el jugador navega el nivel buscando monedas
3. **Recolectar moneda**: feedback inmediato (SFX, partículas, contador actualizado)
4. **Evaluar progreso**: el jugador verifica cuántas monedas faltan y cuánto tiempo queda
5. **Repetir pasos 2-4** hasta cumplir condición de victoria o derrota
6. **Resolución**: menú de victoria (reintentar/salir) o reinicio automático (derrota)

### 5.2 Variaciones del Loop

- **Optimización**: en reintentos, el jugador prueba rutas más eficientes.
- **Presión creciente**: conforme baja el tiempo, las decisiones se vuelven más urgentes.
- **Momentum**: secuencias exitosas de recolección crean sensación de "racha" satisfactoria.

---

## 6. Sistemas de Juego (Especificación)

### 6.1 Controles

- **Flechas ← →** o **A/D**: Movimiento horizontal
- **Espacio** o **W**: Saltar
- **ESC**: Pausar (futuro)

### 6.2 Tabla de Sistemas (para implementación actual)

| Sistema              | Objetivo          | Entrada               | Salida / Feedback           | Datos afectados     |
| -------------------- | ----------------- | --------------------- | --------------------------- | ------------------- |
| Movimiento           | Navegación horizontal | Flechas/AD           | Animación de correr + flip horizontal | Posición X         |
| Salto                | Navegación vertical | Espacio              | Animación de salto/caída + arco parabólico | Posición Y, velocidad Y |
| Recolección          | Sumar monedas     | Colisión con coin    | SFX + partículas + desaparición de moneda | Contador de monedas |
| Cronómetro           | Presión de tiempo | Automático (delta)   | UI actualizada cada frame   | Tiempo restante     |
| Condición de Victoria | Finalizar nivel  | 6 monedas recolectadas | Menú de victoria con opciones | Estado del juego   |
| Condición de Derrota  | Reiniciar        | Tiempo = 0 sin 6 monedas | Reinicio automático del nivel | Estado del juego   |

### 6.3 Sistema de Movimiento (Detalle)

**Movimiento horizontal**:

- Velocidad constante ajustable (por defecto ~200 pixels/segundo)
- Aceleración instantánea (sin rampa de aceleración para mayor responsividad)
- Flip del sprite según dirección

**Salto**:

- Impulso vertical inicial con gravedad constante
- Altura fija (no variable por tiempo de pulsación en versión actual)
- Detección de suelo para permitir nuevo salto
- Animaciones: idle → jump → fall → idle

**Control del personaje**:

- Estado: IDLE, RUNNING, JUMPING, FALLING
- Transiciones basadas en input y física (contacto con suelo, velocidad vertical)

### 6.4 Sistema de Recolección (Detalle)

- **Trigger**: cuando el área de colisión del jugador intersecta con el área de la moneda
- **Efecto inmediato**:
  - Moneda desaparece (queue_free())
  - SFX de recolección
  - Partículas breves (opcional)
  - Contador de UI incrementa
  - Se evalúa condición de victoria (si contador == 6)

### 6.5 Sistema de Cronómetro (Detalle)

- Inicializa en 30 segundos al cargar el nivel
- Decrementa cada frame (usando `delta` time)
- Actualiza UI en tiempo real
- Al llegar a 0:
  - Si `monedas_recolectadas < 6`: reinicia el nivel automáticamente
  - Si `monedas_recolectadas >= 6`: no puede llegar a 0 (victoria antes)

---

## 7. Narrativa y Mundo

### 7.1 Premisa

Un gato ágil y aventurero explora tejados urbanos recolectando monedas brillantes. No hay historia explícita: el juego es experiencial y arcade. El mundo existe para ser un playground de movimiento.

### 7.2 Tipo de Narrativa

**Narrativa ambiental mínima**. El escenario urbano con edificios, tejados y estructuras sugiere un entorno cotidiano transformado en espacio lúdico. La "historia" es la que el jugador crea con sus movimientos y logros.

### 7.3 Temas

Agilidad, superación personal, time trial, satisfacción inmediata.

### 7.4 Personaje

- **El Gato**: protagonista jugable; sin personalidad explícita pero expresivo mediante animaciones (idle curioso, correr dinámico, salto ágil). Su diseño debe transmitir simpatía y capacidad atlética.

---

## 8. Diseño de Niveles

### 8.1 Principios de Level Design

- **Legibilidad**: el jugador debe identificar rápidamente plataformas, monedas y rutas posibles.
- **Parkour vertical**: diseño en múltiples alturas que incentiva el salto y la exploración vertical.
- **Distribución estratégica de monedas**: algunas fáciles (suelo), otras requieren saltos o secuencias.
- **Sin dead-ends frustrantes**: siempre debe haber forma de regresar o continuar.

### 8.2 Estructura típica de un nivel

1. **Punto de inicio**: zona clara y segura donde el jugador aparece.
2. **Zona baja/fácil**: 1-2 monedas accesibles sin saltos complejos (tutorial implícito).
3. **Zona media/parkour**: 2-3 monedas que requieren saltos entre plataformas.
4. **Zona alta/desafío**: 1-2 monedas en posiciones más difíciles (reward por habilidad).
5. **Circulación**: el nivel permite movimiento fluido entre zonas sin atorarse.

### 8.3 Progresión de dificultad

En futuras expansiones, la dificultad puede crecer mediante:

- Plataformas más pequeñas o más separadas
- Monedas en posiciones más difíciles
- Tiempo reducido
- Introducción de obstáculos móviles o peligros

### 8.4 Tabla de Niveles (Vertical Slice Actual)

| Nivel              | Objetivo                      | Monedas totales | Tiempo límite | Características especiales                      |
| ------------------ | ----------------------------- | --------------: | ------------: | ----------------------------------------------- |
| Nivel 1 (actual)   | Introducir mecánicas básicas  |               6 |     30s       | Edificios estáticos, distribución balanceada    |

**Futuras expansiones** (Nivel 2-5):

| Nivel              | Objetivo                      | Monedas totales | Tiempo límite | Características especiales                      |
| ------------------ | ----------------------------- | --------------: | ------------: | ----------------------------------------------- |
| Nivel 2            | Aumentar parkour vertical     |               8 |     35s       | Plataformas más altas, monedas en torres        |
| Nivel 3            | Introducir rutas alternativas |              10 |     40s       | Dos caminos posibles (alto/bajo)                |
| Nivel 4            | Desafío de precisión          |               8 |     25s       | Plataformas pequeñas, menos tiempo              |
| Nivel 5 (boss)     | Recolección máxima            |              12 |     50s       | Nivel grande, múltiples alturas, todas las mecánicas |

---

## 9. Arte, Audio y UI/UX

### 9.1 Dirección artística

Pixel art/sprites 2D con estilo cartoon accesible. Paleta vibrante con edificios en tonos grises/marrones para contraste, monedas doradas brillantes, gato con colores distintivos (actualmente en tonos naranjas/blancos).

### 9.2 Paleta y atmósfera

- **Edificios/fondo**: tonos neutros (grises, marrones, azules apagados) para no distraer
- **Monedas**: amarillo/dorado brillante con animación de rotación o brillo
- **Gato**: colores cálidos (naranja, blanco) para destacar contra el fondo
- **UI**: colores claros sobre fondo oscuro para alta legibilidad

### 9.3 Animaciones del Gato

| Estado    | Animación              | Frames sugeridos | Trigger                          |
| --------- | ---------------------- | ---------------: | -------------------------------- |
| Idle      | Respiración, mirada    |             4-6  | Velocidad horizontal = 0, en suelo |
| Run       | Correr cíclico         |             6-8  | Velocidad horizontal > 0, en suelo |
| Jump      | Impulso inicial        |             2-3  | Frame de inicio de salto         |
| Fall      | Caída/aterrizaje       |             2-3  | Velocidad vertical < 0           |

### 9.4 Audio

**Música (BGM)**:

- Estilo: upbeat, ligero, con ritmo constante (100-120 BPM)
- Textura: chiptune o synth pop alegre, sin complejidad excesiva
- Loop: 1:00-2:00 minutos, sin drops dramáticos que distraigan
- Propósito: mantener energía sin generar estrés

**SFX (Efectos de sonido)**:

- **Recolección de moneda**: "ding" agudo y satisfactorio
- **Salto**: "whoosh" ligero
- **Aterrizaje**: impacto suave (opcional)
- **Victoria**: fanfarria breve (3-5 segundos)
- **Derrota/Time up**: sonido descendente o "buzz" (no agresivo)

### 9.5 UI/UX (Wireframes descritos)

**HUD en juego**:

- **Contador de monedas**: esquina superior izquierda, formato "🪙 4 / 6"
- **Cronómetro**: esquina superior derecha, formato "⏱️ 0:23"
- **Estilo**: texto grande, outline oscuro para contraste sobre cualquier fondo

**Menú de Victoria**:

- Overlay con fondo semi-transparente
- Título: "¡Victoria!" o "¡Misión Cumplida!"
- Botones:
  - "Reintentar" (vuelve a cargar el nivel)
  - "Salir" (cierra el juego o vuelve al menú principal)
- Estadísticas opcionales: tiempo final, bonus por tiempo sobrante

**Pantalla de Derrota**:

- Actualmente: reinicio automático sin menú
- Futuro: overlay rápido con "Time's Up!" y reinicio tras 1-2 segundos

---

## 10. Arquitectura de Software (Diseño Conceptual)

### 10.1 Componentes principales

- **Player** (PlayerMov.gd): control de movimiento, física, animaciones
- **Coin** (Coin2D.gd): detección de recolección, feedback
- **UI** (UI.gd): contador de monedas, condición de victoria
- **UI_Time** (UI_Time.gd): cronómetro, condición de derrota
- **MenuVictoria** (menu_victoria.gd): pantalla de fin del juego
- **ZonaCaida** (ZonaCaida.gd): detección de caídas fuera del nivel (reinicio)

### 10.2 Responsabilidades (tabla)

| Componente   | Responsabilidad principal                                     |
| ------------ | ------------------------------------------------------------- |
| Player       | Procesar input, aplicar física, cambiar animaciones, detectar colisiones |
| Coin         | Esperar colisión con jugador, emitir señal, auto-destruirse   |
| UI           | Escuchar señal de recolección, actualizar contador, mostrar menú victoria |
| UI_Time      | Decrementar tiempo, actualizar display, detectar time-out     |
| MenuVictoria | Ofrecer opciones de reinicio/salida                           |
| ZonaCaida    | Detectar si jugador cae fuera del nivel, reiniciar escena    |

### 10.3 Comunicación entre componentes

**Señales (Signals)**:

- `Coin` → emite señal `coin_collected` cuando jugador colisiona
- `UI` → escucha `coin_collected`, incrementa contador, verifica victoria
- `UI_Time` → cuando tiempo llega a 0, llama a `get_tree().reload_current_scene()`

**Acceso directo**:

- `UI` accede directamente a nodo de menú victoria para mostrarlo
- `Player` no necesita conocer `UI` ni `Coin` (desacople mediante señales)

### 10.4 Patrones de diseño

- **Observer (Signals)**: desacopla la lógica de recolección de monedas de la UI
- **Component-based (Godot Nodes)**: cada entidad es un nodo con script específico
- **State Machine implícita**: estados del jugador (idle/run/jump/fall) controlados por condicionales simples en `_physics_process`

### 10.5 Flujo de ejecución típico

1. Se carga la escena `Map.tscn`
2. `UI_Time` inicia el cronómetro
3. `Player` espera input y procesa física cada frame
4. Al colisionar con `Coin`:
   - `Coin` emite señal y se destruye
   - `UI` recibe señal, incrementa contador
   - Si contador == 6: muestra menú de victoria, pausa el tiempo
5. Si cronómetro llega a 0 sin victoria: reinicia escena
6. Si jugador cae en `ZonaCaida`: reinicia escena

---

## 11. Alcance y Restricciones

### 11.1 Fuera de alcance (non-scope) para el Vertical Slice

- Enemigos o combate
- Power-ups o habilidades especiales
- Múltiples niveles (solo 1 nivel funcional)
- Sistema de puntuación global (leaderboards)
- Menú principal elaborado
- Tutoriales explícitos (se confía en diseño intuitivo)

### 11.2 En alcance para el Vertical Slice

✅ Movimiento fluido del jugador (horizontal + salto)  
✅ Recolección de 6 monedas  
✅ Cronómetro de 30 segundos  
✅ Condiciones de victoria (menú) y derrota (reinicio)  
✅ Animaciones básicas del gato (idle, run, jump, fall)  
✅ SFX de recolección  
✅ HUD con contador y cronómetro  
✅ Nivel único jugable y completo  

---

## 12. Anexos

### Anexo A: Tabla de Variables de Configuración

| Variable             | Tipo  | Valor por defecto | Descripción                                |
| -------------------- | ----- | ----------------: | ------------------------------------------ |
| `speed`              | float |             200.0 | Velocidad horizontal del gato              |
| `jump_velocity`      | float |            -400.0 | Impulso vertical del salto                 |
| `gravity`            | float |            980.0  | Aceleración de gravedad (hacia abajo)      |
| `time`               | int   |                30 | Tiempo límite en segundos                  |
| `coins_required`     | int   |                 6 | Monedas necesarias para ganar              |

### Anexo B: Máquina de Estados del Jugador (FSM)

**Estados**:

- **IDLE**: en suelo, sin movimiento horizontal
- **RUNNING**: en suelo, con movimiento horizontal
- **JUMPING**: en el aire, velocidad vertical negativa (subiendo)
- **FALLING**: en el aire, velocidad vertical positiva (bajando)

**Transiciones**:

- IDLE → RUNNING: input horizontal detectado
- RUNNING → IDLE: input horizontal = 0
- IDLE/RUNNING → JUMPING: presionar espacio + en suelo
- JUMPING → FALLING: velocidad vertical > 0
- FALLING → IDLE/RUNNING: contacto con suelo

### Anexo C: Lista de Assets (mínimo viable actual)

**Sprites**:

- `Cat/idle/` (4-6 frames)
- `Cat/run/` (6-8 frames)
- `Cat/jump/` (2-3 frames)
- `Cat/fall/` (2-3 frames)
- `Coin/` (frames de animación rotatoria o brillos)
- `Buildings/` (texturas de edificios/plataformas)
- `Texture/` (fondos, cielos, detalles decorativos)

**Audio**:

- `SFX_coin_collect.wav` (recolección de moneda)
- `SFX_jump.wav` (salto del gato - opcional)
- `BGM_level.ogg` (música de fondo del nivel)
- `SFX_victory.wav` (fanfarria de victoria)

**Escenas**:

- `Map.tscn` (nivel principal)
- `coin.tscn` (prefab de moneda recolectable)
- `menu_victoria.tscn` (overlay de victoria)

### Anexo D: Especificación de Colisiones

| Entidad         | Collision Layer | Collision Mask | Propósito                          |
| --------------- | --------------: | -------------: | ---------------------------------- |
| Player          |       1 (jugador) |    2 (mundo), 4 (coins), 8 (caída) | Colisiona con suelo y monedas      |
| Plataformas     |       2 (mundo)   |    1 (jugador) | Suelo sólido                       |
| Coin            |       4 (coins)   |    1 (jugador) | Trigger para recolección           |
| ZonaCaida       |       8 (caída)   |    1 (jugador) | Trigger para reinicio              |

### Anexo E: Criterios de Jugabilidad (Playtesting)

**Checklist de calidad mínima**:

- [ ] El gato responde instantáneamente al input (< 1 frame de latencia)
- [ ] El salto se siente "juicy" (altura adecuada, arco satisfactorio)
- [ ] Las 6 monedas son alcanzables en menos de 30 segundos (ruta óptima ~20-25s)
- [ ] Ninguna moneda requiere movimiento "pixel-perfect" frustrante
- [ ] El cronómetro es claramente visible en todo momento
- [ ] El contador de monedas actualiza inmediatamente al recolectar
- [ ] El menú de victoria permite reiniciar o salir sin bugs
- [ ] La pantalla de derrota (time-out) reinicia sin crash

**Métricas de éxito**:

- Tasa de victoria en primer intento: ~30-40% (indica dificultad balanceada)
- Tiempo promedio de victoria: 22-28 segundos
- Tasa de reintentos: 2-3 intentos promedio para jugador nuevo
- Satisfacción reportada: > 7/10 en diversión percibida

### Anexo F: Referencias de Gestión

La planificación, roadmap y control de calidad se mantienen en documentos separados:

- Plan general y backlog: `Metodologia/Planificacion.md`
- Roadmap oficial de sprints: `Metodologia/roadmap.md`
- Protocolo de QA y pruebas: `Metodologia/qa-testing.md`

### Anexo G: Referencias de Diseño (Inspiración)

**Juegos de referencia**:

- **Celeste**: movimiento preciso y satisfactorio, desafío justo
- **Super Meat Boy**: time trials, reinicio rápido, parkour challenging
- **Sonic the Hedgehog**: momentum y flow de movimiento
- **Mario Bros (NES)**: simplicidad de controles, diseño de niveles claro
- **Run 3**: tiempo límite y recolección como objetivo

**Principios tomados**:

- Control responsive y "tight"
- Feedback audiovisual inmediato
- Curva de dificultad accesible con maestría recompensada
- Estética clara y funcional (gameplay over graphics)
