import 'package:flutter/material.dart';

class KategoriPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kategori Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Kategori Sayur Buah',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  KategoriCard('Labu', 'https://blogpictures.99.co/manfaat-labu-kuning.jpg')
                  // KategoriCard('Labu', 'assets/labu.jpg'),
                  // KategoriCard('Terong', 'assets/terong.jpg'),
                  // KategoriCard('Tomat', 'assets/tomat.jpg'),
                  // // Tambahkan sayur oranye lainnya di sini
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Kategori Sayur Bunga',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  // KategoriCard('Brokoli', 'assets/brokoli.jpg'),
                  // KategoriCard('Kembang Kol', 'assets/kembangkol.jpg'),
                  // Tambahkan sayur hijau lainnya di sini
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Kategori Sayur Daun',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  // KategoriCard('Bayam', 'assets/bayam.jpg'),
                  // KategoriCard('Kol', 'assets/kol.jpg'),
                  // KategoriCard('Kangkung', 'assets/kangkung.jpg'),
                  // KategoriCard('Selada', 'assets/selada.jpg'),
                  // Tambahkan sayur oranye lainnya di sini
                ],
              ),
            ),
             Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Kategori Sayur Umbi',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  // KategoriCard('Kentang', 'assets/kentang.jpg'),
                  // KategoriCard('Lobak Putih', 'assets/lobakputih.jpg'),
                  // KategoriCard('Wortel', 'assets/wortel.jpg'),
                  // Tambahkan sayur oranye lainnya di sini
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class KategoriCard extends StatelessWidget {
  final String title;
  // final String imageAsset;
  final String imageUrl;

  // KategoriCard(this.title, this.imageAsset);
  KategoriCard(this.title, this.imageUrl);
  
  // String get imageUrl => null;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          // Image.asset(
          Image.network(
            // imageAsset,
            imageUrl,
            height: 120,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
