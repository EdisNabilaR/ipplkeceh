import 'package:flutter/material.dart';
import 'package:aplikasiverggieshop/users/detailsayurpage.dart';

class DepanPage extends StatefulWidget {
  @override
  State<DepanPage> createState() => _DepanPageState();
}

class _DepanPageState extends State<DepanPage> {
  final List<Product> products = [
    Product(
      name: 'Kangkung',
      description: 'Toko Sayur Berkah, KM 15',
      imageUrl:
          'https://i0.wp.com/umsu.ac.id/berita/wp-content/uploads/2023/07/Kangkung.jpg?fit=1200%2C900&ssl=1/product1.jpg',
      price: 5.000,
    ),
    Product(
      name: 'Kangkung',
      description: 'Toko Sayur Berkah, KM 15',
      imageUrl:
          'https://i0.wp.com/umsu.ac.id/berita/wp-content/uploads/2023/07/Kangkung.jpg?fit=1200%2C900&ssl=1/product1.jpg',
      price: 5.000,
    ),
    Product(
      name: 'Kangkung',
      description: 'Toko Sayur Berkah, KM 15',
      imageUrl:
          'https://i0.wp.com/umsu.ac.id/berita/wp-content/uploads/2023/07/Kangkung.jpg?fit=1200%2C900&ssl=1/product1.jpg',
      price: 5.000,
    ),
    Product(
      name: 'Kangkung',
      description: 'Toko Sayur Berkah, KM 15',
      imageUrl:
          'https://i0.wp.com/umsu.ac.id/berita/wp-content/uploads/2023/07/Kangkung.jpg?fit=1200%2C900&ssl=1/product1.jpg',
      price: 5.000,
    ),
    Product(
      name: 'Kangkung',
      description: 'Toko Sayur Berkah, KM 15',
      imageUrl:
          'https://i0.wp.com/umsu.ac.id/berita/wp-content/uploads/2023/07/Kangkung.jpg?fit=1200%2C900&ssl=1/product1.jpg',
      price: 5.000,
    ),
    Product(
      name: 'Kangkung',
      description: 'Toko Sayur Berkah, KM 15',
      imageUrl:
          'https://i0.wp.com/umsu.ac.id/berita/wp-content/uploads/2023/07/Kangkung.jpg?fit=1200%2C900&ssl=1/product1.jpg',
      price: 5.000,
    ),
    Product(
      name: 'Kangkung',
      description: 'Toko Sayur Berkah, KM 15',
      imageUrl:
          'https://i0.wp.com/umsu.ac.id/berita/wp-content/uploads/2023/07/Kangkung.jpg?fit=1200%2C900&ssl=1/product1.jpg',
      price: 5.000,
    ),
    Product(
      name: 'Kangkung',
      description: 'Toko Sayur Berkah, KM 15',
      imageUrl:
          'https://i0.wp.com/umsu.ac.id/berita/wp-content/uploads/2023/07/Kangkung.jpg?fit=1200%2C900&ssl=1/product1.jpg',
      price: 5.000,
    ),
    Product(
      name: 'Kangkung',
      description: 'Toko Sayur Berkah, KM 15',
      imageUrl:
          'https://i0.wp.com/umsu.ac.id/berita/wp-content/uploads/2023/07/Kangkung.jpg?fit=1200%2C900&ssl=1/product1.jpg',
      price: 5.000,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductCard(product: products[index]);
      },
    ));
  }
}

class Product {
  final String name;
  final String description;
  final String imageUrl;
  final double price;

  Product({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
  });
}

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => DetailSayurPage(product: product),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              product.imageUrl,
              height: 120.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(product.description),
                  SizedBox(height: 4.0),
                  Text('\$${product.price.toStringAsFixed(2)}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
