import 'package:flutter/material.dart';
import '../widgets/riwayat_kehadiran_widget.dart';

class HalamanRiwayat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Riwayat Kehadiran'),
      backgroundColor: const Color.fromARGB(255, 16, 200, 225),),
      body: RiwayatKehadiranWidget(),
    );
  }
}
