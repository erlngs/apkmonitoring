import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart'; 
import 'package:provider/provider.dart';
import 'providers/kehadiran_provider.dart';
import 'screens/halaman_utama.dart';
import 'screens/halaman_riwayat.dart'; 

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  await initializeDateFormatting('id_ID', null); 
  runApp(AplikasiPresensi());
}

class AplikasiPresensi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => KehadiranProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: NavigasiUtama(),
      ),
    );
  }
}

class NavigasiUtama extends StatefulWidget {
  @override
  _NavigasiUtamaState createState() => _NavigasiUtamaState();
}

class _NavigasiUtamaState extends State<NavigasiUtama> {
  int _indeksDipilih = 0;

  final _halaman = [HalamanUtama(), HalamanRiwayat()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _halaman[_indeksDipilih],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indeksDipilih,
        onTap: (indeks) {
          setState(() {
            _indeksDipilih = indeks;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.check_box), label: 'Pencatatan'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Riwayat'),
        ],
      ),
    );
  }
}
