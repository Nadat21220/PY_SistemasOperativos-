#!/usr/bin/env bash
# Fase 3 del plan "Segundo Cerebro": levantar solo el contenedor de Ollama
# (reusando la infraestructura de MacroagenteMAF-MCP-/RFC AI Gen), sin
# levantar el resto del stack (Postgres/MCP/Open WebUI).
# Correr en la máquina local de Diego, con Docker instalado.
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
COMPOSE_DIR="$REPO_ROOT/MacroagenteMAF-MCP-"

if [ ! -f "$COMPOSE_DIR/docker-compose.yml" ]; then
  echo "No se encontró docker-compose.yml en: $COMPOSE_DIR" >&2
  exit 1
fi

cd "$COMPOSE_DIR"
docker compose up -d ollama

echo "Esperando a que el servicio de Ollama responda..."
for i in $(seq 1 15); do
  if curl -sf http://localhost:11434/api/tags >/dev/null 2>&1; then
    break
  fi
  sleep 2
done

echo
echo "Modelos disponibles en Ollama:"
curl -s http://localhost:11434/api/tags
