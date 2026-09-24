#!/usr/bin/env bash
# Fase 1 del plan "Segundo Cerebro": dar permisos de ejecución al AppImage de Obsidian.
# Correr en la máquina local de Diego (no en un contenedor/entorno remoto).
set -euo pipefail

APPIMAGE="$HOME/Descargas/Otros Doc/Obsidian-1.13.7.AppImage"

if [ ! -f "$APPIMAGE" ]; then
  echo "No se encontró el AppImage en: $APPIMAGE" >&2
  echo "Ajustá la ruta en este script si se movió el archivo." >&2
  exit 1
fi

chmod +x "$APPIMAGE"
echo "Permisos de ejecución otorgados."
echo
echo "Para abrir Obsidian y crear/abrir el vault, correr manualmente:"
echo "  \"$APPIMAGE\""
echo
echo "Al abrir Obsidian, elegir 'Open folder as vault' y seleccionar la carpeta:"
echo "  $(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/SegundoCerebro"
