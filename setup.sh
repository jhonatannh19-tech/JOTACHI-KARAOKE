#!/usr/bin/env bash
# Genera la carpeta android/ y aplica la configuración de JOTACHI.
set -e
flutter create --platforms=android --org com.jotachi --project-name jotachi_karaoke .
python3 tool/patch_android.py
flutter pub get
