#!/usr/bin/env bash
# Buduje PaletaFigurek.apk z index.html i projektu smali.
# Wymaga: Java 11+, apktool.jar (2.10.0) i uber-apk-signer.jar (1.3.0) w katalogu tools/.
set -euo pipefail
cd "$(dirname "$0")"
mkdir -p assets build
cp ../index.html assets/index.html
java -jar tools/apktool.jar b . -o build/paleta-unsigned.apk
java -jar tools/uber-apk-signer.jar -a build/paleta-unsigned.apk -o build/
echo "Gotowe: build/paleta-unsigned-aligned-debugSigned.apk"
