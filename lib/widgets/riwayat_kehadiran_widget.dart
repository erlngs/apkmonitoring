import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/kehadiran_provider.dart';

class RiwayatKehadiranWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final kehadiranProvider = Provider.of<KehadiranProvider>(context);

    if (kehadiranProvider.riwayat.isEmpty) {
      return Center(
        child: Text(
          'Riwayat Kosong, Silakan absen dahulu',
          style: TextStyle(fontSize: 18),
        ),
      );
    }

    return ListView.builder(
      itemCount: kehadiranProvider.riwayat.length,
      itemBuilder: (context, index) {
        final data = kehadiranProvider.riwayat[index];
        return ListTile(
          title: Text('${data['tanggal'].toString().split(' ')[0]}'),
          subtitle: Text(
            'Hadir: ${data['hadir']}, Tidak Hadir: ${data['tidakHadir']}',
          ),
        );
      },
    );
  }
}
