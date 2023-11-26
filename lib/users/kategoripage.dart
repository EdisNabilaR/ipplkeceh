import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: KategoriPage(),
    );
  }
}

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
            KategoriSection('Kategori Sayur Buah', [
              KategoriCard('Labu', 'https://awsimages.detik.net.id/customthumb/2014/10/22/900/172449_labucover.jpg?w=600&q=90'),
              KategoriCard('Terong', 'https://www.fajar.co.id/wp-content/uploads/2020/01/Terong-Ungu.jpg'),
              KategoriCard('Tomat', 'https://resepkoki.id/wp-content/uploads/2018/11/tomat-biasa.jpg'),
              // Tambahkan sayur buah lainnya di sini
            ]),
            KategoriSection('Kategori Sayur Bunga', [
              KategoriCard('Brokoli', 'https://assets-a1.kompasiana.com/items/album/2018/09/13/khasiat-dan-manfaat-menakjubkan-sayur-brokoli-untuk-kesehatan-tubuh-5b9a6c6112ae947f7e4d1443.jpg'),
              KategoriCard('Kembang Kol', 'https://storage.googleapis.com/manfaat/2018/01/2399fde4-bunga-kol.jpeg'),
              // Tambahkan sayur bunga lainnya di sini
            ]),
            KategoriSection('Kategori Sayur Daun', [
              KategoriCard('Bayam', 'https://www.astronauts.id/blog/wp-content/uploads/2023/01/7-Manfaat-Sayur-Bayam-Untuk-Tubuh--1024x683.jpg'),
              KategoriCard('Kol', 'https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//98/MTA-43951913/no_brand_kol_putih_-_sayur_kol_putih_500_gram_500_gram_full01_615effec.jpg'),
              KategoriCard('Kangkung', 'https://i0.wp.com/umsu.ac.id/berita/wp-content/uploads/2023/07/Kangkung.jpg?fit=1200%2C900&ssl=1/product1.jpg'),
              KategoriCard('Selada', 'https://asset-a.grid.id/crop/0x0:0x0/x/photo/2022/04/26/cara-menanam-selada-3jpg-20220426071456.jpg'),
              // Tambahkan sayur daun lainnya di sini
            ]),
            KategoriSection('Kategori Sayur Umbi', [
              KategoriCard('Kentang', 'https://asset-a.grid.id//crop/0x0:0x0/700x465/photo/2020/03/03/61709841.jpg'),
              KategoriCard('Lobak Putih', 'https://asset-a.grid.id/crop/0x0:0x0/x/photo/2019/04/26/179482138.png'),
              KategoriCard('Wortel', 'https://cloud.jpnn.com/photo/ilustrasi/normal/2022/02/15/wortel-foto-ricardojpnncom-e7bvg-pwzj.jpg'),
              // Tambahkan sayur umbi lainnya di sini
            ]),
          ],
        ),
      ),
    );
  }
}

class KategoriSection extends StatelessWidget {
  final String title;
  final List<Widget> kategoriCards;

  KategoriSection(this.title, this.kategoriCards);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(15.0),
        ),
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Container(
              height: 300,
              width: double.infinity,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: kategoriCards,
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
  final String imageUrl;

  KategoriCard(this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
            child: Image.network(
              imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
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
