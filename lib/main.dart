import 'package:flutter/material.dart';
import 'package:puan_harca_clone/first_page.dart';
import 'package:puan_harca_clone/home_page.dart';
import 'package:puan_harca_clone/widgets/custom_nav_bar_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(), // İlk sayfa
      routes: {
        '/main': (context) => CustomNavBarPage(), // Ana uygulama
        '/home': (context) => HomePage(), // Tek sayfa
      },
    );
  }
}
