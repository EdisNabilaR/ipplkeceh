import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_core/firebase_core.dart';

class TambahprodukPage extends StatefulWidget {
  @override
  State<TambahprodukPage> createState() => _TambahprodukPageState();
}

class _TambahprodukPageState extends State<TambahprodukPage> {
  final TextEditingController _namaProdukController = TextEditingController();
  final TextEditingController _deskripsiProdukController = TextEditingController();
  final TextEditingController _stokController = TextEditingController();
  final TextEditingController _hargaController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  XFile? image;

  Future<void> initializeFirebase() async {
    await Firebase.initializeApp();
  }

  @override
  void initState() {
    super.initState();
    initializeFirebase();
  }

  gallery() async {
    try {
      final XFile? _image = await _picker.pickImage(source: ImageSource.gallery);
      if (_image != null) {
        // Upload gambar ke Firebase Storage
        Reference storageReference =
            FirebaseStorage.instance.ref().child('produk_images/${DateTime.now().millisecondsSinceEpoch}');
        UploadTask uploadTask = storageReference.putFile(File(_image.path));
        await uploadTask.whenComplete(() async {
          // Dapatkan URL gambar setelah berhasil diunggah
          String imageUrl = await storageReference.getDownloadURL();
          if (imageUrl != null && imageUrl.isNotEmpty) {
            setState(() {
              _gambarProduk = imageUrl;
            });

            // Tampilkan pesan toast
            Fluttertoast.showToast(
              msg: 'Gambar berhasil diunggah ke Firebase',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 2,
              backgroundColor: Colors.blue,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          } else {
            // Handle kesalahan jika URL gambar kosong
            Fluttertoast.showToast(
              msg: 'Terjadi kesalahan saat mengunggah gambar',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 2,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          }
        });
      }
    } catch (error) {
      // Handle kesalahan selama proses upload
      print('Error during image upload: $error');
      Fluttertoast.showToast(
        msg: 'Terjadi kesalahan saat mengunggah gambar',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  String _gambarProduk = '';

  Future<void> _simpanProduk() async {
    CollectionReference produkCollection = FirebaseFirestore.instance.collection('produk');

    await produkCollection.add({
      'nama': _namaProdukController.text,
      'deskripsi': _deskripsiProdukController.text,
      'stok': int.tryParse(_stokController.text) ?? 0,
      'harga': int.tryParse(_hargaController.text) ?? 0,
      'gambar': _gambarProduk,
    });

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text('Tambah Produk'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            // Form widget untuk menangani validasi input
            child: Column(
              children: [
                TextFormField(
                  controller: _namaProdukController,
                  decoration: InputDecoration(labelText: 'Nama Produk'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama produk tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _deskripsiProdukController,
                  maxLines: 4,
                  decoration: InputDecoration(labelText: 'Deskripsi Produk'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Deskripsi produk tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _stokController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Stok'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Stok tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _hargaController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Harga'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Harga tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: gallery,
                  child: Text('Upload Gambar'),
                ),
                SizedBox(height: 16.0),
                if (_gambarProduk.isNotEmpty)
                  Image.network(
                    _gambarProduk,
                    fit: BoxFit.cover,
                    width: 200.0,
                    height: 200.0,
                  ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _simpanProduk,
                  child: Text('Simpan Produk'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
