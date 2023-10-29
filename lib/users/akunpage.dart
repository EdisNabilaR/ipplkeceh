import 'package:flutter/material.dart';

class AkunPage extends StatefulWidget {
  @override
  State<AkunPage> createState() => _AkunPageState();
}

class _AkunPageState extends State<AkunPage> {
  TextEditingController _namaController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _alamatController = TextEditingController();

  void _simpanProfil() {
    String nama = _namaController.text;
    String email = _emailController.text;
    String alamat = _alamatController.text;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
            'Profil disimpan: Nama: $nama, Email: $email, Alamat: $alamat'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Profil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nama:'),
            TextField(
              controller: _namaController,
              decoration: InputDecoration(
                hintText: 'Masukkan nama Anda',
              ),
            ),
            SizedBox(height: 16),
            Text('Email:'),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'Masukkan alamat email Anda',
              ),
            ),
            SizedBox(height: 16),
            Text('Alamat:'),
            TextField(
              controller: _alamatController,
              decoration: InputDecoration(
                hintText: 'Masukkan alamat Anda',
              ),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: _simpanProfil,
              child: Text('Simpan Profil'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _namaController.dispose();
    _emailController.dispose();
    _alamatController.dispose();
    super.dispose();
  }
}
