import 'package:flutter/material.dart';
import 'package:aplikasiverggieshop/users/depanpage.dart';
import 'package:aplikasiverggieshop/users/kategoripage.dart';
import 'package:aplikasiverggieshop/users/akunpage.dart';
import 'package:aplikasiverggieshop/users/peta.dart';

class Beranda extends StatefulWidget {
  @override
  _BerandaState createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  TextEditingController _searchController = TextEditingController();
  late List<Product> _allProducts;
  late List<Product> _displayedProducts;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _allProducts = List.from(allProducts);
    _displayedProducts = List.from(allProducts);
  }

  void _updateDisplayedProducts(String query) {
    setState(() {
      _displayedProducts = _allProducts
          .where((product) => product.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _onSearchTextChanged(String value) {
    _updateDisplayedProducts(value);
  }

  void _onMenuItemSelected(String value) {
    if (value == 'Ubah Akun') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AkunPage()),
      );
    } else if (value == 'Logout') {
      Navigator.popUntil(context, ModalRoute.withName('/login'));
    } else if (value == 'Peta') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Peta()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: TextField(
          controller: _searchController,
          onChanged: _onSearchTextChanged,
          style: TextStyle(fontSize: 15),
          decoration: InputDecoration(
            hintText: 'Search',
            prefixIcon: Icon(Icons.search, color: Colors.black),
            contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.white),
            ),
            fillColor: Color(0xfff3f3f4),
            filled: true,
          ),
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: _onMenuItemSelected,
            itemBuilder: (BuildContext context) {
              return {'Ubah Akun', 'Logout', 'Peta'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.black,
          labelColor: Colors.black,
          unselectedLabelColor: const Color.fromARGB(255, 83, 83, 83),
          labelPadding: EdgeInsets.all(0),
          tabs: [
            Tab(
              text: 'Beranda',
            ),
            Tab(
              text: 'Kategori',
            ),
          ],
        ),
      ),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: [
          DepanPage(products: _displayedProducts),
          KategoriPage(),
        ],
      ),
    );
  }
}
