import 'package:aplikasiverggieshop/launcher.dart';
import 'package:aplikasiverggieshop/users/landingpage.dart';
import 'package:aplikasiverggieshop/users/login.dart';
import 'package:aplikasiverggieshop/users/register.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyDvBQgQRsiAGnzLmBNnn1j_1xW_p1kjgdM",
      authDomain: "veggieshop-11ae3.firebaseapp.com",
      projectId: "veggieshop-11ae3",
      storageBucket: "veggieshop-11ae3.appspot.com",
      messagingSenderId: "391684479095",
      appId: "1:391684479095:android:4ceb425659681c9565ce72",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Veggieshop',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      initialRoute: '/', // Rute awal
      routes: {
        '/': (context) => RegisterPage(), // Halaman awal (LauncherPage)
        '/register': (context) => RegisterPage(), // Rute ke halaman login
        '/landingPage': (context) =>
            LandingPage(), // Rute ke halaman LandingPage
      },
    );
  }
}
