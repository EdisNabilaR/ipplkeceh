import 'package:aplikasiverggieshop/constans.dart';
import 'package:aplikasiverggieshop/users/depanpage.dart';
import 'package:aplikasiverggieshop/users/kategoripage.dart';
import 'package:flutter/material.dart';

class Beranda extends StatefulWidget {
  @override
  _BerandaState createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  int _activeTabIndex = 0;
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  void _setActiveTabIndex() {
    _activeTabIndex = _tabController.index;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: TextField(
          controller: _searchController,
          onChanged: (value) {},
          style: TextStyle(fontSize: 15),
          decoration: InputDecoration(
            hintText: 'Search',
            prefixIcon: Icon(Icons.search, color: Palette.black),
            contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: new BorderSide(color: Colors.white),
            ),
            fillColor: Color(0xfff3f3f4),
            filled: true,
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Palette.black,
          labelColor: Palette.black,
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
          DepanPage(),
          KategoriPage(),
        ],
      ),
    );
  }
}
