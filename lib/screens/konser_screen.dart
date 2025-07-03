import 'package:flutter/material.dart';
import 'konfirmasi_pembayaran_screen.dart';

class KonserScreen extends StatelessWidget {
  final Function(Map<String, String>) onTambahRiwayat;

  const KonserScreen({super.key, required this.onTambahRiwayat});

  final List<Map<String, dynamic>> paketKonser = const [
    {
      "title": "Paket A - Mini Konser",
      "harga": 1500000,
      "hargaTeks": "Rp1.500.000 / hari",
      "deskripsi": "Paket kecil untuk konser mini indoor, termasuk 2 speaker dan mic.",
      "image": "assets/images/hemat.jpg"
    },
    {
      "title": "Paket B - Full Dekor Konser",
      "harga": 2500000,
      "hargaTeks": "Rp2.500.000 / hari",
      "deskripsi": "Cocok untuk konser di lapangan terbuka, 4 speaker aktif + mixer.",
      "image": "assets/images/full_dekor.jpg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Konser'),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView.builder(
        itemCount: paketKonser.length,
        itemBuilder: (context, index) {
          final paket = paketKonser[index];
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
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
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
