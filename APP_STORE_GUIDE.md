# Guía para Subir KubaTodo a App Store Connect

## Requisitos Previos

1. **Cuenta de Apple Developer**
   - Debes tener una cuenta activa de Apple Developer ($99/año)
   - Visita: https://developer.apple.com/account

2. **Información Necesaria**
   - Team ID (lo encuentras en developer.apple.com → Membership)
   - Bundle ID único (ej: com.tuempresa.kubatodo)

## Pasos para Publicar

### 1. Configurar el Proyecto en Xcode

```bash
# Abre el workspace de iOS
open ios/Runner.xcworkspace
```

En Xcode:
1. Selecciona "Runner" en el navegador de proyectos
2. Ve a la pestaña "Signing & Capabilities"
3. **Desmarca** "Automatically manage signing"
4. Selecciona tu Team en el dropdown
5. Crea un Bundle ID único (ej: `com.marlonfalcon.kubatodo`)

### 2. Configurar en App Store Connect

1. Ve a https://appstoreconnect.apple.com/
2. Click en "My Apps" → "+" → "New App"
3. Completa la información:
   - **Platform**: iOS
   - **Name**: KubaTodo
   - **Primary Language**: Spanish
   - **Bundle ID**: (el mismo que configuraste en Xcode)
   - **SKU**: kubatodo-001 (o cualquier ID único)
   - **User Access**: Full Access

### 3. Crear un Build de Release

```bash
# Desde el directorio del proyecto
cd "/Users/marlonfalcon/Documents/Apps Projects/kubatodo"

# Limpiar builds anteriores
flutter clean

# Obtener dependencias
flutter pub get

# Crear el build de release para iOS
flutter build ios --release
```

### 4. Crear el Archive en Xcode

1. Abre el workspace:
   ```bash
   open ios/Runner.xcworkspace
   ```

2. En Xcode:
   - Selecciona "Any iOS Device (arm64)" como destino
   - Ve a Menu: **Product** → **Archive**
   - Espera a que se complete el archive

3. Cuando termine, se abrirá el Organizer:
   - Selecciona tu archive
   - Click en **"Distribute App"**
   - Selecciona **"App Store Connect"**
   - Click **"Upload"**
   - Sigue los pasos del asistente

### 5. Completar Información en App Store Connect

1. Ve a https://appstoreconnect.apple.com/
2. Selecciona tu app "KubaTodo"
3. Completa toda la información requerida:

   **App Information:**
   - Nombre
   - Subtítulo (opcional)
   - Categoría (Productividad)
   - Idiomas

   **Pricing:**
   - Precio: Gratis o Pago
   - Disponibilidad por países

   **Prepare for Submission:**
   - Screenshots (iPhone 6.7" y 6.5" requeridos)
   - Description
   - Keywords
   - Support URL
   - Privacy Policy URL

   **Build:**
   - Selecciona el build que subiste

4. Click en **"Submit for Review"**

### 6. Generar Screenshots (Requeridos)

Para generar screenshots profesionales:

1. Ejecuta la app en simuladores:
   - iPhone 15 Pro Max (6.7")
   - iPhone 14 Plus (6.5")

2. Captura pantallas con ⌘+S

3. Tamaños requeridos:
   - 1290 x 2796 (iPhone 6.7")
   - 1284 x 2778 (iPhone 6.5")

## Comandos Rápidos

```bash
# Verificar que todo esté OK
flutter doctor

# Limpiar y reconstruir
flutter clean && flutter pub get

# Build de release
flutter build ios --release

# Abrir Xcode
open ios/Runner.xcworkspace
```

## Notas Importantes

- **Primera revisión**: Puede tomar 24-48 horas
- **Política de privacidad**: Requerida si recopilas datos
- **Screenshots**: Mínimo 1 por cada tamaño requerido
- **Descripción**: Máximo 4000 caracteres
- **Keywords**: Máximo 100 caracteres

## Errores Comunes

1. **"No se puede verificar"**: Asegúrate de tener certificados y perfiles válidos
2. **"Bundle ID no disponible"**: Usa un ID único
3. **"Falta información"**: Completa todos los campos en App Store Connect

## Checklist Final

- [ ] Cuenta de Apple Developer activa
- [ ] Bundle ID único configurado
- [ ] Team ID configurado en Xcode
- [ ] Build de release creado
- [ ] Archive subido a App Store Connect
- [ ] Screenshots agregados
- [ ] Descripción completa
- [ ] Privacy Policy (si aplica)
- [ ] App enviada a revisión

---

**¿Necesitas ayuda?** 
- Developer Support: https://developer.apple.com/contact/
- App Review: https://developer.apple.com/app-store/review/
