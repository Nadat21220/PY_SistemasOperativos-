---
tipo: sistema
carpeta: 03-Completado-Archivo
---

# 🗄️ Completado / Archivo

## Propósito

Histórico de pendientes ya resueltos. No se borran: quedan como registro consultable.

## Analogía con Sistemas Operativos: Disco (almacenamiento persistente)

Un pendiente que llega aquí es como un dato que se **escribe a disco**: deja de ocupar el recurso "caro" y de acceso inmediato (RAM / `01-En-Proceso`), pero no desaparece — queda persistido para consulta futura, aunque el acceso sea más lento (hay que buscarlo explícitamente, no está "cargado" para uso inmediato).

- El costo de mover algo aquí es bajo (igual que escribir a disco es más lento que RAM pero no es la operación crítica).
- Sirve como respaldo/auditoría: si Diego necesita revisar "¿cuándo resolví X?", este archivo es la fuente de verdad.

## Regla práctica

Al mover una nota aquí, agregar la fecha de cierre en el frontmatter (`fecha_cierre`) para poder hacer consultas Dataview de histórico más adelante si se necesita.
