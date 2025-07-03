import 'package:flutter/material.dart';
import 'pembayaran_sukses_screen.dart';

class KonfirmasiPembayaranScreen extends StatefulWidget {
  final String judulPaket;
  final int harga;
  final Function(Map<String, String>) onTambahRiwayat;

  const KonfirmasiPembayaranScreen({
    super.key,
    required this.judulPaket,
    required this.harga,
    required this.onTambahRiwayat,
  });

  @override
  State<KonfirmasiPembayaranScreen> createState() =>
      _KonfirmasiPembayaranScreenState();
}

class _KonfirmasiPembayaranScreenState
    extends State<KonfirmasiPembayaranScreen> {
  String? metodePembayaran;
  final TextEditingController rekeningController = TextEditingController();
  final TextEditingController noHpController = TextEditingController();

  void _konfirmasiPembayaran() {
    if (metodePembayaran == null ||
        rekeningController.text.isEmpty ||
        noHpController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Harap isi semua data terlebih dahulu")),
      );
      return;
    }

    final riwayatData = {
      'judul': widget.judulPaket,
      'metode': metodePembayaran!,
      'tanggal': DateTime.now().toString().split(' ')[0],
      'harga': widget.harga.toString(),
    };

    widget.onTambahRiwayat(riwayatData);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const PembayaranSuksesScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Konfirmasi Pembayaran'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Pilih Metode Pembayaran",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            DropdownButton<String>(
              value: metodePembayaran,
              hint: const Text("Pilih metode"),
              isExpanded: true,
              items: ['Dana', 'BRI', 'Mandiri', 'BCA'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  metodePembayaran = newValue!;
                });
              },
            ),
            const SizedBox(height: 12),
            TextField(
              controller: rekeningController,
              decoration: const InputDecoration(labelText: "Nomor Rekening"),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: noHpController,
              decoration: const InputDecoration(labelText: "Nomor HP"),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 20),
            Text(
              "Total Harga: Rp${widget.harga}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _konfirmasiPembayaran,
                child: const Text("Konfirmasi Pembayaran"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
