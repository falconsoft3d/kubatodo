#!/usr/bin/env python3
from PIL import Image
import os

# Cargar imagen original
img = Image.open('logo.png')

# Iconos iOS
ios_sizes = {
    'Icon-App-20x20@1x.png': 20,
    'Icon-App-20x20@2x.png': 40,
    'Icon-App-20x20@3x.png': 60,
    'Icon-App-29x29@1x.png': 29,
    'Icon-App-29x29@2x.png': 58,
    'Icon-App-29x29@3x.png': 87,
    'Icon-App-40x40@1x.png': 40,
    'Icon-App-40x40@2x.png': 80,
    'Icon-App-40x40@3x.png': 120,
    'Icon-App-60x60@2x.png': 120,
    'Icon-App-60x60@3x.png': 180,
    'Icon-App-76x76@1x.png': 76,
    'Icon-App-76x76@2x.png': 152,
    'Icon-App-83.5x83.5@2x.png': 167,
    'Icon-App-1024x1024@1x.png': 1024,
}

ios_path = 'ios/Runner/Assets.xcassets/AppIcon.appiconset/'
for name, size in ios_sizes.items():
    resized = img.resize((size, size), Image.Resampling.LANCZOS)
    resized.save(os.path.join(ios_path, name))
    print(f'✓ {name}')

# Iconos Android
android_sizes = {
    'mipmap-mdpi/ic_launcher.png': 48,
    'mipmap-hdpi/ic_launcher.png': 72,
    'mipmap-xhdpi/ic_launcher.png': 96,
    'mipmap-xxhdpi/ic_launcher.png': 144,
    'mipmap-xxxhdpi/ic_launcher.png': 192,
}

android_base = 'android/app/src/main/res/'
for path, size in android_sizes.items():
    resized = img.resize((size, size), Image.Resampling.LANCZOS)
    full_path = os.path.join(android_base, path)
    resized.save(full_path)
    print(f'✓ {path}')

# Iconos macOS
macos_sizes = {
    'app_icon_16.png': 16,
    'app_icon_32.png': 32,
    'app_icon_64.png': 64,
    'app_icon_128.png': 128,
    'app_icon_256.png': 256,
    'app_icon_512.png': 512,
    'app_icon_1024.png': 1024,
}

macos_path = 'macos/Runner/Assets.xcassets/AppIcon.appiconset/'
for name, size in macos_sizes.items():
    resized = img.resize((size, size), Image.Resampling.LANCZOS)
    resized.save(os.path.join(macos_path, name))
    print(f'✓ {name}')

# Web icons
web_sizes = {
    'icons/Icon-192.png': 192,
    'icons/Icon-512.png': 512,
    'icons/Icon-maskable-192.png': 192,
    'icons/Icon-maskable-512.png': 512,
}

for path, size in web_sizes.items():
    resized = img.resize((size, size), Image.Resampling.LANCZOS)
    full_path = os.path.join('web', path)
    resized.save(full_path)
    print(f'✓ web/{path}')

print('\n✅ Todos los iconos generados exitosamente!')
