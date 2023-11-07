import 'package:aplikasiverggieshop/constans.dart';
import 'package:aplikasiverggieshop/users/akunpage.dart';
import 'package:aplikasiverggieshop/users/beranda.dart';
import 'package:aplikasiverggieshop/users/keranjangpage.dart';
import 'package:aplikasiverggieshop/users/tambahproduk.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _bottomNavCurrentIndex = 0;
  List<Widget> container = [
    Beranda(),
    KeranjangPage(),
    AkunPage(),
    TambahprodukPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: container[_bottomNavCurrentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _bottomNavCurrentIndex = index;
          });
        },
        currentIndex: _bottomNavCurrentIndex,
        items: [
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.home,
              color: Colors.green,
            ),
            icon: Icon(
              Icons.home_outlined,
              color: Colors.grey,
            ),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.shopping_cart,
              color: Colors.green,
            ),
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: Colors.grey,
            ),
            label: 'Keranjang',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.person,
              color: Colors.green,
            ),
            icon: Icon(
              Icons.person_outline,
              color: Colors.grey,
            ),
            label: 'Profil',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.plus_one,
              color: Colors.green,
            ),
            icon: Icon(
              Icons.plus_one_outlined,
              color: Colors.grey,
            ),
            label: 'Produk',
          ),
        ],
      ),
    );
  }
}
