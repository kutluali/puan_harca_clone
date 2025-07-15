import 'package:flutter/material.dart';
import 'package:puan_harca_clone/announcements.dart';
import 'package:puan_harca_clone/home_page.dart';
import 'package:puan_harca_clone/profile_page.dart';
import 'package:puan_harca_clone/payment_card.dart';
import 'package:puan_harca_clone/two_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Announcements(),
    );
  }
}

class CustomNavBarPage extends StatefulWidget {
  @override
  State<CustomNavBarPage> createState() => _CustomNavBarPageState();
}

class _CustomNavBarPageState extends State<CustomNavBarPage> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    HomePage(),
    TwoPage(),
    PaymentCard(),
    Announcements(),
    ProfilePage(),
  ];

  final List<IconData> icons = [
    Icons.home,
    Icons.store,
    Icons.wallet,
    Icons.campaign,
    Icons.person,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: const BoxDecoration(
          color: Colors.white,
          // Artık margin yok, ekranla birleşik olacak
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
        ),
        child: SafeArea(
          // iPhone çentik uyumu ve Android bar alanı için
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(icons.length, (index) {
              final isSelected = selectedIndex == index;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.pinkAccent : Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icons[index],
                    size: 28,
                    color: isSelected ? Colors.white : Colors.pinkAccent,
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
