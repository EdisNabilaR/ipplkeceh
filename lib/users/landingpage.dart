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
    new Beranda(),
    new KeranjangPage(),
    new AkunPage(),
    new TambahprodukPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: container[_bottomNavCurrentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Palette.bg1,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _bottomNavCurrentIndex = index;
          });
        },
        currentIndex: _bottomNavCurrentIndex,
        items: [
          BottomNavigationBarItem(
            activeIcon: new Icon(
              Icons.home,
              color: Palette.bg1,
            ),
            icon: new Icon(
              Icons.home_outlined,
              color: Colors.grey,
            ),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            activeIcon: new Icon(
              Icons.shopping_cart,
              color: Palette.bg1,
            ),
            icon: new Icon(
              Icons.shopping_cart_outlined,
              color: Colors.grey,
            ),
            label: 'Keranjang',
          ),
          BottomNavigationBarItem(
              activeIcon: new Icon(
                Icons.person,
                color: Palette.bg1,
              ),
              icon: new Icon(
                Icons.person_outline,
                color: Colors.grey,
              ),
              label: 'Profil'),
          BottomNavigationBarItem(
              activeIcon: new Icon(
                Icons.plus_one,
                color: Palette.bg1,
              ),
              icon: new Icon(
                Icons.plus_one_outlined,
                color: Colors.grey,
              ),
              label: 'Produk'),
        ],
      ),
    );
  }
}
