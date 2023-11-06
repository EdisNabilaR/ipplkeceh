import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: KeranjangPage(),
    );
  }
}

class KeranjangPage extends StatefulWidget {
  @override
  State<KeranjangPage> createState() => _KeranjangPageState();
}

class _KeranjangPageState extends State<KeranjangPage> {
  List<CartItem> cartItems = [
    CartItem('Kangkung', 10.000, 2,
        'https://i0.wp.com/umsu.ac.id/berita/wp-content/uploads/2023/07/Kangkung.jpg?fit=1200%2C900&ssl=1'),
    CartItem('Bayam', 15.000, 1,
        'https://i0.wp.com/portalmadura.com/wp-content/uploads/2020/01/sayur-bayam.jpg'),
    CartItem('Bayam', 15.000, 1,
        'https://i0.wp.com/portalmadura.com/wp-content/uploads/2020/01/sayur-bayam.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text('Keranjang'),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DetailBarangPage(cartItem: cartItems[index]),
                  ),
                );
              },
              leading: Image.network(cartItems[index].imageUrl),
              title: Text(cartItems[index].name),
              subtitle: Text(
                'Harga: \$${cartItems[index].price.toStringAsFixed(2)} - Jumlah: ${cartItems[index].quantity}',
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MetodePembayaranPengantaranPage(),
            ),
          );
        },
        child: Icon(Icons.payment),
      ),
    );
  }
}

class CartItem {
  final String name;
  final double price;
  final int quantity;
  final String imageUrl;

  CartItem(this.name, this.price, this.quantity, this.imageUrl);
}

class DetailBarangPage extends StatelessWidget {
  final CartItem cartItem;

  DetailBarangPage({required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cartItem.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(cartItem.imageUrl),
            SizedBox(height: 16.0),
            Text('Nama: ${cartItem.name}'),
            Text('Harga: \$${cartItem.price.toStringAsFixed(2)}'),
            Text('Jumlah: ${cartItem.quantity}'),
          ],
        ),
      ),
    );
  }
}

class MetodePembayaranPengantaranPage extends StatefulWidget {
  @override
  _MetodePembayaranPengantaranPageState createState() =>
      _MetodePembayaranPengantaranPageState();
}

class _MetodePembayaranPengantaranPageState
    extends State<MetodePembayaranPengantaranPage> {
  String selectedPaymentMethod = 'transfer';
  String selectedDeliveryMethod = 'ambilToko';
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void _showBankOptions(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pilih Bank'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('Bank BNI'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Bank BRI'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Bank KaltimTara'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Bank Mandiri'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Konfirmasi'),
          content: Text('Data pembayaran telah berhasil disimpan.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Tutup'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Metode Pembayaran dan Pengantaran'),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(16.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Pilih Metode Pembayaran:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  RadioListTile(
                    title: Text('Transfer'),
                    value: 'transfer',
                    groupValue: selectedPaymentMethod,
                    onChanged: (value) {
                      setState(() {
                        selectedPaymentMethod = value.toString();
                        if (selectedPaymentMethod == 'transfer') {
                          _showBankOptions(context);
                        }
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text('COD (Bayar di Tempat)'),
                    value: 'COD',
                    groupValue: selectedPaymentMethod,
                    onChanged: (value) {
                      setState(() {
                        selectedPaymentMethod = value.toString();
                      });
                    },
                  ),
                  SizedBox(height: 16.0),
                  Text('Pilih Metode Pengantaran:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  RadioListTile(
                    title: Text('Ambil di Toko'),
                    value: 'ambilToko',
                    groupValue: selectedDeliveryMethod,
                    onChanged: (value) {
                      setState(() {
                        selectedDeliveryMethod = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text('Antar oleh Kurir'),
                    value: 'antarKurir',
                    groupValue: selectedDeliveryMethod,
                    onChanged: (value) {
                      setState(() {
                        selectedDeliveryMethod = value.toString();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          if (selectedDeliveryMethod == 'antarKurir') ...[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _selectDate(context);
                  },
                  child: Text(
                      'Pilih Tanggal: ${selectedDate.toLocal().day} ${_getMonth(selectedDate.toLocal().month)} ${selectedDate.toLocal().year}'),
                ),
                SizedBox(height: 16.0), 
              ],
            ),
          ],
          ElevatedButton(
            onPressed: () {
              _showConfirmationDialog();
            },
            child: Text('Konfirmasi'),
          ),
        ],
      ),
    );
  }

  String _getMonth(int month) {
    switch (month) {
      case 1:
        return 'Januari';
      case 2:
        return 'Februari';
      case 3:
        return 'Maret';
      case 4:
        return 'April';
      case 5:
        return 'Mei';
      case 6:
        return 'Juni';
      case 7:
        return 'Juli';
      case 8:
        return 'Agustus';
      case 9:
        return 'September';
      case 10:
        return 'Oktober';
      case 11:
        return 'November';
      case 12:
        return 'Desember';
      default:
        return '';
    }
  }
}
