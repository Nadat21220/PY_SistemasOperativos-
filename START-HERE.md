# 🧠 Segundo Cerebro — ¡Comienza Aquí!

Tu sistema personal de gestión de tareas con **IA local** (sin internet requerido).

---

## ¿Qué es esto?

Un vault de **Obsidian** con:
- ✅ Sistema automático de tareas (scheduler visual)
- ✅ IA local integrada (resume, etiqueta, conecta ideas)
- ✅ Sin dependencias en la nube
- ✅ 100% privado y portable

---

## 🚀 Instala en 2 minutos

### 1️⃣ Asegúrate de tener Docker

```bash
docker --version
```

Si no lo tienes: https://docker.com/get-started

### 2️⃣ Ejecuta el setup automático

```bash
./SETUP.sh
```

(Si estás en Windows, usa **Git Bash** o **WSL2**)

### 3️⃣ Abre Obsidian

Descarga desde: https://obsidian.md

Luego:
- "Open vault from folder"
- Selecciona esta carpeta
- ✅ ¡Listo!

---

## 📖 Primeros Pasos (5 minutos)

1. **Crea una tarea:**
   - Presiona `Ctrl+Shift+I`
   - Selecciona "Pendiente.md"
   - Llena los campos
   - Guarda en `00-Bandeja-Entrada/`

2. **Ve tu scheduler:**
   - Abre `02-Cola-Pendientes/INDEX-Cola-Pendientes.md`
   - Ves todas tus tareas por prioridad
   - Haz clic en una para abrirla

3. **Procesa tareas:**
   - Tarea importante ahora → mueve a `01-En-Proceso/`
   - Tarea para después → mueve a `02-Cola-Pendientes/`
   - ¡Terminada! → mueve a `03-Completado-Archivo/`

---

## 🤖 Usa IA Local

Dentro de una tarea:
1. Selecciona texto
2. Presiona `Ctrl+Shift+L`
3. Elige "Summarize"
4. ✨ IA lo resume automáticamente

**¡Sin internet, sin datos en la nube, 100% privado!**

---

## 📚 Documentos Completos

Después de los primeros pasos, lee:

- **INSTALACION.md** — Guía técnica completa
- **DISTRIBUCION.md** — Cómo compartir/descargar
- **README.md** — Info del proyecto escolar

---

## 🆘 Si algo falla

**"Docker no funciona"**
```bash
docker compose ps
docker compose logs ollama
```

**"Obsidian no ve los plugins"**
- Configuración → Plugins de comunidad → Desactiva "Modo seguro"
- Reinicia Obsidian

**"Local GPT dice error"**
- Verifica: `curl http://localhost:11434/api/tags`
- Si falla: `docker compose up -d ollama`

---

## 💡 Ideas para usar esto

- 📚 Organizar apuntes de clases
- ✅ Gestionar tareas y proyectos
- 🔗 Conectar ideas relacionadas (wikilinks)
- 📝 Bitácora personal con IA
- 🎓 Proyecto escolar (SO concepts)

---

## 🎯 Siguientes pasos

1. Crea 3-5 tareas reales (no de prueba)
2. Muévelas entre carpetas conforme progresan
3. Prueba Local GPT en una descripción
4. Después de 1-2 semanas, documenta qué aprendiste

---

**¿Listo? ¡Abre Obsidian y crea tu primer pendiente! 🚀**

---

*Proyecto escolar sobre conceptos de Sistemas Operativos*  
*Entrega: 3 de noviembre de 2026*
