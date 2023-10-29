import 'package:flutter/material.dart';
import 'package:aplikasiverggieshop/users/depanpage.dart';

class DetailSayurPage extends StatefulWidget {
  final Product product;

  DetailSayurPage({required this.product});

  @override
  _DetailSayurPageState createState() => _DetailSayurPageState();
}

class _DetailSayurPageState extends State<DetailSayurPage> {
  int jumlahBeli = 1;

  @override
  Widget build(BuildContext context) {
    double totalHarga = jumlahBeli * widget.product.price;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.product.imageUrl,
              height: 300.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.name,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    widget.product.description,
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '\$${totalHarga.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Deskripsi Produk:',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Kangkung yang dijual merupakan hasil panen Tani Warga Makmur KM 17',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Jumlah yang ingin dibeli:',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          if (jumlahBeli > 1) {
                            setState(() {
                              jumlahBeli--;
                            });
                          }
                        },
                      ),
                      Text(
                        jumlahBeli.toString(),
                        style: TextStyle(fontSize: 18.0),
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            jumlahBeli++;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Check Out'),
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
