# Cat Coin Rush — Proyecto 02

**Segundo Bimestre — 2026**

## Descripción General

Cat Coin Rush es un juego de plataformas 2D enfocado en recolección contrarreloj y mecánicas de parkour vertical. El jugador controla un gato ágil que debe recolectar monedas en niveles procedurales antes de que se agote el tiempo. El proyecto prioriza la accesibilidad, el flow de movimiento y la recompensa por habilidad sobre la complejidad narrativa.

## Estructura del Repositorio

### Proyecto (documentación y diseño)

- `Proyecto/Arquitectura/arquitectura.md` — Diseño conceptual y arquitectura de software.
- `Proyecto/GDD/Game_Design_Document.md` — Game Design Document.
- `Proyecto/Metodologia/Planificacion.md` — Metodología ágil y gestión.
- `Proyecto/Metodologia/roadmap.md` — Roadmap oficial de sprints.
- `Proyecto/Metodologia/qa-testing.md` — Protocolo de QA y pruebas.
- `Proyecto/ArteUI/Moodboard/moodboard.md` — Moodboard visual (referencias y notas de arte).
- `Proyecto/ArteUI/Wireframe/Wireframe.md` — Wireframes UI (HUD, cronómetro, menús) + imágenes.
- `Proyecto/ArteUI/Audio/Audio.md` — Guía de audio y SFX.
- `Proyecto/UML/` — Diagramas (fuentes `.puml` y exports `.png`).

### Vertical Slice (implementación actual)

- Proyecto Godot 4.x con sistema de movimiento, recolección y cronómetro.
- `Assets/` — Sprites del gato, monedas, edificios y texturas.
- `Scenes/` — Escenas del mapa, menús y prefabs.
- `Scripts/` — Lógica de movimiento (PlayerMov.gd), recolección (Coin2D.gd), UI y cronómetro.

## Tecnologías Utilizadas

- **Godot 4.6** (C#)
- **.NET 8.0**
- **PlantUML** (diagramas)
- **Markdown** (documentación)

## Documentos Clave (Proyecto)

- [Game Design Document (GDD)](Proyecto/GDD/Game_Design_Document.md)
- [Arquitectura de Software](Proyecto/Arquitectura/arquitectura.md)
- [Planificación y Metodología](Proyecto/Metodologia/Planificacion.md)
- [Roadmap de Sprints](Proyecto/Metodologia/roadmap.md)
- [QA y Testing](Proyecto/Metodologia/qa-testing.md)
- [Moodboard Visual](Proyecto/ArteUI/Moodboard/moodboard.md)
- [Wireframes UI](Proyecto/ArteUI/Wireframe/Wireframe.md)
- [Guía de Audio y SFX](Proyecto/ArteUI/Audio/Audio.md)

### Diagramas UML

- Fuentes (`.puml`):
  - [Casos de Uso](Proyecto/UML/Casos_de_uso.puml)
  - [Clases](Proyecto/UML/clases.puml)
  - [Diagrama Conceptual](Proyecto/UML/diagrama_conceptual.puml)
  - [Estados FSM](Proyecto/UML/estados_fsm.puml)
- Exports (`.png`):
  - [Casos de Uso](Proyecto/UML/img/Caso_de_uso.png)
  - [Clases](Proyecto/UML/img/Clases.png)
  - [Diagrama Conceptual](Proyecto/UML/img/Conceptual.png)
  - [Estados FSM](Proyecto/UML/img/FSM.png)

## Cómo Ejecutar el Vertical Slice

1. Abrir Godot Engine 4.x.
2. Importar el proyecto desde la carpeta raíz (contiene `project.godot`).
3. Ejecutar la escena principal `Scenes/Map.tscn`.
4. Controles: Flechas/WASD para mover, Espacio para saltar.
5. Objetivo: recolectar 6 monedas antes de que se acabe el tiempo (30 segundos).

## Autores

Ariel Amaguaña, Luis Caiza

---

Para más detalles, consulta los documentos en la carpeta `Proyecto/`.
