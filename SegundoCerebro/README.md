---
tipo: sistema
proyecto: Segundo Cerebro
entrega: 2026-11-03
---

# 🧠 Segundo Cerebro — Obsidian + Ollama local

Proyecto escolar de Sistemas Operativos: base de conocimiento personal en Obsidian, potenciada por un LLM local (Ollama), documentando la correspondencia entre cada pieza construida y un concepto de SO (gestión de memoria, scheduling, concurrencia, interrupciones, kernel/userspace, I/O).

Problema real que resuelve: **gestión de tareas y pendientes personales** (hoy se pierden/desorganizan).

Es un proyecto **separado** de `MacroagenteMAF-MCP-` (RFC AI Gen), pero **reusa su infraestructura de Ollama**: el modelo `mistral-nemo` ya descargado en el volumen Docker de ese proyecto, accedido en `http://localhost:11434` cuando el contenedor `ollama_service` está levantado.

## Estructura del vault

```
SegundoCerebro/
├── 00-Bandeja-Entrada/       # I/O de entrada: pendientes nuevos, sin clasificar
├── 01-En-Proceso/            # "RAM": pendientes activos ahora mismo
├── 02-Cola-Pendientes/       # "cola de scheduling": pendientes esperando turno
├── 03-Completado-Archivo/    # "disco": pendientes resueltos, histórico
└── Sistema/
    ├── Templates/             # plantilla Templater para crear pendientes
    ├── Bitacora-Analogias.md  # tabla de analogías SO ↔ implementación
    └── Definicion-Problema.md # reflexión personal (sección 4 de la rúbrica)
```

Cada carpeta numerada tiene su propio `README.md` explicando su analogía con un concepto de SO — abrilos desde Obsidian.

## Fase 1 — Instalar Obsidian

El AppImage ya está descargado en `~/Descargas/Otros Doc/Obsidian-1.13.7.AppImage`. Correr, en la máquina local (no en este entorno remoto):

```bash
./scripts/instalar-obsidian.sh
```

Esto da permisos de ejecución y muestra el comando para abrir Obsidian manualmente. Al abrir, elegir *"Open folder as vault"* y seleccionar esta carpeta (`SegundoCerebro/`).

## Fase 2 — Estructura del vault

Ya creada en este repo (ver árbol arriba). No requiere pasos adicionales.

## Fase 3 — Levantar Ollama (reusando RFC AI Gen)

Correr, en la máquina local, con Docker disponible:

```bash
./scripts/levantar-ollama.sh
```

Esto levanta **solo** el contenedor `ollama_service` de `MacroagenteMAF-MCP-/docker-compose.yml` (no todo el stack — Postgres/MCP/Open WebUI no hacen falta) y verifica que `mistral-nemo` aparezca listado en `http://localhost:11434/api/tags`.

## Fase 4 — Plugins de Obsidian (Nivel 2)

Desde *Configuración → Plugins de la comunidad*, con "Restringir modo seguro" desactivado, instalar:

1. **Templater** — apuntar la carpeta de plantillas a `Sistema/Templates`. Usar `Plantilla-Pendiente.md` para crear pendientes con estructura fija (estado, prioridad, fecha, tags). Analogía: system call que crea un proceso con el mismo formato de PCB.
2. **Dataview** — habilitar consultas. La consulta ya está en `02-Cola-Pendientes/Consulta-Cola-Pendientes.md`. Analogía: el scheduler mostrando la cola de listos.
3. **Local GPT** — conectar a `http://localhost:11434`, modelo `mistral-nemo`. Usar los comandos sobre el pendiente seleccionado para resumir y sugerir etiquetas.
   - *Opcional (stretch)*: **Smart Connections** (mismo Ollama) para sugerir enlaces entre pendientes relacionados vía embeddings — fuera del alcance de la primera entrega.

## Fase 5 — Deliverables de la tarea

- **Definición del problema**: `Sistema/Definicion-Problema.md` — completar las 3 preguntas (reflexión personal).
- **Bitácora de analogías**: `Sistema/Bitacora-Analogias.md` — tabla ya prellenada; completar la sección "cómo funciona" / "en qué se aleja" de cada fila después de usar el sistema unos días.

## Verificación (checklist para la demo final)

- [ ] `curl -s http://localhost:11434/api/tags` devuelve `mistral-nemo` en la lista.
- [ ] Obsidian abre el vault `SegundoCerebro` sin errores, muestra las 4 carpetas numeradas.
- [ ] Local GPT conectado: seleccionar texto de una nota de prueba en `00-Bandeja-Entrada/`, correr el comando de resumen, confirmar que responde usando `mistral-nemo` (verificar en `docker logs ollama_service` que llega la petición).
- [ ] Dataview: crear 2-3 notas de prueba con distinto `estado`, confirmar que la consulta en `02-Cola-Pendientes/` las lista correctamente filtradas.
- [ ] Crear un pendiente **real** (no de prueba) de principio a fin: Bandeja → clasificar → procesar → archivar — la rúbrica exige no usar datos de prueba en la demo final.
