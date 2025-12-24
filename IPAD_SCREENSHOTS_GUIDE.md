# 📸 Guía Rápida - Screenshots para iPad 13"

## Situación Actual

✅ La app está ejecutándose en el iPad Pro 13" (simulador)

## Pasos para Tomar Screenshots

### 1. Preparar Contenido en la App

En el simulador iPad, añade tareas de ejemplo:
- ✅ Completar proyecto de trabajo
- ✅ Reunión con el equipo
- ⬜ Revisar correos importantes
- ⬜ Preparar presentación
- ⬜ Llamar al cliente
- ⬜ Hacer ejercicio
- ⬜ Comprar víveres
- ⬜ Leer documentación técnica
- ⬜ Actualizar portfolio

### 2. Tomar Screenshots

**En el Simulador de iPad**:
Presiona **⌘ + S** (Cmd + S) para capturar

**Screenshots necesarios**: Mínimo 3

#### Capturas Sugeridas:
1. **Screenshot 1**: Vista principal con lista de tareas (mix de completadas y pendientes)
2. **Screenshot 2**: Vista de tareas pendientes (más tareas visibles)
3. **Screenshot 3**: Vista de tareas completadas
4. **Screenshot 4** (opcional): Diálogo de crear nueva tarea

### 3. Verificar Tamaño

Los screenshots de iPad Pro 13" deben ser:
- **Resolución**: 2048 x 2732 píxeles
- **Orientación**: Portrait (vertical)

Para verificar:
```bash
sips -g pixelWidth -g pixelHeight ~/Desktop/screenshot.png
```

### 4. Organizar Screenshots

```bash
# Crear carpeta para screenshots de iPad
mkdir -p screenshots/iPad_13

# Mover screenshots del escritorio a la carpeta
# Los archivos se llaman algo como: "Simulator Screenshot - iPad Pro..."
```

### 5. Subir a App Store Connect

1. Ve a https://appstoreconnect.apple.com
2. Selecciona "KubaTodo Task Manager Marlon"
3. Ve a **App Store** → **Screenshots**
4. Busca la sección **iPad Pro 13"** o **iPad (3rd Gen)**
5. Arrastra y suelta tus screenshots
6. Ordénalos (el primero será el destacado)

## Comando Rápido para Tomar Screenshot

Si prefieres usar la terminal:
```bash
# Tomar screenshot del iPad actualmente ejecutándose
xcrun simctl io booted screenshot ~/Desktop/ipad_screenshot_1.png

# Esperar 5 segundos, cambiar algo en la app, y tomar otro
sleep 5
xcrun simctl io booted screenshot ~/Desktop/ipad_screenshot_2.png
```

## Orientación del iPad

Por defecto, los screenshots se toman en la orientación actual del simulador.

**Para cambiar orientación** (si lo necesitas):
- En el Simulador: **Device** → **Rotate Left/Right**
- O presiona: **⌘ + ←** / **⌘ + →**

**Recomendación**: Usa orientación **Portrait (vertical)** para consistencia con iPhone

## Tips para Screenshots Profesionales de iPad

1. **Más contenido visible**: iPad tiene más espacio, muestra más tareas
2. **Aprovechar el ancho**: El layout en iPad puede mostrar más información
3. **Consistencia**: Usa las mismas tareas que en iPhone
4. **Claridad**: Asegúrate que el texto sea legible

## Checklist

- [ ] App ejecutándose en iPad Pro 13"
- [ ] Contenido de ejemplo añadido (8-10 tareas)
- [ ] 3-4 screenshots tomados con ⌘+S
- [ ] Screenshots verificados (2048 x 2732)
- [ ] Screenshots organizados en carpeta
- [ ] Listos para subir a App Store Connect

---

## Estado Actual

🟢 **App ejecutándose en iPad Pro 13" - LISTA PARA SCREENSHOTS**

**Siguiente paso**: 
1. Ve al simulador iPad
2. Añade tareas de ejemplo
3. Presiona **⌘ + S** para capturar (mínimo 3 veces)
4. Los screenshots se guardan en el escritorio
5. Súbelos a App Store Connect

---

## Resumen de Todos los Screenshots Necesarios

### iPhone (OBLIGATORIO)
- ✅ iPhone 15 Pro Max (6.7") - 1290 x 2796
- ⚠️ iPhone 15 Plus (6.5") - 1284 x 2778 (recomendado)

### iPad (OBLIGATORIO)
- ⏳ iPad Pro 13" - 2048 x 2732 (en proceso ahora)

**Total necesario**: Mínimo 3 screenshots por cada tamaño
