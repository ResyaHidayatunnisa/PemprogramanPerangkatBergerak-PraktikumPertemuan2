import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Halaman Profil"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              "Nama Aplikasi: My Flutter App",
            ),
            SizedBox(height: 8),
            Text(
              "Versi: 2.5.3",
            ),
            SizedBox(height: 8),
            Text(
              "Developer: Resya Hidayatunnisa",
            ),
          ],
        ),
      ),
    );
  }
}
