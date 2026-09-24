---
tipo: sistema
carpeta: 01-En-Proceso
---

# ⚙️ En Proceso

## Propósito

Pendientes **activos ahora mismo** — en los que Diego está trabajando o va a trabajar hoy/esta semana.

## Analogía con Sistemas Operativos: Memoria RAM

Un pendiente en esta carpeta es como un proceso **cargado en RAM**: está listo para ejecutarse en cualquier momento, con acceso inmediato, sin el costo de "traerlo desde disco" (buscarlo, recordar el contexto, retomarlo).

- Mantener pocas notas aquí = mantener el *working set* pequeño, evitando "thrashing" (saturarse de pendientes activos a la vez y no avanzar en ninguno).
- Cuando un pendiente se resuelve, se mueve a `03-Completado-Archivo/` ("se escribe a disco" — pasa a almacenamiento persistente/histórico).
- Cuando un pendiente pierde prioridad temporalmente, vuelve a `02-Cola-Pendientes/` ("se saca de RAM", swap-out).

## Regla práctica

Si esta carpeta empieza a acumular más de ~5-7 notas, es señal de que se está simulando "multitarea" que en realidad genera cambios de contexto constantes — mover lo que no se está tocando de verdad a la cola.
