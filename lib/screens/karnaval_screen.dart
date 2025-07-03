import 'package:flutter/material.dart';
import 'konfirmasi_pembayaran_screen.dart';

class KarnavalScreen extends StatelessWidget {
  final Function(Map<String, String>) onTambahRiwayat;

  const KarnavalScreen({super.key, required this.onTambahRiwayat});

  final List<Map<String, dynamic>> paketKarnaval = const [
    {
      "title": "Paket A - Mini Sound",
      "harga": 800000,
      "hargaTeks": "Rp800.000 / hari",
      "deskripsi": "Cocok untuk karnaval kecil, 2 speaker aktif & 1 mic wireless.",
      "image": "assets/images/mini_sound.jpg",
    },
    {
      "title": "Paket C - Full Sound",
      "harga": 1500000,
      "hargaTeks": "Rp1.500.000 / hari",
      "deskripsi": "Sound system lengkap untuk karnaval besar.",
      "image": "assets/images/ful_sound.jpg",
    },
    {
      "title": "Paket D - Lighting + Sound",
      "harga": 1800000,
      "hargaTeks": "Rp1.800.000 / hari",
      "deskripsi": "Sound + lighting untuk parade malam hari.",
      "image": "assets/images/lighning_sound.jpg",
    },
    {
      "title": "Paket E - Sound Lighting Videotron",
      "harga": 2500000,
      "hargaTeks": "Rp2.500.000 / hari",
      "deskripsi": "Paket lengkap dengan crew & efek asap.",
      "image": "assets/images/soud_videotron.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Karnaval'),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView.builder(
        itemCount: paketKarnaval.length,
        itemBuilder: (context, index) {
          final paket = paketKarnaval[index];
          return Card(
            margin: const EdgeInsets.all(12),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.asset(
                    paket["image"],
                    width: double.infinity,
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        paket["title"],
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        paket["hargaTeks"],
                        style: const TextStyle(fontSize: 16, color: Colors.red),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        paket["deskripsi"],
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => KonfirmasiPembayaranScreen(
                                  judulPaket: paket["title"],
                                  harga: paket["harga"],
                                  onTambahRiwayat: onTambahRiwayat,
                                ),
                              ),
                            );
                          },
                          child: const Text(
                            "Pesan Sekarang",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
