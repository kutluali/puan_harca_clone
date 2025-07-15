/*import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomCarousel extends StatefulWidget {
  final List<String> imageList;
  final double height;

  const CustomCarousel({super.key, required this.imageList, this.height = 150});
  //Default olarak height değerini 150verdik istersek daha büyük boyut yapabiliriz 

  @override
  State<CustomCarousel> createState() => _CustomCarouselState();
}

class _CustomCarouselState extends State<CustomCarousel> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  //Dispose yaptık bellekteki yoğunluğu sızıntıyı azaltarak telefonu yormaz ekrandan kayan resimleri bellekten siler. Verimli çalışır
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
                    width: double.infinity,
                  ),
                ),
              );
            },
          ),
        ),
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
*/

// Yöntem 1: Stack ile tam kontrol
import 'package:flutter/material.dart';

class CardPointsSection extends StatelessWidget {
  final int bankaKartiPuani;
  final int markaKartiPuani;

  const CardPointsSection({
    super.key,
    this.bankaKartiPuani = 0,
    this.markaKartiPuani = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Stack(
        children: [
          // Ana Row - Puanlar
          Row(
            children: [
              Expanded(
                child: _buildPointCard(
                  title: "Banka Kartı Puanları",
                  points: bankaKartiPuani,
                  isSelected: true,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildPointCard(
                  title: "Marka Kartı Puanları",
                  points: markaKartiPuani,
                  isSelected: false,
                ),
              ),
            ],
          ),
          // Sol alt köşedeki icon
          Positioned(
            left: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.orange.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(Icons.credit_card, size: 24, color: Colors.orange),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPointCard({
    required String title,
    required int points,
    required bool isSelected,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isSelected ? Colors.pink.shade50 : Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: isSelected
            ? Border.all(color: Colors.pink, width: 2)
            : Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$points ₺",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.pink : Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: isSelected ? Colors.pink : Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}

// Yöntem 2: Daha esnek Stack kullanımı
class CardPointsSectionV2 extends StatelessWidget {
  final int bankaKartiPuani;
  final int markaKartiPuani;

  const CardPointsSectionV2({
    super.key,
    this.bankaKartiPuani = 0,
    this.markaKartiPuani = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Stack(
        clipBehavior: Clip.none, // Taşan içerikleri göster
        children: [
          // Ana içerik
          Container(
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => print("Banka Kartı seçildi"),
                    child: _buildPointCard(
                      title: "Banka Kartı Puanları",
                      points: bankaKartiPuani,
                      isSelected: true,
                      color: Colors.pink,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: GestureDetector(
                    onTap: () => print("Marka Kartı seçildi"),
                    child: _buildPointCard(
                      title: "Marka Kartı Puanları",
                      points: markaKartiPuani,
                      isSelected: false,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Sol alt köşedeki animasyonlu icon
          Positioned(
            left: -8,
            bottom: -8,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.orange.shade300, Colors.orange.shade600],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.orange.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Icon(
                Icons.credit_card,
                size: 28,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPointCard({
    required String title,
    required int points,
    required bool isSelected,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isSelected ? color.withOpacity(0.1) : Colors.grey.shade50,
        borderRadius: BorderRadius.circular(16),
        border: isSelected
            ? Border.all(color: color, width: 2)
            : Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$points ₺",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: isSelected ? color : Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: isSelected ? color : Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}

// Yöntem 3: Kompakt Stack kullanımı
class CompactCardPointsSection extends StatefulWidget {
  @override
  _CompactCardPointsSectionState createState() =>
      _CompactCardPointsSectionState();
}

class _CompactCardPointsSectionState extends State<CompactCardPointsSection> {
  bool isBankaKartiSelected = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Stack(
        children: [
          // Ana kart seçim row'u
          Row(
            children: [
              Expanded(
                child: _buildSelectableCard(
                  "Banka Kartı Puanları",
                  0,
                  isBankaKartiSelected,
                  () => setState(() => isBankaKartiSelected = true),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildSelectableCard(
                  "Marka Kartı Puanları",
                  0,
                  !isBankaKartiSelected,
                  () => setState(() => isBankaKartiSelected = false),
                ),
              ),
            ],
          ),
          // Sol alt köşe icon
          Positioned(
            left: 4,
            bottom: 4,
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Icon(
                Icons.account_balance_wallet,
                size: 20,
                color: Colors.orange.shade600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectableCard(
    String title,
    int points,
    bool isSelected,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? Colors.pink.shade50 : Colors.grey.shade50,
          borderRadius: BorderRadius.circular(12),
          border: isSelected
              ? Border.all(color: Colors.pink, width: 2)
              : Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$points ₺",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.pink : Colors.black,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                color: isSelected ? Colors.pink : Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Kullanım örneği
class CardsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kartlarım"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Diğer içerikler...
          const SizedBox(height: 20),

          // Kart puanları bölümü
          const CardPointsSection(bankaKartiPuani: 150, markaKartiPuani: 75),

          const SizedBox(height: 20),

          // Alternatif versiyon
          const CardPointsSectionV2(bankaKartiPuani: 200, markaKartiPuani: 100),

          const SizedBox(height: 20),

          // Kompakt versiyon
          CompactCardPointsSection(),

          // Diğer içerikler...
        ],
      ),
    );
  }
}
