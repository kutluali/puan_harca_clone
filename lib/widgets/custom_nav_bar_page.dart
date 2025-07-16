import 'package:flutter/material.dart';
import 'package:puan_harca_clone/announcements.dart';
import 'package:puan_harca_clone/home_page.dart';
import 'package:puan_harca_clone/payment_card.dart';
import 'package:puan_harca_clone/profile_page.dart';
import 'package:puan_harca_clone/two_page.dart';

class CustomNavBarPage extends StatefulWidget {
  @override
  State<CustomNavBarPage> createState() => _CustomNavBarPageState();
}

class _CustomNavBarPageState extends State<CustomNavBarPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    TwoPage(),
    PaymentCard(),
    Announcements(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildCircleIcon(IconData iconData, bool isSelected) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: isSelected ? Colors.pinkAccent : Colors.transparent,
      child: Icon(
        iconData,
        color: isSelected ? Colors.white : Colors.pinkAccent,
        size: 24,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.white,
        elevation: 8,
        items: [
          BottomNavigationBarItem(
            icon: _buildCircleIcon(Icons.home, _selectedIndex == 0),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildCircleIcon(Icons.store, _selectedIndex == 1),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildCircleIcon(Icons.wallet, _selectedIndex == 2),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildCircleIcon(Icons.campaign, _selectedIndex == 3),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildCircleIcon(Icons.person, _selectedIndex == 4),
            label: '',
          ),
        ],
      ),
    );
  }
}
