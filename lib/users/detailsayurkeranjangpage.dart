import 'package:aplikasiverggieshop/users/keranjangpage.dart';
import 'package:flutter/material.dart';

class DetailSayurKeranjangPage extends StatefulWidget {
  final CartItem cartItem;

  DetailSayurKeranjangPage({required this.cartItem});

  @override
  _DetailSayurKeranjangPageState createState() =>
      _DetailSayurKeranjangPageState();
}

class _DetailSayurKeranjangPageState extends State<DetailSayurKeranjangPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Keranjang'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(widget.cartItem.imageUrl),
            SizedBox(height: 20.0),
            Text('Nama: ${widget.cartItem.name}'),
            Text('Harga: ${widget.cartItem.price}'),
            Text('Jumlah: ${widget.cartItem.quantity}'),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MetodePembayaranPengantaranPage(),
                  ),
                );
              },
              child: Text('Pilih Metode Pembayaran dan Pengantaran'),
            ),
          ],
        ),
      ),
    );
  }
}
