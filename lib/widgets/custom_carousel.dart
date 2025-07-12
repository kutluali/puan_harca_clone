import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomCarousel extends StatefulWidget {
  final List<String> imageList;
  final double height;

  const CustomCarousel({super.key, required this.imageList, this.height = 150});

  @override
  State<CustomCarousel> createState() => _CustomCarouselState();
}

class _CustomCarouselState extends State<CustomCarousel> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: widget.height,
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.imageList.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    widget.imageList[index],
                    fit: BoxFit.cover,
                    width: double.infinity, //Ekran genişliği boyunca
                  ),
                ),
              );
            },
          ),
        ),
        //Bu kısımda alttaki noktaların rengini pasif aktif olmasına göre renllendiriyoruz.
        const SizedBox(height: 8),
        AnimatedSmoothIndicator(
          activeIndex: _currentIndex,
          count: widget.imageList.length,
          effect: const WormEffect(
            dotColor: Colors.grey,
            activeDotColor: Colors.pink,
            dotHeight: 8,
            dotWidth: 8,
          ),
        ),
      ],
    );
  }
}
