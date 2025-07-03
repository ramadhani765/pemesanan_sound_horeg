import 'package:flutter/material.dart';
import 'screens/home_screen.dart'; // Ganti sesuai lokasi HomeScreen-mu

void main() {
  runApp(const SoundHoregApp());
}

class SoundHoregApp extends StatefulWidget {
  const SoundHoregApp({super.key});

  @override
  State<SoundHoregApp> createState() => _SoundHoregAppState();
}

class _SoundHoregAppState extends State<SoundHoregApp> {
  final List<Map<String, String>> _history = [];

  void _tambahRiwayat(Map<String, String> data) {
    setState(() {
      _history.add(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sound Horeg App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(
        onTambahRiwayat: _tambahRiwayat,
        historyData: _history,
      ),
    );
  }
}
