import 'package:flutter/material.dart';

class CustomAppBarPlus extends StatelessWidget {
  final String textTitle;
  final String? imageLogoPath;

  const CustomAppBarPlus({
    super.key,
    required this.textTitle,
    this.imageLogoPath,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          textTitle,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        if (imageLogoPath != null)
          Image.asset(imageLogoPath!, width: 30, height: 30),
      ],
    );
  }
}
