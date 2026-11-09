#!/usr/bin/env bash
# Jalankan SEKALI setelah clone: membuat folder android/ios lalu menambahkan izin lokasi.
set -e
flutter create . --platforms=android,ios --project-name absensi_mtu --org id.ac.mtu
git checkout -- lib/main.dart pubspec.yaml 2>/dev/null || true

MANIFEST=android/app/src/main/AndroidManifest.xml
if ! grep -q ACCESS_FINE_LOCATION "$MANIFEST"; then
  sed -i '/<manifest/a\    <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>\n    <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>' "$MANIFEST"
fi

PLIST=ios/Runner/Info.plist
if ! grep -q NSLocationWhenInUseUsageDescription "$PLIST"; then
  sed -i '0,/<dict>/s//<dict>\n\t<key>NSLocationWhenInUseUsageDescription<\/key>\n\t<string>Lokasi dipakai untuk memverifikasi absensi di area kampus.<\/string>/' "$PLIST"
fi

flutter pub get
echo "Selesai. Jalankan: flutter run"
