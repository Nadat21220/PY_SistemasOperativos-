---
tipo: sistema
carpeta: 02-Cola-Pendientes
---

# 🕓 Cola de Pendientes

## Propósito

Pendientes clasificados que **esperan su turno** — no están activos ahora mismo (`01-En-Proceso`), pero ya salieron de la bandeja sin clasificar.

## Analogía con Sistemas Operativos: Planificación de procesos (scheduling)

Esta carpeta + la consulta de abajo son literalmente una **cola de listos (ready queue)**: procesos (pendientes) que están listos para ejecutarse pero esperan a que el scheduler (Diego) les asigne el CPU (su tiempo y atención).

La consulta Dataview de abajo cumple el rol del **scheduler**: decide el orden de atención según una política (aquí: prioridad, luego antigüedad — similar a una política *priority scheduling* con desempate FIFO, que evita la inanición (*starvation*) de los pendientes de baja prioridad que llevan mucho tiempo esperando).

## Consulta (requiere el plugin Dataview activo)

```dataview
TABLE estado AS "Estado", prioridad AS "Prioridad", fecha_creacion AS "Creado"
FROM "01-En-Proceso" OR "02-Cola-Pendientes"
WHERE estado != "completado" AND file.name != "Consulta-Cola-Pendientes"
SORT prioridad DESC, fecha_creacion ASC
```

> Requiere que cada nota de pendiente tenga frontmatter con `estado`, `prioridad` y `fecha_creacion` — ver `Sistema/Templates/Plantilla-Pendiente.md`.
