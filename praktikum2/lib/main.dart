import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'input_mahasiswa.dart';
import 'package:url_launcher/url_launcher.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tugas 2 Praktikum Mobile',
      home: const MainPage(),
    );
  }
}


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  Map<String, dynamic>? mahasiswa;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Halaman Utama")),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ProfilePage()),
                    );
                  },
                  child: const Text("Halaman Profil"),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Input_Mahasiswa(),
                      ),
                    );
                    if (result != null) {
                      setState(() {
                        mahasiswa = result;
                      });
                    }
                  },
                  child: const Text("Input Data Mahasiswa"),
                ),
              ],
            ),

            const SizedBox(height: 20),
            if (mahasiswa != null)
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Nama: ${mahasiswa!['nama']}"),
                    Text("Umur: ${mahasiswa!['umur']}"),
                    Text("Alamat: ${mahasiswa!['alamat']}"),
                    Text("Kontak: ${mahasiswa!['kontak']}"),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () async {
                        String tel = mahasiswa!['kontak'].toString().replaceAll(RegExp(r'[^0-9]'), '');
                        if (tel.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Nomor telepon tidak valid')),
                          );
                          return;
                        }
                        final Uri url = Uri(scheme: 'tel', path: tel);
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Gagal melakukan panggilan')),
                          );
                        }
                      },
                      child: const Text("Call"),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

