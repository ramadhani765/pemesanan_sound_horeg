import 'package:flutter/material.dart';
import '../widgets/menu_card.dart';
import 'karnaval_screen.dart';
import 'hajatan_screen.dart';
import 'konser_screen.dart';
import 'profile_screen.dart';
import 'login_screen.dart';
import 'history_screen.dart'; // ← import history
// ← nanti perlu ini juga

class HomeScreen extends StatelessWidget {
  final Function(Map<String, String>) onTambahRiwayat;
  final List<Map<String, String>> historyData;

  const HomeScreen({
    super.key,
    required this.onTambahRiwayat,
    required this.historyData,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> menus = [
      {
        "title": "Karnaval",
        "image": "assets/images/karnaval_banner.jpg",
        "screen": KarnavalScreen(
          onTambahRiwayat: onTambahRiwayat,
        ),
      },
      {
        "title": "Hajatan",
        "image": "assets/images/hajatan_banner.jpg",
        "screen": HajatanScreen(
          onTambahRiwayat: onTambahRiwayat,
        ),
      },
      {
        "title": "Konser",
        "image": "assets/images/konser_banner.jpg",
        "screen": KonserScreen(
          onTambahRiwayat: onTambahRiwayat,
        ),
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("AUDIO PRODUCTION"),
        backgroundColor: Colors.deepPurple,
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'Profil') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfileScreen()),
                );
              } else if (value == 'Riwayat') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HistoryScreen(historyData: historyData),
                  ),
                );
              } else if (value == 'Logout') {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen(
                    onTambahRiwayat: onTambahRiwayat,
                    historyData: historyData,
                  )),
                );
              }
            },
            itemBuilder: (BuildContext context) {
              return const [
                PopupMenuItem<String>(
                  value: 'Profil',
                  child: Text('Profil'),
                ),
                PopupMenuItem<String>(
                  value: 'Riwayat',
                  child: Text('Riwayat'),
                ),
                PopupMenuItem<String>(
                  value: 'Logout',
                  child: Text('Logout'),
                ),
              ];
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Center(
              child: Text(
                "SELAMAT DATANG AUDIO PRODUCTION",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 12),
            const Center(
              child: Text(
                "Silakan Anda Memilih Kebutuhan Anda",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: menus.map((menu) => MenuCard(menu)).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
