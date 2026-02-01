# QA y Testing — Cat Coin Rush

## 1. Propósito y alcance

Establecer un proceso mínimo de aseguramiento de calidad para la documentación del juego, enfocado en coherencia de diseño, lógica de sistemas y claridad de la experiencia de gameplay.

## 2. Flujo de gestión de bugs

1) Reportar el hallazgo con la plantilla.  
2) Asignar severidad y responsable.  
3) Reproducir y validar en ambiente/documento actualizado.  
4) Cerrar solo con evidencia adjunta y nota de verificación.

## 3. Plantilla de Bug Report

- **ID**:
- **Título**:
- **Severidad**: Baja / Media / Alta / Bloqueante
- **Prioridad**: P1 / P2 / P3
- **Entorno / versión del documento**:
- **Descripción**:
- **Pasos para reproducir**:
- **Resultado esperado**:
- **Resultado observado**:
- **Evidencia** (captura, enlace a sección del doc, diagrama, issue):
- **Estado**: ToDo / InProgress / Ready for Review / Done
- **Responsable**:
- **Fecha de detección / fecha de cierre**:
- **Notas de validación**:

## 4. Guía de severidad y prioridad

- **Bloqueante**: impide continuar la revisión o invalida el entregable.
- **Alta**: afecta funcionalidad lógica central (física, recolección, cronómetro) o criterio clave de aceptación.
- **Media**: inconsistencia menor de contenido, formato o trazabilidad.
- **Baja**: mejoras menores, estilo, typos sin impacto en criterios.

## 5. Casos mínimos de prueba (técnicos - documentación)

### 5.1 Consistencia de Sistemas

- [ ] Sistema de movimiento: velocidad, gravedad y salto están especificados con valores numéricos
- [ ] Sistema de recolección: trigger de colisión, señales y feedback están documentados
- [ ] Sistema de cronómetro: tiempo inicial, decremento y condición de time-out están claros
- [ ] FSM del jugador: estados (IDLE, RUNNING, JUMPING, FALLING) y transiciones están definidos sin ambigüedad

### 5.2 Arquitectura

- [ ] Componentes: cada componente (Player, Coin, UI, UI_Time) tiene responsabilidades claras
- [ ] Comunicación: flujo de señales (coin_collected) está documentado con emisor y receptor
- [ ] Patrones: al menos 2 patrones de diseño están identificados y justificados
- [ ] Diagramas UML: casos de uso, clases y FSM existen y están exportados a PNG

### 5.3 Coherencia entre Documentos

- [ ] GDD y Arquitectura: componentes mencionados en GDD coinciden con arquitectura.md
- [ ] Pilares y MDA: aesthetics en MDA reflejan los pilares de diseño
- [ ] Assets y Audio: todos los assets mencionados en GDD están listados en Anexo C
- [ ] Wireframes y UI: elementos de UI mencionados en GDD tienen wireframe correspondiente

### 5.4 Completitud del GDD

- [ ] Sección 1-12 completas sin marcadores "TODO" o "Por definir" en contenido crítico
- [ ] Tablas: todas las tablas tienen al menos 3 filas de contenido real (no placeholders)
- [ ] Anexos: mínimo 5 anexos (Variables, FSM, Assets, Colisiones, Criterios)
- [ ] Referencias: al menos 3 juegos de referencia documentados con aprendizajes

## 6. Casos mínimos de prueba (gameplay - playtesting conceptual)

Aunque el vertical slice está implementado, validar que la documentación lo refleje correctamente:

### 6.1 Movimiento

- [ ] Controles documentados (WASD/Flechas + Espacio)
- [ ] Velocidad de movimiento especificada (~200 px/s)
- [ ] Gravedad y jump_velocity especificados (-400 impulso, 980 gravedad)
- [ ] Animaciones: idle, run, jump, fall documentadas con triggers

### 6.2 Recolección

- [ ] Número de monedas requeridas: 6
- [ ] Feedback descrito: SFX + desaparición + contador actualizado
- [ ] Condición de victoria: mostrar menú al recolectar 6 monedas

### 6.3 Cronómetro

- [ ] Tiempo inicial: 30 segundos
- [ ] Comportamiento al llegar a 0: reinicio automático si < 6 monedas
- [ ] UI del cronómetro: posición (esquina superior derecha) y formato (⏱️ 0:23)

### 6.4 Condiciones de Victoria/Derrota

- [ ] Victoria: 6 monedas → menú con opciones "Reintentar" y "Salir"
- [ ] Derrota: tiempo = 0 con < 6 monedas → reinicio automático
- [ ] Caída fuera del nivel: detección con ZonaCaida → reinicio

## 7. Checklist de Calidad de UI/UX

- [ ] HUD: contador de monedas visible en esquina superior izquierda
- [ ] HUD: cronómetro visible en esquina superior derecha
- [ ] Menú Victoria: tiene título claro y 2 botones funcionales
- [ ] Feedback: cada moneda recolectada produce SFX audible
- [ ] Legibilidad: texto de UI tiene outline/sombra para contraste

## 8. Checklist de Diagramas UML

- [ ] Diagrama de Casos de Uso: mínimo 5 casos (Mover, Saltar, Recolectar, Ver Tiempo, Reiniciar)
- [ ] Diagrama de Clases: mínimo 6 clases (Player, Coin, UI, UI_Time, MenuVictoria, ZonaCaida)
- [ ] Diagrama FSM: 4 estados del jugador con transiciones claras
- [ ] Diagrama Conceptual: muestra relación entre componentes principales
- [ ] Todos los diagramas: exportados a PNG y accesibles desde README

## 9. Evidencia requerida para cerrar un bug

- Captura o enlace al documento corregido.
- Nota de verificación (quién valida y cuándo).
- Estado actualizado en el tablero y referencia al ID del bug.

## 10. Métricas de Calidad

**Objetivo**: documentación sin issues críticos antes de entrega.

| Métrica                          | Target   | Cómo medirla                                   |
| -------------------------------- | -------- | ---------------------------------------------- |
| Consistencia entre docs          | 100%     | Checklist 5.3 completo sin issues              |
| Completitud del GDD              | 100%     | Checklist 5.4 completo sin secciones vacías    |
| Diagramas UML exportados         | 100%     | 4/4 diagramas en formato PNG accesibles        |
| Bugs críticos abiertos           | 0        | Ningún bug de severidad "Bloqueante" o "Alta"  |
| Typos en documentos principales  | < 5      | Revisión de GDD, Arquitectura, README          |

## 11. Ejemplo de Bug Report

**ID**: BUG-001  
**Título**: Inconsistencia en número de monedas entre GDD y README  
**Severidad**: Media  
**Prioridad**: P2  
**Entorno**: GDD v2.0, README v1.0  
**Descripción**: El GDD menciona 6 monedas requeridas, pero el README dice "recolectar monedas" sin especificar número.  
**Resultado esperado**: Ambos documentos deben decir "6 monedas".  
**Resultado observado**: README no especifica número exacto.  
**Evidencia**: Captura de ambas secciones.  
**Estado**: Done  
**Responsable**: Ariel Amaguaña  
**Fecha de detección**: 2026-01-30  
**Fecha de cierre**: 2026-01-30  
**Notas de validación**: Corregido en README línea 45, verificado por autores.

---

## 12. Protocolo de Revisión Final (Pre-Entrega)

Antes de marcar el proyecto como "Done", ejecutar este checklist completo:

### 12.1 Documentos Principales

- [ ] README.md: completo, enlaces funcionales, sin typos
- [ ] GDD: versión 2.0, changelog actualizado, 12 secciones completas
- [ ] Arquitectura: componentes, patrones y diagramas de flujo presentes
- [ ] Planificación: épicas, user stories y estimaciones completas
- [ ] Roadmap: 6 sprints definidos con DoD claro
- [ ] QA Testing: checklist y plantilla de bugs presentes

### 12.2 Assets y Recursos

- [ ] Moodboard: completo con referencias visuales
- [ ] Wireframes: 2 wireframes (HUD, Menú Victoria) con anotaciones
- [ ] Audio Guide: lista de SFX y BGM especificados
- [ ] Diagramas UML: 4 diagramas exportados y accesibles

### 12.3 Estructura del Repositorio

- [ ] Carpeta /Proyecto con subcarpetas organizadas
- [ ] Carpeta /UML con /Codigo (puml) y /img (png)
- [ ] README principal en raíz del repositorio
- [ ] Backup del GDD anterior (Game_Design_Document_backup.md)

### 12.4 Validación Cruzada

- [ ] Todos los componentes mencionados en GDD están en Arquitectura
- [ ] Todos los sistemas en GDD tienen especificación técnica
- [ ] Todas las user stories en Planificación tienen estimación
- [ ] Todos los enlaces en README apuntan a archivos existentes

---

## 13. Conclusión

Este protocolo de QA asegura:

- Documentación consistente y sin contradicciones
- Arquitectura técnica sólida y escalable
- Especificaciones claras para futura implementación
- Entregable profesional y evaluable sin ambigüedades

**Responsables de QA**: Ariel Amaguaña, Luis Caiza  
**Última revisión**: 30/01/2026
