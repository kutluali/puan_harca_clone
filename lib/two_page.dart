import 'package:flutter/material.dart';
import 'package:puan_harca_clone/widgets/custom_carousel.dart';

class TwoPage extends StatefulWidget {
  const TwoPage({super.key});

  @override
  State<TwoPage> createState() => _TwoPageState();
}

class _TwoPageState extends State<TwoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Carousel ve Noktalar
          CustomCarousel(
            imageList: [
              'images/alisveris1.jpg',
              'images/alisveris2.jpg',
              'images/alisveris3.jpg',
              'images/alisveris4.jpg',
            ],
          ),

          SizedBox(height: 10),

          // İçerik
          Expanded(
            child: Row(
              children: [
                //buildSideMenu(), // Sol
                SizedBox(width: 8),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      // buildSearchBar(),
                      // Expanded(child: buildBrandGrid()),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget buildCarousel() {}
}
