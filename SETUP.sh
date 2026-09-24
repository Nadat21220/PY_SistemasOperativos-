#!/bin/bash

echo "🧠 Segundo Cerebro — Setup Automático"
echo "======================================"
echo ""

# Verificar Docker
if ! command -v docker &> /dev/null; then
    echo "❌ Docker no está instalado. Por favor instala Docker."
    exit 1
fi

echo "✓ Docker detectado"

# Levantar Ollama
echo ""
echo "Levantando Ollama..."
docker compose up -d ollama
sleep 3

# Verificar que Ollama responde
echo "Verificando conexión a Ollama..."
if curl -s http://localhost:11434/api/tags > /dev/null 2>&1; then
    echo "✓ Ollama está corriendo en http://localhost:11434"
else
    echo "⚠️  Ollama está levantando, espera 10 segundos..."
    sleep 10
fi

# Descargar modelo mistral-nemo si no existe
echo ""
echo "Verificando modelo mistral-nemo..."
if curl -s http://localhost:11434/api/tags | grep -q "mistral-nemo"; then
    echo "✓ mistral-nemo ya existe"
else
    echo "Descargando mistral-nemo (esto puede tardar 5-10 minutos)..."
    docker compose exec -T ollama ollama pull mistral-nemo
fi

echo ""
echo "======================================"
echo "✓ Setup completado"
echo ""
echo "Próximos pasos:"
echo "1. Abre Obsidian: ~/Descargas/Otros\ Doc/Obsidian-1.13.7.AppImage"
echo "2. Abre el vault desde esta carpeta"
echo "3. Los plugins ya están configurados"
echo ""
echo "Para detener Ollama: docker compose down"
echo "Para ver logs: docker compose logs ollama"
