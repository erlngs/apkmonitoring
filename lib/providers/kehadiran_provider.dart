import 'package:flutter/material.dart';
import '../models/kehadiran_model.dart';

class KehadiranProvider extends ChangeNotifier {
  List<Kehadiran> _siswa = [
    Kehadiran(nama: 'Ali'),
    Kehadiran(nama: 'Budi'),
    Kehadiran(nama: 'Citra'),
    Kehadiran(nama: 'Erlang'),
    Kehadiran(nama: 'Sinatrya'),
    Kehadiran(nama: 'Yusya'),
  ];

  List<Map<String, dynamic>> _riwayat = [];

  List<Kehadiran> get siswa => _siswa;
  List<Map<String, dynamic>> get riwayat => _riwayat;

  void ubahKehadiran(int index) {
    _siswa[index].hadir = !_siswa[index].hadir;
    notifyListeners();
  }

  void simpanKehadiran() {
    final jumlahHadir = _siswa.where((s) => s.hadir).length;
    final jumlahTidakHadir = _siswa.length - jumlahHadir;

    _riwayat.insert(0, {
      'tanggal': DateTime.now(),
      'hadir': jumlahHadir,
      'tidakHadir': jumlahTidakHadir,
    });

    for (var siswa in _siswa) {
      siswa.hadir = false;
    }
    notifyListeners();
  }
}
