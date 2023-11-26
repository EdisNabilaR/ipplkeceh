import 'package:aplikasiverggieshop/users/register.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

  void _onMenuItemSelected(String value) {
    if (value == 'Ubah Akun') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AkunPage()),
      );
    } else if (value == 'Logout') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => RegisterPage()), 
      );
    } else if (value == 'Peta') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => Peta()), 
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
          onChanged: (value) {},
          style: TextStyle(fontSize: 15),
          decoration: InputDecoration(
            hintText: 'Search',
            prefixIcon: Icon(Icons.search, color: Colors.black),
            contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: new BorderSide(color: Colors.white),
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
          DepanPage(),
          KategoriPage(),
        ],
      ),
    );
  }
}
