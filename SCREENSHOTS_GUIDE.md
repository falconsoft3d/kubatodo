# 📸 Guía para Crear Screenshots para App Store

## Método 1: Manual (Recomendado)

### Paso 1: Iniciar la App en el Simulador

1. **Abre el Simulador**:
   ```bash
   open -a Simulator
   ```

2. **Selecciona el dispositivo correcto**:
   - En el Simulador: **Device** → **iPhone 15 Pro Max** (6.7")
   - O **iPhone 15 Plus** (6.5")

3. **Ejecuta la app**:
   ```bash
   cd "/Users/marlonfalcon/Documents/Apps Projects/kubatodo"
   flutter run
   ```

### Paso 2: Preparar Contenido para Screenshots

Añade tareas de ejemplo en la app que se vean profesionales:

**Tareas Sugeridas**:
- ✅ Completar proyecto de trabajo
- ✅ Reunión con el equipo
- ⬜ Revisar correos importantes
- ⬜ Preparar presentación
- ⬜ Llamar al cliente
- ⬜ Hacer ejercicio
- ⬜ Comprar víveres

### Paso 3: Tomar Screenshots

**En el Simulador de iOS**:
1. Presiona **⌘ + S** (Cmd + S) para tomar un screenshot
2. Los screenshots se guardan automáticamente en el escritorio
3. El nombre incluye el dispositivo y la fecha

**Screenshots Necesarios** (mínimo 3 por tamaño):

#### iPhone 15 Pro Max (1290x2796) - 6.7"
1. **Screenshot 1**: Pantalla principal con lista de tareas pendientes
2. **Screenshot 2**: Vista de tareas con algunas completadas
3. **Screenshot 3**: Diálogo de crear nueva tarea
4. **Screenshot 4** (opcional): Vista de tareas completadas

#### iPhone 15 Plus (1284x2778) - 6.5" (opcional pero recomendado)
- Mismas capturas que arriba

### Paso 4: Organizar Screenshots

```bash
# Crear carpeta para screenshots
mkdir -p screenshots/iPhone_6.7
mkdir -p screenshots/iPhone_6.5

# Mover tus screenshots a estas carpetas
# Renombra los archivos para que sean descriptivos
```

## Método 2: Usando el Script

Si la app ya está corriendo en el simulador:

```bash
./take_screenshots.sh
```

Este script tomará screenshots automáticamente cada pocos segundos.

## Método 3: Screenshots desde Dispositivo Real (Opcional)

Si tienes un iPhone físico:

1. Conecta tu iPhone
2. Ejecuta: `flutter run` y selecciona tu dispositivo
3. Toma screenshots con **Botón Lateral + Volumen Arriba**
4. Los screenshots se guardan en la app Fotos
5. Transfiérelos a tu Mac con AirDrop o cable

## Tamaños Requeridos por App Store

Apple requiere screenshots de estos tamaños:

### iPhone
| Dispositivo | Resolución | Pulgadas |
|-------------|------------|----------|
| **iPhone 15 Pro Max** | 1290 x 2796 | 6.7" |
| **iPhone 15 Plus** | 1284 x 2778 | 6.5" |
| iPhone 15 Pro | 1179 x 2556 | 6.1" |
| iPhone SE | 750 x 1334 | 4.7" |

### iPad
| Dispositivo | Resolución | Pulgadas |
|-------------|------------|----------|
| **iPad Pro 13"** | 2048 x 2732 | 13" |
| iPad Pro 12.9" | 2048 x 2732 | 12.9" |
| iPad Pro 11" | 1668 x 2388 | 11" |

**Nota**: Necesitas screenshots de iPhone (6.7" y 6.5") Y iPad (13")

## Tips para Screenshots Profesionales

1. **Contenido Limpio**: Usa tareas de ejemplo que se vean profesionales
2. **Variedad**: Muestra diferentes estados (vacía, con tareas, completadas)
3. **Consistencia**: Usa el mismo contenido en todos los tamaños
4. **Iluminación**: El modo oscuro de KubaTodo ya se ve genial
5. **Orden**: Nombra los archivos: `01_main.png`, `02_tasks.png`, etc.

## Subir a App Store Connect

1. Ve a https://appstoreconnect.apple.com
2. Selecciona tu app "KubaTodo Task Manager Marlon"
3. Ve a la sección **App Store** → **Screenshots**
4. Arrastra y suelta tus screenshots en las secciones correspondientes
5. Puedes usar los mismos screenshots para múltiples idiomas

## Comandos Útiles

```bash
# Ver simuladores disponibles
xcrun simctl list devices | grep iPhone

# Tomar screenshot manualmente
xcrun simctl io booted screenshot screenshot.png

# Ver resolución de un screenshot
sips -g pixelWidth -g pixelHeight screenshot.png
```

## Checklist

- [ ] App corriendo en simulador iPhone 15 Pro Max
- [ ] Contenido de ejemplo añadido
- [ ] 3-5 screenshots tomados para 6.7"
- [ ] 3-5 screenshots tomados para 6.5" (opcional)
- [ ] Screenshots organizados en carpetas
- [ ] Screenshots renombrados descriptivamente
- [ ] Listo para subir a App Store Connect
