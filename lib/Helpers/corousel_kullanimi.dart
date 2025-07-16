import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'dart:async'; // Timer için gerekli

class CustomCarousel extends StatefulWidget {
  final List<String> imageList; // Gösterilecek resimlerin listesi
  final double height; // Carousel'in yüksekliği
  final bool autoPlay; // Otomatik oynatma açık/kapalı
  final Duration autoPlayInterval; // Otomatik oynatma aralığı
  final bool enlargeCenterPage; // Orta sayfa büyük gösterilsin mi?
  final double viewportFraction; // Ekranda kaç sayfa görünsün (0.8 = %80)
  final bool enableInfiniteScroll; // Sonsuz döngü
  final Axis scrollDirection; // Kaydırma yönü (yatay/dikey)
  final bool reverse; // Ters yönde mi oynatsın?
  final Curve curve; // Animasyon eğrisi
  final Duration animationDuration; // Sayfa geçiş animasyon süresi
  final bool showIndicator; // Alt nokta göstergesi göster/gizle
  final Color indicatorActiveColor; // Aktif nokta rengi
  final Color indicatorInactiveColor; // Pasif nokta rengi
  final double indicatorSize; // Nokta boyutu
  final EdgeInsets margin; // Sayfa kenar boşlukları
  final double borderRadius; // Köşe yuvarlaklığı
  final BoxFit imageFit; // Resim nasıl sığdırılsın?
  final Function(int)? onPageChanged; // Sayfa değiştiğinde çağrılacak fonksiyon

  const CustomCarousel({
    super.key,
    required this.imageList,
    this.height = 150,
    this.autoPlay = true,
    this.autoPlayInterval = const Duration(seconds: 3),
    this.enlargeCenterPage = false,
    this.viewportFraction = 1.0,
    this.enableInfiniteScroll = true,
    this.scrollDirection = Axis.horizontal,
    this.reverse = false,
    this.curve = Curves.easeInOut,
    this.animationDuration = const Duration(milliseconds: 300),
    this.showIndicator = true,
    this.indicatorActiveColor = Colors.pink,
    this.indicatorInactiveColor = Colors.grey,
    this.indicatorSize = 8.0,
    this.margin = const EdgeInsets.symmetric(horizontal: 5),
    this.borderRadius = 8.0,
    this.imageFit = BoxFit.cover,
    this.onPageChanged,
  });

  @override
  State<CustomCarousel> createState() => _CustomCarouselState();
}

class _CustomCarouselState extends State<CustomCarousel> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();
  Timer? _autoPlayTimer; // Otomatik oynatma timer'ı

  @override
  void initState() {
    super.initState();

    /*_pageController = PageController(
      viewportFraction: widget.viewportFraction,
    );*/

    // ViewportFraction ayarı ile PageController'ı başlatıyoruz
    _pageController.dispose();

    // Otomatik oynatma aktifse timer'ı başlat
    if (widget.autoPlay) {
      _startAutoPlay();
    }
  }

  // Otomatik oynatma timer'ını başlat
  void _startAutoPlay() {
    _autoPlayTimer = Timer.periodic(widget.autoPlayInterval, (timer) {
      if (mounted) {
        _nextPage();
      }
    });
  }

  // Otomatik oynatma timer'ını durdur
  void _stopAutoPlay() {
    _autoPlayTimer?.cancel();
    _autoPlayTimer = null;
  }

  // Bir sonraki sayfaya geç
  void _nextPage() {
    if (widget.enableInfiniteScroll) {
      // Sonsuz döngü: Son sayfadaysa başa dön
      if (_currentIndex < widget.imageList.length - 1) {
        _pageController.nextPage(
          duration: widget.animationDuration,
          curve: widget.curve,
        );
      } else {
        _pageController.animateToPage(
          0,
          duration: widget.animationDuration,
          curve: widget.curve,
        );
      }
    } else {
      // Normal mod: Son sayfada dur
      if (_currentIndex < widget.imageList.length - 1) {
        _pageController.nextPage(
          duration: widget.animationDuration,
          curve: widget.curve,
        );
      }
    }
  }

  // Önceki sayfaya geç
  void _previousPage() {
    if (widget.enableInfiniteScroll) {
      // Sonsuz döngü: İlk sayfadaysa sona git
      if (_currentIndex > 0) {
        _pageController.previousPage(
          duration: widget.animationDuration,
          curve: widget.curve,
        );
      } else {
        _pageController.animateToPage(
          widget.imageList.length - 1,
          duration: widget.animationDuration,
          curve: widget.curve,
        );
      }
    } else {
      // Normal mod: İlk sayfada dur
      if (_currentIndex > 0) {
        _pageController.previousPage(
          duration: widget.animationDuration,
          curve: widget.curve,
        );
      }
    }
  }

  @override
  void dispose() {
    _autoPlayTimer?.cancel(); // Timer'ı temizle
    _pageController.dispose(); // PageController'ı temizle
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Ana Carousel Widget'ı
        SizedBox(
          height: widget.height,
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.imageList.length,
            scrollDirection: widget.scrollDirection, // Kaydırma yönü
            reverse: widget.reverse, // Ters yönde kaydırma
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
              // Dış callback'i çağır
              widget.onPageChanged?.call(index);
            },
            itemBuilder: (context, index) {
              // Her sayfa için container
              Widget carouselItem = Container(
                margin: widget.margin,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  // Orta sayfa büyütme efekti
                  boxShadow: widget.enlargeCenterPage && index == _currentIndex
                      ? [
                          BoxShadow(
                            color: Colors.black.withAlpha(25),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ]
                      : null,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  child: Image.asset(
                    widget.imageList[index],
                    fit: widget.imageFit,
                    width: double.infinity,
                    // Resim yükleme hatası durumunda
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        child: const Icon(
                          Icons.broken_image,
                          size: 50,
                          color: Colors.grey,
                        ),
                      );
                    },
                  ),
                ),
              );
              if (widget.enlargeCenterPage && index == _currentIndex) {
                carouselItem = Transform.scale(
                  scale: 1.05,
                  child: carouselItem,
                );
              }
              return carouselItem;
            },
          ),
        ),

        // Alt boşluk
        const SizedBox(height: 8),

        // Sayfa göstergesi (nokta indicator)
        if (widget.showIndicator)
          AnimatedSmoothIndicator(
            activeIndex: _currentIndex,
            count: widget.imageList.length,
            effect: WormEffect(
              dotColor: widget.indicatorInactiveColor,
              activeDotColor: widget.indicatorActiveColor,
              dotHeight: widget.indicatorSize,
              dotWidth: widget.indicatorSize,
            ),
          ),

        // Manuel kontrol butonları (isteğe bağlı)
        if (widget.autoPlay)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  _stopAutoPlay();
                  _previousPage();
                  if (widget.autoPlay) _startAutoPlay();
                },
                icon: const Icon(Icons.chevron_left),
              ),
              IconButton(
                onPressed: () {
                  if (_autoPlayTimer != null) {
                    _stopAutoPlay();
                  } else {
                    _startAutoPlay();
                  }
                  setState(() {}); // UI'yi güncelle
                },
                icon: Icon(
                  _autoPlayTimer != null ? Icons.pause : Icons.play_arrow,
                ),
              ),
              IconButton(
                onPressed: () {
                  _stopAutoPlay();
                  _nextPage();
                  if (widget.autoPlay) _startAutoPlay();
                },
                icon: const Icon(Icons.chevron_right),
              ),
            ],
          ),
      ],
    );
  }
}

// KULLANIM ÖRNEKLERİ:

// 1. Basit kullanım:
/*
CustomCarousel(
  imageList: ['assets/1.jpg', 'assets/2.jpg', 'assets/3.jpg'],
)
*/

// 2. Otomatik oynatma kapalı:
/*
CustomCarousel(
  imageList: ['assets/1.jpg', 'assets/2.jpg', 'assets/3.jpg'],
  autoPlay: false,
)
*/

// 3. Hızlı oynatma (1 saniye):
/*
CustomCarousel(
  imageList: ['assets/1.jpg', 'assets/2.jpg', 'assets/3.jpg'],
  autoPlayInterval: Duration(seconds: 1),
)
*/

// 4. Çoklu sayfa görünümü:
/*
CustomCarousel(
  imageList: ['assets/1.jpg', 'assets/2.jpg', 'assets/3.jpg'],
  viewportFraction: 0.8, // %80 genişlik, yan sayfalar da görünür
  enlargeCenterPage: true, // Orta sayfa büyük görünür
)
*/

// 5. Dikey kaydırma:
/*
CustomCarousel(
  imageList: ['assets/1.jpg', 'assets/2.jpg', 'assets/3.jpg'],
  scrollDirection: Axis.vertical,
  height: 300,
)
*/

// 6. Özelleştirilmiş gösterge:
/*
CustomCarousel(
  imageList: ['assets/1.jpg', 'assets/2.jpg', 'assets/3.jpg'],
  indicatorActiveColor: Colors.blue,
  indicatorInactiveColor: Colors.grey.shade300,
  indicatorSize: 12.0,
)
*/

// 7. Sayfa değişikliği dinleyicisi:
/*
CustomCarousel(
  imageList: ['assets/1.jpg', 'assets/2.jpg', 'assets/3.jpg'],
  onPageChanged: (index) {
    print('Sayfa değişti: $index');
  },
)
*/
