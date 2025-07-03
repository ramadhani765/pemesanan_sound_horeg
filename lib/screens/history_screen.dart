import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  final List<Map<String, String>> historyData;

  const HistoryScreen({super.key, required this.historyData});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  late List<Map<String, String>> _riwayat;

  @override
  void initState() {
    super.initState();
    _riwayat = List.from(widget.historyData); // salin agar bisa diedit
  }

  void _hapusRiwayat(int index) {
    setState(() {
      _riwayat.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Riwayat Pemesanan"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _riwayat.isEmpty
            ? const Center(
                child: Text(
                  "Belum ada riwayat pemesanan.",
                  style: TextStyle(fontSize: 16),
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      "History",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _riwayat.length,
                      itemBuilder: (context, index) {
                        final item = _riwayat[index];
                        return Card(
                          margin: const EdgeInsets.only(bottom: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 4,
                          child: ListTile(
                            title: Text("Nama Paket: ${item["judul"]}"),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 6),
                                Text("Pembayaran via: ${item["metode"]}"),
                                Text("Tanggal: ${item["tanggal"]}"),
                                Text("Harga: ${item["harga"]}"),
                              ],
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () => _hapusRiwayat(index),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.home),
                      label: const Text("Kembali ke Halaman Utama"),
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
