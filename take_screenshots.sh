#!/bin/bash

# Script para tomar screenshots de KubaTodo para App Store

echo "📸 Generando screenshots de KubaTodo para App Store..."
echo ""

# Directorio para guardar screenshots
SCREENSHOT_DIR="screenshots"
mkdir -p "$SCREENSHOT_DIR"

# Función para tomar screenshot
take_screenshot() {
    local device_id=$1
    local device_name=$2
    local screenshot_num=$3
    
    echo "📱 Tomando screenshot $screenshot_num en $device_name..."
    xcrun simctl io "$device_id" screenshot "$SCREENSHOT_DIR/${device_name// /_}_screenshot_${screenshot_num}.png"
    sleep 2
}

# Device IDs (actualizar según tus dispositivos)
IPHONE_15_PRO_MAX="6E0D9B54-1713-45E9-A2F7-71C7AB3310D0"
IPHONE_15_PLUS="04460858-A99D-44D4-A6D8-F90090626A0F"

echo "⏳ Esperando 5 segundos para que la app esté lista..."
sleep 5

# Tomar screenshots en iPhone 15 Pro Max (6.7")
echo ""
echo "📱 iPhone 15 Pro Max (1290x2796)..."
take_screenshot "$IPHONE_15_PRO_MAX" "iPhone_15_Pro_Max" "1"
echo "  → Añade algunas tareas en la app ahora"
sleep 5
take_screenshot "$IPHONE_15_PRO_MAX" "iPhone_15_Pro_Max" "2"
sleep 3
take_screenshot "$IPHONE_15_PRO_MAX" "iPhone_15_Pro_Max" "3"

echo ""
echo "✅ Screenshots guardados en: $SCREENSHOT_DIR/"
echo ""
echo "📋 Tamaños generados:"
echo "   • iPhone 15 Pro Max: 1290x2796 (6.7\")"
echo ""
echo "🎨 Próximos pasos:"
echo "   1. Revisa los screenshots en la carpeta '$SCREENSHOT_DIR'"
echo "   2. Sube los mejores a App Store Connect"
echo "   3. Necesitas mínimo 3 screenshots por dispositivo"
echo ""
