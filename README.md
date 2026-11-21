# Paleta figurek

Pomocnik do malowania figurek z druku 3D, z farbami Vallejo, Citadel, AK lub Army Painter. Działa w przeglądarce i jako aplikacja na Androida, bez internetu.

<p>
<img src="screenshots/przepisy.png" width="190" alt="Przepisy">
<img src="screenshots/figurki.png" width="190" alt="Figurki">
<img src="screenshots/narzedzia.png" width="190" alt="Narzędzia">
<img src="screenshots/druk.png" width="190" alt="Druk 3D">
</p>

## Co potrafi

| Zakładka | Funkcje |
| --- | --- |
| **Przepisy** | Wybór marki farb. Materiały (czerwień, skóra, złoto, stal, drewno…) w czterech odcieniach: cień, baza, światło, błysk, z kroplami do mieszania. Brakująca farba dostaje zamiennik. Podstawki: pustynia, ziemia, bruk, lawa, śnieg, bagno, trawa. |
| **Figurki** | 12 instrukcji (m.in. Artur Morgan, rycerz, ork, smok) z odhaczaniem kroków, tryb przy stole z dużymi literami, własne figurki, kolejka „do pomalowania / w trakcie / gotowe”, galeria zdjęć przed i po. |
| **Narzędzia** | Inwentarz farb wszystkich marek (ponad 1600 farb Vallejo, Citadel, AK, Army Painter) uzupełniany skanerem kodów kreskowych, zamienniki między markami z przepisem na mieszankę z posiadanych farb i podpowiedzią zakupu, minutnik schnięcia z powiadomieniami, kalkulator rozcieńczania i mieszania, kolory ze zdjęcia, plan kolorów z generatorem zestawów, kopia zapasowa, panel szafki lakierniczej i lampy na ESP32. |
| **Wiedza** | Koło barw, cień i światło bez szarości, zasada 60/30/10, techniki w obrazkach, słowniczek pojęć. |
| **Druk 3D** | Wybór drukarki (Bambu Lab, Prusa, Creality, Elegoo, Anycubic, inna FDM, żywica) z ustawieniami dla dyszy 0,4 i małej, kalkulator skali, przygotowanie wydruku FDM, zenithal, mokra paleta, typowe błędy. |
| **Zakupy** | Lista z oznaczeniami produktów, „kończy się” i kopiowanie do Google Keep. |

- **Wybór drukarki 3D** — ustawienia do figurek dla Bambu Lab (A1 mini, A1, P1S, X1C), Prusa (MK4, MINI+), Creality (Ender-3 V3 SE, K1C), Elegoo Neptune 4, Anycubic Kobra 3, innej FDM i drukarek żywicznych.
- **Harmonia kolorów** — koło barw (malarskie RYB lub cyfrowe RGB) z harmoniami: dopełniające, rozszczepione, analogiczne, triada, prostokąt, kwadrat, monochromatyczne. Dla każdego koloru najbliższe farby z inwentarza i wybranej marki oraz proporcje 60-30-10.
- **Zmiana producenta farb** — przepisy i instrukcje figurek pokazują odpowiedniki Citadel, AK, Army Painter albo farby z Twojego inwentarza (≈ = dobrane po kolorze).

## Instalacja na Androidzie

1. Pobierz [`apk/PaletaFigurek-1.9.3.apk`](apk/PaletaFigurek-1.9.3.apk).
2. Otwórz plik na telefonie i zezwól na instalację z nieznanych źródeł.
3. Przy pierwszym uruchomieniu zezwól na powiadomienia (minutnik schnięcia), a przy pierwszym skanowaniu na aparat.

Wymaga Androida 8.0 lub nowszego.

## W przeglądarce

Całość to jeden plik [`index.html`](index.html). Otwórz go w przeglądarce albo włącz GitHub Pages dla tego repozytorium.

## Budowanie APK

Aplikacja to `index.html` w WebView z małą warstwą natywną w smali (wybór zdjęć, powiadomienia przez `AlarmManager`).

```bash
cd android
mkdir tools   # apktool.jar 2.10.0 i uber-apk-signer.jar 1.3.0
./build.sh
```

## Warsztat (ESP32)

Panel w zakładce Narzędzia → Warsztat łączy się z ESP32 w sieci domowej:

- `GET /data` → `{"t":21.5,"h":48}` (temperatura °C, wilgotność %)
- `GET /lamp?k=4000&b=80` → barwa 3000–6500 K, jasność 0–100%

Odpowiedzi z nagłówkiem `Access-Control-Allow-Origin: *`.

## Skaner kodów

Kody Vallejo (`8429551…`) aplikacja rozpoznaje sama. Kod innej marki wystarczy raz przypisać do farby z listy — potem jest rozpoznawany automatycznie (zapisuje się w urządzeniu i w kopii zapasowej).

## Licencje zewnętrzne

- Kolory farb: [Miniature Painter Pro — miniature-paints](https://github.com/Arcturus5404/miniature-paints), MIT, © 2022 Rick Fleuren
- Dekoder kodów kreskowych: [ZXing for JS](https://github.com/zxing-js/library), Apache License 2.0
