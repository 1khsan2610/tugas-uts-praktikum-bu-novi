# MyPorto - Aplikasi Portofolio Flutter

Aplikasi portofolio sederhana yang menampilkan hasil proyek praktikum Flutter.

## Struktur Proyek

```
myporto/
├── lib/
│   ├── main.dart
│   └── screens/
│       ├── dashboard_screen.dart      # Halaman utama dengan daftar menu
│       ├── counter_screen.dart        # Proyek 1: Counter App
│       ├── nested_widget_screen.dart  # Proyek 2: Widget Bertingkat
│       ├── user_input_screen.dart     # Proyek 3: User Input Form
│       ├── dynamic_list_screen.dart   # Proyek 4: Dynamic List (Todo)
│       ├── simple_navigation_screen.dart # Proyek 5: Navigasi Antar Halaman
│       ├── grid_view_screen.dart      # Proyek 6: Grid View
│       └── about_me_screen.dart       # Halaman Tentang Saya
├── assets/
│   └── profile.png                   # (opsional) foto profil
└── pubspec.yaml
```

## Cara Menjalankan

1. Pastikan Flutter SDK sudah terinstal
2. Clone atau copy proyek ini
3. Jalankan perintah berikut di terminal:

```bash
cd myporto
flutter pub get
flutter run
```

## Fitur Aplikasi

### Halaman Dashboard
- AppBar dengan judul "MyPorto"
- Teks sambutan dan deskripsi
- Daftar 7 tombol rounded
- Tombol berubah warna setelah diklik (abu → teal/hijau)
- Tombol "Tentang Saya" berubah menjadi biru indigo
- Counter kunjungan halaman

### Proyek 1: Counter
- Tombol increment, decrement, dan reset
- Animasi perubahan angka
- Tampilan kartu bergradien

### Proyek 2: Widget Bertingkat
- Contoh Row & Column bersarang
- Container bertingkat
- Stack widget
- Row dengan Expanded

### Proyek 3: User Input
- Form dengan validasi
- TextField, DropdownButton
- Tampilan hasil input
- SnackBar notifikasi

### Proyek 4: Dynamic List
- Tambah item baru
- Hapus item (swipe atau tombol)
- Tandai selesai (toggle)
- Counter statistik

### Proyek 5: Navigasi Sederhana
- Navigator.push()
- Mengirim data ke halaman baru
- Menerima data kembali dengan pop()

### Proyek 6: Grid View
- GridView.builder dengan 3 kolom
- Filter kategori
- Tap item menampilkan SnackBar

### Halaman Tentang Saya
- Foto profil (ikon default)
- NPM, Nama, Jurusan, Angkatan
- Deskripsi singkat
- Daftar keahlian

## Kustomisasi

Ganti data pada `about_me_screen.dart`:
- NPM: ubah `'20241320083'`
- Nama: ubah `'IKHSAN'`
- Jurusan: ubah `'Sistem Informasi'`
- Angkatan: ubah `'2024'`
- Deskripsi: edit teks di bagian "Sekilas Tentang Saya"

Untuk menambahkan foto profil nyata:
1. Taruh foto di folder `assets/` dengan nama `profile.png`
2. Ganti widget `Icon(Icons.person, ...)` di `about_me_screen.dart` dengan:
   ```dart
   Image.asset('assets/profile.png', fit: BoxFit.cover)
   ```