#!/bin/bash

echo "🧠 Segundo Cerebro — Setup Automático"
echo "======================================"
echo ""

MODEL="mistral-nemo"

modelo_listo() {
    curl -s http://localhost:11434/api/tags 2>/dev/null | grep -q "$MODEL"
}

# Caso 1: ya hay Ollama instalado de forma nativa en esta máquina
if command -v ollama &> /dev/null; then
    echo "✓ Ollama nativo detectado, se usará directamente (sin Docker)"

    if ! curl -s http://localhost:11434/api/tags > /dev/null 2>&1; then
        echo "Ollama no está corriendo, iniciando servicio..."
        ollama serve > /dev/null 2>&1 &
        sleep 3
    fi

    echo ""
    echo "Verificando modelo $MODEL..."
    if modelo_listo; then
        echo "✓ $MODEL ya existe"
    else
        echo "Descargando $MODEL (esto puede tardar 5-10 minutos)..."
        ollama pull "$MODEL"
    fi

# Caso 2: no hay Ollama nativo, se usa el contenedor Docker como respaldo
else
    echo "Ollama nativo no encontrado, se usará Docker como respaldo"

    if ! command -v docker &> /dev/null; then
        echo "❌ Ni Ollama ni Docker están instalados."
        echo "   Instala Ollama (https://ollama.com) o Docker (https://docker.com) y vuelve a correr este script."
        exit 1
    fi

    echo "✓ Docker detectado"
    echo ""
    echo "Levantando Ollama..."
    docker compose up -d ollama
    sleep 3

    echo "Verificando conexión a Ollama..."
    if curl -s http://localhost:11434/api/tags > /dev/null 2>&1; then
        echo "✓ Ollama está corriendo en http://localhost:11434"
    else
        echo "⚠️  Ollama está levantando, espera 10 segundos..."
        sleep 10
    fi

    echo ""
    echo "Verificando modelo $MODEL..."
    if modelo_listo; then
        echo "✓ $MODEL ya existe"
    else
        echo "Descargando $MODEL (esto puede tardar 5-10 minutos)..."
        docker compose exec -T ollama ollama pull "$MODEL"
    fi
fi

echo ""
echo "======================================"
echo "✓ Setup completado"
echo ""
echo "Próximos pasos:"
echo "1. Abre Obsidian y carga esta carpeta como vault"
echo "2. Los plugins ya están configurados (revisa INSTALACION.md)"
echo ""
echo "Si usaste Docker para Ollama:"
echo "  Detener: docker compose down"
echo "  Ver logs: docker compose logs ollama"
