# Planificación y Gestión (Project Management)

## Cat Coin Rush — Proyecto 02

**Metodología:** Ágil (Scrum ligero / Kanban)  
**Herramienta sugerida:** GitHub Projects (tablero) + Issues  
**Objetivo:** Evidenciar organización del trabajo mediante Épicas, User Stories, tareas y estimaciones.

**Evidencias esperadas (por Issue o User Story)**

- Descripción clara del objetivo y alcance.
- Captura o enlace al entregable asociado (documento, diagrama, mockup).
- Checklist de tareas marcadas y responsable asignado.
- Nota de validación o comentario de revisión.

**Definition of Done general**

- Criterios de aceptación cumplidos y revisados.
- Evidencia adjunta y accesible (GitHub Issue/PR/archivo en `docs`).
- Sin pendientes críticos ni severidades altas abiertas.
- Actualización del estado en el tablero (pasado a Review/Done con fecha).

---

## 1. Tablero (GitHub Projects) — Configuración sugerida

### 1.1 Columnas

- Backlog
- Ready
- In Progress
- Review
- Done

### 1.2 Labels sugeridos

- `documentation`
- `design`
- `architecture`
- `art-ui`
- `audio`
- `gameplay`
- `management`
- `priority:high`
- `priority:medium`
- `priority:low`

### 1.3 Reglas simples de trabajo

- Todo trabajo debe estar en un Issue.
- Un Issue debe tener: descripción, checklist, estimación.
- Para pasar a "Review" debe tener evidencia (captura, link, diagrama, archivo).

---

## 2. Épicas (Epic Map)

| ID    | Épica                                   | Objetivo                                                         |
| ----- | --------------------------------------- | ---------------------------------------------------------------- |
| EP-01 | Investigación y Concepto                | Definir alcance, referencias y documento base del juego          |
| EP-02 | Diseño MDA y Core Loop                  | Fundamentar el juego con MDA, pilares y diseñar loop/sistemas principales |
| EP-03 | Mecánicas y Gameplay                    | Documentar movimiento, recolección, cronómetro y condiciones de victoria/derrota |
| EP-04 | Arquitectura Técnica (UML + Patrones)   | Diseñar la arquitectura con UML, patrones y especificación de componentes |
| EP-05 | Arte, Audio y UI Mockups                | Definir dirección visual/sonora, wireframes del HUD y menús       |
| EP-06 | Consolidación del Repositorio y Entrega | Ordenar documentación, README y evidencias para evaluación       |

---

## 3. Backlog (User Stories + Tareas + Estimaciones)

> Convención de estimación: horas (h).  
> Total sugerido para el proyecto: 22–35h (según profundidad).

---

# EP-01 — Investigación y Concepto

## US-01.1 — Definir visión del juego

**Como** equipo de diseño, **quiero** definir la visión, pilares y alcance del juego, **para** asegurar coherencia en todo el documento.

**Criterios de aceptación**

- Visión general escrita (1–2 párrafos)
- 4 pilares definidos y explicados
- Alcance y restricciones claras (non-scope)

**Tareas**

- [ ] TSK-01.1.1 Redactar visión y pilares (2h)
- [ ] TSK-01.1.2 Definir non-scope y restricciones (1h)
- [ ] TSK-01.1.3 Revisar consistencia con MDA (1h)

**Estimación total:** 4h

---

## US-01.2 — Establecer referencias e inspiración

**Como** diseñador, **quiero** documentar referencias de juegos similares, **para** justificar decisiones del proyecto.

**Criterios de aceptación**

- Lista de 3–6 referentes (juegos) con "qué aporta cada uno"
- Moodboard inicial (visual)

**Tareas**

- [ ] TSK-01.2.1 Investigar juegos de plataformas similares (Celeste, Super Meat Boy, Sonic) (2h)
- [ ] TSK-01.2.2 Crear moodboard visual con capturas (1h)
- [ ] TSK-01.2.3 Documentar principios tomados (1h)

**Estimación total:** 4h

---

# EP-02 — Diseño MDA y Core Loop

## US-02.1 — Diseñar análisis MDA completo

**Como** diseñador, **quiero** crear tabla MDA (Mechanics-Dynamics-Aesthetics), **para** conectar reglas con experiencia emocional.

**Criterios de aceptación**

- Tabla MDA con al menos 4 filas (aesthetics claras)
- Descripción de cada capa (mechanics, dynamics, aesthetics)
- Justificación de conexiones

**Tareas**

- [ ] TSK-02.1.1 Definir aesthetics objetivo (desafío, flow, satisfacción, urgencia) (1h)
- [ ] TSK-02.1.2 Documentar dynamics (comportamientos emergentes) (1h)
- [ ] TSK-02.1.3 Listar mechanics core (movimiento, salto, recolección, cronómetro) (2h)

**Estimación total:** 4h

---

## US-02.2 — Definir Core Game Loop

**Como** diseñador, **quiero** especificar el loop principal de juego, **para** asegurar claridad en la experiencia repetitiva.

**Criterios de aceptación**

- Diagrama o lista de pasos del loop (mínimo 5 pasos)
- Variaciones del loop (optimización, presión creciente)
- Validación con pilares de diseño

**Tareas**

- [ ] TSK-02.2.1 Documentar loop paso a paso (1.5h)
- [ ] TSK-02.2.2 Describir variaciones (0.5h)

**Estimación total:** 2h

---

# EP-03 — Mecánicas y Gameplay

## US-03.1 — Especificar sistema de movimiento

**Como** programador, **quiero** tener especificación detallada del movimiento del jugador, **para** implementarlo con precisión.

**Criterios de aceptación**

- Tabla de controles (WASD, Flechas, Espacio)
- Especificación de física (velocidad, gravedad, salto)
- FSM de estados del jugador (IDLE, RUNNING, JUMPING, FALLING)

**Tareas**

- [ ] TSK-03.1.1 Documentar controles y parámetros de física (1.5h)
- [ ] TSK-03.1.2 Crear diagrama FSM de estados (1.5h)

**Estimación total:** 3h

---

## US-03.2 — Diseñar sistema de recolección y scoring

**Como** diseñador, **quiero** definir cómo funcionan las monedas y el contador, **para** asegurar feedback claro.

**Criterios de aceptación**

- Especificación de trigger de recolección
- Feedback audiovisual (SFX, partículas)
- Condición de victoria (6 monedas)

**Tareas**

- [ ] TSK-03.2.1 Documentar mecánica de recolección (1h)
- [ ] TSK-03.2.2 Definir condiciones de victoria/derrota (1h)

**Estimación total:** 2h

---

## US-03.3 — Especificar sistema de cronómetro

**Como** diseñador, **quiero** definir el comportamiento del cronómetro, **para** generar presión de tiempo adecuada.

**Criterios de aceptación**

- Tiempo límite definido (30 segundos)
- Comportamiento al llegar a 0 (reinicio automático)
- UI del cronómetro especificada

**Tareas**

- [ ] TSK-03.3.1 Documentar lógica del cronómetro (1h)
- [ ] TSK-03.3.2 Definir condición de derrota (0.5h)

**Estimación total:** 1.5h

---

# EP-04 — Arquitectura Técnica

## US-04.1 — Crear documento de arquitectura

**Como** programador, **quiero** tener especificación de componentes y responsabilidades, **para** mantener código organizado.

**Criterios de aceptación**

- Tabla de componentes con responsabilidades
- Patrones de diseño aplicados (Observer, Component-Based, FSM)
- Diagrama de comunicación entre componentes

**Tareas**

- [ ] TSK-04.1.1 Documentar componentes principales (2h)
- [ ] TSK-04.1.2 Explicar patrones de diseño aplicados (1.5h)
- [ ] TSK-04.1.3 Crear diagramas de flujo (1.5h)

**Estimación total:** 5h

---

## US-04.2 — Crear diagramas UML

**Como** desarrollador, **quiero** diagramas UML (casos de uso, clases, FSM), **para** visualizar arquitectura.

**Criterios de aceptación**

- Diagrama de casos de uso (mínimo 5 casos)
- Diagrama de clases conceptual (Player, Coin, UI, etc.)
- Diagrama de estados (FSM del jugador)

**Tareas**

- [ ] TSK-04.2.1 Crear diagrama de casos de uso en PlantUML (2h)
- [ ] TSK-04.2.2 Crear diagrama de clases (2h)
- [ ] TSK-04.2.3 Crear diagrama FSM (1.5h)
- [ ] TSK-04.2.4 Exportar todos a PNG (0.5h)

**Estimación total:** 6h

---

# EP-05 — Arte, Audio y UI

## US-05.1 — Crear Moodboard visual

**Como** artista, **quiero** un moodboard que defina la dirección visual, **para** guiar la creación de assets.

**Criterios de aceptación**

- Moodboard con referencias visuales (capturas de juegos similares)
- Paleta de colores definida
- Notas sobre estilo de sprites y animaciones

**Tareas**

- [ ] TSK-05.1.1 Recopilar referencias visuales (1.5h)
- [ ] TSK-05.1.2 Definir paleta y estilo (1h)
- [ ] TSK-05.1.3 Documentar en moodboard.md (0.5h)

**Estimación total:** 3h

---

## US-05.2 — Diseñar Wireframes de UI

**Como** diseñador de UI, **quiero** wireframes del HUD y menús, **para** implementar UI consistente.

**Criterios de aceptación**

- Wireframe de HUD (contador de monedas, cronómetro)
- Wireframe de menú de victoria
- Notas sobre posicionamiento y estilo

**Tareas**

- [ ] TSK-05.2.1 Crear wireframe de HUD (1h)
- [ ] TSK-05.2.2 Crear wireframe de menú victoria (1h)
- [ ] TSK-05.2.3 Documentar en Wireframe.md (0.5h)

**Estimación total:** 2.5h

---

## US-05.3 — Crear guía de Audio y SFX

**Como** diseñador de audio, **quiero** lista de SFX y música necesarios, **para** producir assets coherentes.

**Criterios de aceptación**

- Lista de SFX (recolección, salto, victoria, derrota)
- Descripción de música (BGM upbeat, 100-120 BPM)
- Referencias de estilo (chiptune, synth pop)

**Tareas**

- [ ] TSK-05.3.1 Listar todos los SFX necesarios (1h)
- [ ] TSK-05.3.2 Definir dirección musical (1h)
- [ ] TSK-05.3.3 Documentar en Audio.md (0.5h)

**Estimación total:** 2.5h

---

# EP-06 — Consolidación y Entrega

## US-06.1 — Crear README completo

**Como** usuario del repositorio, **quiero** un README claro, **para** entender el proyecto rápidamente.

**Criterios de aceptación**

- Descripción del juego
- Estructura del repositorio
- Enlaces a todos los documentos clave
- Instrucciones para ejecutar el vertical slice

**Tareas**

- [ ] TSK-06.1.1 Redactar README principal (1.5h)
- [ ] TSK-06.1.2 Verificar enlaces y estructura (0.5h)

**Estimación total:** 2h

---

## US-06.2 — Validar consistencia de documentación

**Como** evaluador, **quiero** que todos los documentos sean consistentes, **para** entender el proyecto sin contradicciones.

**Criterios de aceptación**

- Sin contradicciones entre GDD, Arquitectura y Metodología
- Terminología consistente en todos los documentos
- Todos los diagramas exportados y accesibles

**Tareas**

- [ ] TSK-06.2.1 Revisión cruzada de documentos (2h)
- [ ] TSK-06.2.2 Corrección de inconsistencias (1h)

**Estimación total:** 3h

---

## 4. Resumen de Estimaciones

| Épica | Horas estimadas |
| ----- | --------------: |
| EP-01 |             8h  |
| EP-02 |             6h  |
| EP-03 |           6.5h  |
| EP-04 |            11h  |
| EP-05 |             8h  |
| EP-06 |             5h  |
| **TOTAL** |        **44.5h** |

---

## 5. Cronograma Sugerido (Sprints)

Ver archivo `roadmap.md` para desglose detallado por semanas.

---

## 6. Herramientas y Recursos

- **Gestión**: GitHub Projects, GitHub Issues
- **Diagramas**: PlantUML, draw.io
- **Documentación**: Markdown, VS Code
- **Diseño**: Figma (wireframes), Canva/Pinterest (moodboard)
- **Motor**: Godot 4.x

---

## 7. Roles y Responsabilidades

Para un proyecto individual o equipo pequeño:

- **Diseñador de Juego**: GDD, MDA, level design
- **Arquitecto de Software**: arquitectura, UML, patrones
- **Artista**: moodboard, referencias visuales
- **Diseñador de Audio**: guía de audio y SFX
- **Project Manager**: planificación, backlog, roadmap

En proyecto individual, una persona asume todos los roles por fases.
