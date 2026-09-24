---
tipo: sistema
carpeta: Sistema/Templates
---

# 🧩 Templates (Templater)

## Analogía con Sistemas Operativos: System call que crea un proceso (PCB)

Ejecutar `Plantilla-Pendiente.md` sobre una nota nueva es análogo a una **system call** que crea un proceso: siempre produce una estructura con el mismo formato fijo — un **PCB (Process Control Block)** — sin importar qué pendiente sea.

Los campos del frontmatter son, en esta analogía, los campos mínimos de un PCB:

| Campo frontmatter | Rol tipo PCB |
|---|---|
| `estado` | Estado del proceso: `pendiente` \| `en-proceso` \| `completado` |
| `prioridad` | Prioridad de scheduling: `alta` \| `media` \| `baja` |
| `fecha_creacion` | Momento de creación del proceso |
| `fecha_cierre` | Momento de terminación (se llena al archivar) |
| `tags` | Metadatos adicionales para clasificación |

## Cómo usarla

1. En Obsidian, con Templater instalado y configurado (carpeta de plantillas apuntando a `Sistema/Templates`), crear una nota nueva en `00-Bandeja-Entrada/`.
2. Insertar la plantilla `Plantilla-Pendiente` (comando Templater: *Insert Template*).
3. Completar `estado` y `prioridad`, mover la nota a la carpeta que corresponda.
