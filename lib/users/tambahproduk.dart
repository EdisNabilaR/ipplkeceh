import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TambahprodukPage extends StatefulWidget {
  @override
  State<TambahprodukPage> createState() => _TambahprodukPageState();
}

class _TambahprodukPageState extends State<TambahprodukPage> {
  final TextEditingController _namaProdukController = TextEditingController();
  final TextEditingController _deskripsiProdukController =
      TextEditingController();
  final TextEditingController _stokController = TextEditingController();
  final TextEditingController _hargaController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  XFile? image;
  File? img;

  gallery() async {
    final XFile? _image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      image = _image;
    });
  }

  String _gambarProduk = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Tambah Produk'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: _namaProdukController,
                decoration: InputDecoration(labelText: 'Nama Produk'),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _deskripsiProdukController,
                maxLines: 4,
                decoration: InputDecoration(labelText: 'Deskripsi Produk'),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _stokController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Stok'),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _hargaController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Harga'),
              ),
              SizedBox(height: 5.0),
              ElevatedButton(
                onPressed: gallery,
                child: Text('Upload Gambar'),
              ),
              SizedBox(height: 16.0),
              if (image != null)
                Image.file(
                  File(image!.path),
                  fit: BoxFit.cover,
                ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {},
                child: Text('Simpan Produk'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
