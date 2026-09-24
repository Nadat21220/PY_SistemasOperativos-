# 📦 Distribución de Segundo Cerebro

Para compartir este proyecto con otros o descargarlo en otra máquina.

---

## 📥 Opción 1: Descargar como ZIP

1. Ve al repositorio en GitHub (si está publicado)
2. Haz clic en **"Code"** → **"Download ZIP"**
3. Extrae la carpeta donde quieras
4. Abre terminal en esa carpeta
5. Ejecuta: `./SETUP.sh`

---

## 🔄 Opción 2: Clonar con Git

```bash
git clone https://github.com/usuario/SegundoCerebro.git
cd SegundoCerebro
./SETUP.sh
```

---

## 🚀 Opción 3: Portable (USB o disco externo)

1. Copia toda la carpeta `SegundoCerebro/` a tu USB/disco externo
2. En la otra máquina:
   ```bash
   cd /ruta/al/usb/SegundoCerebro
   ./SETUP.sh
   ```
   
**Ventaja:** Llevas todo contigo (vault + config + script)

---

## ✅ Checklist para Distribuir

Antes de compartir, verifica que:

- [ ] Carpetas 00-04 existen y tienen archivos de ejemplo
- [ ] `docker-compose.yml` está presente
- [ ] `SETUP.sh` es ejecutable (`chmod +x SETUP.sh`)
- [ ] `INSTALACION.md` tiene instrucciones claras
- [ ] No hay archivos sensibles (contraseñas, API keys)
- [ ] `.gitignore` excluye `.obsidian/` y archivos temporales

---

## 📋 Contenido Mínimo para Distribuir

```
SegundoCerebro/
├── 00-Bandeja-Entrada/
├── 01-En-Proceso/
├── 02-Cola-Pendientes/
├── 03-Completado-Archivo/
├── Sistema/
│   ├── Templates/Pendiente.md
│   ├── Bitacora-Analogias.md
│   └── Definicion-Problema.md
├── docker-compose.yml
├── SETUP.sh
├── INSTALACION.md
├── DISTRIBUCION.md
├── README.md
└── .gitignore
```

---

## 🔧 Para usuarios que ya tienen Docker corriendo

Si el usuario ya tiene Docker con otros servicios corriendo:

1. Este proyecto usa puerto **11434** (Ollama)
2. Si quiere usar puerto diferente, edita `docker-compose.yml`:
   ```yaml
   ports:
     - "11435:11434"  # Cambio a 11435 (externo)
   ```
3. Luego configura Local GPT con la URL correcta

---

## 📞 Soporte

Si algo no funciona:

1. Verifica que Docker está corriendo: `docker ps`
2. Revisa logs: `docker compose logs ollama`
3. Reinicia: `docker compose down && docker compose up -d ollama`
4. Consulta `INSTALACION.md` sección "Solución de Problemas"

