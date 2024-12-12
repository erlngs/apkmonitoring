import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/daftar_siswa_widget.dart';
import '../providers/kehadiran_provider.dart';

class HalamanUtama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final kehadiranProvider = Provider.of<KehadiranProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Presensi Siswa'),
        backgroundColor: const Color.fromARGB(255, 16, 200, 225),
      ),
      body: Column(
        children: [
          Expanded(
            child: DaftarSiswaWidget(),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: kehadiranProvider.siswa.any((s) => s.hadir)
                      ? () {
                          // Simpan kehadiran
                          kehadiranProvider.simpanKehadiran();

                          // Menampilkan popup (AlertDialog)
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Berhasil'),
                                content: Text('Kehadiran berhasil disimpan!'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(); // Tutup popup
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      : null,
                  child: Text('Simpan Kehadiran'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
