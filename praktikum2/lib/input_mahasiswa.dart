import 'package:flutter/material.dart';

class Input_Mahasiswa extends StatefulWidget {
  const Input_Mahasiswa({super.key});

  @override
  State<Input_Mahasiswa> createState() => _Input_MahasiswaState();
}

class _Input_MahasiswaState extends State<Input_Mahasiswa> {
  final _formKey = GlobalKey<FormState>();
  final namaController = TextEditingController();
  final umurController = TextEditingController();
  final alamatController = TextEditingController();
  final kontakController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Input Mahasiswa")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: namaController,
                decoration: const InputDecoration(labelText: "Nama"),
                validator: (value) =>
                    value == null || value.isEmpty ? "Wajib di isi!" : null,
              ),
              TextFormField(
                controller: umurController,
                decoration: const InputDecoration(labelText: "Umur"),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value == null || value.isEmpty ? "Wajib di isi!" : null,
              ),
              TextFormField(
                controller: alamatController,
                decoration: const InputDecoration(labelText: "Alamat"),
                validator: (value) =>
                    value == null || value.isEmpty ? "Wajib di isi!" : null,
              ),
              TextFormField(
                controller: kontakController,
                decoration: const InputDecoration(labelText: "Kontak"),
                validator: (value) =>
                    value == null || value.isEmpty ? "Wajib di isi!" : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final mahasiswa = {
                      'nama': namaController.text,
                      'umur': umurController.text,
                      'alamat': alamatController.text,
                      'kontak': kontakController.text,
                    };
                    Navigator.pop(context, mahasiswa);
                  }
                },
                child: const Text("Simpan"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
  
