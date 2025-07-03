import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            // Gambar profil, ganti "profil.jpg" dengan nama file kamu sendiri di folder assets/images
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/profil.jpg'), // <- Ganti file ini jika perlu
            ),
            const SizedBox(height: 20),

            const Text(
              'ramadani',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'johndoe@example.com',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            const Chip(
              label: Text('Pengguna Biasa'),
              backgroundColor: Colors.deepPurpleAccent,
              labelStyle: TextStyle(color: Colors.white),
            ),

            const SizedBox(height: 30),
            const Divider(),

            // Informasi tambahan
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Tentang Pengguna',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Ini adalah halaman profil pengguna. Anda dapat mengganti foto profil dengan mengganti file "profil.jpg" di folder assets/images.',
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
