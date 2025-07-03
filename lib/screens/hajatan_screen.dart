import 'package:flutter/material.dart';
import 'konfirmasi_pembayaran_screen.dart';

class HajatanScreen extends StatelessWidget {
  final void Function(Map<String, String>)? onTambahRiwayat;

  const HajatanScreen({super.key, this.onTambahRiwayat});

  final List<Map<String, dynamic>> paketHajatan = const [
    {
      "title": "Paket A - Hemat",
      "harga": 500000,
      "hargaTeks": "Rp500.000 / hari",
      "deskripsi": "1 mic wireless, 2 speaker aktif, cocok untuk acara kecil.",
      "image": "assets/images/sound_hemat.jpg"
    },
    {
      "title": "Paket C - Full Dekor",
      "harga": 1000000,
      "hargaTeks": "Rp1.000.000 / hari",
      "deskripsi": "Sound + lighting basic + kabel dekorasi area.",
      "image": "assets/images/full_dekor.jpg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hajatan'),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView.builder(
        itemCount: paketHajatan.length,
        itemBuilder: (context, index) {
          final paket = paketHajatan[index];
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
                                  onTambahRiwayat: (riwayat) {
                                    if (onTambahRiwayat != null) {
                                      onTambahRiwayat!(riwayat);
                                    }
                                  },
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
