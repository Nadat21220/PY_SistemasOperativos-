# ⚡ Próximos Pasos — Tu checklist de hoy

## Fase Inmediata (Hoy — 30 minutos)

- [x] Abre `Sistema/Definicion-Problema.md` y **completa las 3 preguntas** (es lo único que debes escribir tú ahora, el resto ya está armado)
- [x] Ejecuta Obsidian: `~/Descargas/Otros\ Doc/Obsidian-1.13.7.AppImage`
- [x] Cuando te pida, abre el vault desde `~/Documentos/SegundoCerebro/`
- [x] Verifica que ves las 4 carpetas (00, 01, 02, 03) y la carpeta Sistema

## Fase 2 (Hoy o mañana — 20 minutos)

- [ ] Levantar Ollama:
  ```bash
  cd ~/Documentos/Repositorios/MacroagenteMAF-MCP-
  docker compose up -d ollama_service
  ```
- [ ] Confirmar que responde:
  ```bash
  curl -s http://localhost:11434/api/tags | grep mistral-nemo
  ```

## Fase 3 (En Obsidian — 15 minutos por plugin)

Dentro de Obsidian, en orden:
1. **Templater** → Configuración → Plugins comunidad → Instala → Configura carpeta de templates
2. **Dataview** → Lo mismo
3. **Local GPT** → Lo mismo + configura URL `http://localhost:11434` y modelo `mistral-nemo`

## Fase 4 (La semana siguiente)

- Usa el sistema 5-7 días con pendientes reales
- Cada día: abre `02-Cola-Pendientes/INDEX-Cola-Pendientes.md` para ver tu "scheduler"
- Crea 3-5 pendientes reales en `00-Bandeja-Entrada/` y clasifícalos
- Prueba Local GPT: selecciona texto en una nota, `Ctrl+Shift+L`, "Summarize"

## Fase 5 (Después de 1-2 semanas de uso real)

- Abre `Sistema/Bitacora-Analogias.md`
- **Completa cada sección** explicando cómo experimentaste ese concepto de SO
- La sección "Reflexión Final" es la más importante (40% de tu nota)

---

## 📋 Resumen: Lo que ya está hecho vs. lo que debes hacer

| Qué                     | Estado      | Tu acción                             |
| ----------------------- | ----------- | ------------------------------------- |
| Estructura de carpetas  | ✅ Hecho     | Nada                                  |
| Plantilla de pendientes | ✅ Hecho     | Nada                                  |
| Consulta Dataview       | ✅ Hecho     | Probar cuando instales plugin         |
| Definición del problema | 📝 Templado | **LLENA AHORA**                       |
| Bitácora de analogías   | 📝 Templada | Llena conforme uses (2 semanas)       |
| Obsidian instalado      | ✅ Hecho     | Ejecuta el AppImage                   |
| Ollama corriendo        | ✅ Hecho     | `docker compose up -d ollama_service` |
| Plugins instalados      | ✅ Hecho     | Templater, Dataview, Local GPT        |

---

## 🎯 Meta Final

**3 de noviembre de 2026:** Presentas tu vault con:
- Pendientes reales (no de prueba)
- Conexiones entre ideas (wikilinks)
- Bitácora completa explicando los conceptos SO que viste en la práctica
- Conclusión personal sobre cuál concepto te sorprendió más

---

**¡Dale! Comienza por llenar tu Definición del Problema. Ese es el paso más importante ahora.**
