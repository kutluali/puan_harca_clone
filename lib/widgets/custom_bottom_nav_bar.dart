import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0;

  final List<IconData> _icons = [
    Icons.home,
    Icons.store,
    Icons.wallet,
    Icons.campaign,
    Icons.person,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Seçilen Sekme: $_selectedIndex")),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(_icons.length, (index) {
            final isSelected = index == _selectedIndex;
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                decoration: isSelected
                    ? BoxDecoration(
                        color: Colors.pinkAccent.shade100,
                        borderRadius: BorderRadius.circular(30),
                      )
                    : null,
                child: Icon(
                  _icons[index],
                  color: isSelected ? Colors.white : Colors.grey[600],
                  size: 26,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
