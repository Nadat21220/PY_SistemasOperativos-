---
tipo: sistema
entrega: 2026-11-03
---

# 📖 Bitácora de Analogías — Segundo Cerebro ↔ Sistemas Operativos

Tabla base de correspondencias entre este sistema (vault de Obsidian + Ollama local) y conceptos de Sistemas Operativos, aplicada al problema concreto que resuelve: **gestión de tareas y pendientes personales**.

Cada fila tiene una sección abajo para completar después de usar el sistema unos días: **cómo funciona en la práctica** y **en qué se aleja del concepto real** (honestidad sobre los límites de la analogía es parte de la evaluación).

## Tabla de correspondencias

| Concepto SO | Implementación concreta |
|---|---|
| Sistema de archivos / inodos | El vault: carpetas por estado del pendiente + wikilinks `[[ ]]` conectando tareas relacionadas |
| Memoria (RAM vs disco) | `01-En-Proceso/` (pendientes activos, "cargados en memoria") vs `03-Completado-Archivo/` (histórico, "en disco") |
| Planificación de procesos | `02-Cola-Pendientes/` + consulta Dataview que lista pendientes por prioridad/estado — una "cola de listos" visualizada |
| Concurrencia | Uso simultáneo del Segundo Cerebro y RFC AI Gen: ambos comparten la misma GPU/VRAM y el mismo proceso de Ollama — concurrencia real, medible con `nvidia-smi` |
| Interrupciones | Nueva nota en `00-Bandeja-Entrada/` dispara clasificación/etiquetado (manual al inicio, luego vía plantilla Templater) |
| Gestión de recursos | RAM/VRAM que consume Ollama al correr localmente |
| Kernel vs espacio de usuario | Ollama = kernel (procesa peticiones de IA); Obsidian = espacio de usuario (interfaz) |

---

## Desarrollo por fila

### 1. Sistema de archivos / inodos

**Cómo funciona en la práctica:**
>
> _(completar después de usar el sistema)_

**En qué se aleja del concepto real:**
>
> _(ej: un inodo real no tiene contenido semántico — un wikilink sí conecta información relacionada, no solo ubicación en disco)_

---

### 2. Memoria (RAM vs disco)

**Cómo funciona en la práctica:**
>

**En qué se aleja del concepto real:**
>
> _(ej: mover una nota entre carpetas es una decisión manual y consciente; el SO decide qué swappear de forma automática y transparente al usuario)_

---

### 3. Planificación de procesos

**Cómo funciona en la práctica:**
>

**En qué se aleja del concepto real:**
>
> _(ej: aquí la "política de scheduling" la define la consulta Dataview de forma estática; un scheduler real re-evalúa dinámicamente en cada quantum)_

---

### 4. Concurrencia

**Cómo funciona en la práctica:**
>
> _(registrar aquí una medición real con `nvidia-smi` mientras Segundo Cerebro y RFC AI Gen usan Ollama al mismo tiempo)_

**En qué se aleja del concepto real:**
>

---

### 5. Interrupciones

**Cómo funciona en la práctica:**
>

**En qué se aleja del concepto real:**
>
> _(ej: una interrupción de hardware se atiende en microsegundos y de forma forzosa; aquí depende de que Diego revise la bandeja)_

---

### 6. Gestión de recursos

**Cómo funciona en la práctica:**
>

**En qué se aleja del concepto real:**
>

---

### 7. Kernel vs espacio de usuario

**Cómo funciona en la práctica:**
>

**En qué se aleja del concepto real:**
>
> _(ej: no hay una frontera protegida por hardware entre Obsidian y Ollama como la que separa kernel/userspace real — es una separación lógica por proceso, no por privilegios de CPU)_
