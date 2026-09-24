---
tipo: sistema
carpeta: 00-Bandeja-Entrada
---

# 📥 Bandeja de Entrada

## Propósito

Cualquier pendiente nuevo entra **aquí primero**, sin clasificar. No se decide todavía si es urgente, si va a `01-En-Proceso` o si espera en `02-Cola-Pendientes`.

## Analogía con Sistemas Operativos: Interrupciones

Crear una nota nueva en esta carpeta es equivalente a que el hardware dispare una **interrupción**: algo externo (una idea, un mensaje, una tarea que surge) exige la atención del sistema *ahora*, fuera del flujo normal de ejecución.

- El **manejador de interrupción** (Diego revisando la bandeja, o más adelante una plantilla Templater) decide qué hacer con esa señal: clasificarla, etiquetarla, y moverla a la cola correspondiente.
- Mientras la nota vive aquí sin clasificar, es análogo a una interrupción **pendiente de atender** (todavía no se ejecutó su rutina de manejo).

## Flujo esperado

1. Nota nueva llega aquí (manual, o vía plantilla `Sistema/Templates/Plantilla-Pendiente.md`).
2. Se clasifica: prioridad, estado, tags.
3. Se mueve a `01-En-Proceso/` (si se va a trabajar ya) o a `02-Cola-Pendientes/` (si espera turno).
