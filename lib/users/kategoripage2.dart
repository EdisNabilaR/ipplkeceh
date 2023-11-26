// import 'package:flutter/material.dart';

// class KategoriPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Kategori Page'),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             KategoriSection('Kategori Sayur Buah', [
//               KategoriCard('Labu', 'assets/labu.jpg'),
//               KategoriCard('Terong', 'assets/terong.jpg'),
//               KategoriCard('Tomat', 'assets/tomat.jpg'),
//               // Tambahkan sayur oranye lainnya di sini
//             ]),
//             KategoriSection('Kategori Sayur Bunga', [
//               KategoriCard('Brokoli', 'assets/brokoli.jpg'),
//               KategoriCard('Kembang Kol', 'assets/kembangkol.jpg'),
//               // Tambahkan sayur hijau lainnya di sini
//             ]),
//             KategoriSection('Kategori Sayur Daun', [
//               KategoriCard('Bayam', 'assets/bayam.jpg'),
//               KategoriCard('Kol', 'assets/kol.jpg'),
//               KategoriCard('Kangkung', 'assets/kangkung.jpg'),
//               KategoriCard('Selada', 'assets/selada.jpg'),
//               // Tambahkan sayur oranye lainnya di sini
//             ]),
//             KategoriSection('Kategori Sayur Umbi', [
//               KategoriCard('Kentang', 'assets/kentang.jpg'),
//               KategoriCard('Lobak Putih', 'assets/lobakputih.jpg'),
//               KategoriCard('Wortel', 'assets/wortel.jpg'),
//               // Tambahkan sayur oranye lainnya di sini
//             ]),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class KategoriSection extends StatelessWidget {
//   final String title;
//   final List<Widget> kategoriCards;

//   KategoriSection(this.title, this.kategoriCards);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Text(
//             title,
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//           Container(
//             height: 300,
//             width: double.infinity, // Expanded akan memanfaatkan lebar penuh
//             child: ListView(
//               scrollDirection: Axis.horizontal,
//               children: kategoriCards,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class KategoriCard extends StatelessWidget {
//   final String title;
//   final String imageUrl;

//   KategoriCard(this.title, this.imageUrl);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.all(8.0),
//       child: Column(
//         children: <Widget>[
//           Image.asset(
//             imageUrl,
//             height: 200,
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               title,
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

