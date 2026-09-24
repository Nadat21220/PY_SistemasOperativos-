# 📋 Cola de Pendientes — Scheduler de Tareas

Este archivo contiene una consulta **Dataview** que lista automáticamente todos tus pendientes según su estado y prioridad. Es el equivalente de ver la "cola de listos" en un SO.

---

## Pendientes Activos (En Proceso)

```dataview
TABLE WITHOUT ID
link(file.name, file.path) as "Tarea",
Prioridad as "Prioridad",
Estado as "Estado"
WHERE file.folder = "01-En-Proceso"
SORT Prioridad DESC, file.mtime DESC
```

*Haz doble clic en el nombre de la tarea para abrirla y ver los pasos*

---

## Pendientes en Cola (Esperando Turno)

```dataview
TABLE WITHOUT ID
link(file.name, file.path) as "Tarea",
Prioridad as "Prioridad",
Estado as "Estado"
WHERE file.folder = "02-Cola-Pendientes"
SORT Prioridad DESC
```

*Haz doble clic en el nombre de la tarea para abrirla y ver los pasos*

---

## Resumen por Prioridad (Activos + Cola)

```dataview
TABLE WITHOUT ID
Prioridad as "Prioridad",
link(file.name, file.path) as "Nombre",
Estado as "Estado",
FechaEntrega as "Fecha Entrega"
FROM "01-En-Proceso" OR "02-Cola-Pendientes"
WHERE file.name != "INDEX-Cola-Pendientes"
SORT Prioridad DESC
```

---

## Consejos de uso:

1. **Crea un nuevo pendiente:** desde `00-Bandeja-Entrada/`, usa la plantilla `Pendiente.md` del Sistema
2. **Procesa la bandeja:** cada vez que algo llegue a `00-Bandeja-Entrada/`, clasifícalo:
   - Si es AHORA → `01-En-Proceso/`
   - Si es DESPUÉS → `02-Cola-Pendientes/`
3. **Consulta esta página:** cada mañana, mira la cola. Es tu scheduler mostrándote qué hacer primero
4. **Cierra tareas:** muévelas a `03-Completado-Archivo/` cuando termines
