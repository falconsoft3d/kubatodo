# KubaTodo

Aplicación móvil de gestión de tareas con diseño inspirado en el estilo Tesla - minimalista, oscuro y moderno.

## Características

- ✨ Diseño minimalista inspirado en Tesla
- 🌑 Tema oscuro elegante
- ✅ Agregar, completar y eliminar tareas
- 📝 Descripción opcional para cada tarea
- 💾 Almacenamiento persistente con SharedPreferences
- 🎯 Tabs para tareas activas y completadas
- 🔄 Gestos de deslizar para eliminar
- 📱 Optimizado para iOS

## Requisitos

- Flutter SDK (>=3.0.0)
- Xcode (para ejecutar en iOS)
- Un dispositivo iOS o simulador

## Instalación

1. Clona o navega al directorio del proyecto:
```bash
cd "/Users/marlonfalcon/Documents/Apps Projects/kubatodo"
```

2. Instala las dependencias:
```bash
flutter pub get
```

3. Verifica que tu dispositivo iOS esté conectado o que el simulador esté ejecutándose:
```bash
flutter devices
```

## Ejecución

Para ejecutar la aplicación en tu iPhone o simulador:

```bash
flutter run
```

Si tienes múltiples dispositivos conectados, especifica el dispositivo:

```bash
flutter run -d <device-id>
```

Para ejecutar en modo release (mejor rendimiento):

```bash
flutter run --release
```

## Estructura del Proyecto

```
lib/
├── main.dart                    # Punto de entrada
├── models/
│   └── task.dart               # Modelo de datos de tareas
├── providers/
│   └── task_provider.dart      # Gestión de estado
└── screens/
    └── home_screen.dart        # Pantalla principal
```

## Características del Diseño

- **Colores**: Fondo negro (#000000) con elementos en gris oscuro (#1A1A1A)
- **Tipografía**: SF Pro (fuente nativa de iOS)
- **Animaciones**: Transiciones suaves y naturales
- **Interacciones**: Gestos intuitivos (tap para completar, deslizar para eliminar)
- **Espaciado**: Generoso para una experiencia limpia

## Compilar para iOS

Para crear un build para distribución:

```bash
flutter build ios --release
```

Luego abre el proyecto en Xcode:

```bash
open ios/Runner.xcworkspace
```

## Tecnologías Utilizadas

- **Flutter**: Framework de UI
- **Provider**: Gestión de estado
- **SharedPreferences**: Almacenamiento local
- **Material Design**: Componentes base

## Soporte

Esta aplicación está optimizada para iOS pero también funciona en Android.
