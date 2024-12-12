import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
        
        final DateTime tanggal = data['tanggal'];
        final String formattedDate = DateFormat("EEEE, dd MMMM yyyy", 'id_ID').format(tanggal);

        return ListTile(
          title: Text(formattedDate),
          subtitle: Text(
            'Hadir: ${data['hadir']}, Tidak Hadir: ${data['tidakHadir']}',
          ),
        );
      },
    );
  }
}
