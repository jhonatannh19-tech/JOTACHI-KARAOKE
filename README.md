
name: Build JOTACHI Karaoke APK

on:
  workflow_dispatch:
  push:
    branches:
      - main

permissions:
  contents: read

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - uses: actions/setup-java@v4
        with:
          distribution: temurin
          java-version: '17'

      - uses: subosito/flutter-action@v2
        with:
          channel: stable

      - name: Install dependencies
        run: flutter pub get

      - name: Build APK
        run: flutter build apk --release

      - name: Upload APK
        uses: actions/upload-artifact@v4
        with:
          name: JOTACHI-KARAOKE-APK
          path: build/app/outputs/flutter-apk/app-release.apk

name: Build JOTACHI Karaoke APK

on:
  workflow_dispatch:
  push:
    branches:
      - main

permissions:
  contents: read

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - uses: actions/setup-java@v4
        with:
          distribution: temurin
          java-version: '17'

      - uses: subosito/flutter-action@v2
        with:
          channel: stable

      - name: Install dependencies
        run: flutter pub get

      - name: Build APK
        run: flutter build apk --release

      - name: Upload APK
        uses: actions/upload-artifact@v4
        with:
          name: JOTACHI-KARAOKE-APK
          path: build/app/outputs/flutter-apk/app-release.apk
# JOTACHI PROFESSIONAL KARAOKE (Flutter, Android)

## Estado real (sin maquillaje)
| Función | Estado |
|---|---|
| Importar canciones del teléfono | Escrito, **sin probar** |
| Separación de voz por servidor (Demucs) | Escrito, **sin probar** |
| Separación de voz local (sin internet) | **No implementada** (stub honesto) |
| Reproductor + original/instrumental | Escrito, **sin probar** |
| Letras sincronizadas (.lrc / LRCLIB) | Parser con pruebas; UI **sin probar** |
| Grabar la voz | Escrito, **sin probar** |
| Mezclar tu voz con el instrumental en un solo archivo | **No existe aún** |
| APK | **No generado**: este entorno no tiene Flutter/Android SDK ni internet |

Nada se ha compilado ni ejecutado. Las versiones de `pubspec.yaml` no se verificaron.

## Generar el APK
Opción A (recomendada): sube la carpeta a GitHub; el workflow `Build APK` compila y publica `app-release.apk` como artefacto.

Opción B (local, con Flutter instalado):
```
./setup.sh
flutter analyze && flutter test
flutter build apk --release
# build/app/outputs/flutter-apk/app-release.apk
```
El APK release usa la firma de depuración de Flutter: sirve para instalar y probar, no para Play Store.

## Servidor de separación
```
cd server && pip install -r requirements.txt
API_KEY=mi_clave uvicorn main:app --host 0.0.0.0 --port 8000
```
En la app: Ajustes → URL (`http://IP:8000`) y clave. Se necesita `ffmpeg` y mucha RAM; en CPU una canción tarda varios minutos.
