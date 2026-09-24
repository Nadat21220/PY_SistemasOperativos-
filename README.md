# 🧠 Segundo Cerebro — Tu Sistema de Gestión de Tareas & Pendientes

**Proyecto escolar:** Simular conceptos de Sistemas Operativos usando una base de conocimiento personal (Obsidian + IA local).

**Entrega:** 3 de noviembre de 2026

---

## 📁 Estructura del Vault

```
SegundoCerebro/
├── 00-Bandeja-Entrada/       # 📥 I/O: nuevos pendientes sin procesar
├── 01-En-Proceso/            # ⚙️  RAM: tareas que estás haciendo AHORA
├── 02-Cola-Pendientes/       # 📋 Scheduler: tareas esperando turno
├── 03-Completado-Archivo/    # 💾 Disco: historial de tareas completadas
└── Sistema/
    ├── Templates/
    │   └── Pendiente.md       # Plantilla para crear tareas (Templater)
    ├── Definicion-Problema.md # Tu reflexión personal (DEBES COMPLETAR)
    ├── Bitacora-Analogias.md  # Análisis SO ↔ tu sistema (DEBES COMPLETAR)
    └── README.md              # Este archivo
```

---

## 🚀 Primeros Pasos (ANTES DE NADA)

### 1. Llenar tu definición del problema (OBLIGATORIO)
Abre `Sistema/Definicion-Problema.md` y responde las 3 preguntas en tu propio contexto. Esto define el alcance de tu proyecto y es lo que la rúbrica evalúa primero.

### 2. Ejecutar Obsidian
```bash
~/Descargas/Otros\ Doc/Obsidian-1.13.7.AppImage
```
- Cuando abra la primera vez, selecciona "Open vault from folder"
- Navega a `~/Documentos/SegundoCerebro/` y confirma
- Obsidian creará un archivo `.obsidian/` (config local del vault)

### 3. Levantar Ollama (OBLIGATORIO para Local GPT)
```bash
cd ~/Documentos/Repositorios/MacroagenteMAF-MCP-
docker compose up -d ollama_service
curl -s http://localhost:11434/api/tags | grep mistral-nemo
```
Confirma que `mistral-nemo` aparece en la lista — es el modelo que Local GPT va a usar.

---

## 🔌 Instalar Plugins en Obsidian (NIVEL 2)

**Dentro de Obsidian:**

1. **Templater**
   - Configuración → Plugins de la comunidad
   - Busca "Templater"
   - Instala y activa
   - En configuración, marca "Folder for templates" → `Sistema/Templates/`
   - Ahora puedes crear pendientes con `Ctrl+Shift+I` → seleccionar `Pendiente.md`

2. **Dataview**
   - Plugins de la comunidad → "Dataview"
   - Instala y activa
   - Ahora las consultas en `02-Cola-Pendientes/INDEX-Cola-Pendientes.md` funcionarán

3. **Local GPT** (IA local integrada)
   - Plugins de la comunidad → "Local GPT"
   - Instala y activa
   - En configuración:
     - API URL: `http://localhost:11434`
     - Modelo: `mistral-nemo`
   - Ahora puedes seleccionar texto en cualquier nota y usar Ctrl+Shift+L → "Summarize" o "Extract Tags"

---

## 📝 Flujo de Uso Diario

### Mañana: Revisar la cola
1. Abre `02-Cola-Pendientes/INDEX-Cola-Pendientes.md`
2. Ve el Dataview: lista todas tus tareas por prioridad
3. Elige una para comenzar → muévela a `01-En-Proceso/`

### Durante el día: Procesar entradas
1. Algo urgente llega → crea una nota rápida en `00-Bandeja-Entrada/`
2. Cuando tengas tiempo, clasifícala:
   - **Ahora** → `01-En-Proceso/`
   - **Después** → `02-Cola-Pendientes/`

### Procesar una tarea
1. Abre la nota en `01-En-Proceso/`
2. **(Opcional)** Usa Local GPT: selecciona la descripción, `Ctrl+Shift+L` → "Summarize"
3. Completa los checkbox `- [ ]` de pasos
4. Cuando termines → mueve la nota a `03-Completado-Archivo/`

### Fin de semana: Reflexión
Abre `Sistema/Bitacora-Analogias.md` y añade tus observaciones en cada sección. ¿Cómo cada concepto de SO se manifestó en tu uso real?

---

## 🎯 Entregas de la Tarea

### Entrada 1: Definición del Problema
**Archivo:** `Sistema/Definicion-Problema.md`
**Estado:** 📝 DEBES COMPLETAR AHORA (media página, tus propias palabras)

### Entrada 2: Sistema Funcional
**Carpetas:** Todo lo que ves arriba, estructurado y funcionando con plugins
**Estado:** ✅ LISTO (carpetas creadas, plugins por instalar desde Obsidian)

### Entrada 3: Bitácora de Analogías
**Archivo:** `Sistema/Bitacora-Analogias.md`
**Estado:** 📝 DEBES COMPLETAR CONFORME USES (después de 1-2 semanas de uso real)
- Llena cada sección explicando cómo viviste ese concepto
- La sección final es la más importante para la nota (40% de la rúbrica)

### Entrada 4: Demostración en Clase
**Qué traes:** Tu vault con datos REALES (no de prueba)
- Muestra la cola de pendientes con tus tareas reales
- Usa Local GPT en vivo para resumir algo
- Explica una conexión que viste entre dos ideas (wikilinks)

---

## 📊 Rúbrica de Evaluación

| Criterio | % | Cómo lo verán |
|---|---|---|
| **Fidelidad conceptual** | 40% | Bitácora: ¿explicaste realmente cómo cada concepto SO aparece en tu sistema? |
| **Funcionalidad del sistema** | 30% | ¿Obsidian + Dataview + Local GPT funciona sin errores? ¿usas tareas reales? |
| **Resolución del problema real** | 30% | ¿El sistema resuelve el problema que escribiste en Definición? |

---

## ⚙️ Troubleshooting Rápido

### Local GPT dice "Connection refused"
- Verifica que Ollama esté corriendo: `curl http://localhost:11434/api/tags`
- Si no → `docker compose up -d ollama_service` en tu proyecto RFC

### Dataview no muestra mis tareas
- Verifica que las notas estén EN las carpetas (no solo en subcarpetas)
- Abre `02-Cola-Pendientes/INDEX-Cola-Pendientes.md` e intenta editar la consulta manualmente

### Obsidian se abre pero no ve el vault
- Cuando Obsidian inicie, busca "Open vault from folder"
- Selecciona `~/Documentos/SegundoCerebro/`

---

## 🎓 Reflexión Final

Este proyecto te pide que veas conceptos de SO no como teoría, sino como realidad en tu propio sistema. **La sección más importante es la Bitácora**, cuando después de usar el sistema durante 3-4 semanas, describas con sinceridad cómo se manifestó cada concepto.

**Buena suerte — ¡y que sea útil no solo para la nota, sino para tu vida! 🧠**
