# 🧠 Segundo Cerebro — Guía de Instalación

Tu sistema personal de gestión de tareas con IA local, basado en Obsidian + Ollama.

---

## 📋 Requisitos Previos

- **Ollama** (descarga desde https://ollama.com) **o** Docker (descarga desde https://www.docker.com/products/docker-desktop) — solo necesitas uno de los dos
- **Obsidian** (descarga desde https://obsidian.md) — O usa el AppImage si estás en Linux
- **4GB RAM mínimo** (recomendado 8GB)
- **2GB disco libre** para el modelo de IA

---

## 🚀 Instalación Rápida (3 pasos)

### Paso 1: Levantar Ollama (IA local)

```bash
cd /ruta/a/SegundoCerebro
chmod +x SETUP.sh   # solo si el script no viene marcado como ejecutable
./SETUP.sh
```

El script detecta automáticamente tu situación:
- ✅ Si ya tienes **Ollama instalado nativamente**, lo usa directamente y descarga el modelo ahí (sin tocar Docker)
- ✅ Si no tienes Ollama, usa **Docker** como respaldo y lo levanta en un contenedor
- ✅ Descarga el modelo `mistral-nemo` (5-10 minutos la primera vez)

### Paso 2: Abrir el Vault en Obsidian

1. Descarga **Obsidian** desde https://obsidian.md
2. Abre Obsidian → "Open vault from folder"
3. Selecciona esta carpeta (`SegundoCerebro/`)
4. ✅ Listo, tu vault está cargado

### Paso 3: Instalar Plugins (5 minutos)

Dentro de Obsidian, ve a **Configuración → Plugins de la comunidad** e instala:

1. **Templater** — Crea tareas estructuradas
   - Configuración → Carpeta de templates → `Sistema/Templates/`
2. **Dataview** — Muestra tareas por estado/prioridad
3. **Local GPT** — IA local para resumir/etiquetar
   - API URL: `http://localhost:11434`
   - Modelo: `mistral-nemo`

---

## 📖 Uso Diario

### 1. Crear una tarea

Dentro de Obsidian:
- Presiona **Ctrl+Shift+I** → selecciona `Pendiente.md`
- Rellena el título, descripción, prioridad
- Guarda en `00-Bandeja-Entrada/`

### 2. Ver tu scheduler

- Abre `02-Cola-Pendientes/INDEX-Cola-Pendientes.md`
- Ves todas tus tareas por prioridad
- Haz clic en una para abrirla

### 3. Procesar tareas

- Tarea que empiezas AHORA → muévela a `01-En-Proceso/`
- Tarea que espera → muévela a `02-Cola-Pendientes/`
- Tarea completada → muévela a `03-Completado-Archivo/`

### 4. Resumir con IA (opcional)

- Selecciona texto en una nota
- Presiona **Ctrl+Shift+L** → "Summarize"
- IA resume automáticamente

---

## 🛠️ Comandos Útiles

```bash
# Ver si Ollama está corriendo
docker compose ps

# Ver logs de Ollama
docker compose logs ollama

# Detener Ollama
docker compose down

# Reiniciar todo
docker compose up -d ollama
```

---

## 📁 Estructura del Proyecto

```
SegundoCerebro/
├── 00-Bandeja-Entrada/    ← Nuevas tareas (entrada)
├── 01-En-Proceso/         ← Tareas activas (ahora)
├── 02-Cola-Pendientes/    ← Tareas esperando (después)
├── 03-Completado-Archivo/ ← Tareas completadas (historial)
├── Sistema/
│   ├── Templates/         ← Plantillas Templater
│   ├── Bitacora-Analogias.md
│   ├── Definicion-Problema.md
│   └── README.md
├── docker-compose.yml     ← Ollama config
├── SETUP.sh              ← Script de instalación
└── INSTALACION.md        ← Este archivo
```

---

## 🐛 Solución de Problemas

### "Docker no detecta Ollama"
```bash
docker compose up -d ollama
sleep 5
curl http://localhost:11434/api/tags
```

### "Obsidian no ve los plugins"
- Configuración → Plugins de la comunidad → Desactiva "Modo seguro restricto"
- Reinicia Obsidian

### "Local GPT dice 'Connection refused'"
- Verifica: `curl http://localhost:11434/api/tags`
- Si no responde → `docker compose up -d ollama`

### "Modelo muy lento"
- Verifica RAM disponible: `free -h`
- Si < 4GB, considera usar modelo `mistral:7b` más ligero

---

## 📚 Más Información

- **Obsidian**: https://obsidian.md/
- **Dataview**: https://blacksmithgu.github.io/obsidian-dataview/
- **Ollama**: https://ollama.ai/
- **Templater**: https://silentvoid13.github.io/Templater/

---

**¡Dale! Tu segundo cerebro está listo para usar. Crea tu primera tarea y organiza tu vida.** 🚀
