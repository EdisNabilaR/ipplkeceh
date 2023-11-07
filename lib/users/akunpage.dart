import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AkunPage extends StatefulWidget {
  @override
  State<AkunPage> createState() => _AkunPageState();
}

class _AkunPageState extends State<AkunPage> {
  TextEditingController _namaController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _alamatController = TextEditingController();

  bool isEditing = false;

  @override
  void initState() {
    super.initState();

    loadProfilData();
  }

  void loadProfilData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _namaController.text = prefs.getString('nama') ?? '';
      _emailController.text = prefs.getString('email') ?? '';
      _alamatController.text = prefs.getString('alamat') ?? '';
    });
  }

  void _simpanProfil() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('nama', _namaController.text);
    prefs.setString('email', _emailController.text);
    prefs.setString('alamat', _alamatController.text);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Profil disimpan: Nama: ${_namaController.text}, Email: ${_emailController.text}, Alamat: ${_alamatController.text}',
        ),
      ),
    );

    setState(() {
      isEditing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Profil'),
        actions: [
          if (isEditing)
            IconButton(
              onPressed: _simpanProfil,
              icon: Icon(Icons.save),
            ),
        ],
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
              enabled: isEditing,
            ),
            SizedBox(height: 16),
            Text('Email:'),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'Masukkan alamat email Anda',
              ),
              enabled: isEditing,
            ),
            SizedBox(height: 16),
            Text('Alamat:'),
            TextField(
              controller: _alamatController,
              decoration: InputDecoration(
                hintText: 'Masukkan alamat Anda',
              ),
              enabled: isEditing,
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isEditing = !isEditing;
                });
              },
              child: Text(isEditing ? 'Batal' : 'Ubah Profil'),
            ),
          ],
        ),
      ),
    );
  }
}
