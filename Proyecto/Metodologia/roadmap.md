# Roadmap del Semestre (Planificación de Sprints)

> Simulación de semestre en sprints de 2 semanas. Cada sprint define un foco y un "Definition of Done".

| Sprint | Foco principal               | Entregable (Definition of Done)                                                                                                 |
| -----: | ---------------------------- | ------------------------------------------------------------------------------------------------------------------------------- |
|      1 | Concepto + Documento base    | GDD v2.0 completo (visión, pilares, MDA, loop, sistemas de movimiento, recolección y cronómetro). Repo ordenado con /Proyecto. |
|      2 | Arquitectura + Núcleo lógico | UML (Casos de Uso, Clases, FSM) exportado + sección "Arquitectura" del GDD pulida (componentes, patrones, señales).            |
|      3 | Mecánicas y Level Design     | Especificación completa de movimiento, física, recolección + tabla de niveles (actual + futuras expansiones).                  |
|      4 | Arte + UI/UX (Wireframes)    | Moodboard final + wireframes (HUD con contador y cronómetro, menú de victoria) + reglas visuales de sprites del gato y monedas. |
|      5 | Integración + Audio          | Lista de assets final (sprites/tiles/UI/audio) + lista SFX + reglas de audio para feedback (recolección, salto, victoria).     |
|      6 | Polish + QA                  | No se agrega nada nuevo: checklist final, reporte de bugs (mín. 5), ajustes de claridad/flujo, entrega final ordenada.         |

---

## Desglose Detallado por Sprint

### Sprint 1 (Semanas 1-2): Concepto y GDD Base

**Objetivo**: Establecer fundamentos del proyecto con documentación clara.

**User Stories en scope**:

- US-01.1: Definir visión del juego
- US-01.2: Establecer referencias e inspiración
- US-02.1: Diseñar análisis MDA completo
- US-02.2: Definir Core Game Loop

**Criterios de Done**:

- [ ] GDD v2.0 completo con secciones 1-5 (Resumen, Ficha Técnica, Pilares, MDA, Loop)
- [ ] Moodboard inicial con referencias visuales
- [ ] Repositorio creado con estructura /Proyecto
- [ ] README principal con descripción del proyecto

**Estimación**: 14h

---

### Sprint 2 (Semanas 3-4): Arquitectura y UML

**Objetivo**: Diseñar la arquitectura técnica y crear diagramas UML.

**User Stories en scope**:

- US-04.1: Crear documento de arquitectura
- US-04.2: Crear diagramas UML (Casos de Uso, Clases, FSM)

**Criterios de Done**:

- [ ] Documento `arquitectura.md` completo con componentes, patrones y responsabilidades
- [ ] 4 diagramas UML (Casos de Uso, Clases, FSM, Conceptual) en formato .puml
- [ ] Exports de diagramas en PNG en carpeta /UML/img
- [ ] Sección de arquitectura del GDD actualizada

**Estimación**: 11h

---

### Sprint 3 (Semanas 5-6): Mecánicas y Gameplay

**Objetivo**: Especificar todos los sistemas de gameplay en detalle.

**User Stories en scope**:

- US-03.1: Especificar sistema de movimiento
- US-03.2: Diseñar sistema de recolección y scoring
- US-03.3: Especificar sistema de cronómetro

**Criterios de Done**:

- [ ] Sección 6 del GDD (Sistemas de Juego) completada con tablas detalladas
- [ ] Tabla de variables de configuración (velocidad, gravedad, tiempo, monedas)
- [ ] FSM del jugador documentado con transiciones
- [ ] Anexo de especificación de colisiones (layers & masks)

**Estimación**: 6.5h

---

### Sprint 4 (Semanas 7-8): Arte, UI y Wireframes

**Objetivo**: Definir dirección visual y diseñar interfaces.

**User Stories en scope**:

- US-05.1: Crear Moodboard visual
- US-05.2: Diseñar Wireframes de UI
- US-05.3: Crear guía de Audio y SFX

**Criterios de Done**:

- [ ] Moodboard completo con paleta de colores y referencias
- [ ] 3 wireframes: HUD, Menú Victoria, Pantalla de Derrota (futuro)
- [ ] Documento `Audio.md` con lista completa de SFX y BGM
- [ ] Tabla de animaciones del gato (idle, run, jump, fall)

**Estimación**: 8h

---

### Sprint 5 (Semanas 9-10): Integración y Assets

**Objetivo**: Consolidar toda la documentación y preparar lista de assets.

**User Stories en scope**:

- US-06.1: Crear README completo
- Tareas de integración y consistencia

**Criterios de Done**:

- [ ] README principal actualizado con enlaces a todos los documentos
- [ ] Anexo C del GDD: Lista de Assets completa
- [ ] Todos los diagramas exportados y enlazados
- [ ] Verificación de rutas y enlaces en todos los documentos

**Estimación**: 5h

---

### Sprint 6 (Semanas 11-12): QA y Entrega Final

**Objetivo**: Validar calidad de la documentación y preparar entrega.

**User Stories en scope**:

- US-06.2: Validar consistencia de documentación
- Protocolo de QA (ver `qa-testing.md`)

**Criterios de Done**:

- [ ] Checklist de QA completo (sin issues críticos)
- [ ] Reporte de bugs de documentación (mínimo 5 issues resueltos)
- [ ] Changelog actualizado en GDD y README
- [ ] Presentación o video demo (si requerido)
- [ ] Entrega final en repositorio ordenado

**Estimación**: 5h

---

## Métricas de Progreso

Usar estas métricas para tracking en GitHub Projects:

- **Velocity**: Story Points completados por sprint
- **Burndown**: Tareas pendientes vs tiempo restante
- **Quality**: Número de bugs/inconsistencias encontrados y resueltos
- **Coverage**: Porcentaje de secciones del GDD completadas

---

## Riesgos y Mitigación

| Riesgo                          | Probabilidad | Impacto | Mitigación                                    |
| ------------------------------- | ------------ | ------- | --------------------------------------------- |
| Sobrecarga de documentación     | Media        | Alto    | Priorizar MVP, documentar lo esencial primero |
| Inconsistencias entre docs      | Alta         | Medio   | Revisión cruzada en Sprint 6                  |
| Diagramas UML incorrectos       | Baja         | Alto    | Validar con arquitectura antes de exportar    |
| Falta de tiempo para polish     | Media        | Bajo    | Reservar Sprint 6 exclusivo para QA           |

---

## Dependencias entre Sprints

```
Sprint 1 (GDD Base)
    ↓
Sprint 2 (Arquitectura) ← depende de conceptos de Sprint 1
    ↓
Sprint 3 (Mecánicas) ← depende de arquitectura de Sprint 2
    ↓
Sprint 4 (Arte/UI) ← puede iniciar en paralelo con Sprint 3
    ↓
Sprint 5 (Integración) ← depende de todos los anteriores
    ↓
Sprint 6 (QA) ← depende de integración completa
```

---

## Retrospectiva (al finalizar cada sprint)

**Formato sugerido**:

1. **¿Qué funcionó bien?**
2. **¿Qué se puede mejorar?**
3. **¿Hubo bloqueadores?**
4. **Acciones para el próximo sprint**

Documentar retrospectivas en `retrospectiva.md` (opcional).

---

## Conclusión

Este roadmap garantiza:

- Progreso incremental y validable
- Priorización clara de tareas
- Tiempo dedicado para QA y polish
- Entrega final sin prisa de última hora
