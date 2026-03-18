#!/bin/bash

# Script para levantar Keycloak con Docker
# Uso: ./start-keycloak.sh

echo "🚀 Iniciando Keycloak con Docker..."
echo ""

# Verificar si Docker está instalado
if ! command -v docker &> /dev/null; then
    echo "❌ Error: Docker no está instalado"
    echo "Por favor, instala Docker desde https://www.docker.com/"
    exit 1
fi

# Verificar si Docker Compose está instalado
if ! command -v docker-compose &> /dev/null; then
    echo "❌ Error: Docker Compose no está instalado"
    echo "Por favor, instala Docker Compose"
    exit 1
fi

# Levantar los contenedores
echo "📦 Levantando contenedores..."
docker-compose up -d

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Keycloak se está iniciando..."
    echo ""
    echo "⏳ Espera unos segundos para que Keycloak termine de inicializar"
    echo ""
    echo "📊 Para ver los logs:"
    echo "   docker-compose logs -f keycloak"
    echo ""
    echo "🌐 Accede a Keycloak en:"
    echo "   http://localhost:8080"
    echo ""
    echo "👤 Credenciales de administrador:"
    echo "   Usuario: admin"
    echo "   Contraseña: admin"
    echo ""
    echo "🛑 Para detener Keycloak:"
    echo "   docker-compose down"
    echo ""
    echo "📖 Para más información, consulta KEYCLOAK_SETUP.md"
else
    echo ""
    echo "❌ Error al levantar los contenedores"
    exit 1
fi
