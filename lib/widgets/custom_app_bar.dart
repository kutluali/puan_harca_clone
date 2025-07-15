import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String titleText;
  final int tikoAmount;
  final String tikoImagePath; // Image path'i parametre olarak al
  final int basketAmount;
  final IconData iconData;

  const CustomAppBar({
    super.key,
    required this.titleText,
    required this.tikoAmount,
    required this.tikoImagePath,
    required this.basketAmount,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          titleText,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.grey.shade100,
          ),
          child: Row(
            children: [
              SizedBox(width: 20),
              Text(
                tikoAmount.toString() + " ₺",
                style: const TextStyle(color: Colors.pinkAccent, fontSize: 16),
              ),
              const SizedBox(width: 6),
              Image.asset(
                tikoImagePath,
                width: 16,
                height: 16,
                color: Colors.pinkAccent,
              ),
            ],
          ),
        ),
        SizedBox(width: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.grey.shade100,
          ),
          child: Row(
            children: [
              SizedBox(width: 20),
              Text(
                basketAmount.toString() + " ₺",
                style: const TextStyle(color: Colors.pinkAccent, fontSize: 16),
              ),
              const SizedBox(width: 6),
              Icon(iconData, size: 16, color: Colors.pinkAccent),
            ],
          ),
        ),
      ],
    );
  }
}
