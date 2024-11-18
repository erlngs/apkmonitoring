import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/kehadiran_provider.dart';

class DaftarSiswaWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final kehadiranProvider = Provider.of<KehadiranProvider>(context);

    return ListView.builder(
      itemCount: kehadiranProvider.siswa.length,
      itemBuilder: (context, index) {
        final siswa = kehadiranProvider.siswa[index];
        return CheckboxListTile(
          title: Text(siswa.nama),
          value: siswa.hadir,
          onChanged: (value) {
            kehadiranProvider.ubahKehadiran(index);
          },
        );
      },
    );
  }
}
