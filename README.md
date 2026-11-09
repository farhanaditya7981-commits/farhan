# Absensi MTU

Aplikasi absensi sederhana berbasis **context awareness (lokasi)** dengan Flutter.
Absen hanya bisa dilakukan jika pengguna berada dalam radius **20 meter** dari titik kampus
Universitas Mahkota Tricom Unggul.

## Fitur
- Hitung jarak ke titik kampus memakai GPS (`geolocator`)
- Tombol **Absen** aktif hanya jika jarak <= 20 m
- Tolak absensi jika akurasi GPS buruk atau terdeteksi mock location
- Riwayat absensi (sementara, di memori)

## Cara menjalankan
```bash
git clone <url-repo-kamu>
cd absensi_mtu
./setup.sh      # sekali saja: generate android/ios + izin lokasi
flutter run
```

## Konfigurasi
Ubah koordinat kampus di `lib/main.dart`:
```dart
const double kCampusLat = ...;
const double kCampusLng = ...;
const double kMaxRadiusMeter = 20;
```
Ambil koordinat dari Google Maps (klik kanan pada titik absensi).

## Struktur
```
lib/main.dart          # seluruh logika & UI
test/widget_test.dart  # widget test dasar
setup.sh               # generate platform + izin lokasi
```
